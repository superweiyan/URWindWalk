//
//  URLog.h
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLog : NSObject

+ (id)sharedObject;

- (void)logInfo:(NSString *)info model:(NSString *)model funName:(const char *)funName;

- (void)logInfo:(NSString *)info model:(NSString *)model;

@end
