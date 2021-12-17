# Thunderhead iOS SDK Migration Guide

## Thunderhead SDK 8.* to 9.*

Thunderhead SDK 9.+ removes support for in-list optimizations.

### Remove `DisableInListOptimization` in App's Info.plist File

Support for in-list optimizations has been removed starting with Thunderhead SDK 9.0.0. If you're using `DisableInListOptimization` in App's Info.plist file to enable/disable in-list optimizations, you need to remove it from App's Info.plist file.