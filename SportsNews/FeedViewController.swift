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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.gazetaesportiva.net/categoria/tenis/feed/")!
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            
            if let n = result.value{
                self.news = n
                
                if self.news.count != 0 {
                    //for stop animated
                }
                self.collectionView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
