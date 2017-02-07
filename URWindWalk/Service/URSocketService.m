//
//  URSocketService.m
//  URWindWalk
//
//  Created by weiyan on 18/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URSocketService.h"
#import "URAsyncSocketWrapper.h"
#import "URProtocolWrapper.h"

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
    if (content.length == 0) {
        return NO;
    }
    
    NSDictionary *info = @{@"content":content};
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:info options:0 error:&error];
    
    if(error) {
        return NO;
    }
    
    BOOL issuccess = [_asyncSocketWrapper sendData:data callback:^(BOOL timeout) {
        callback(timeout);
    }];
    
    return issuccess;
}

- (BOOL)login:(NSString *)passport password:(NSString *)password callback:(on_requestTimeout_blcok)callback
{
    if (passport.length == 0 || password == 0) {
        return NO;
    }
    
    NSData *data = [URProtocolWrapper loginReq:passport password:password];
    
    BOOL issuccess = [_asyncSocketWrapper sendData:data callback:^(BOOL timeout) {
        callback(timeout);
    }];
    
    return issuccess;
}


@end
