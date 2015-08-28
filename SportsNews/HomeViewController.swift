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
    let baseURL = "http://www.gazetaesportiva.net/categoria/"
    let refresh = UIRefreshControl()
    var news = [News]()
    var url:NSURL!
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var load: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("WARNING!")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //StatusBar - Light
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        //NavBar - set hidden
        navigationController?.navigationBarHidden = true
        
//        UIView.animateWithDuration(0.7, delay: 0.3,
//            options: .Repeat | .Autoreverse, animations: {
//                self.iconView.alpha = 0
//            }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //RefreshControl
        refresh.tintColor = UIColor.whiteColor()
        refresh.addTarget(self, action: "refreshNews", forControlEvents: UIControlEvents.ValueChanged)
        collectionView.addSubview(refresh)
        
//        //for load animated
//      load.layer.hidden = false
//        load.startAnimating()
        
//        if self.news.count != 0 {
//            //for stop animated
     self.load.layer.hidden = true
//            self.load.stopAnimating()
        self.imageIcon.layer.hidden = true
//        }
        
        //Feed CollectionView - Get news
        feedHome()

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    func refreshNews(){
        feedHome()
        self.refresh.endRefreshing()
    }
    
    //Sorry About that, but we dont have time :)
    func feedHome() {
        url = NSURL(string: baseURL + "regiao-sudeste/feed/")
        
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) in
            
            if let n = result.value{
                self.news = n
                self.collectionView.reloadData()
            }
        }
        //
        delay(1.0, closure: { () -> () in
            self.url = NSURL(string: self.baseURL + "regiao-nordeste/feed/")
            
            self.sportHTMLReader.getNewsFromURL(self.url) { (result: Result<[News], NSError?>) in
                
                if let n = result.value{
                    self.news = self.news + n
                    self.collectionView.reloadData()
                }
            }
        })
        //
        delay(2.0, closure: { () -> () in
            self.url = NSURL(string: self.baseURL + "regiao-norte/feed/")
            
            self.sportHTMLReader.getNewsFromURL(self.url) { (result: Result<[News], NSError?>) in
                
                if let n = result.value{
                    self.news = self.news + n
                    self.collectionView.reloadData()
                }
            }
        })
        //
        delay(3.0, closure: { () -> () in
            self.url = NSURL(string: self.baseURL + "regiao-centro-oeste/feed/")
            
            self.sportHTMLReader.getNewsFromURL(self.url) { (result: Result<[News], NSError?>) in
                
                if let n = result.value{
                    self.news = self.news + n
                    self.collectionView.reloadData()
                }
            }
        })
        //
        
        delay(4.0, closure: { () -> () in
            self.url = NSURL(string: self.baseURL + "regiao-sul/feed/")
            
            self.sportHTMLReader.getNewsFromURL(self.url) { (result: Result<[News], NSError?>) in
                
                if let n = result.value{
                    self.news = self.news + n
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "readNews" {
            let vc = segue.destinationViewController as! NewsViewController
            let selectedNews = sender as! News
            vc.news = selectedNews
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
