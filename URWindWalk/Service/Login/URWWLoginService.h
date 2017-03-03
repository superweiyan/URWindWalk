//
//  URWWLoginService.h
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URBlock.h"

extern NSString * URShowLoginNotification;

@interface URWWLoginService : NSObject

- (BOOL)login:(NSString *)passport password:(NSString *)password timeout:(timeout_block)callback;

- (void)logout;

- (BOOL)autoLogin;

@end
