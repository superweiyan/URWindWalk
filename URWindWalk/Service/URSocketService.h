//
//  URSocketService.h
//  URWindWalk
//
//  Created by weiyan on 18/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * URSocketResultNotification;

@interface URSocketService : NSObject

+ (URSocketService *)sharedObject;

@end
