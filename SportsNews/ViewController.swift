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
    
    let sportHTMLReader = SportHTLMReader()
    let testHTMLReader = TesteHTMLReader()
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let xmlParser = SaxParser()
//        xmlParser.xmlURL = NSURL(string: "http://www.lancenet.com.br/rss/section/3/")
//        
//        news = xmlParser.parseFeed as! [News]
//        
//        println("Titulo - \(news.first?.text)")
        

//        let url = NSURL(string: "http://www.lancenet.com.br/rss/section/3/")!
//        sportHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
//            
//            println("Finding news...")
//            
//            if let news = result.value {
//                for currentNews in news{
//                    println("Titulo da noticia - \(currentNews.title)")
//                }
//            }
//            else{
//                println("Error for getting news= \(result.error)")
//            }
//        }
        
        let url = NSURL(string: "http://www.lancenet.com.br/rss/section/3/")!
        testHTMLReader.getNewsFromURL(url) { (result: Result<[News], NSError?>) -> Void in
            
            if let news = result.value{
                for n in news {
                    self.i++
                    println(self.i)
                    println("\n")
                    println("\n titulo - \(n.title)")
                    println("\n image - \(n.imageURL)")
                    println("\n texto - \(n.text)")
                    println("\n link -\(n.link)")
                    println("\n--------------------------------------------")
                    
                }
            }
        }
    }

}

