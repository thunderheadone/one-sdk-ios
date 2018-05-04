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
      pod 'Thunderhead', :git => 'https://github.com/thunderheadone/one-sdk-ios.git', :tag => '2.21.1'
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

#### Set up the Framework in User mode

To start tracking, capturing, and receiving optimizations with the ONE SDK in User mode, you must first initialize it with your ONE API parameters. You can find your ONE API parameters on the ONE website.

With your parameters ready to hand, add the following line to the top of the `didFinishLaunchingWithOptions`:
	
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

#### Set up the Framework in Admin mode

To use the framework in Admin mode, simply change the `adminMode` boolean to `true`, as follows:

Swift:
```swift
One.startSessionWithSK("ONE-XXXXXXXXXX-1022", 
	uri:"myAppsNameURI",
	apiKey:"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx",
	sharedSecret:"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx", 
	userId:"api@yourCompanyName", 
	adminMode:true, 
	hostName:"eu2.thunderhead.com")
```


Objective-C:
```objective-c
[One startSessionWithSK:@"ONE-XXXXXXXXXX-1022"
		    uri:@"myAppsNameURI"
		 apiKey:@"f713d44a-8af0-4e79-ba7e-xxxxxxxxxxxxxxxx"
	   sharedSecret:@"bb8bacb2-ffc2-4c52-aaf4-xxxxxxxxxxxxxxxx"
		 userId:@"api@yourCompanyName"	
	      adminMode:YES	
	       hostName:@"eu2.thunderhead.com"];
```

#### View controller/view lifecycle overriding rules

The framework listens to a number of UIViewController and UIView methods to provide the desired functionality. Those methods are:
- `viewWillAppear`
- `viewDidAppear`
- `viewWillDisappear`
- `didMoveToWindow`

If you use these methods in your code, please ensure to call super when implementing them.

**You have now successfully integrated the codeless ONE SDK for iOS.**

## Additional features
Follow any of the steps below to access further functions of the SDK.

### Manually set a specific Interaction path

The SDK automatically assigns an Interaction path to each view controller. To override the Interaction path that is created automatically, call your view controller and pass your desired Interaction path as a string to the view controller’s `oneInteractionPath` property. 

In your `viewDidLoad` or any other view lifecycle methods, which come before `viewDidAppear`, simply set an Interaction path as shown below:

Swift:
```swift
override func viewDidLoad() {
	super.viewDidLoad()
	// Do any additional setup after loading the view
	self.oneInteractionPath = "/myCustomInteractionPath"
}
```


Objective-C:
```objective-c
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.oneInteractionPath = @"/myCustomInteractionPath";
}
```

*Important note:* Please ensure your custom Interaction starts with a “/” and only contains letters, numbers and/or dashes.

### Exclude an Interaction

You can exclude a specific view controller from being recognized as an Interaction by using the `excludeInteractionPath` method.

In your `viewDidLoad` or any other view lifecycle methods, which come before the `viewDidAppear` method, simply set `excludeInteractionPath` to `true` as shown below:

Swift:
```swift
override func viewDidLoad() {
	super.viewDidLoad()
	// Do any additional setup after loading the view
	self.excludeInteractionPath = true
}
```


Objective-C:
```objective-c
- (void)viewDidLoad {    
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.excludeInteractionPath = YES;
}
```

By default, `excludeInteractionPath` returns `false`.

### Disable automatic interaction detection

You can disable automatic interaction detection by calling the method `disableAutomaticInteractionDetection:` and passing `true` as a parameter, as shown below:

Swift:
```swift
One.disableAutomaticInteractionDetection(true)
```


Objective-C:
```objective-c
[One disableAutomaticInteractionDetection:YES];
```

An appropriate place to call the method might be under `didFinishLaunchingWithOptions` in your application delegate. 

By disabling automatic interaction detection, the SDK will no longer automatically send interaction requests as view controllers are presented on screen. It becomes your responsibility to send them when needed by using the send interaction methods outlined below.

