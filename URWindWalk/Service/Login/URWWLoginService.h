//
//  URWWLoginService.h
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^login_timeout_block) ();

extern NSString * URShowLoginNotification;

@interface URWWLoginService : NSObject

+ (URWWLoginService *)sharedObject;

- (BOOL)login:(NSString *)passport password:(NSString *)password timeout:(login_timeout_block)callback;

- (void)logout;

- (BOOL)autoLogin;

@end
