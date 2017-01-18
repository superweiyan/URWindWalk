//
//  URWWLoginService.h
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URWWLoginService : NSObject

+ (URWWLoginService *)sharedObject;

- (void)login:(NSString *)nickName password:(NSString *)password;

- (void)logout;

- (void)autoLogin;

@end
