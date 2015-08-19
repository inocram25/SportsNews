//
//  SaxParser.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/18/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit

class SaxParser: NSObject, NSXMLParserDelegate {
    
    var xmlURL:NSURL?
    var parseFeed:NSArray {
        
        if let url = self.xmlURL{
            parser = NSXMLParser(contentsOfURL: xmlURL)!
            self.parser.delegate = self
            self.parser.parse()
        }
        
        return news
    }
    
    private var parser = NSXMLParser()
    private var xmlText:String!
    private var currentNews:News?
    private var news = [News]()
    
    
    // MARK: – NSXMLParserDelegate methods
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        
        xmlText = ""
        
        if elementName == "item" {
            currentNews = News()
        }
        
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "title"
        {
            currentNews?.title = xmlText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
        
        if elementName == "link"
        {
            currentNews?.link = xmlText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
        
        if elementName == "description"
        {
            currentNews?.text = xmlText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
        
        if elementName == "item"
        {
            println(self.currentNews?.title)
            news.append(self.currentNews!)
        }
        
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        
        if let text = string {
            xmlText = xmlText + text
        }
    }
   
}
