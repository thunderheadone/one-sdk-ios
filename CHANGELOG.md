#### Version 6.3.4
* [BUGFIX] Fixed an issue where in some cases a `View Controller` presented modally caused a memory leak.

#### Version 6.3.3
* [BUGFIX] Fixed a crash related to handling a deallocated `View Controller` hosting `WKWebView`.

#### Version 6.3.2
* [BUGFIX] Fixed a crash related to handling `View Controllers` that are deallocated.
* [BUGFIX] Fixed an issue where codeless Interactions may not be sent after dismissing a `View Controller` that was presented modally.

#### Version 6.3.1
* [BUGFIX] Fixed a crash that was occurring when tracking WKWebView interactions.
* [BUGFIX] Fixed a crash that was occurring when dismissing `View Controllers` that are presented modally.

#### Version 6.3.0
* [NEW] Added ability to dynamically switch between Admin and User mode without restarting the app.
* [UPDATE] Improved `optOut` method to ensure no Interactions are sent when a user is opted out of all tracking.

#### Version 6.2.0
* [NEW] Added ability to create `WKWebView` URL Interaction paths in ONE directly through the Admin mode interface.
* [UPDATE] Aligned `disableAutomaticInteractionDetection` with `excludeInteractionPath` to fully disable the ONE SDK from interacting with the View Controller when the method is called.
* [UPDATE] Added more granular framework logging to facilitate better customer support when tracking Interactions.
* [BUGFIX] Addressed an issue that was occurring when checking [the list of Interactions created under a Touchpoint](https://github.com/thunderheadone/one-sdk-ios#sending-codeless-interactions-based-on-the-list-of-interactions-created-under-a-touchpoint), which could’ve led to some offline Interactions not being sent.
* [BUGFIX] Fixed a crash that was occuring when reconfiguring the SDK while the device was offline.
* [BUGFIX] Fixed an issue where Modals were not triggering Interactions in Preview mode.

#### Version 6.1.0
* [NEW] Added ability to automatically track `WKWebView` Interactions based on the URL loaded. The Interaction for the `ViewController` containing the `WKWebView` will also automatically be sent. To disable this automatic tracking - [see our readme](https://github.com/thunderheadone/one-sdk-ios#disable-wkwebview-tracking).

#### Version 6.0.0
* [BREAKING] The Thunderhead SDK is now distributed as an XCFramework bundle. The binary contains architecture slices for `arm64`, `armv7` for iOS and `arm64`, `i386, x86_64` for the simulator. For further details on this [see our migration guide](https://github.com/thunderheadone/one-sdk-ios/blob/master/migration-guides/THUNDERHEAD-6.0.0-MIGRATION-GUIDE.md#xcframework-integration).
* [BREAKING] Updated minimum deployment target to iOS 9.0.
* [BREAKING] Added support for using the Thunderhead SDK with Xcode 12.3. The Thunderhead SDK now requires Xcode 12+ (iOS 14). For further details on this [see our readme](https://github.com/thunderheadone/one-sdk-ios#requirements).
* [BREAKING] Removed the push notification functionality from the Thunderhead SDK. For further details on this [see our migration guide](https://github.com/thunderheadone/one-sdk-ios/blob/master/migration-guides/THUNDERHEAD-6.0.0-MIGRATION-GUIDE.md#push-notifications).
* [NEW] Added support for integrating the Thunderhead SDK via Swift Package Manager. For further details on this [see our readme](https://github.com/thunderheadone/one-sdk-ios#swift-package-manager).
* [NEW] Added support for Interaction tracking for iOS 13+ Modals.
* [UPDATE] Added more granular debug logging to facilitate better customer support when SDKs are migrated from an older to a newer version.
* [BUGFIX] Fixed an issue where the app name was not pulled correctly from the bundle identifier.
* [BUGFIX] Fixed an issue where mini notifications were not always displayed on iOS 13+ Modals.

#### Version 5.3.3
* [BUGFIX] Fixed an issue where tapping on cells could stop navigation to target view, in apps that use RxSwift.

#### Version 5.3.2
* [UPDATE] Xcode 11.3.1 compatible SDK.

#### Version 5.3.1
* [UPDATE] Xcode 11.4.1 compatible SDK.

#### Version 5.3.0
* [NEW] Added ability to send `one-appInstall` and `one-appReinstall` Interactions in Preview mode.
* [NEW] Added ability to control Data Adapter location sharing.
* [NEW] Added ability to control the TID keychain storage.
* [NEW] Added ability to control the TID pasteboard storage.
* [NEW] Added the prefix [Thunderhead] to all SDK console logs.
* [NEW] Added a new Debug log level which will display granular console logs around how we interact with your app's delegates.
* [BUGFIX] Fixed an issue where configuring the SDK in Admin mode was overriding an app's status bar color. 
* [BUGFIX] Updated the developer documentation to remove build time warnings.

#### Version 5.2.1
* [UPDATE] Xcode 11.3.1 compatible SDK.

#### Version 5.2.0
* [NEW] Added ability to disable in-list mini optimizations.

#### Version 5.1.1
* [BUGFIX] Fixed a crash related to scrolling observed in some apps.

#### Version 5.1.0
* [NEW] Thunderhead SDK can now be integrated directly via [Cocoapods](https://cocoapods.org/pods/Thunderhead). For further details on this [see our readme](https://github.com/thunderheadone/one-sdk-ios#cocoapods).
* [BUGFIX] Fixed a crash that was occuring when Thunderhead SDK is integrated into a RxSwift app using `UIScrollViewDelegate` [RxSwift](https://github.com/ReactiveX/RxSwift).

#### Version 5.0.0
* [NEW] Added ability to initialize the SDK and set the parameters later for different regions and spaces. For further details on this [see our sample app on how to initialize the SDK and set the parameters later](https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/dynamic-initialization-example#thunderhead-sdk-late-initialization).
* [NEW] Added ability to change the SDK initialization parameters on the fly. For further details on this [see our sample app on how to reconfigure the SDK](https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/dynamic-initialization-example#reconfiguring-the-thunderhead-sdk).
* [BUGFIX] Fixed an issue where multiple 401s were sent when the token expires on an interaction with multiple regions.

#### Version 4.0.2
* [BUGFIX] Fixed a crash that was occurring when libraries with multiple `UIWindow`s are used in an application.

#### Version 4.0.1
* [BUGFIX] Fixed an issue where the `UNUserNotificationCenter.delegate` was incorrectly set to nil by the SDK when calling `UIApplication.shared.registerForRemoteNotifications()`.

#### Version 4.0.0
* [BREAKING] iOS 13 ready SDK, built with Xcode 11.0. If you are using a lower version of Xcode, 10.2 or 10.3, you will only be able to archive your app with bitcode disabled.
* [NEW] Added support for `UIWindowScene` to support integrations with apps built with Xcode 11.0 and iOS 13.
* [NEW] Added support for the status bar view changes introduced in iOS 13.
* [NEW] Added support for segmented control changes introduced in iOS 13.
* [UPDATE] Updated the Admin mode views to be displayed correctly in iOS 13.
* [UPDATE] Updated the Admin mode region highlighting to support View Controller presentation changes introduced in iOS 13.
* [UPDATE] Updated the table view accessory view to support changes introduced in iOS 13.
* [UPDATE] Improved the Admin mode login credentials storage to save these by site key. This allows business user to use Admin mode easily when multiple site keys are used by an app.
* [UPDATE] Moved the properties caching under the same database as the offline interaction caching. All requests made via send properties and all interactions calls will be stored offline when the server is down or an internet connection cannot be established. This will help ensure you have a complete picture of the user profile regardless connectivity state.
* [UPDATE] Removed use of redirects when opening an optimization url. Previously url redirects were used to pass the response codes between the app and external channel. Response codes are now sent automatically by the SDK and the target url is opened as normal without a redirect being used.
* [BUGFIX] Fixed an issue where a customer attribute name was not updated in the SDK when edited in ONE.
* [BUGFIX] Fixed an issue where mini inline notifications were not displayed correctly in table cells which reside inside a `UIControl`.

#### Version 3.0.2
* [UPDATE] Removed `UIWebView` references and use from our SDK, in line with Apple’s ITMS-90809 -deprecated API Usage notification. See https://developer.apple.com/documentation/uikit/uiwebview for more information.

#### Version 3.0.1
* [BUGFIX] Improved the `UNUserNotificationCenter` implementation to handle situations where the `bundleProxy` might be null.

#### Version 3.0.0
* [BREAKING] Updated minimum deployment target to iOS 8.0.

#### Version 2.24.1
* [BUGFIX] Rebuilt the SDK to support Xcode 10.1.

#### Version 2.24.0
* [NEW] Added iPhone XR and XS Max support.
* [NEW] Added the ability to use Face ID at login.
* [NEW] Added support to capture group and single elements of a `UICollectionView` that resides inside a `UITableView`.
* [BUGFIX] Fixed an issue where a mini inline notification text size was not getting changed when editing an asset in ONE.
* [BUGFIX] Fixed an issue where a list of child propositions was getting duplicated while filtering.
* [BUGFIX] Fixed an issue where error messages were not being displayed properly on iPhone X series, when running the SDK in Admin mode.
* [BUGFIX] Fixed an issue where Admin mode was becoming unresponsive when tapping the Poker Chip.
* [BUGFIX] Fixed an issue where a push notification was not shown when the app was running in the foreground.
* [BUGFIX] Fixed a crash that was occurring when attempting to inject an inline mini optimization in a `UITableView`.
* [BUGFIX] Fixed a crash that was occurring when scrolling a `UITableView` where an inline mini notification was injected.
* [BUGFIX] Fixed a crash that was occurring when cancelling deletion of a capture point on iOS 8.

#### Version 2.23.1
* [BUGFIX] Fixed an issue where a 'Missing Push Notification Entitlement' warning was shown when the app didn't have push notifications enabled.

#### Version 2.23.0
* [NEW] Added support for Interaction Studio Theme.
* [NEW] Updated Admin mode Entity Names to match the naming in the web application.
* [BUGFIX] Fixed an issue with iToolbar path mismatch between iOS versions.
* [BUGFIX] Fixed an issue where pressing the poker chip in airplane mode resulted in unresponsive behaviour.
* [BUGFIX] Fixed an issue where one-appInstall interaction and follow-up interaction were using different tids.

#### Version 2.22.2
* [BUGFIX] Resolved an issue where existing deeplinks do not work after integrating ONE SDK.

#### Version 2.22.1
* [BUGFIX] Resolved an issue where the push token was not being sent programmatically when enable push was not switched on.

#### Version 2.22.0
* [NEW] Switched from a cookie based login in Admin mode to OAuth 2.
* [NEW] Ability to opt an end-user out of tracking, if the end-user does not give permission to be tracked in the client app.
* [BUGFIX] Fixed an issue where the preview panel in Admin mode would blink when switching snapshot versions.
* [BUGFIX] Fixed an issue where implementing `tableView:performAction:forIndexPath:sender` caused exceptions to be thrown.

#### Version 2.21.1
* [BUGFIX] Fixed an issue where a stack overflow would occur when navigating to a view that contains multiple view controllers.

#### Version 2.21.0
* [NEW] Ability to codelessly optimize table view cells using mini notifications.
* [BUGFIX] Fixed an issue where the `UIToolbar` path was different between iOS 11.2 and iOS versions < iOS 11.2.
* [BUGFIX] Resolved an issue where optimizations were not always presented and capture points are not always sent in Preview mode.
* [BUGFIX] Fixed an issue where the Admin popover was not moving to its correct position after the keyboard is appeared in iOS 11.

#### Version 2.20.1
* [BUGFIX] Resolved an issue where the SDK was interfering with implementations of `UILabel`.

#### Version 2.20.0
* [NEW] Added iPhone X support for Admin mode and User mode notifications.
* [NEW] Added the ability to display a mini notification from the top.
* [UPDATE] Updated the codeless identity transfer implementation to only use initWithURL:entersReaderIfAvailable prior to iOS 11.
* [UPDATE] Reviewed and updated the implementation to ensure integrations with Xcode 8.3 are still supported.
* [BUGFIX] Resolved an issue where duplicate properties were sent in some of the send properties requests sent by the SDK.
* [BUGFIX] Resolved an issue where response codes were sent repeatably in some circumstances where a network error would occur.
* [BUGFIX] Resolved an issue where the list items were not presented under the proposition screen when trying to link a proposition to an attribute.

#### Version 2.19.2
* [BUGFIX] Fixed an issue where URL query string encoding is removed when recreating the URL.

#### Version 2.19.1
* [UPDATE] Updated the FMDB implementation to avoid possible App Store rejections (see:https://github.com/ccgus/fmdb/issues/610).
* [BUGFIX] Resolved an issue where the SDK removed url query parameters without a value when adding a one-tid.
* [BUGFIX] Fixed an issue where one-click interactions were being sent twice.

#### Version 2.19.0
* [NEW] Ability to store interactions when a connection cannot be establish or ONE is down, and send these interactions when the service has been restored.
* [UPDATE] Added the SDK version to every request header.
* [UPDATE] Added support for the Cordova plugin and React module to be able to send the SDK version with every request header.
* [UPDATE] Added a close button to the search field in Admin mode.
* [BUGFIX] Fixed an issue where requests were sent continuously to ONE if a 404 response was received.
* [BUGFIX] Fixed an issue where Main Thread exception was thrown when enabling push notifications.
* [BUGFIX] Fixed a bug where users were unable select a capture point cell after deleting the point.
* [BUGFIX] Improved the proposition screen to avoid UI freezes when searching long lists.
* [BUGFIX] Resolved an issue where an app would crash when tapping the push notification if the app was terminated prior to the push being received.

#### Version 2.18.0
* [NEW] Added ability to send interaction paths which contain UTF8 characters.
* [UPDATE] Improved touchpoint uri validation.
* [UPDATE] Updated the identity transfer logic to support the SFSafariViewController initWithURL method in iOS 11.
* [BUGFIX] Resolved an issue where the SDK was sending multiple PUT requests instead of sending them one by one.
* [BUGFIX] Resolved an issue where the back buttons were not functioning correctly in Admin mode when running the SDK on iOS 11.
* [BUGFIX] Resolved various UI issues related to running the SDK in Admin mode on iOS 11.
* [BUGFIX] Resolved a crash that was occurring when navigating back from a WKWebView.
* [BUGFIX] Resolved an issue where identity sync was not being performed in apps built with Swift.

#### Version 2.17.0
* [NEW] Ability to codelessly sync identity with a web touchpoint on any interaction using an identity sync asset.
* [UPDATE] Updated our Runtime APIs logic to cache tids received after the 5 seconds timeout and link them with requests as they are sent.
* [UPDATE] Improved our codeless tracking API to only track delegates and objects that ONE is interested in.
* [UPDATE] Updated our framework to now be distributed without symlinks.
* [UPDATE] Updated our push notifications neutral response code logic to not send these response codes when push notification have been disabled via the application settings.
* [BUGFIX] Resolved an issue where a dynamic proposition name would change its length when being selection in the Admin mode interface.
* [BUGFIX] Added the UserNotifications framework to our framework module.modulemap to ensure users don't experience compile errors when integrating the SDK in their app.

#### Version 2.16.0
* [NEW] Ability to capture text from a Button.
* [NEW] Ability to track list items where the label matches the list item width and height.
* [NEW] Add ability paste username and password when logging in to Admin mode.
* [UPDATE] We have updated how we store unsent response codes to ensure all response codes are sent to ONE.
* [UPDATE] Updated the oauth library implementation to reduce the SDK package size.
* [UPDATE] Improved the mini notification implementation to support across all screen orientations and avoid a crash which was occurring on device rotation.
* [UPDATE] Updated the one install and one reinstall implementations to not send interactions for apps that already have been installed and use an older version of the SDK.
* [BUGFIX] Resolved an issue where an empty region name would sometimes be shown against interactions when running the SDK in Admin mode.
* [BUGFIX] Resolved an issue where PUT requests were being sent twice when running the SDK in iOS 7.

#### Version 2.15.0
* [NEW] Improve install/identity tracking to allow identity sync with web touchpoints programmatically.
* [BUGFIX] Resolved an issues where sometimes requests were sent twice when tapping a collection or table view cell which was tracked.
* [BUGFIX] Resolved an issue where a runtime request sometimes was sent twice when in Preview mode.
* [BUGFIX] Resolved an issue where identity sync occurred when launching the app in Admin mode.
* [BUGFIX] Resolved an issue where the username was sometimes cleared in Admin mode.
* [BUGFIX] Resolved an issue where the one-tid was not always appended to requests.

#### Version 2.14.0
* [NEW] Install tracking capability when using the Redirect Tracking API.
* [UPDATE] Updated the login email text field to use an email input.
* [BUGFIX] Resolved an issue where the full screen optimization is presented incorrectly on top of a UIAlertController.
* [BUGFIX] Resolved an issue where the neutral code was resent once the app was terminated and reopened by tapping on the notification.

#### Version 2.13.0
* [NEW] Improved the push notification support to use alert base push in combination with background push.
* [NEW] Ability to whitelist links eligible for identity transfer.
* [NEW] Ability to blacklist links not eligible for identity transfer.
* [UPDATE] Updated the properties caching logic to stop re-sending invalid properties after 2 failed attempts.
* [BUGFIX] Fixed an issue where UIControl tracking points were not sent to ONE in User mode.
* [BUGFIX] Fixed an issue where the SDK was incorrectly displaying an 'no regions found' alert in Admin mode for certain type of view controllers.
* [BUGFIX] Fixed an issue where the navigation bar was not being recognised by the SDK when highlighting elements in Admin mode.
* [BUGFIX] Resolved an issue where the full screen notification was interfering with action sheets.
* [BUGFIX] Resolved an issue where the UIAlertController element mapping was causing multiple elements to be mapped with the same id.
* [BUGFIX] Resolved an issue where the Admin popover UX was not behaving correctly when adding group tracking or capture points.
* [BUGFIX] Fixed an issue where the Admin popover was reappearing on screen once an error occurred.  

#### Version 2.12.0
* [NEW] Ability to programmatically retrieve a push token.
* [NEW] Ability to open a url received in a ONE push notification message.
* [NEW] Ability to automatically send response codes for a push message received from ONE.
* [BUGFIX] Resolved an issue where business users were unable to select some elements using the Admin mode interface.

#### Version 2.11.0
* [NEW] Ability to enable push notifications and codelessly receive a push message from ONE.
* [BUGFIX] Resolved attributes list incompatibility with the new design time api.
* [BUGFIX] Fixed an Admin mode crash which was occurring when refreshing proposition lists.
* [BUGFIX] Fixed an issue where a user was able to navigate in Admin mode when the SDK was retrieving the design time context.
* [BUGFIX] Resolved an Admin mode issue where a user was not able to dismiss an alert when the poker chip was present on screen.
* [BUGFIX] Resolved an issue where interaction requests were not triggered automatically in some apps.
* [BUGFIX] Added support for StackViews as part of the elements path, to ensure that 2 elements don’t end up having the same path.
* [BUGFIX] Resolved an issue where tracking points were not sent to ONE in some apps.
* [BUGFIX] Resolved an issue where the Apply button in one of the Admin mode views was not presented correctly once an error has occurred.
* [BUGFIX] Resolved an issue where tracking and capture points were only triggered every second time in certain apps.  

#### Version 2.10.0
* [NEW] Given that you declare a specific app group as part of your app the SDK can now share the anonymous identifier between apps in the same app group.
* [UPDATE] The SDK now stores the thunderhead anonymous identifier depending on the space to which an app belongs to.
* [UPDATE] Added descriptive logs after every return statement. These are controlled using the SDK log levels.
* [BUGFIX] Resolved an issue where the SDK could not automatically recognise SafariViewControllers as an interaction.
* [BUGFIX] Resolved a crash which was occurring whilst propositions where refreshed in Admin mode.
* [BUGFIX] Resolved an issue where the SDK would get into an incorrect state if the user was to tap the screen whilst preview was in a loading state.  

#### Version 2.9.0
* [NEW] Cross-channel and install tracking using SafariViewController in apps running on iOS 9+.
* [NEW] Ability to automatically share the tid between apps from the same vendor on apps running on iOS 7, 8 and 9.
* [NEW] The SDK will also now track non-https/http links opened in an app automatically using the 'one-click' interaction.
* [UPDATE] Removed the mapViews public method from the SDK.
* [UPDATE] Updated the Swift method names to match the Objective C method names using the NS_SWIFT_NAME macro.
* [UPDATE] Improved the ability to retrieve a response from an automatically triggered interaction call to allow registration of delegate on a "per-interaction basis”. Please see the latest integration document for further details.
* [UPDATE] Preview mode usability improvements.
* [UPDATE] Update the SDK to better handle UIControls which are used as touch callbacks.
* [UPDATE] iOS 10: Added support for 'openURL:options:completionHandler:' in order for the SDK to automatically pass incoming properties to ONE.
* [UPDATE] Updated the CollectionView delegation protocol.
* [BUGFIX] Resolved an issue where Admin users were unable to track and capture web views which were added as subviews.
* [BUGFIX] Resolved an issue where the full screen notifications would stop from being shown on screen.
* [BUGFIX] Fixed an issue where our collection view capture point data gathering algorithm was not sending data correctly for certain edge cases.
* [BUGFIX] Fixed an issue where interaction were not always sent when going to Preview mode in some apps.
* [BUGFIX] Resolved an issue where the Poker chip would not be shown on screen in certain apps when running in Admin mode.
* [BUGFIX] Resolved an issue where the Admin mode popover wasn’t functioning as expected.
* [BUGFIX] Added a fix to allow Admin users to select the last footer in a table view.
* [BUGFIX] Resolved an issue where the navigation buttons in Admin mode would change depending on the app the SDK was integrated with.
* [BUGFIX] Fixed an issue where regions were not always fully highlighted when inside UITabBarController.
* [BUGFIX] Fixed an issue where the element path wasn’t properly built for image views with gesture recognizer that sat within a cell.
* [BUGFIX] Resolved an issue where tracking points inside cells were not always correctly sent to ONE in Preview and User mode.
* [BUGFIX] Resolved an issue where WKWebView tracking points were not correctly triggered in some apps.
* [BUGFIX] Updated the interaction recognition algorithm to recognise MFMailComposeViewController, MFMessageComposeViewController and SLComposeViewController again.

#### Version 2.8.4
* [NEW] Ability to send a push token to ONE. This feature simply exposes the ability to programmatically pass the push token to ONE and will become available as an engagement feature in future ONE releases.
* [UPDATE] Support for identifying interactions across windows.
* [UPDATE] Added an update which allows Admin users to select any elements visible on screen and interactions if no element is found on tap.
* [UPDATE] Updated the interaction recognition algorithms to ignore interactions which don't have trackable elements inside them and interactions which are not currently visible (hidden or alpha less than 0.1).
* [UPDATE] Removed support for Safari View Controller’s 'initWithURL with configuration' to automatically send a 'one-click' interaction to ONE for all outbound links opened from an app. This was due to the method being removed by Apple from the last beta release.
* [UPDATE] Removed support for Safari View Controller’s 'initWithURL with configuration' to automatically add one-tid parameter for identity transfer on all links opened using this method. This was due to the method being removed by Apple from the last beta release.
* [UPDATE] Updated the ONE SDK public method documentation.
* [BUGFIX] Resolved an issue where the SDK could not handle subclassed split view controllers using a similar name to the UISplitViewController.

#### Version 2.8.3
* [UPDATE] Removed the need to pass error by reference when calling getURLWithOneTid.
* [BUGFIX] Resolved an issue where the tid was not shown, in preview mode, even though a response was received.

#### Version 2.8.2
* [NEW] Ability to automatically send a 'one-click' interaction to ONE for all outbound links opened from an app.
* [UPDATE] Contained iOS 10 update - Added support for Safari View Controller’s 'initWithURL with configuration' to automatically send a 'one-click' interaction to ONE for all outbound links opened from an app.
* [UPDATE] Contained iOS 10: Added support for Safari View Controller’s 'initWithURL with configuration' to automatically add one-tid parameter for identity transfer on all links opened using this method. 	
* [UPDATE] Updated the ONE SDK public method documentation.

#### Version 2.8.1
* [BUGFIX] Resolved an issue where poker chip was not correctly displayed in apps which create their window programmatically.
* [BUGFIX] Resolved an issue where the Admin mode highlighting disappeared after an alert was shown on screen.

#### Version 2.8.0
* [NEW] Ability to filter attribute list in Admin mode.
* [NEW] Support outgoing one tid parameter for identity transfer in WKWebViews.
* [UPDATE] Improve the send interaction with properties method to fall back on the send interaction method if no properties are passed.
* [BUGFIX] Fixed a UI bug in preview mode where releases were incorrectly aligned on the screen.

#### Version 2.7.1
* [UPDATE] Reverted the algorithm which places the Thunderhead Admin mode window above other application windows automatically.

#### Version 2.7.0
* [NEW] Add support for CSRF headers to all design time APIs.
* [NEW] Ability to enter username and password when using touch ID.
* [NEW] Ability to enter preview mode on long press.
* [NEW] Ability to store username and passwords in device keychain.
* [NEW] Ability to see the TID in preview mode.
* [NEW] Ability to share monitor URL.
* [NEW] Ability to track and capture a WKWebView.
* [UPDATE] Added an algorithm which places the Thunderhead Admin mode window above other application windows automatically should these want to sit above it.
* [BUGFIX] Resolved an Admin mode crash which was occurring when editing a capture point.
* [BUGFIX] Resolved a crash which was occurring when searching for dynamic propositions and using the pull to refresh feature.
* [BUGIFX] Resolved a crash which was occurring if the response delegate object was removed in callback method of an automatically triggered interaction.

#### Version 2.6.0
* [NEW] Removed single customer key and added support for capturing into key attributes.
* [NEW] Added support for UTF-8 in mobile assets.
* [NEW] Added ability to distribute the SDK as an embedded framework.
* [UPDATE] Updated the point count APIs to align with PC12 API changes.
* [UPDATE] The SDK is now storing the reachability object weakly.
* [UPDATE] Improved automatic text capturing support for text fields, text views and search bars.
* [UPDATE] Updated the ability to retrieve a response from an automatically triggered interaction call using delegate pattern implementation.

#### Version 2.5.2
* [BUGFIX] Resolved issue with html encoded characters not being displayed properly in the SDK.

#### Version 2.5.1
* [BUGFIX] Added CFBundleSupportedPlatforms to the Thunderhead bundle and set it as iPhoneOS.

#### Version 2.5.0
* [NEW] Ability to set a mini notification background colour.
* [NEW] Ability to set a mini notification timer.
* [NEW] Ability to set a mini notification text size and colour.
* [NEW] Added support for flexible image width in mini notifications.
* [NEW] Ability to get structure data.
* [NEW] Ability to retrieve a response from an automatically triggered interaction call using a delegate pattern.
* [UPDATE] Updated manual interactions implementation to trigger known optimizations if blocks are not used.
* [UPDATE] Eliminate the need in adding compiler flag -ObjC during SDK integration.
* [UPDATE] Removed the use of the FBKVOController from the SDK. This implementation has been replaced by swizzling. ‘didMoveToWindow’, ‘setText’ and ‘setAttributedText’ will be swizzled as part of the automatic data capture.
* [UPDATE] Updated the ‘one_tid’ parameter used as part of the automatic identity transfer to ‘one-tid’.
* [UPDATE] Updated the ‘In the Works’ description copy text.
* [BUGFIX] Resolved an issue where poker chip appeared on top of the login screen.
* [BUGFIX] Resolved an issue where the SDK could crash if too many mapping requests where being created at the same time.

#### Version 2.4.1
* [BUGFIX] Fixed an issue where user is in process of entering text into text field and premature request with captured text might be sent to ONE before user finishes entering.

#### Version 2.4.0
* [NEW] Ability to track and capture data from repeating cells in Admin mode.
* [NEW] Ability to send a response code programmatically.
* [NEW] Ability to switch off automatic interaction detection in the SDK.
* [NEW] Added support for automatic interception of incoming parameters.
* [NEW] Added support for automatic appending of a ‘one_tid’ parameter on all outgoing links to support identity transfer.
* [UPDATE] Removed the need to add SDK dependencies manually and started fully supporting modules.
* [BUGFIX] Resolved an issue where the app crashed when a user would navigate to Preview mode iOS7.
* [BUGFIX] Fixed an issues where an app could not be exported due to a  bundle unspecified key in the Thunderhead SDK bundle.
* [BUGFIX] Fixed an issues where not all interaction requests contained device data.
* [BUGFIX] Resolved an issue where a manually triggered interaction request for a different channel could contain an incorrect URI.
* [BUGFIX] Resolved an issue where the popover was being displayed over the element.
* [BUGFIX] Resolved an issue where the Admin popover showed the attribute name instead of hardcoded <Proposition set dynamically> when using a dynamic proposition.
* [BUGFIX] Resolved an issue where the preview point counts was overlapped by status bar.

#### Version 2.3.0
* [NEW] Extended the SDKs programmatic support to allow response retrieval, from manually triggered interactions.
* [NEW] Added support for programmatically triggering interaction requests, for another space, from within a current mobile touchpoint.
* [UPDATE] Updated the UI for all key Admin mode screens.
* [UPDATE] Updated Preview mode point counts UI.
* [UPDATE] Updated Preview mode to align with new Tagger.
* [UPDATE] Updated Edit mode highlighting to align with new Tagger.
* [BUGFIX] Fixed an issue where the Preview mode poker chip would disappear when an alert was presented in iOS 7.

#### Version 2.2.0
* [NEW] Ability to select attributes for dynamic propositions using the Admin mode interface.
* [NEW] Ability to track and capture data from repeating Table View cells and cell elements.
* [NEW] Ability to track and capture data from repeating Collection View cells and cell elements.
* [BUGFIX] Fixed an issue where the capture points where being sent twice for the same element.

#### Version 2.1.6
* [BUGFIX] Fixed an issue where the session was being invalidated where no regions could be found for a view controller.
* [BUGFIX] Fixed an issue where a tracking point could be added to text field, search bar or text view.

#### Version 2.1.5
* [UPDATE] Added bitcode support
* [BUGFIX] Resolved an issue where passwords containing special characters weren’t parsed correctly by the network controller

#### Version 2.1.4
* [UPDATE] Updated the public method comments

#### Version 2.1.3
* [UPDATE] Ensure captured data is not sent multiple times
* [UPDATE] Improved implementation to support building the SDK under Xcode 6.x
* [BUGFIX] Changing region name causes the app crash
* [BUGFIX] No region alert message causes the app crash
* [BUGFIX] Requests are not always sent when popover appears
* [BUGFIX] Non-existent capture point are triggered in User mode
* [BUGFIX] Poker chip is active after dismissing No Region alert message