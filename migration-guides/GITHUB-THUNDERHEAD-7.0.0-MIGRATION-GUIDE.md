# Thunderhead iOS SDK Migration Guide

## Thunderhead SDK 6.* to 7.*

Thunderhead SDK 7.+ adds a number of new features. 

### optOut method

Support for deprecated `optOut` method from Thunderhead ONE or Salesforce Interaction Studio has been removed starting with Thunderhead SDK 7.0.0. If you're using the method, you need to use the new [opt out/in](https://github.com/thunderheadone/one-sdk-ios#opt-an-end-user-out-of-or-into-tracking) method introduced in Thunderhead SDK 5.3.0.

```diff
- optOut: or opt(out:)

```

To opt **out** an end-user from all tracking, call the opt out method as shown below:

Swift:
```swift
One.opt(.out, forOptions: .allTracking)
```

Objective-C:
```objective-c
[One opt:Out forOptions:AllTracking];
```

To opt **in** an end-user for all tracking, call the opt in method as shown below:

Swift:
```swift
One.opt(.in, forOptions: .allTracking)
```

Objective-C:
```objective-c
[One opt:In forOptions:AllTracking];
```
