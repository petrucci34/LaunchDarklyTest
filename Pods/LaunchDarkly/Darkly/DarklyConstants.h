//
//  Copyright © 2015 Catamorphic Co. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 *  @brief Enum for setting up log output level.
 *  @since 4.2.0
 *
 */
typedef enum {
    DarklyLogLevelNone = 0,         //No output
    DarklyLogLevelCriticalOnly,     //Default, outputs only critical events
    DarklyLogLevelDebug,            //Debug level, outputs critical and main events
    DarklyLogLevelAll               //Highest level, outputs all events
} DarklyLogLevel;

extern NSString * const kClientVersion;
extern NSString * const kBaseUrl;
extern NSString * const kEventsUrl;
extern NSString * const kStreamUrl;
extern NSString * const kNoMobileKeyExceptionName;
extern NSString * const kNoMobileKeyExceptionReason;
extern NSString * const kNilConfigExceptionName;
extern NSString * const kNilConfigExceptionReason;
extern NSString * const kClientNotStartedExceptionName;
extern NSString * const kClientNotStartedExceptionReason;
extern NSString * const kClientAlreadyStartedExceptionName;
extern NSString * const kClientAlreadyStartedExceptionReason;
extern NSString * const kIphone;
extern NSString * const kIpad;
extern NSString * const kUserDictionaryStorageKey;
extern NSString *const kLDUserUpdatedNotification;
extern NSString *const kLDFlagConfigChangedNotification;
extern NSString *const kLDBackgroundFetchInitiated;
extern int const kCapacity;
extern int const kConnectionTimeout;
extern int const kDefaultFlushInterval;
extern int const kMinimumPollingIntervalMillis;
extern int const kMillisInSecs;
