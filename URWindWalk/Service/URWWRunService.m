//
//  URWWRunService.m
//  URWindWalk
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWRunService.h"

@implementation URWWRunService

+ (URWWRunService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWRunService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWRunService alloc] init];   \
    });                                         \
    return __instance;
}

- (void)startRun
{
    self.isRunning = YES;
}

- (void)stopRun
{
    self.isRunning = NO;
}

@end
