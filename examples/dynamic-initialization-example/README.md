# Late Initialization and Reconfiguration Example 

This example app demonstrates how to late initialize and dynamically reconfigure the Thunderhead SDK on the fly.

App Flow Summary:
1. In [AppDelegate.swift](https://github.com/thunderheadone/one-sdk-ios/blob/master/examples/dynamic-initialization-example/Dynamic%20Initialization%20Example/Dynamic%20Initialization%20Example/AppDelegate.swift#L47) `didFinishLaunchingWithOptions` method, the SDK is initialized with empty parameters. (*Late initialization*)
2. On initial app start, [RegionViewController.swift](https://github.com/thunderheadone/one-sdk-ios/blob/master/examples/dynamic-initialization-example/Dynamic%20Initialization%20Example/Dynamic%20Initialization%20Example/RegionViewController.swift) is presented with no region selected/configured.  
3. The 'SELECT' button presents [ChangeRegionViewController.swift](https://github.com/thunderheadone/one-sdk-ios/blob/master/examples/dynamic-initialization-example/Dynamic%20Initialization%20Example/Dynamic%20Initialization%20Example/ChangeRegionViewController.swift), which displays a list of regions to select from.
4. Upon selection of a new region, the SDK is then *reconfigured* with new API credentials corresponding to the region selected, triggered from the [`onRegionChanged`](https://github.com/thunderheadone/one-sdk-ios/blob/master/examples/dynamic-initialization-example/Dynamic%20Initialization%20Example/Dynamic%20Initialization%20Example/RegionViewController.swift#L93) delegate method.  

*Note:*
- The SDK's `adminMode` parameter is not reconfigurable on the fly, the app needs to be restarted when switching between User and Admin mode.

## Thunderhead SDK Late Initialization

In the event you want the SDK to run even without valid parameters, you can initialize the SDK with all empty strings `""` or `nil` parameters.  The SDK can then be configured later with valid parameters using the same method.

*Note:*
- In this state, the SDK locally queues end-user data and will upload the data to server once SDK is initialized with valid parameters.
- The SDK does not support partial parameters, parameters passed must either be *all* valid or *all* `empty/nil`.
    
Swift:
```swift
One.startSessionWithSK("",
    uri:"",
    apiKey:"",
    sharedSecret:"",
    userId:"",
    adminMode: false,
    hostName:"")
```

Objective-C:
```objective-c
[One startSessionWithSK:@""
                uri:@""
             apiKey:@""
           sharedSecret:@""
             userId:@""
              adminMode:NO
               hostName:@""];
```
See example of usage [here]( https://github.com/thunderheadone/one-sdk-ios/blob/master/examples/dynamic-initialization-example/Dynamic%20Initialization%20Example/Dynamic%20Initialization%20Example/AppDelegate.swift#L47)

## Reconfiguring the Thunderhead SDK

In the case that the SDK is already initialized with valid credentials, the SDK can also be reconfigured later when necessary. This can be useful for certain situations.  For example, you may require to use different site keys or hosts corresponding to the regions your users are located in as they relocate.

To reconfigure the SDK with different parameters, simply run `One.startSessionWithSK` again with the new parameters, as shown below:

Swift:
```swift
One.startSessionWithSK("ONE-XXXXXXXXXX-1022",
    uri:"myAppsNameURI",
    apiKey:"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx",
    sharedSecret:"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx",
    userId:"api@yourCompanyName",
    adminMode:false,
    hostName:"eu2.thunderhead.com")
```

Objective-C:
```objective-c
[One startSessionWithSK:@"ONE-XXXXXXXXXX-1022"
                uri:@"myAppsNameURI"
             apiKey:@"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx"
           sharedSecret:@"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx"
             userId:@"api@yourCompanyName"
              adminMode:NO
               hostName:@"eu2.thunderhead.com"];
```

## Installation

### CocoaPods

Make sure you have the [CocoaPods](http://cocoapods.org) dependency manager installed. You can do so by executing the following command:

```sh
$ gem install cocoapods
```

In order to run the app, install the Thunderhead SDK into the Example App using the following command:

```sh
$ pod install
```

## Questions or need help

### Salesforce Interaction Studio Support
_For Salesforce Marketing Cloud Interaction Studio questions, please submit a support ticket via https://help.salesforce.com/home_

### Thunderhead ONE Support
_The Thunderhead team is available 24/7 to answer any questions you have. Just email [onesupport@thunderhead.com](mailto:onesupport@thunderhead.com) or visit our docs page for more detailed installation and usage information._

