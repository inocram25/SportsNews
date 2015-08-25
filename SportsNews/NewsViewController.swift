//
//  NewsViewController.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/25/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = news {
            titleLabel.text = n.title
            imageView.pin_setImageFromURL(NSURL(string: n.imageURL))
            textView.text = n.textComp
        }
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
