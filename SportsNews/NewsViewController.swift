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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let n = news {
            titleLabel.text = n.title
            if let urlString = n.imageURL{
                imageView.pin_setImageFromURL(NSURL(string: urlString))
            }
            textView.text = n.textComp
        }
        
        //Disable automatically adjusts in scrollview
        self.automaticallyAdjustsScrollViewInsets = false
    }
}
