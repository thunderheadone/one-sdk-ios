//
//  AppDelegate.swift
//  Content Orchestration Example
//
//  Created by Andrei Pop on 25/03/2019.
//  Copyright © 2019 Thunderhead. All rights reserved.
//

import UIKit
import Thunderhead

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        One.startSessionWithSK("ONE-XXXXXXXXXX-1022",
                               uri:"myAppsNameURI",
                               apiKey:"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx",
                               sharedSecret:"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx",
                               userId:"api@yourCompanyName",
                               adminMode:false,
                               hostName:"eu2.thunderhead.com")

//        For Interaction Studio, uncomment below
//        One.setTheme(.InteractionStudio)
        
//        To see an output of the requests/responses made by the SDK, uncomment below
//        One.setLogLevel(.All)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

