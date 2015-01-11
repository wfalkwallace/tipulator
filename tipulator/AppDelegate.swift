//
//  AppDelegate.swift
//  tipulator
//
//  Created by William Falk-Wallace on 12/31/14.
//  Copyright (c) 2014 Falk-Wallace. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // style the navbar
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barTintColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1)
        navigationBarAppearace.tintColor = UIColor(red:0.93, green:0.94, blue:0.95, alpha:1)
        navigationBarAppearace.titleTextAttributes = [NSFontAttributeName: UIFont(name: "MarketingScript", size: 30)!,
                                                      NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        
        // let image = UIImage(named: "logo-text-light")
        // navigationItem.titleView = UIImageView(image: image)
        
        // var navigationLogoImageView = UIImageView()
        // navigationLogoImageView.contentMode = .ScaleAspectFit
        // var navigationLogoImage = UIImage(named: "logo-text-light")
        // navigationLogoImageView.image = navigationLogoImage
        // UINavigationBar.appearance().addSubview(navigationLogoImageView)
        
        
        // set up some saved defaults
        var defaultSettings = ["defaultTipIndex":0, "defaultSplitIndex":0, "defaultTipPercentages":[0.2, 0.25], "defaultCurrencySymbolIndex":0]
        NSUserDefaults.standardUserDefaults().registerDefaults(defaultSettings)
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

