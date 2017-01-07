//
//  URWWUserInfoService.h
//  URWindWalk
//
//  Created by weiyan on 06/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "URWWUserInfo.h"

@interface URWWUserInfoService : NSObject

+ (URWWUserInfoService *)sharedObject;

- (URWWUserInfo *)getUserInfoByUid:(NSUInteger)uid;

- (NSUInteger)getMyUid;


@end
