//
//  URWWUserInfoService.m
//  URWindWalk
//
//  Created by weiyan on 06/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URWWUserInfoService.h"

@implementation URWWUserInfoService

+ (URWWUserInfoService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWUserInfoService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWUserInfoService alloc] init];   \
    });                                         \
    return __instance;
}


- (URWWUserInfo *)getUserInfoByUid:(NSUInteger)uid
{
    URWWUserInfo *userInfo = [[URWWUserInfo alloc] init];
    userInfo.nickName = @"superman";
    return userInfo;
}

- (NSUInteger)getMyUid
{
    return 999;
}

@end
