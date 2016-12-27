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

@interface URLogWrapper()
{
    DDFileLogger *_fileLogger;
}
@end

@implementation URLogWrapper

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configLog];
    }
    return self;
}

+ (id)sharedObject
{
    static dispatch_once_t __once;              \
    static URLogWrapper * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URLogWrapper alloc] init];   \
    });                                         \
    return __instance;
}

- (void)configLog
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    _fileLogger = [[DDFileLogger alloc] init];
    [_fileLogger setMaximumFileSize:1024 * 1024];
    [_fileLogger setRollingFrequency:3600.0 * 24];
    [[_fileLogger logFileManager] setMaximumNumberOfLogFiles:7];
    [DDLog addLogger:_fileLogger];
}

- (void)logDebug:(NSString *)info
{
    DDLogDebug(info);
}

- (void)logInfo:(NSString *)info
{
    DDLogInfo(info);
}

- (NSString *)getLogPath
{
    return [[_fileLogger currentLogFileInfo] filePath];
}
@end
