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
    
    var news = [News]()
    let sportHTMLReader = SportHTLMReader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let xmlParser = SaxParser()
        xmlParser.xmlURL = NSURL(string: "http://www.lancenet.com.br/rss/section/3/")
        
        news = xmlParser.parseFeed as! [News]
        
        println("Titulo - \(news.first?.text)")*/
        

        let url = NSURL(string: "http://www.lancenet.com.br/rss/section/3/")!
        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            //
            println("Fim")
        }
    }

}