### Send an Interaction request programmatically

You can send an Interaction request programmatically by calling the `sendInteraction` method and passing an Interaction path as a parameter as shown below:

Swift:
```swift
One.sendInteraction("/InteractionPath")
```


Objective-C:
```objective-c
[One sendInteraction:@"/InteractionPath"];
```

*Note:* This will send a POST request to ONE. Only the tid from the response will be used by the SDK - all other response objects will be ignored.

### Send an Interaction request programmatically with a completion block

You can send an Interaction request programmatically by passing an Interaction path and a completion block as a parameters as shown below:

Swift:
```swift
One.sendInteraction("/InteractionPath") { (response, error) -> Void in
	if (error == nil) {
		if let response = response {
			One.processResponse(response)
		}
	}
}
```


Objective-C:
```objective-c
[One sendInteraction:@"/InteractionPath" withBlock:^(NSDictionary *response, NSError *error) {
	if (!error) {
		[One processResponse:response];
	}
}];
```

*Note:* This will send a POST request to ONE. The response can be passed to the `processResponse` method as a parameter as shown above. This method returns the response to the SDK to process - attaching any capture, track or optimize instructions to the Interaction.

### Retrieve a response for a UIViewController instance

You can retrieve a response for an automatically triggered specific Interaction request by making your object conform to the protocol `OneInteractionResponseDelegate`. Your object might be an instance of `UIViewController` or any other class. Follow the instructions below in order to set up this functionality depending on your object’s class. 

#### Retrieve a response for a UIViewController instance

If your object is an instance of `UIViewController` class, perform the next steps to get a response for an automatically triggered interaction request.

1. Add an object, which will be receiving the response, as a parameter to a method `addInteractionResponseDelegate` as shown below:

	Swift:
	```swift
	One.addInteractionResponseDelegate(<your-object>)
	```


	Objective-C:
	```objective-c
	[One addInteractionResponseDelegate:<your-object>];
	```

*Note:* the SDK will weakly store your object, so you need to keep a strong reference to it somewhere. 

2. Make your object conform to the protocol `OneInteractionResponseDelegate`:

	Swift:
	```swift
	class MyViewController: UIViewController, OneInteractionResponseDelegate
	```


	Objective-C:
	```objective-c
	@interface MyViewController() <OneInteractionResponseDelegate>
	```

3. If the automatic interaction detection is switched off, set a value to oneInteractionPath property of your object:

	Swift:
	```swift
	self.oneInteractionPath = "/InteractionPath";
	```


	Objective-C:
	```objective-c
	self.oneInteractionPath = @"/InteractionPath";
	```

