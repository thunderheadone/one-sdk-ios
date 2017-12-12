![Thunderhead ONE SDK](https://www.thunderhead.com/uploads/2015/07/Thunderhead_LogoIcon_Aubergine.png "Thunderhead ONE")

The ONE SDK for iOS supports iOS 7.1 and above.

## Installation

### CocoaPods

Make sure you have the [CocoaPods](http://cocoapods.org) dependency manager installed. You can do so by executing the following command:

```sh
$ gem install cocoapods
```

Specify the *Thunderhead ONE SDK* in your podfile

```txt
# Thunderhead ONE SDK
    target :YourTargetName do
      pod 'Thunderhead', :git => 'https://github.com/thunderheadone/one-sdk-ios.git', :tag => '2.19.2'
    end
```

Install using the following command:

```sh
$ pod install
```


### Manual Installation

1. [Download the latest ONE SDK for iOS](https://github.com/thunderheadone/one-sdk-ios/releases) and extract the zip.
2. Open your existing iOS application Xcode project.
3. Import the Thunderhead.embeddedframework into your project.
4. Confirm the SDK files have been added to your project, as follows:
	+ Navigate to your project build settings by selecting your project's Project File in the Project Navigator.
	+ Select the main build target for your app.
	+ Select the **Build Phases** tab.
	+ Confirm **_Thunderhead.framework_** is located in the **Link Binary With Libraries** section.
	+ Confirm **_ThunderheadBundle.bundle_** is located in the **Copy Bundle Resources** section.
5. Ensure your project enables modules by going to **Build Settings** tab and setting the flag for **Enable Modules (C and Objective-C)** to **Yes**. Check out **_Adding the SDK dependencies for manual installation_** if you need modules to be disabled.

**Note:** If your project’s deployment target is less than iOS 8, the **_WebKit.framework_** has to be added manually. Check out **_Adding the SDK dependencies  for manual installation_**.

#### Adding the SDK dependencies for manual installation

The SDK requires modules to be enabled. If you require modules to be disabled, you may need to include the following frameworks to the **Link Binary With Libraries**:

+ *Foundation.framework*
+ *UIKit.framework*
+ *CoreGraphics.framework*
+ *SystemConfiguration.framework*
+ *MessageUI.framework*
+ *Accelerate.framework*
+ *LocalAuthentication.framework*
+ *SafariServices.framework*
+ *WebKit.framework*

If any of the frameworks are missing from your app, select the +icon in the lower-left corner of the **Link Binary With Libraries** section and add each framework, as needed, using the popup window.

## Use the Codeless ONE SDK for iOS
Enable your app to automatically recognize ONE Interactions by executing the following steps.
### Initialize the SDK
Complete the following steps to initialize the SDK.
#### Import the SDK’s module
1.	Open your App Delegate file.
2.	Add the following line at the top of the file below your own import statements:

	Swift:
	```swift
	import Thunderhead
	```

	Objective-C:
	```objective-c
	@import Thunderhead;
	```

#### Set up the Framework in User Mode
To start tracking, capturing, and receiving optimizations with the ONE SDK in User Mode, you must first initialize it with your ONE API parameters. You can find your ONE API parameters on the ONE website.

With your parameters ready to hand, add the following line to the top of the didFinishLaunchingWithOptions:
```swift
	
```

	```objective-c
	[One startSessionWithSK:@"ONE-XXXXXXXXXX-1022"
	                        uri:@"myAppsNameURI"
	                    apiKey:@"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx"
	             sharedSecret:@"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx"
	                    userId:@"yourUsername@yourCompanyName"	
	                adminMode:NO	
	                 hostName:@"eu2.thunderhead.com"];
	```


## Questions or need help

_The Thunderhead ONE team is available 24/7 to answer any questions you have. Just email onesupport@thunderhead.com or visit our docs page for more detailed installation and usage information._
