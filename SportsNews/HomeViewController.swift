//
//  HomeViewController.swift
//  SportsNews
//
//  Created by Leonardo Maffei on 21/08/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit
import Result

class HomeViewController: UIViewController {
    
    let sportHTMLReader = SportHTMLReader()
    var news = [News]()
    let url = NSURL(string: "http://www.gazetaesportiva.net/categoria/tenis/feed/")!
    let refresh = UIRefreshControl()
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var load: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //StatusBar - Light
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        //NavBar - set hidden
        navigationController?.navigationBarHidden = true
        
        UIView.animateWithDuration(0.7, delay: 0.3,
            options: .Repeat | .Autoreverse, animations: {
                self.iconView.alpha = 0
            }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //RefreshControl
        refresh.tintColor = UIColor.whiteColor()
        refresh.addTarget(self, action: "refreshNews", forControlEvents: UIControlEvents.ValueChanged)
        collectionView.addSubview(refresh)
        
        //for load animated
        load.layer.hidden = false
        load.startAnimating()
        
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            
            if let n = result.value{
                self.news = n
                
                if self.news.count != 0 {
                    //for stop animated
                    self.load.layer.hidden = true
                    self.load.stopAnimating()
                    self.imageIcon.layer.hidden = true
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    func refreshNews(){
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            if let n = result.value{
                self.news = n
                self.collectionView.reloadData()
                self.refresh.endRefreshing()
            }
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "readNews" {
            let vc = segue.destinationViewController as! NewsViewController
            let selectedNews = sender as! News
            vc.news = selectedNews
        }
    }
    
}
