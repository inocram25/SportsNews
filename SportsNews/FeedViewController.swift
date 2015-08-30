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
    var news = [News]()
    var favorites = [String]()
    var selectedCategory:String?
    var url:NSURL!
    let defaults = NSUserDefaults.standardUserDefaults()
    let refresh = UIRefreshControl()
    let baseURL = "http://www.gazetaesportiva.net/categoria/"
    
    @IBOutlet weak var favoriteBarButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("WARNING!")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Call by CategoriesVC
        if var selected = selectedCategory?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "-") {
            
            if selected == "corrida" {
                selected = "corrida-e-caminhada"
            }
            //Feed CollectionView - Get News
            url = NSURL(string:baseURL + selected + "/feed/")
            
            sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) in
                if let news = result.value{
                    self.news = news
                    self.collectionView.reloadData()
                }
            }
            
        }else{
            //Set delegate
            collectionView.emptyDataSetSource = self;
            collectionView.emptyDataSetDelegate = self;
            
            if let data = defaults.objectForKey("favorites") as? NSData {
                let stringUrls = (NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String])!
                var urls = [NSURL]()
                println(urls)
                for URL in stringUrls{
                    //Transform URL (string) in NSURL
                    urls.append(NSURL(string: URL)!)
                }
                sportHTMLReader.getNewsFromMultiplesURLs(urls, completion: { (result: Result<[News], NSError?>) in
                    //TO-DO
                })
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    // MARK: - Refresh
    func refreshNews(){
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            if let news = result.value{
                self.news = news
                self.collectionView.reloadData()
                self.refresh.endRefreshing()
            }
        }
    }
    
    // MARK: - Add Favortie
    @IBAction func favouriteTapped(sender: AnyObject) {
        //Change icon color
        favoriteBarButton.image = favoriteBarButton.image?.imageWithColor(UIColor.purpleColor()).imageWithRenderingMode(.AlwaysOriginal)
        
        //Save Favorites
        let data = defaults.objectForKey("favorites") as? NSData
        if let data = data{
            favorites = (NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String])!
            println("aoba \(favorites)")
        }
        favorites.append("\(url)")
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
