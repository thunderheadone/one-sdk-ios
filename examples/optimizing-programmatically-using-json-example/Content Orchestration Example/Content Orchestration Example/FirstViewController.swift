//
//  FirstViewController.swift
//  Content Orchestration Example
//
//  Created by Andrei Pop on 25/03/2019.
//  Copyright © 2019 Thunderhead. All rights reserved.
//

import UIKit
import Thunderhead

//
// Declared the OneInteractionResponseDelegate which will notify us when a response is received for this view controller
//
class FirstViewController: UITableViewController, OneInteractionResponseDelegate {

    var myTableViewData = ["product-1A","product-2A","product-3A"]
    var myOptimizationData : [String : OneOptimizationResponse] = [:]
    
    let cardItemIdentifier : String = "card-item"
    let topBannerIdentifier : String = "top-banner"
    
    let tableViewCellIdentifier : String = "cellidentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: tableViewCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        // Added the delegate to the view controller
        //
        One.addInteractionResponseDelegate(self)
    }
    
    //
    // Delegate fucntion which returns the response from an interaction
    //
    func interaction(_ interactionPath: String!, didReceiveResponse response: [AnyHashable : Any]!) {
            if(response != nil) {
                
                //
                // Retrieve the response and decode it as a OneInteractionResponse
                //
                var interactionResponse: OneInteractionResponse?
                let decoder = JSONDecoder()
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
                    interactionResponse = try decoder.decode(OneInteractionResponse.self, from:jsonData)
                } catch {
                    print(error.localizedDescription)
                }
                
                if let interactionResponse = interactionResponse,
                    let optimizations = interactionResponse.optimizations,
                    optimizations.count > 0 {
                    
                    for optimization in optimizations {
                        
                        //
                        // Base64 decode the optimization data
                        //
                        if let optimizationString = optimization.data,
                            let optimizationData = Data(base64Encoded: optimizationString) {
                            
                                do {
                                    if let optimizationDataResponse = try decoder.decode(OptimizationDataResponse.self, from:optimizationData) as? OptimizationDataResponse,
                                        let action = optimizationDataResponse.actions?.first,
                                        let asset =  action.asset,
                                        let content = asset.content,
                                        let responses = asset.responses
                                    {
                                    //
                                    // Escape the HTML tags to retrieve the decoded asset content
                                    //
                                    let decodedContent = content.stringByEscapingHTMLTags()
                                    
                                    if let decodedContentData = decodedContent.data(using: .utf8),
                                        let decodedContentDataResponse = try decoder.decode(OneAssetContentResponse.self, from:decodedContentData) as? OneAssetContentResponse,
                                        
                                        //
                                        // Fot the purposes of this demo we retrieve the image and path
                                        // The optimization path will determine where the asset will be displayed in the table view
                                        //
                                        let contentImage = decodedContentDataResponse.image,
                                        let optimizationPath = optimization.path
                                        {
                                            if (optimizationPath == topBannerIdentifier) {
                                                print(decodedContentDataResponse)
                                                myTableViewData[0] = contentImage
                                            }
                                            
                                            if (optimizationPath == cardItemIdentifier) {
                                                print(decodedContentDataResponse)
                                                myTableViewData[1] = contentImage
                                            }

                                            myOptimizationData[optimizationPath] = OneOptimizationResponse(optimization: optimization, responses: responses)
                                            
                                            DispatchQueue.main.async {
                                                self.tableView.reloadData()
                                            }
                                        }
                                    }
                                } catch {
                                print("Failed to parse optimization data: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
                
            //
            // Pass on the reponse to ONE SDK. This method returns the response to
            // the SDK to process - attaching any capture, track or optimize
            // instructions to the Interaction.
            //
            One.processResponse(response)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        One.removeInteractionResponseDelegate(self)
        
        //
        // reset the table view data to the original array
        //
        myTableViewData = ["product-1A","product-2A","product-3A"]
    }
}

extension FirstViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier) as! FirstTableViewCell
        
        //
        // Quick hack to check if the array object is an image url
        // If it is we need to download the image
        //
        if myTableViewData[indexPath.row].hasPrefix("https") {
            if let url = URL(string: myTableViewData[indexPath.row]) {
                do {
                    cell.myImageView?.image = UIImage(data: try Data(contentsOf: url))
                } catch {
                    print("Failed to download the image.")
                }
            }
        }
        else {
            cell.myImageView?.image = UIImage(named: myTableViewData[indexPath.row])
        }
        
        if indexPath.row == 0 {
            cell.myImageView?.contentMode = .scaleAspectFill
        }
        else {
            cell.myImageView?.contentMode = .scaleAspectFit
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var optimizationPath : String?
        
        if indexPath.row == 0 {
            optimizationPath = topBannerIdentifier
         
        }
        else if indexPath.row == 1 {
            optimizationPath = cardItemIdentifier
        }
        
        if let optimizationPath = optimizationPath,
            let myOptimizationData = myOptimizationData[optimizationPath] {
                let response = myOptimizationData.responses.filter {$0.sentiment == "positive"}.first
                One.sendResponseCode(response?.code, forInteractionPath: self.oneInteractionPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 140
        } else {
            return 400
        }
    }
    
    
}

//
// String extension to escape HTML Tags
//
extension String {
    
    func stringByEscapingHTMLTags() -> String {
        var target = self
        target =  target.replacingOccurrences(of: "&quot;", with: "\"")
        target =  target.replacingOccurrences(of: "&nbsp;", with: " ")
        target =  target.replacingOccurrences(of: "&lt;", with: "<")
        target =  target.replacingOccurrences(of: "&gt;", with: ">")
        target =  target.replacingOccurrences(of: "&amp;", with: "&")
        
        return target
    }
}
