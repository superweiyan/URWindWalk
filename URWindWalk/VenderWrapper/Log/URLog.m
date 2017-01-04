//
//  URLog.m
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URLog.h"
#import "URLogWrapper.h"

@interface URLog()
{
    URLogWrapper *_logWrapper;
}
@end

@implementation URLog

- (instancetype)init
{
    self = [super init];
    if (self) {
        _logWrapper = [[URLogWrapper alloc] init];
    }
    return self;
}

+ (id)sharedObject
{
    static dispatch_once_t __once;              \
    static URLog * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URLog alloc] init];   \
    });                                         \
    return __instance;
}

- (void)logInfo:(NSString *)info model:(NSString *)model funName:(char *)funName
{
    [_logWrapper logInfo:[NSString stringWithFormat:@"\"%@\", \"%s\", %@", model, funName, info]];
}

- (void)logInfo:(NSString *)info model:(NSString *)model
{
    [_logWrapper logInfo:[NSString stringWithFormat:@"\"%@\", %@", model, info]];
}

@end
