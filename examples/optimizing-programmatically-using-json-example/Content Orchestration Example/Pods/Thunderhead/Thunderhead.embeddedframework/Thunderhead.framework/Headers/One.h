//
//  One.h
//  Thunderhead
//
//  Copyright © 2017 Thunderhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

/*!
 @typedef OneLogLevel
 @brief This is an enum which specifies the log level output which will be printed to console.
 @field kOneLogLevelNone This log level disables logging to console.
 @field kOneLogLevelAll  This log level prints everything to console.
 @field kOneLogLevelWebService This log level prints everything relating to web services (requests, responses etc.) only.
 @field kOneLogLevelFramework This log level prints framework events which occur whilst running the app.
 */
typedef NS_ENUM(NSInteger, OneLogLevel) {
    kOneLogLevelNone NS_SWIFT_NAME(None),
    kOneLogLevelAll NS_SWIFT_NAME(All),
    kOneLogLevelWebService NS_SWIFT_NAME(WebService),
    kOneLogLevelFramework NS_SWIFT_NAME(Framework)
};

/*!
 @typedef OneTheme
 @brief This is an enum which specifies the theme used in design time.
 @field OneThemeDefault Default theme in design time.
 @field OneThemeInteractionStudio  Interaction Studio theme in design time.
 */
typedef NS_ENUM(NSInteger, OneTheme) {
    OneThemeDefault NS_SWIFT_NAME(Default),
    OneThemeInteractionStudio NS_SWIFT_NAME(InteractionStudio)
};

/*!
 @brief This delegate can be used to retrieve interaction responses from automatically triggered interactions. 
 @discussion Using this delegate is optional. See the ONE SDK for iOS integration document for further details.
 */
@protocol OneInteractionResponseDelegate <NSObject>

@property (nonatomic, copy) NSString *oneInteractionPath;

- (void)interaction:(NSString *)interactionPath didReceiveResponse:(NSDictionary *)response NS_SWIFT_NAME(interaction(_:didReceiveResponse:));

@end


@interface One : NSObject

/*!
 @brief Initializes the framework.
 @param siteKey The ONE Engagement Hub space site key.
 @param touchPointURI The touchpoint URI path only without the protocol idetifier.
 @param apiKey The ONE Engagement Hub space API key.
 @param sharedSecret The ONE Engagement Hub space shared secret key.
 @param userId A User ID which has access to the current touchpoint. It is recommended to use an api user: api@<your-tenant.com>.
 @param adminMode Define whether the framework is initialized in Admin or User mode. Set YES to initialize in Admin mode. Otherwise set NO to initialize in User mode.
 @param hostName The ONE Engagement Hub server instance your space is hosted on. If you specify the host name without http or https, https will be used.
 @discussion Call the method in app delegate's didFinishLaunchingWithOptions.
 */
+ (void)startSessionWithSK:(NSString *)siteKey uri:(NSString *)touchPointURI apiKey:(NSString *)apiKey sharedSecret:(NSString *)sharedSecret userId:(NSString *)userId adminMode:(BOOL)adminMode hostName:(NSString *)hostName NS_SWIFT_NAME(startSessionWithSK(_:uri:apiKey:sharedSecret:userId:adminMode:hostName:));

/*!
 @brief Sends touchpoint properties to ONE via a PUT request for the interaction '/' (base touchpoint) and/or '/' with '*' (wildcard).
 @param properties A dictionary of properties. Keys and values should be NSString objects.
 */
+ (void)sendBaseTouchpointProperties:(NSDictionary *)properties NS_SWIFT_NAME(sendBaseTouchpointProperties(_:));

/*!
 @brief Sends properties for a given interaction path to ONE via a PUT request.
 @param interactionPath An interaction path.
 @param properties A dictionary of properties. Keys and values should be NSString objects.
 */
+ (void)sendProperties:(NSDictionary *)properties
    forInteractionPath:(NSString *)interactionPath NS_SWIFT_NAME(sendProperties(_:forInteractionPath:));
;

/*!
 @brief Sends an interaction request with properties for a given path to ONE via a POST request.
 @param properties A dictionary of properties. Keys and values should be NSString objects.
 @param interactionPath An interaction path.
 @discussion If no properties are provided, an interaction request will be sent without properties.
 */
+ (void)sendInteraction:(NSString *)interactionPath
         withProperties:(NSDictionary *)properties NS_SWIFT_NAME(sendInteraction(_:withProperties:));

