//
//  FeedViewController.swift
//  
//
//  Created by Leonardo Maffei on 26/08/15.
//
//

import UIKit
import Result

class FeedViewController: UIViewController {
    
    let sportHTMLReader = SportHTMLReader()
    let defaults = NSUserDefaults.standardUserDefaults()
    let refresh = UIRefreshControl()
    let baseURL = "http://www.gazetaesportiva.net/categoria/"
    var urls = [NSURL]()
    var news = [News]()
    var favorites = [String]()
    var selectedCategory:String?
    var url:NSURL!
    var alreadyExist = false
    var feedUrl:String?
    
    @IBOutlet weak var favoriteBarButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func didReceiveMemoryWarning() {
        println("WARNING!")
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Came by CategoriesVC
        if var selected = selectedCategory?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "-") {
            
            if selected == "corrida" {
                selected = "corrida-e-caminhada"
            }

            feedUrl = String(baseURL + selected + "/feed/")
            url = NSURL(string: feedUrl!)
            
            if let data = defaults.objectForKey("favorites") as? NSData{
                if let stringUrls = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String] {
                    
                    for URL in stringUrls {
                        if URL == feedUrl {
                            favoriteBarButton.image = favoriteBarButton.image?.imageWithColor(UIColor.blueColor()).imageWithRenderingMode(.AlwaysOriginal)
                            alreadyExist = true
                        }
                    }
                }
            }
            feedForFavorites(false)
            
        }
        else {
            
            //Set delegate
            collectionView.emptyDataSetSource = self;
            collectionView.emptyDataSetDelegate = self;
            
            news = []
            self.collectionView.reloadData()
            
            //Get news from Userdeafults (favorites)
            if let data = defaults.objectForKey("favorites") as? NSData {
                let stringUrls = (NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String])!
                urls = stringUrls.map {NSURL(string: $0)!}
                feedForFavorites(true)
            }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Came by tab bar - Favorites
        if selectedCategory == nil {
            self.navigationItem.rightBarButtonItem?.enabled = false
            self.navigationItem.setRightBarButtonItem(nil, animated: true)
            self.title = "Favoritos"
        }
        
        //RefreshControl
        refresh.tintColor = UIColor.whiteColor()
        refresh.addTarget(self, action: "refreshNews", forControlEvents: UIControlEvents.ValueChanged)
        collectionView.addSubview(refresh)
    }
    
    deinit {
        collectionView.emptyDataSetSource = nil;
        collectionView.emptyDataSetDelegate = nil;
    }
    
    // MARK: - Feed
    func feedForFavorites(isFavorites: Bool) {
        
        if isFavorites {
            
            news = []
            sportHTMLReader.getNewsFromMultiplesURLs(urls, completion: { (result: Result<[News], NSError?>) in
                if let news = result.value {
                    self.news = self.news + news
                    self.collectionView.reloadData()
                }
            })
            
        }
        else{
            
            sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
                if let news = result.value{
                    self.news = news
                    self.collectionView.reloadData()
                }
            }
        }

    }

    // MARK: - Refresh - Need Fix
    func refreshNews(){
        if let selected = selectedCategory {
            feedForFavorites(false)
        }
        else{
            feedForFavorites(true)
        }
        
        refresh.endRefreshing()
    }
    
    // MARK: - Add Favortie
    @IBAction func favouriteTapped(sender: AnyObject) {
        
        if let data = defaults.objectForKey("favorites") as? NSData{
            favorites = (NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String])!
        }
        
        if alreadyExist == false {
            //Change icon color
            favoriteBarButton.image = favoriteBarButton.image?.imageWithColor(UIColor.blueColor()).imageWithRenderingMode(.AlwaysOriginal)
            favoriteBarButton.enabled = false
            
            //Save Favorites
            favorites.append(feedUrl!)
            
        }else{
            //Change icon color
            favoriteBarButton.image = UIImage(named: "star-fill")
            
            //Remove from favorites
            favorites = favorites.filter {$0 != self.feedUrl}
        }
        
        let dataArray = NSKeyedArchiver.archivedDataWithRootObject(favorites)
        defaults.setObject(dataArray, forKey: "favorites")
        defaults.synchronize()
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "readNewsFromMyFeed" {
            let vc = segue.destinationViewController as! NewsViewController
            let selectedNews = sender as! News
            vc.news = selectedNews
        }
    }
}
