## Manual installation

If you don't want to use Cocoapods or Swift Package Manager, you can still take advantage of the Thunderhead SDK by importing the framework directly.

1. [Download the latest Thunderhead SDK for iOS](https://github.com/thunderheadone/one-sdk-ios/releases) and extract the zip. This is a ~28MB file and might take some time to download.
2. Open your existing iOS application Xcode project.
3. Import the `Thunderhead.embeddedframework` into your project.
4. Confirm the SDK files have been added to your project, as follows:
    + Navigate to your project build settings by selecting your project's Project File in the Project Navigator.
    + Select the main build target for your app.
    + Select the **Build Phases** tab.
    + Confirm **_Thunderhead.xcframework_** is located in the **Link Binary With Libraries** section.
    + Confirm **_ThunderheadBundle.bundle_** is located in the **Copy Bundle Resources** section.
5. Ensure your project enables modules by going to **Build Settings** tab and setting the flag for **Enable Modules (C and Objective-C)** to **Yes**. Check out [Adding the SDK dependencies for manual installation](#adding-the-sdk-dependencies-for-manual-installation) if you need modules to be disabled.

See example project for manual installation [here](https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/optimizing-programmatically-using-json-example).

*Note:*
- If you encounter the `No such module 'Thunderhead'` compile error, see our [Troubleshooting Guide](https://github.com/thunderheadone/one-sdk-ios/blob/master/TROUBLESHOOTING-GUIDE.md#no-such-module-thunderhead-xcode-compile-error).

### Adding the SDK dependencies for manual installation

The SDK requires modules to be enabled. If you require modules to be disabled, you may need to include the following frameworks to the **Link Binary With Libraries**:

+ *Accelerate.framework*
+ *CoreLocation.framework*
+ *Foundation.framework*
+ *LocalAuthentication.framework*
+ *CoreGraphics.framework*
+ *MessageUI.framework*
+ *SafariServices.framework*
+ *Security.framework*
+ *SystemConfiguration.framework*
+ *UIKit.framework*
+ *WebKit.framework*
+ *libsqlite3.tbd*

*Note:*
- If any of the frameworks are missing from your app, select the +icon in the lower-left corner of the **Link Binary With Libraries** section and add each framework, as needed, using the popup window.

[Step 2: Configure biometric authentication](../README.md#step-2-configure-biometric-authentication)