/*!
 @brief Sends an interaction request with properties for a given path to ONE via a POST request.
 @param properties A dictionary of properties. Keys and values should be NSString objects.
 @param interactionPath An interaction path.
 @param block A completion block will be executed when the response is received. The processResponse: method can be called inside this block to handle the response object.
 @discussion If no properties are provided, an interaction request will be sent without properties.
 */
+ (void)sendInteraction:(NSString *)interactionPath
         withProperties:(NSDictionary *)properties
               andBlock:(void(^)(NSDictionary *response, NSError *error))block NS_SWIFT_NAME(sendInteraction(_:withProperties:andBlock:));

/*!
 @brief Sends an interaction request for a given path to ONE via a POST request.
 @param interactionPath An interaction path.
 */
+ (void)sendInteraction:(NSString *)interactionPath NS_SWIFT_NAME(sendInteraction(_:));

/*!
 @brief Sends an interaction request for a given path to ONE via a POST request.
 @param interactionPath An interaction path.
 @param block A completion block will be executed when the response is received. The processResponse: method can be called inside this block to handle the response object.
 */
+ (void)sendInteraction:(NSString *)interactionPath
              withBlock:(void(^)(NSDictionary *response, NSError *error))block NS_SWIFT_NAME(sendInteraction(_:withBlock:));

/*!
 @brief Sends a response code for a given interaction path via a PUT request.
 @param responseCode A response code.
 @param interactionPath An interaction path.
 */
+ (void)sendResponseCode:(NSString *)responseCode
      forInteractionPath:(NSString *)interactionPath NS_SWIFT_NAME(sendResponseCode(_:forInteractionPath:));

/*!
 @brief Retrieves a structure data from ONE for a given structure name.
 @param structureName A structure name.
 @param block A completion block containing the structure.
 */
+ (void)getStructureData:(NSString *)structureName
               withBlock:(void(^)(NSDictionary *response, NSError *error))block NS_SWIFT_NAME(getStructureData(_:withBlock:));

/*!
 @brief Sends an '/one-click' interaction call to ONE passing the link URL, host, path and parameters as properties to enable link attribution tracking.
 @param link A NSURL instance.
 */
+ (void)sendInteractionForOutboundLink:(NSURL *)link NS_SWIFT_NAME(sendInteractionForOutboundLink(_:));

/*!
 @brief Sends push token to ONE.
 @param pushToken A push token.
 */
+ (void)sendPushToken:(NSData *)pushToken NS_SWIFT_NAME(sendPushToken(_:));

/*!
 @return A device token delivered by Apple.
 */
+ (NSString *)getPushToken NS_SWIFT_NAME(getPushToken());

/**
 *  Disables automatic interaction detection.
 *
 *  @param disable YES, if automatic interaction detection should be disabled, 
 *  and NO otherwise.
 */
+ (void)disableAutomaticInteractionDetection:(BOOL)disable NS_SWIFT_NAME(disableAutomaticInteractionDetection(_:));

/**
 *  Disables automatic outbound link tracking.
 *
 *  @param disable YES, if automatic outbound link tracking should be disabled,
 *  and NO otherwise.
 */
+ (void)disableAutomaticOutboundLinkTracking:(BOOL)disable NS_SWIFT_NAME(disableAutomaticOutboundLinkTracking(_:));

/**
 *  Enables push notifications.
 *
 *  @param enable YES, if receiving push notifications should be enabled,
 *  and NO otherwise.
 *  @discussion Disabled by default.
 */
+ (void)enablePushNotifications:(BOOL)enable;

/*!
 @brief Erases the user profile from the app user preferences.
 */
+ (void)clearUserProfile NS_SWIFT_NAME(clearUserProfile());

/*!
 @brief Returns the current framework version.
 */
+ (NSString *)frameworkVersion NS_SWIFT_NAME(frameworkVersion());

/*!
 @brief Sets the framework's log level.
 @param logValue Log level. Possible values are kOneLogLevelNone, kOneLogLevelAll, kOneLogLevelWebService, kOneLogLevelFramework.
 @discussion Set specific log level to see the framework outputs in the debug panel. By default, the log level is set to kOneLogLevelNone.
 */
+ (void)setLogLevel:(OneLogLevel)logValue NS_SWIFT_NAME(setLogLevel(_:));

/*!
 @brief Sends the location object's latitude, longitude, horizontal accuracy and timestamp.
 @param location A CLLocation object.
 */
