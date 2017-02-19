//
//  URWWLoginService.m
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URWWLoginService.h"
#import "Urprotocol.pbobjc.h"
#import "UrpacketType.pbobjc.h"
#import "URSocketService.h"
#import "URProtocolWrapper.h"

NSString * URShowLoginNotification = @"URShowLoginNotification";

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

- (BOOL)login:(NSString *)passport password:(NSString *)password timeout:(login_timeout_block)callback
{
    
    if (passport.length == 0 || password.length == 0) {
        return NO;
    }
    
    URLoginReq *loginReq = [URLoginReq new];
    loginReq.passport = passport;
    loginReq.password = password;

    URProtocol *protocol = [URProtocol new];
    protocol.uri = URPacketType_KUriPloginReq;
    protocol.loginReq = loginReq;
    
    NSData *data = [URProtocolWrapper outputStreamWithProto:protocol];
    
    [[URSocketService sharedObject] sendData:data callback:^(BOOL timeout) {
        if (timeout) {
            callback();
        }
    }];
    
    return YES;
}

- (void)logout
{
    
}

- (BOOL)autoLogin
{
    if (YES) {
        [[NSNotificationCenter defaultCenter] postNotificationName:URShowLoginNotification object:nil];
    }
    else {
        
    }
    
    return YES;
}

@end
