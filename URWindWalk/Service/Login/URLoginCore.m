//
//  URSocketService+Login.m
//  URWindWalk
//
//  Created by weiyan on 19/02/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URLoginCore.h"
#import "Urprotocol.pbobjc.h"
#import "URSocketService.h"
#import "UrpacketType.pbobjc.h"

@implementation URLoginCore

- (void)parseLoginResProtocol:(URProtocol *)protocol
{
    URLoginRes *loginRes = protocol.loginRes;
}


- (BOOL)login:(NSString *)passport password:(NSString *)password timeout:(timeout_block)timeout
{
    if (passport.length == 0 || password.length == 0) {
        return NO;
    }
    
    URLoginReq *loginReq = [URLoginReq new];
    loginReq.passport = passport;
    loginReq.password = password;
    
    URProtocol *protocol = [URProtocol new];
    protocol.loginReq = loginReq;
    
    __weak typeof(self) weakSelf = self;
    [[URSocketService sharedObject] sendData:URPacketType_KUriPloginReq data:protocol
                                    callback:^(URProtocol *protocol){
                                        [weakSelf parseLoginResProtocol:protocol];
                                    }timeout:^{
                                        if (timeout) {
                                            timeout();
                                        }}
     ];
    
    return YES;
}

@end
