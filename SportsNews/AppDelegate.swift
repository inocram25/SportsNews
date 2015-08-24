//
//  AppDelegate.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/18/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        let attrs = [NSForegroundColorAttributeName:UIColor.blackColor()]
        
        let appearanceNavigationBar = UINavigationBar.appearance()
        //appearanceNavigationBar.barTintColor = UIColor.blackColor()
        appearanceNavigationBar.titleTextAttributes = attrs
        appearanceNavigationBar.tintColor = UIColor.blackColor()
        
        let appearanceTabBar = UITabBar.appearance()
        appearanceTabBar.barTintColor = UIColor.news_darkGrayColor()
        
        let appearanceTabBarItem = UITabBarItem.appearance()
        appearanceTabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor()], forState:.Normal)
        appearanceTabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState:.Selected)
        
        return true
    }
}

