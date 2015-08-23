//
//  ViewController.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/18/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit
import Result

class ViewController: UIViewController {
    
    let sportHTMLReader = SportHTMLReader()
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let xmlParser = SaxParser()
//        xmlParser.xmlURL = NSURL(string: "http://www.gazetaesportiva.net/categoria/tenis/feed/")
//        
//        news = xmlParser.parseFeed as! [News]
//        
//        println("Titulo - \(news.first?.text)")
        
        
        let url = NSURL(string: "http://www.gazetaesportiva.net/categoria/tenis/feed/")!
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            
            if let news = result.value{
                for n in news {
                    println(n.textComp.componentsSeparatedByString("content:encoded")[1])
                println("##########################################################################################################")
                }
            }
        }
    }
}

