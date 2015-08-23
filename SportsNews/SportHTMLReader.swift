//
//  SportHTLMReader.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/19/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import Foundation
import HTMLReader
import Alamofire
import Result


class SportHTMLReader {
    
    var news = [News]()
    
    private lazy var manager: Alamofire.Manager = {
        
        let configuration: NSURLSessionConfiguration = {
            var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
            
            var headers = Alamofire.Manager.defaultHTTPHeaders
            headers["Accept-Encoding"] = "gzip"
            headers["Content-Type"] = "text/html; charset=utf-8"
            configuration.HTTPAdditionalHeaders = headers
            
            return configuration
            }()
        
        return Manager(configuration: configuration)
        }()
    
    func getNewsFromURL(URL: NSURL, completion: ((Result<[News], NSError?>)  -> Void)){
        
        manager.request(.GET, URL).response { (_, _, responseData, error) in
            
            if let responseObject = responseData, stringData = NSString(data: responseObject, encoding: NSUTF8StringEncoding) as? String {
                
                let filtered = stringData.stringByReplacingOccurrencesOfString("<![CDATA[", withString: "").stringByReplacingOccurrencesOfString("]]>", withString: "")
                
                let document = HTMLDocument(string: filtered)
                
                let divHeadings = document.nodesMatchingSelector("item") as! [HTMLElement]
                
                
                for div in divHeadings {
                    
                    var currentNews = News()
                    currentNews.textComp = ""
                    for htmlNode in div.childElementNodes {
                        currentNews.textComp = currentNews.textComp.stringByAppendingString("\(htmlNode.tagName)\n")
                        currentNews.textComp = currentNews.textComp.stringByAppendingString(htmlNode.textContent)
                        currentNews.textComp = currentNews.textComp.stringByAppendingString("\n\(htmlNode.tagName)\n")
                       
                        if let element = htmlNode as? HTMLElement {
                            if let e = element.firstNodeMatchingSelector("title") {
                                currentNews.title = e.textContent
                            }
                            
                            if let e = element.firstNodeMatchingSelector("img"), imgPath = e.attributes["src"] as? String{
                                currentNews.imageURL = imgPath
                            }
                            
                            if let e = element.firstNodeMatchingSelector("description") {
                                currentNews.text = e.textContent
                            }
                            
                            if let e = element.firstNodeMatchingSelector("guid") {
                                currentNews.link = e.textContent
                            }
                            
                            if let e = element.firstNodeMatchingSelector("pubDate") {
                                currentNews.pubDate = e.textContent
                            }
                        }
                    }
                    self.news.append(currentNews)
                }
                completion(Result.success(self.news))
            }else {
                completion(Result.failure(error))
                println("error parsing responseData")
            }
        }
    }
}