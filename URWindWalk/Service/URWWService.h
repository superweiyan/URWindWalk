//
//  URWWService.h
//  URWindWalk
//
//  Created by weiyan on 19/02/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URWWLoginService;

@class URWWRunService;

@interface URWWService : NSObject

@property (nonatomic, strong) URWWLoginService  *loginService;
@property (nonatomic, strong) URWWRunService    *runService;

+ (URWWService *)sharedObject;

@end
