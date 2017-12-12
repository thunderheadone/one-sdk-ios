Pod::Spec.new do |s|
  s.name                = 'Thunderhead'
  s.version             = '2.20.0'
  s.summary             = 'The ONE SDK for iOS, for integrating the ONE Engagmeent Hub into your iOS application.'
  s.license             = { :type => 'Commercial', :text => 'Copyright (c) 2017 Thunderhead One Inc. All rights reserved.' }
  s.authors             = { 'Thunderhead ONE' => 'onesupport@thunderhead.com'}
  s.homepage            = 'https://github.com/thunderheadone/one-sdk-ios'
  s.description         = 'The ONE SDK for iOS, for integrating ONE into your iOS application. The SDK supports iOS 7.1 and above.'
  s.frameworks          = ["Accelerate", "CoreLocation", "Foundation", "LocalAuthentication", "CoreGraphics", "MessageUI", "SafariServices", "Security", "SystemConfiguration", "UIKit", "WebKit", "UserNotifications"]
  s.library             = "sqlite3"
  s.source = { :git => 'https://github.com/thunderheadone/one-sdk-ios.git', :tag => "#{s.version}" }
  s.platform            = :ios, '7.1'
  s.preserve_paths      = 'Thunderhead.embeddedframework/Thunderhead.framework'
  s.public_header_files = 'Thunderhead.embeddedframework/Thunderhead.framework/Headers/One.h'
  s.source_files        = 'Thunderhead.embeddedframework/Thunderhead.framework/Headers/One.h'
  s.resources           = 'Thunderhead.embeddedframework/ThunderheadBundle.bundle'
  s.vendored_frameworks = 'Thunderhead.embeddedframework/Thunderhead.framework'
end