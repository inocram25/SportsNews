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
        
        //Navigation Bar
        let appearanceNavigationBar = UINavigationBar.appearance()
        appearanceNavigationBar.barTintColor = UIColor.whiteColor()
        appearanceNavigationBar.titleTextAttributes = attrs
        appearanceNavigationBar.tintColor = UIColor.blackColor()
        
        //Tab Bar
        let appearanceTabBar = UITabBar.appearance()
        appearanceTabBar.barTintColor = UIColor.blackColor()
        
        //Tab Bar item
        let appearanceTabBarItem = UITabBarItem.appearance()
        appearanceTabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor()], forState:.Normal)
        appearanceTabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState:.Selected)
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
        return true
    }
}

