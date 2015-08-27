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
    var selectedCategory:String?
    var url:NSURL!
    @IBOutlet weak var favoriteBarButton: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selected = selectedCategory{
            urlFromSelecetedCategory()
        }else{
            //TO-DO: Show My Feeds
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/futebol-internacional/feed/")
        }
        
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            
            if let n = result.value{
                self.news = n
                
                if self.news.count != 0 {
                    //for stop animated
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    func urlFromSelecetedCategory(){
        
        if selectedCategory == "Volei"{
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/volei/feed/")!
        }
        else if selectedCategory == "Ciclismo"{
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/ciclismo/feed/")!
        }
        else if selectedCategory == "Atletismo"{
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/atletismo/feed/")!
        }
        else if selectedCategory == "Natacao"{
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/natacao/feed/")!
        }
        else if selectedCategory == "Corrida"{
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/corrida-e-caminhada/feed/")!
        }
        else if selectedCategory == "Tenis"{
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/tenis/feed/")!
        }
        else if selectedCategory == "Outros"{
            url = NSURL(string: "http://www.gazetaesportiva.net/categoria/outros/feed/")!
        }
    }
    
    @IBAction func favouriteTapped(sender: AnyObject) {
        self.favoriteBarButton.tintColor = UIColor.redColor()
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
