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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.gazetaesportiva.net/categoria/tenis/feed/")!
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            
            if let n = result.value{
                self.news = n
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
