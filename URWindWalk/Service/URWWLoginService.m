//
//  URWWLoginService.m
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URWWLoginService.h"

@implementation URWWLoginService

+ (URWWLoginService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWLoginService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWLoginService alloc] init];   \
    });                                         \
    return __instance;
}

- (void)login:(NSString *)nickName password:(NSString *)password
{
    
}

- (void)logout
{
    
}

- (void)autoLogin
{
    
}

@end
