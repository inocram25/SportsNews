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
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var load: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //set hide navigation bar
    override func viewWillAppear(animated: Bool)
    {
        navigationController?.navigationBarHidden = true
        
        UIView.animateWithDuration(0.7, delay: 0.3,
            options: .Repeat | .Autoreverse, animations: {
                self.iconView.alpha = 0
            }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for load animated
        load.layer.hidden = false
        load.startAnimating()
        
        let url = NSURL(string: "http://www.gazetaesportiva.net/categoria/tenis/feed/")!
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
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "readNews" {
            let vc = segue.destinationViewController as! NewsViewController
            let selectedNews = sender as! News
            vc.news = selectedNews
        }
    }
    
}
