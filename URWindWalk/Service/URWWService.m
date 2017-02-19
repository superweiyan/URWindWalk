//
//  URWWService.m
//  URWindWalk
//
//  Created by weiyan on 19/02/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URWWService.h"
#import "URWWLoginService.h"
//#import "URWWMainService.h"
#import "URWWRunService.h"

@implementation URWWService

+ (URWWService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWService alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initModel];
    }
    return self;
}

- (void)initModel
{
//    self.mainService = [[URWWMainService alloc] init];
    self.loginService = [[URWWLoginService alloc] init];
    self.runService = [[URWWRunService alloc] init];
}

@end