+ (void)updateLocation:(CLLocation *)location NS_SWIFT_NAME(updateLocation(_:));

/*!
 @brief Parses and sends URL parameters of a given URL to ONE
 @param url A NSURL object.
 */
+ (void)handleURL:(NSURL *)url NS_SWIFT_NAME(handleURL(_:));

/*!
 @brief Returns the ONE tid.
 */
+ (NSString *)getTid NS_SWIFT_NAME(getTid());

/*!
 @brief Enables or disables automatic identity transfer for incoming and outgoing links.
 @param disable Set YES to disable automatic identity transfer and NO otherwise.
 @discussion Enabled by default.
 */
+ (void)disableIdentityTransfer:(BOOL)disable NS_SWIFT_NAME(disableIdentityTransfer(_:));

/*!
 @brief Appends the ONE tid as parameter to a given URL.
 @param url A NSURL object.
 @return A NSURL object with the ONE tid.
 */
+ (NSURL *)getURLWithOneTid:(NSURL *)url NS_SWIFT_NAME(getURLWithOneTid(_:));

/*!
 @brief Allows the given links to participate in identity transfer.
 @param links A NSArray object containg NSURL or NSString objects.
 @discussion The given links can be NSURL objects or NSString objects representing URL patterns. NSString objects can include wildcard characters.
 */
+ (void)whitelistIdentityTransferLinks:(NSArray *)links;

/*!
 @brief Disallows the given links to participate in identity transfer.
 @param links A NSArray object containg NSURL or NSString objects.
 @discussion The given links can be NSURL objects or NSString objects representing URL patterns. NSString objects can include wildcard characters.
 */
+ (void)blacklistIdentityTransferLinks:(NSArray *)links;

/*!
 @brief Synchronizes the app's customer identity with their identity in Mobile Safari.
 */
+ (void)identitySync NS_SWIFT_NAME(identitySync());

/*!
 @brief Synchronizes the app's customer identity with their identity from a given URL.
 @param url A NSURL object.
 */
+ (void)identitySyncWithURL:(NSURL *)url NS_SWIFT_NAME(identitySyncWithURL(_:));

/*!
 @brief Handles a response received from ONE. All tracking and/or capture points will be parsed by the framework as usual. All optimization points, known by the framework, will be processed/displayed.
 @param response A NSDictionary instance.
 */
+ (void)processResponse:(NSDictionary *)response NS_SWIFT_NAME(processResponse(_:));

/*!
 @brief Register a given object to receive a response for an automatically triggered interaction call. 
 @param delegate An object conforming to OneInteractionResponseDelegate protocol.
 @discussion If the object is deallocated, it will be automatically unregistered. If you want to unregister the object and use it for other needs, you can call removeInteractionResponseDelegate: method.
 */
+ (void)addInteractionResponseDelegate:(id <OneInteractionResponseDelegate>)delegate NS_SWIFT_NAME(addInteractionResponseDelegate(_:));

/*!
 @brief Removes a given object from receiving a response for an automatically triggered interaction call.
 @param delegate An object you added by using addInteractionResponseDelegate: method.
 */
+ (void)removeInteractionResponseDelegate:(id)delegate NS_SWIFT_NAME(removeInteractionResponseDelegate(_:));

/*!
 @brief Configure ONE SDK to opt in/out from all interactions.
 @param optOut YES, if ONE SDK should be configured to opt out from all interactions or NO otherwise.
 */
+ (void)optOut:(BOOL)optOut NS_SWIFT_NAME(opt(out:));

/*!
 @brief Sets the framework's UI theme.
 @param theme A OneTheme enum. Possible values are OneThemeDefault, OneThemeInteractionStudio.
 @discussion Set specific themes to update the framework's UI in design time. By default, the theme is set to kOneThemeDefault.
 */
+ (void)setTheme:(OneTheme)theme NS_SWIFT_NAME(setTheme(_:));

@end



///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interaction ID
///////////////////////////////////////////////////////////////////////////////////////////

@interface UIViewController (OneInteracting)

/*!
 @property oneInteractionPath
 @brief An interaction path.
 */
@property (nonatomic, copy) NSString *oneInteractionPath;

/*!
 @property excludeInteractionPath
 @brief Excludes an interaction from being recognized by the framework
 @discussion Set it to YES to exclude the interaction from processing. Default is NO.
 */
@property (nonatomic, assign) BOOL excludeInteractionPath;

@end
