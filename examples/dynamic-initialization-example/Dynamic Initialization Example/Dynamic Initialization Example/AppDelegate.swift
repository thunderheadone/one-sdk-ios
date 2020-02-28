/*
    AppDelegate.swift
    Dynamic Initialization Example
 
    Copyright © 2020 Thunderhead One Inc. All rights reserved.
 
    This example app demonstrates how to late initialize and reconfigure the ONE SDK when required.
       In this app, we use the situation where it may be useful to reconfigure the SDK
       in the event that a user has changed regions.
    
    https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/dynamic-initialization-example
*/

import UIKit
import Thunderhead

/// Admin mode is not reconfigurable on the fly.  You will need to use the same Admin setting for all configurations.
/// App needs to be restarted when switching between User and Admin mode.
let kOneSDKAdminModeEnabled = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
         To see an output of the requests/responses made by the SDK, uncomment below
         
         For more documentation on SDK logging:
            See here: https://github.com/thunderheadone/one-sdk-ios#access-debug-information
         */
        // One.setLogLevel(.All)
        
        
        /*
         Late Initialization, put off configuration until later.
         
         You can initialize the SDK with either all valid or empty/nil parameters.
         - When initialized with valid credentials, the SDK can be reconfigured later when necessary.
         - When initialized by passing all `empty strings` or `nil` parameters (late initialization), the SDK can then be configured with valid parameters later using the same method.
             - Note: In this state, the SDK locally queues end-user data and will upload the data to server once SDK is initialized with valid parameters.
         https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/dynamic-initialization-example
         */
        NSLog("Thunderhead SDK is initialized with no parameters (late initialization).")
        One.startSessionWithSK("",
            uri: "",
            apiKey: "",
            sharedSecret: "",
            userId: "",
            adminMode: kOneSDKAdminModeEnabled,
            hostName: "")
        
        
        /*
         Uncomment below to opt an end-user out of tracking.
            When opted out, tracking will stop and locally queued data will be removed.
            At any point you can opt a user back in by passing false into the same method.
            For instructions on how completely remove a user's data from Thunderhead ONE or Salesforce Interaction Studio - see our api documentation.
            https://thunderheadone.github.io/one-api/#operation/delete
         */
        // One.opt(out: true)
        
        
        /*
         Uncomment below to opt disable automatic Interaction detection.
            By disabling automatic Interaction detection, the SDK will no longer automatically send Interaction requests as view controllers are presented on screen. It becomes your responsibility to send them when needed by using the send Interaction methods outlined here:
            https://github.com/thunderheadone/one-sdk-ios#send-an-interaction-request-programmatically
            
            You can set this back to false at any point to restart automatic Interaction detection.
         */
        // One.disableAutomaticInteractionDetection(true)
        
        
        /*
         For Interaction Studio, uncomment below
         
         https://github.com/thunderheadone/one-sdk-ios#for-salesforce-interaction-studio-integrations
         */
        // One.setTheme(.InteractionStudio)
        
        /*
         Uncomment below to programmatically erase the user profile data
            This method removes tid from local storage only.
            For instructions on how to completely remove a user's data from Thunderhead ONE or Salesforce Interaction Studio - see our api documentation.
            https://thunderheadone.github.io/one-api/#operation/delete
         */
        // One.clearUserProfile()

        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor(red: 65.0/255.0, green: 61.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