4.	Implement a protocol’s required method as shown below:

	Swift:
	```swift
	func interaction(interactionPath: String!, didReceiveResponse response: [NSObject : AnyObject]!) {
        if (response != nil) {
            // work with the response
        }
	}
	```


	Objective-C:
	```objective-c
	`- (void)interaction:(NSString *)interactionPath didReceiveResponse:(NSDictionary *)response {
    	if (response) {
        	// Do something with the response.
    	}
	}
	```

The method returns an interaction path and a corresponding Interaction response. You can either use the `processResponse` method to let the SDK process the default response for you or process it by yourself. 

5. If you no longer need to obtain response for automatically triggered interaction request, you can either nullify your object or call the SDK’s method `removeInteractionResponseDelegate` as shown below:

	Swift:
	```swift
	One.removeInteractionResponseDelegate(<your-object>)
	```


	Objective-C:
	```objective-c
	[One removeInteractionResponseDelegate:<your-object>];
	```

#### Retrieve a response for other instances

If your object is not an instance of `UIViewController` class, perform the next steps to get a response for an automatically triggered interaction request.

1.	Add an object, which will be receiving the response, as a parameter to a method `addInteractionResponseDelegate` as shown below:

	Swift:
	```swift
	One.addInteractionResponseDelegate(<your-object>)
	```


	Objective-C:
	```objective-c
	[One addInteractionResponseDelegate:<your-object>];
	```

*Note:* the SDK will weakly store your object, so you need to keep a strong reference to it somewhere. 

2. Make your object conform to the protocol `OneInteractionResponseDelegate`:

	Swift:
	```swift
	class YourObject: YourObjectClass, OneInteractionResponseDelegate
	```


	Objective-C:
	```objective-c
	@interface YourObject() <OneInteractionResponseDelegate>;
	```

3. Declare a variable `oneInteractionPath` and set its value:
	
	Swift:
	```swift
	class YourObject: YourObjectClass, OneInteractionResponseDelegate {	
		var oneInteractionPath: String! = "/InteractionPath"
		...
	}
	```


	Objective-C:
	```objective-c
	<your-object>.oneInteractionPath = @"/InteractionPath";
	```

4.	Implement a protocol’s required method as shown below:

	Swift:
	```swift
	func interaction(interactionPath: String!, didReceiveResponse response: [NSObject : AnyObject]!) {
        	if (response != nil) {
            	// work with the response
        	}
	}
	```


	Objective-C:
	```objective-c
	- (void)interaction:(NSString *)interactionPath didReceiveResponse:(NSDictionary *)response {
    		if (response) {
    			// Do something with the response.
    		}
	}
	```

The above mentioned method returns an interaction path and a corresponding interaction response. You can either use the `processResponse` method to let the SDK process the default response for you or process it by yourself. 

5. If you no longer need to obtain response for automatically triggered interaction request, you can either nullify your object or call the SDK’s method `removeInteractionResponseDelegate` as shown below

	Swift:
	```swift
	One.removeInteractionResponseDelegate(<your-object>)
	```


	Objective-C:
	```objective-c
	[One removeInteractionResponseDelegate:<your-object>];
	```


### Send Properties to ONE

Properties in the form of key/value pair strings can be sent to ONE using the SDK's public methods. Simply create a dictionary of key/value pair strings and call the appropriate properties public method, as follows:

Swift:
```swift
let myProperties = ["key1":"value1","key2":"value2"]
```


Objective-C:
```objective-c
NSDictionary *myProperties = @{@"Key1":@"Value1", @"Key2":@"Value2"};
```

#### Send properties to a base touchpoint

To send properties to a base touchpoint, call the following public method and pass in your dictionary of key/value pair strings:

Swift:
```swift
One.sendBaseTouchpointProperties(myProperties)
```


Objective-C:
```objective-c
[One sendBaseTouchpointProperties:myProperties];
```

*Note:* This will send a PUT request to ONE. 

#### Send an Interaction request with properties

You can send an Interaction request with Interaction properties by calling the method below, passing Interaction path and dictionary of properties to it:

Swift:
```swift
One.sendInteraction("interactionPath", withProperties:myProperties)
```


Objective-C:
```objective-c
[One sendInteraction:@"/interactionPath" withProperties:myProperties];
```

*Note:* This will send a POST request to ONE. Only the tid from the response will be used by the SDK - all other response objects will be ignored.

#### Send an Interaction request with properties and a completion block

You can send an Interaction request with properties and a completion block by calling the method below, passing an Interaction path, a dictionary of properties and a completion block to it:

Swift:
```swift
One.sendInteraction("/interactionPath", withProperties:myProperties) { 
	(response, error) in
		if (error == nil) {
			if let response = response {
				One.processResponse(response)
			}
		}
}
```


Objective-C:
```objective-c
[One sendInteraction:@"/interactionPath" withProperties:myProperties andBlock:^(NSDictionary *response, NSError *error) {
	if (!error) {
		[One processResponse:response];
	}
}];
```

*Note:* This will send a POST request to ONE. 

The response can be passed to the `processResponse` method as a parameter as shown above. This method returns the response to the SDK to process, attaching any capture, track or optimize instructions to the interaction.

#### Send properties to an Interaction

To send properties to a specific Interaction, call the following public method, passing in your dictionary of key/value pair strings and providing the Interaction path:

Swift:
```swift
One.sendProperties(myProperties, forInteractionPath:"/InteractionPath")
```


Objective-C:
```objective-c
[One sendProperties:myProperties forInteractionPath:@"/interactionPath"];
```

*Note:* This will send a PUT request to ONE. 

#### Send a response code

To send a response code, call the method shown below by passing the response code and the corresponding interaction path as parameters:

Swift:
```swift
One.sendResponseCode("yourCode", forInteractionPath:"/InteractionPath")
```


Objective-C:
```objective-c
[One sendResponseCode:@"yourCode" forInteractionPath:@"/interactionPath"];
```

*Note:* This will send a PUT request to ONE. 

### Identity sync

#### Identity sync with ONE

To synchronise the Safari Mobile identity set by our ONE Tag with the current app identity, call: 

Swift:
```swift
One.identitySync()
```


Objective-C:
```objective-c
[One identitySync];
```

#### Identity sync with ONE and your web touchpoint

To synchronise the Safari Mobile identity set by our ONE Tag with the current app identity and your web touchpoint, call: 

Swift:
```swift
One.identitySyncWithURL(URL(string: "https://yourWebsite"))
```


Objective-C:
```objective-c
[One identitySyncWithURL:[NSURL URLWithString:@"https://yourwebsite"]];
```

### Ability to whitelist identity transfer links

The SDK allows to whitelist links to which the SDK appends a one-tid by calling the method `whitelistIdentityTransferLinks` and passing links to it as shown below:

Swift:
```swift
// This example blacklists links with the domain names
// www.google.com and www.uber.com. For example,
// https://www.google.com, https://www.uber.com/en/,
// https://www.uber.com/en/ride/, etc.
One.whitelistIdentityTransferLinks(["www.google.com","www.uber.com"])

