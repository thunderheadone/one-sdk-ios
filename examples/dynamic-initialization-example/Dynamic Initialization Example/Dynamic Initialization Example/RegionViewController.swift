/*
    RegionViewController.swift
    Dynamic Initialization Example
 
    Copyright © 2020 Thunderhead One Inc. All rights reserved.
 
    This example app demonstrates how to late initialize and reconfigure the ONE SDK when required.
       In this app, we use the situation where it may be useful to reconfigure the SDK
       in the event that a user has changed regions.
    
    https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/dynamic-initialization-example
*/

import UIKit
import Thunderhead

let kRegionKey = "region"

struct ONESDKCredentials {
    var siteKey: String? = ""
    var uri: String? = ""
    var apiKey: String? = ""
    var sharedSecret: String? = ""
    var userId: String? = ""
    var adminMode = kOneSDKAdminModeEnabled
    var hostName: String? = ""
}

/*
    Each ONE configuration corresponds to a region.
    Fill in your own ONE credentials below.
        - You will need to maintain and store your own SDK configurations as the SDK does not manage them.
        - Admin mode is not reconfigurable on the fly, hence the `kOneSDKAdminModeEnabled` constant used for all configurations.
          The app needs to be restarted when switching between User and Admin mode.
*/
var ONESDKConfiguration: Dictionary = [
    "United States": ONESDKCredentials(
        siteKey: "ONE-XXXXXXXXXX-1022_1",
        uri: "myAppsNameURI_1",
        apiKey: "f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx_1",
        sharedSecret: "bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx_1",
        userId: "api@yourCompanyName",
        adminMode: kOneSDKAdminModeEnabled,
        hostName: "eu2.thunderhead.com"),
    "Europe": ONESDKCredentials(
        siteKey: "ONE-XXXXXXXXXX-1022_2",
        uri: "myAppsNameURI_2",
        apiKey: "f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx_2",
        sharedSecret: "bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx_2",
        userId: "api@yourCompanyName",
        adminMode: kOneSDKAdminModeEnabled,
        hostName: "eu2.thunderhead.com"),
    "United Kingdom": ONESDKCredentials(
        siteKey: "ONE-XXXXXXXXXX-1022_3",
        uri: "myAppsNameURI_3",
        apiKey: "f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx_3",
        sharedSecret: "bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx_3",
        userId: "api@yourCompanyName",
        adminMode: kOneSDKAdminModeEnabled,
        hostName: "eu2.thunderhead.com"),
]

class RegionViewController: UIViewController, ChangeRegionDelegate {
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var currentRegion: String? {
        return UserDefaults.standard.string(forKey: kRegionKey) ?? nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if let region = currentRegion {
            self.regionLabel.text = currentRegion
            self.onRegionChanged(region: region)
            
            // Update button state
            DispatchQueue.main.async {
                self.button.setTitle("CHANGE", for: .normal)
            }
        } else {
            self.regionLabel.text = "No Region Selected"
            
            // Update button state
            DispatchQueue.main.async {
                self.button.setTitle("SELECT", for: .normal)
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    //MARK: - ChangeRegionDelegate
    
    func onRegionChanged(region: String) {
        
        // Handle SDK reconfiguration here.
        if let oneConfiguration = ONESDKConfiguration[region] {
            NSLog("Thunderhead SDK is reconfigured with parameters corresponding to \(region).")
            
            self.regionLabel.text = region
            self.saveRegion(region: region)
            
            // Reconfigure the SDK that corresponds to the region selected.
            One.startSessionWithSK(oneConfiguration.siteKey,
                                   uri: oneConfiguration.uri,
                                   apiKey: oneConfiguration.apiKey,
                                   sharedSecret: oneConfiguration.sharedSecret,
                                   userId: oneConfiguration.userId,
                                   adminMode: false,
                                   hostName: oneConfiguration.hostName)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ChangeRegionTableViewController {
            destination.delegate = self
            destination.currentRegion = self.currentRegion
        }
    }
    
    
    // MARK: - Region Storage
    
    private func saveRegion(region: String) {
        let defaults = UserDefaults.standard
        defaults.set(region, forKey: kRegionKey)
        defaults.synchronize()
    }
}
