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


class SportHTLMReader {
   
    var news = [News]()
    
    private lazy var manager: Alamofire.Manager = {
        
        let configuration: NSURLSessionConfiguration = {
            var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
            
            var headers = Alamofire.Manager.defaultHTTPHeaders
            headers["Accept-Encoding"] = "gzip"
            //headers["Content-Type"] = "application/json"
            configuration.HTTPAdditionalHeaders = headers
            return configuration
            }()
        
        return Manager(configuration: configuration)
        }()
    
    func getNewsFromURL(URL: NSURL, completion: ((Result<[News], NSError?>)  -> Void)){
        
        manager.request(.GET, URL).responseString { (_, _, responseData, error) in
            
            if let stringData = responseData {
                
                let filtered = stringData.stringByReplacingOccurrencesOfString("<![CDATA[", withString: "").stringByReplacingOccurrencesOfString("]]>", withString: "")
                let document = HTMLDocument(string: filtered)
                
                if let divHeading = document.firstNodeMatchingSelector("item") {
                    
                    for htmlNode in divHeading.childElementNodes {
                        //println("\nteste: \(htmlNode)")
                        if let element = htmlNode as? HTMLElement {
                            
                            if let e = element.firstNodeMatchingSelector("title") {
                                println("title - \(e.textContent)")
                            }
                            
                            if let e = element.firstNodeMatchingSelector("img"){
                                let imgPath = e.attributes["src"] as! String
                                println("imgPath - \(imgPath)")

                            }
                            
                            if let e = element.firstNodeMatchingSelector("description") {
                                println("description - \(e.textContent)")
                            }
                            
                            /*if let e = element.firstNodeMatchingSelector("link") {
                                println("\n\n\n\nlink\n\n\n - \(e)")
                            }*/

                            //var currentNews:News?
                            //currentNews.title = ""
                            //currentNews.text = ""
                            //currentNews.imageURL = ""
                            
                            //self.news.append(currentNews)
                        }
                    }
                    
                    completion(Result.success(self.news))
                }
                else {
                    completion(Result.failure(Result<[News], NSError?>.error(message: "could not find div .contentheading")))
                }
            }
            else {
                completion(Result.failure(error))
                println("error parsing responseData")
            }
        }
        
        
    }
}
