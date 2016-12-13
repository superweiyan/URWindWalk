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

- (void)logInfo:(NSString *)info model:(NSString *)model funName:(NSString *)funName
{
    [_logWrapper logInfo:[NSString stringWithFormat:@"\"%@\", \"%@\", %@", model, funName, info]];
}

@end
