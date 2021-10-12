## Swift Package Manager

Starting with v6.0.0 of the Thunderhead SDK, Thunderhead's Swift Package Manager support is available for use with Xcode. CocoaPods is not required for Swift Package Manager users.

Swift Package Manager support requires Xcode 12.5 or higher.

1. Optionally, if you're adding Thunderhead SDK to a project for the first time, this step can be ignored. If migrating from a CocoaPods-based project, run `pod deintegrate` to remove CocoaPods from your Xcode project. The CocoaPods-generated `.xcworkspace` file can safely be deleted afterward.

2. In Xcode, install the Thunderhead framework by navigating to **File > Add Packages…**

3. In the prompt that appears, select the Thunderhead GitHub repository:
 
   ```sh
   https://github.com/thunderheadone/one-sdk-ios
   ```

   ![Thunderhead Add Package](https://github.com/thunderheadone/one-sdk-ios/raw/master/images/SPM/ThunderheadAddPackageURL.png)

2. Select the version of Thunderhead SDK you want to use. For new projects, we recommend using the newest version of Thunderhead SDK, which you can find [here](https://github.com/thunderheadone/one-sdk-ios/releases). 

   By default, `Up to Next Major` version is selected.
   
   You might need to select your project in this window if there are multiple projects in your workspace. 

   To integrate a specific version of the Thunderhead SDK, simply specify a version number you need. 

   For example, to integrate version 8.0.0 of the Thunderhead SDK, specify the version number like on the screenshot below:

   ![Thunderhead Choose Package Version](https://github.com/thunderheadone/one-sdk-ios/raw/master/images/SPM/ThunderheadChoosePackage.png)

3. Hit **Add Package** and wait for Xcode to finish verifying and downloading the Swift package into your project.

   ![Thunderhead Cloning Package](https://github.com/thunderheadone/one-sdk-ios/raw/master/images/SPM/ThunderheadFetchPackage.png)

4. Choose the Thunderhead products you want to include in your app.

   ![Thunderhead Select Target](https://github.com/thunderheadone/one-sdk-ios/raw/master/images/SPM/ThunderheadSelectTarget.png)

5. Drag and drop the **_ThunderheadBundle.bundle_** to **Copy Bundle Resources** section in your targets.

   ![Thunderhead Copy Thunderhead Bundle](https://github.com/thunderheadone/one-sdk-ios/raw/master/images/SPM/ThunderheadAddBundleResource.gif)

[Step 2: Configure biometric authentication](../README.md#step-2-configure-biometric-authentication)