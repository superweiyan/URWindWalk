//
//  URLogWrapper.m
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URLogWrapper.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const int ddLogLevel = DDLogLevelVerbose;

@implementation URLogWrapper

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configLog];
    }
    return self;
}

- (void)configLog
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    
#ifdef OPEN_LOG_FILE
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    [fileLogger setMaximumFileSize:1024 * 1024];
    [fileLogger setRollingFrequency:3600.0 * 24];
    [[fileLogger logFileManager] setMaximumNumberOfLogFiles:7];
    [DDLog addLogger:fileLogger];
#endif
    
}

- (void)logDebug:(NSString *)info
{
    DDLogDebug(info);
}

- (void)logInfo:(NSString *)info
{
    DDLogInfo(info);
}
@end
