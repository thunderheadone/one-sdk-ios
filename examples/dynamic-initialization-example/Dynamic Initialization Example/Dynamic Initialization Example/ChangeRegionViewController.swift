/*
    ChangeRegionTableViewController.swift
    Dynamic Initialization Example

    Copyright © 2020 Thunderhead One Inc. All rights reserved.
 
    This example app demonstrates how to late initialize and reconfigure the ONE SDK when required.
       In this app, we use the situation where it may be useful to reconfigure the SDK
       in the event that a user has changed regions.
    
    https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/dynamic-initialization-example
*/

import UIKit

// Delegate to handle SDK reconfiguration.
protocol ChangeRegionDelegate: class {
    func onRegionChanged(region: String)
}

class ChangeRegionTableViewController: UITableViewController {
    
    private var regions = Array(ONESDKConfiguration.keys.sorted())
    weak var delegate: ChangeRegionDelegate?
    var currentRegion: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Country"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)

        let region = regions[indexPath.row]
        cell.textLabel?.text = region
        
        if (region == currentRegion) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRegion = regions[indexPath.row]
        delegate?.onRegionChanged(region: selectedRegion)
        self.navigationController?.popViewController(animated: true)
    }
}
