![Thunderhead SDK](https://github.com/thunderheadone/one-sdk-ios/raw/master/images/Thunderhead_Logo.png)

## Resources

* [Migration Guides](https://github.com/thunderheadone/one-sdk-ios/tree/master/migration-guides)

## Table of Contents

- [Prerequisites](#prerequisites)
- [Step 1: Add the Thunderhead SDK to your app](#step-1-add-the-thunderhead-sdk-to-your-app)
  * [CocoaPods](docs/cocoapods-integration-guide.md)
  * [Swift Package Manager](docs/spm-integration-guide.md)
  * [Manual installation](docs/manual-integration-guide.md)
- [Step 2: Configure biometric authentication](#step-2-configure-biometric-authentication)
- [Step 3: Configure the codeless Thunderhead SDK for iOS](#step-3-configure-the-codeless-thunderhead-sdk-for-ios)
  * [Initialize the SDK](#initialize-the-sdk)
    + [Import the SDK’s module](#import-the-sdks-module)
    + [Set up the SDK in User mode for App Store builds](#set-up-the-sdk-in-user-mode-for-app-store-builds)
    + [Set up the SDK in Admin mode for internal distribution](#set-up-the-sdk-in-admin-mode-for-internal-distribution)
- [Additional codeless integration considerations](#additional-codeless-integration-considerations)
  * [For Salesforce Interaction Studio integrations](#for-salesforce-interaction-studio-integrations)
  * [`ViewController`/`View` lifecycle overriding rules](#viewcontrollerview-lifecycle-overriding-rules)
  * [Sending codeless Interactions based on the list of Interactions created under a Touchpoint](#sending-codeless-Interactions-based-on-the-list-of-Interactions-created-under-a-touchpoint)
- [Additional features of Thunderhead SDK](docs/additional-features-guide.md)
- [Troubleshooting guide](#troubleshooting-guide)
- [Questions or need help](#questions-or-need-help)
  * [Salesforce Interaction Studio support](#salesforce-interaction-studio-support)
  * [Thunderhead ONE support](#thunderhead-one-support)

For native integration, simply follow the steps outlined under the installation and configuration section to quickly integrate the SDK into your app. 

## Prerequisites

  - Install the following:
    
    * Xcode 13.0 or later

    * [CocoaPods](https://cocoapods.org) 1.10.0 or later

  - Make sure that your project meets these requirements:

    * Your project must target iOS 9 or later.

  - Set up a physical iOS device or use the iOS simulator to run your app.

*Note:*
- Xcode versions < 13.0 only support archiving an application with bitcode disabled.

## Step 1: Add the Thunderhead SDK to your app

We recommend using [CocoaPods](#cocoapods) to install the Thunderhead SDK. However, if you'd rather not use CocoaPods, you can integrate the SDK framework [directly](#manual-installation) or use [Swift Package Manager](#swift-package-manager) instead.

### CocoaPods

For integration via Cocoapods, please follow [Cocoapods Integration Guide](docs/cocoapods-integration-guide.md).

### Swift Package Manager

For integration via Swift Package Manager, please follow [SPM Integration Guide](docs/spm-integration-guide.md).

### Manual installation

For manual integration, please follow [Manual Integration Guide](docs/manual-integration-guide.md).

## Step 2: Configure biometric authentication

The SDK supports biometric authentication (Touch ID / Face ID) in Admin mode

*Note:*
- To use Face ID authentication, you need to add:

```
<key>NSFaceIDUsageDescription</key>
<string>Why is my app authenticating using face id?</string>
```

to your `Info.plist` file. Failure to do so results in a dialog that tells the user your app has not provided the Face ID usage description.

## Step 3: Configure the codeless Thunderhead SDK for iOS

Enable your app to automatically recognize **Interactions** in your app, by executing the following steps:

### Initialize the SDK

Complete the following steps to initialize the SDK.

#### Import the SDK’s module
1.    Open your App Delegate file.
2.    Add the following line at the top of the file below your own import statements:

    Swift:
    ```swift
    import Thunderhead
    ```

    Objective-C:
    ```objective-c
    @import Thunderhead;
    ```

#### Set up the SDK in User mode for App Store builds

To start tracking, capturing, and receiving Optimizations with the Thunderhead SDK in User mode, you must first initialize it with your Thunderhead API parameters. 
You can find your Thunderhead API parameters on the _API Credentials_ page in Thunderhead ONE or Salesforce Interaction Studio.

For more information on finding these parameters: 
* For **Thunderhead ONE** integrations, see [Find the Information required when Integrating ONE with your Mobile Solutions](https://permalink.thunderhead.com/mobile-docs/one-mobile-integration-info) 
* For **Salesforce Interaction Studio** integrations, see [Find the Information required when Integrating Interaction Studio with your Mobile App](https://permalink.thunderhead.com/mobile-docs/is-mobile-integration-info) 

With your parameters ready at hand, add the following lines to the top of the `didFinishLaunchingWithOptions`:

Swift:
```swift
One.startSessionWithSK("ONE-XXXXXXXXXX-1022",
                    uri:"myAppsNameURI",
                 apiKey:"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx",
           sharedSecret:"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx",
                 userId:"api@yourCompanyName", // For Interaction Studio integrations use a numeric user id - see https://permalink.thunderhead.com/mobile-docs/is-mobile-integration-info-credentials
              adminMode:false,
               hostName:"eu2.thunderhead.com")
```


Objective-C:
```objective-c
[One startSessionWithSK:@"ONE-XXXXXXXXXX-1022"
                    uri:@"myAppsNameURI"
                 apiKey:@"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx"
           sharedSecret:@"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx"
                 userId:@"api@yourCompanyName" // For Interaction Studio integrations use a numeric user id - see https://permalink.thunderhead.com/mobile-docs/is-mobile-integration-info-credentials
              adminMode:NO
               hostName:@"eu2.thunderhead.com"];
```

#### Set up the SDK in Admin mode for internal distribution

We recommend adding the Admin mode function on your internal builds, behind a debug settings function or on a dedicated build pipeline, as described [here](https://eu2.thunderhead.com/one/help/conversations/how-do-i/mobile/one_integrate_mobile_overview_5_steps/#step-3-deploy-the-admin-mode-build-and-make-available-to-business-users).

To use the framework in Admin mode, simply change the `adminMode` boolean to `true`, as follows:

Swift:
```swift
One.startSessionWithSK("ONE-XXXXXXXXXX-1022",
                    uri:"myAppsNameURI",
                 apiKey:"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx",
           sharedSecret:"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx",
                 userId:"api@yourCompanyName", // For Interaction Studio integrations use a numeric user id - see https://permalink.thunderhead.com/mobile-docs/is-mobile-integration-info-credentials
              adminMode:true,
               hostName:"eu2.thunderhead.com")
```


Objective-C:
```objective-c
[One startSessionWithSK:@"ONE-XXXXXXXXXX-1022"
                    uri:@"myAppsNameURI"
                 apiKey:@"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx"
           sharedSecret:@"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx"
                 userId:@"api@yourCompanyName" // For Interaction Studio integrations use a numeric user id - see https://permalink.thunderhead.com/mobile-docs/is-mobile-integration-info-credentials
              adminMode:YES
               hostName:@"eu2.thunderhead.com"];
```

*Note:*
- Dynamic configuration of both Admin and User mode is supported.

**You have now successfully integrated the codeless Thunderhead SDK for iOS.**

## Additional codeless integration considerations

### For Salesforce Interaction Studio integrations

When integrating with Salesforce Interaction Studio you can set the Admin mode theme to match the Interaction Studio look and feel, as follows:

Swift:
```swift
One.setTheme(OneTheme.InteractionStudio)
```

Objective-C:
```objective-c
 [One setTheme:OneThemeInteractionStudio];
```
*Note:*
- By default the SDK will be launched using the Thunderhead ONE theme. You should only use the Interaction Studio theme if you are a Salesforce customer.

### `ViewController`/`View` lifecycle overriding rules

The framework listens to a number of `UIViewController` and `UIView` methods to provide the desired functionality. Those methods are:
- `viewWillAppear`
- `viewDidAppear`
- `viewWillDisappear`
- `didMoveToWindow`

If you use these methods in your code, please ensure to call super when implementing them.

### Sending codeless Interactions based on the list of Interactions created under a Touchpoint

In order to reduce the number of unnecessary Interaction requests sent automatically by the SDK, only codeless Interactions with explicit Interaction paths created under a Touchpoint and configured with at least one point are sent to Thunderhead ONE or Salesforce Interaction Studio. This configuration change has been introduced in version 5.3.0 of the iOS SDK.

*Note:*
- The SDK will only send codeless Interactions if they have been created under a Touchpoint and/or if they match wildcard rules defined under a Touchpoint.
- For a codeless Interaction to be sent by the SDK this Interaction needs to contain at least one Activity Capture Point, Attribute Capture Point, and/or Optimization Point.
- If you are running the SDK in [User mode](#set-up-the-sdk-in-user-mode-for-app-store-builds), you need to ensure that all Interactions and related points have been fully published, before the SDK will trigger a request.

## Additional features of Thunderhead SDK

For additional features of Thunderhead SDK, please follow [Additional Features Guide](docs/additional-features-guide.md).

## Troubleshooting guide

Having trouble with Thunderhead and your iOS project? Visit the [Troubleshooting Guide](TROUBLESHOOTING-GUIDE.md)

## Questions or need help

### Salesforce Interaction Studio support
_For Salesforce Marketing Cloud Interaction Studio questions, please submit a support ticket via https://help.salesforce.com/home_.

### Thunderhead ONE support
_For Thunderhead ONE questions, please submit a support ticket via https://support.thunderhead.com_.
