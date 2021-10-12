## CocoaPods

Make sure you have the [CocoaPods](https://cocoapods.org) dependency manager installed. You can do so by executing the following command:

```sh
$ gem install cocoapods
```

1. Create a Podfile if you don't already have one:

```sh
$ cd your-project-directory
```

```sh
$ pod init
```

2. To your Podfile, add the *Thunderhead SDK* pod that you want to use in your app.

```txt
# Thunderhead SDK
    target :YourTargetName do
    pod 'Thunderhead', '~> {SDK_VERSION}'
    end
```

3. Install the pods, then open your `.xcworkspace` file to see the project in Xcode:

```sh
$ pod install
```

```sh
$ open your-project.xcworkspace
```

You can find an example project for pod installation [here](https://github.com/thunderheadone/one-sdk-ios/tree/master/examples/dynamic-initialization-example).

*Note:*
- While running `pod install`, if you get the following warnings:

```txt
[!] The `ThunderheadSampleApp [Debug]` target overrides the `OTHER_LDFLAGS` build setting defined in `Pods/Target Support Files/Pods-ThunderheadSampleApp/Pods-ThunderheadSampleApp.debug.xcconfig'. This can lead to problems with the CocoaPods installation
    - Use the `$(inherited)` flag, or
    - Remove the build settings from the target.
[!] The `ThunderheadSampleApp [Release]` target overrides the `OTHER_LDFLAGS` build setting defined in `Pods/Target Support Files/Pods-ThunderheadSampleApp/Pods-ThunderheadSampleApp.release.xcconfig'. This can lead to problems with the CocoaPods installation
    - Use the `$(inherited)` flag, or
    - Remove the build settings from the target.
```

Go to app target's **Build Settings**, add **$(inherited)** to **Other Linker Flags**, which will add linker flags generated in pods or see our [Troubleshooting Guide](https://github.com/thunderheadone/one-sdk-ios/blob/master/TROUBLESHOOTING-GUIDE.md#resolve-undefined-symbols-for-architecture-arm64-compile-time-error).

[Step 2: Configure biometric authentication](../README.md#step-2-configure-biometric-authentication)