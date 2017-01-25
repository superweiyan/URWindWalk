//
//  URSocketService.m
//  URWindWalk
//
//  Created by weiyan on 18/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URSocketService.h"
#import "URAsyncSocketWrapper.h"

NSString * URSocketResultNotification = @"URSocketResultNotification";

@interface URSocketService()
{
    URAsyncSocketWrapper   *_asyncSocketWrapper;
}
@end

@implementation URSocketService

+ (URSocketService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URSocketService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URSocketService alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _asyncSocketWrapper = [[URAsyncSocketWrapper alloc] init];
        _asyncSocketWrapper.port = 7777;
        _asyncSocketWrapper.ip = @"127.0.0.1";
        [self initData];
    }
    return self;
}

- (void)initData
{
    if([_asyncSocketWrapper connectServer]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:URSocketResultNotification object:nil];
    }
}

- (BOOL)sendText:(NSString *)content callback:(on_requestTimeout_blcok)callback
{
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    
    BOOL issuccess = [_asyncSocketWrapper sendData:data callback:^(BOOL timeout) {
        callback(timeout);
    }];
    
    return issuccess;
}

@end