// This example blacklists links with the main domain name
// wikipedia.org and any subdomain. For example,
// https://en.wikipedia.org, https://simple.wikipedia.org, etc.
One.whitelistIdentityTransferLinks(["*.wikipedia.org"]
```


Objective-C:
```objective-c
// This example whitelists links with the domain names
// www.google.com and www.uber.com. For example,
// https://www.google.com, https://www.uber.com/en/,
// https://www.uber.com/en/ride/, etc. 
[One whitelistIdentityTransferLinks:@[@"www.google.com", @"www.uber.com"]];

// This example whitelists links with the main domain name
// wikipedia.org and any subdomain. For example,
// https://en.wikipedia.org, https://simple.wikipedia.org, etc. 
[One whitelistIdentityTransferLinks:@[@"*.wikipedia.org"]];
```

*Note:* If a link is whitelisted, a one-tid will be appended to this link only.

### Ability to blacklist identity transfer links

The SDK allows to blacklist links to which the SDK appends a one-tid by calling the method `blacklistIdentityTransferLinks` and passing links to it as shown below:

Swift:
```swift
// This example blacklists links with the domain names
// www.google.com and www.uber.com. For example,
// https://www.google.com, https://www.uber.com/en/,
// https://www.uber.com/en/ride/, etc.
One.blacklistIdentityTransferLinks(["www.google.com","www.uber.com"])

// This example blacklists links with the main domain name
// wikipedia.org and any subdomain. For example,
// https://en.wikipedia.org, https://simple.wikipedia.org, etc.
One.blacklistIdentityTransferLinks(["*.wikipedia.org"] 
```


Objective-C:
```objective-c
// This example blacklists links with the domain names
// www.google.com and www.uber.com. For example,
// https://www.google.com, https://www.uber.com/en-BY/,
// https://www.uber.com/en/ride/, etc. 
[One blacklistIdentityTransferLinks :@[@"www.google.com", @"www.uber.com"]];

// This example blacklists links with the main domain name
// wikipedia.org and any subdomain. For example,
// https://en.wikipedia.org, https://simple.wikipedia.org, etc. 
[One blacklistIdentityTransferLinks:@[@"*.wikipedia.org"]];
```

*Note:* If a link is blacklisted, a one-tid will be appended to all other links but the blacklisted link. 

###	Disable automatic identity transfer

By default, the SDK adds ‘one-tid’ as a URL query parameter to outgoing network requests. To disable it, call the method `disableIdentityTransfer` by passing true as shown below: 

Swift:
```swift
One.disableIdentityTransfer(true)
```


Objective-C:
```objective-c
[One disableIdentityTransfer:YES];
```

*Note:* This will also disable the ability to automatically pick up parameters from deep links that open the app and will also prevent the SDK from adding a ‘one-tid’ as a URL query parameter to web links opened from the app, resulting in the customer identity not being transferred.

#### Send properties for a URL scheme

If you have disabled automatic identity transfer you can still send all URL parameters received as part of a URL scheme, which opens your app, by calling

Swift:
```swift
One.handleURL(yourNSURL)
```


Objective-C:
```objective-c
[One handleURL:yourNSURL];
```

passing the URL as a parameter into the handleURL SDK public method, as shown below: 

Swift:
```swift
func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool  {
	One.handleURL(yourNSURL)
	return true 
}
```


Objective-C:
```objective-c
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	[One handleURL:url];
	return YES;
}
```
Note: This will send a PUT request to ONE.

#### Append a ‘one-tid’ parameter to a URL to facilitate identity transfer 

If you have disabled automatic identity transfer, you can still add a ‘one-tid’ parameter to a URL in order to facilitate identity transfer across channels, by calling:

Swift:
```swift
One.getURLWithOneTid(yourNSURL)
```


Objective-C:
```objective-c
[One getURLWithOneTid:yourNSURL];
```

passing the URL as a parameter, which will return back a the same URL containing a ‘one-tid’ parameter. 

Swift:
```swift
let urlWithOneTid = One.getURLWithOneTid(yourNSURL)
```


Objective-C:
```objective-c
NSURL *urlWithOneTid = [One getURLWithOneTid:yourNSURL];
```

### Disable automatic outbound link tracking

By default, the SDK will automatically send an Interaction request to ‘/one-click’ as a URL is opened in Safari, `SafariViewController`, `UIWebview` or `WKWebView`.

To disable it, call the method `disableAutomaticOutboundLinkTracking` by passing `true` as shown below:

Swift:
```swift
One.disableAutomaticOutboundLinkTracking(true)
```


Objective-C:
```objective-c
[One disableAutomaticOutboundLinkTracking:YES];
```

#### Programmatically trigger an outbound link tracking interaction

If you have disabled automatic outbound link tracking, you can still track a URL, by calling:

Swift:
```swift
One.sendInteractionForOutboundLink(yourNSURL)
```


Objective-C:
```objective-c
[One sendInteractionForOutboundLink:yourNSURL];
```

passing the URL which will send an interaction request ‘/one-click’ using the same logic as available automatically. 

*Note:* This will send a POST request to ONE.

### Enable push notifications

To receive push notifications from ONE, take the following steps:

1.	enable Push Notifications in Capabilities pane
2.	enable Background Modes in Capabilities pane
3.	select Remote Notifications under Background Modes section
4.	call the method `enablePushNotifications` by passing `true` as shown below: 

	Swift:
	```swift
	One.enablePushNotifications(true)
	```


	Objective-C:
	```objective-c
	[One enablePushNotifications:YES];
	```

*Note:* To disable this feature if it once was enabled, simply call the same method and pass `false`.   

### Get a push token

To the push token codelessly retrieved by the SDK, call `getPushToken` method as shown below:

Swift:
```swift
let pushToken =  One.getPushToken()
// work with the push token
```


Objective-C:
```objective-c
NSString *pushToken = [One getPushToken];
// work with the push token
```

### Send a push token

To send a push token, call `sendPushToken` method by passing a push token:

Swift:
```swift
One.sendPushToken(pushToken)
```


Objective-C:
```objective-c
[One sendPushToken:pushToken];
```

The push token can be obtained and sent from the app delegate’s method `didRegisterForRemoteNotificationsWithDeviceToken` as shown below:

Swift:
```swift
func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
	One.sendPushToken(deviceToken)
	// work with the push token
}
```


Objective-C:
```objective-c
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
	[One sendPushToken:deviceToken];
	// work with the push token
}
```

*Note:* Use this function only to store the push token in ONE if you haven't enabled push notification support.

### Send a location object

To send a location object, call:

Swift:
```swift
One.updateLocation(location)
```


Objective-C:
```objective-c
[One updateLocation:location]; 
```

passing the location object as a parameter to `updateLocation` method. Use `CLLocationManager` delegate methods to call `updateLocation`, as shown below:

Swift:
```swift
func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
	One.updateLocation(locations.first)
}
```


Objective-C:
```objective-c
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
	[One updateLocation:[locations firstObject]];
}
```

### Get a structure data

To get a structure data, call `getStructureData` method by passing a structure’s name and a completion block as shown below:

Swift:
```swift
One.getStructureData("YourStructureName") { (response, error) in
	if (error == nil) {
		// work with response
	}
}
```


Objective-C:
```objective-c
[One getStructureData:@"yourStructureName" withBlock:^(NSDictionary *response, NSError *error) {
	if (!error) {
		// work with response
	}
}];
```

### Get Tid

To get the current ‘tid’ used by the SDK, call:

Swift:
```swift
One.getTid
```


Objective-C:
```objective-c
[One getTid];
```

This will return the tid assigned to the current user as a `String`.

### Access Debug Information

The ONE SDK for iOS provides 4 distinct debugging levels, that can be enabled in the `didFinishLaunchingWithOptions` method of your project's AppDelegate, as shown below:

1. kOneLogLevelNone - if set, no messages will be displayed in the console.
	
	Swift:
	```swift
	One.setLogLevel(.None)
	```


	Objective-C:
	```objective-c
	[One setLogLevel:kOneLogLevelNone];
	```

2. kOneLogLevelAll - if set, all log messages will be displayed in the console.
	
	Swift:
	```swift
	One.setLogLevel(.All)
	```


	Objective-C:
	```objective-c
	[One setLogLevel:kOneLogLevelAll];
	```

3. kOneLogLevelWebService - if set, only web service logs will be displayed in the console.
	
	Swift:
	```swift
	One.setLogLevel(.WebService)
	```


	Objective-C:
	```objective-c
	[One setLogLevel:kOneLogLevelWebService];
	```

4. kOneLogLevelFramework - if set, only framework logs will be displayed in the console.
	
	Swift:
	```swift
	One.setLogLevel(.Framework)
	```


	Objective-C:
	```objective-c
	[One setLogLevel:kOneLogLevelFramework];
	```

*Note:* By default, the ONE SDK for iOS does not display any debug log messages. Only exception messages are printed in the console, when these occur.

### Identify the framework version

You can find out the current version of the framework by calling:

Swift:
```swift
One.frameworkVersion()
```


Objective-C:
```objective-c
[One frameworkVersion];
```

### Clear the user profile

You can programmatically erase the user profile data by calling:

Swift:
```swift
One.clearUserProfile()
```


Objective-C:
```objective-c
[One clearUserProfile];
```

*Note:* This method removes tid from the user preferences and the keychain.

## Questions or need help

_The Thunderhead ONE team is available 24/7 to answer any questions you have. Just email onesupport@thunderhead.com or visit our docs page for more detailed installation and usage information._
