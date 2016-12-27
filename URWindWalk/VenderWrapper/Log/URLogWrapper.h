//
//  URLogWrapper.h
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLogWrapper : NSObject

+ (id)sharedObject;

- (void)logDebug:(NSString *)info;

- (void)logInfo:(NSString *)info;

- (NSString *)getLogPath;

@end
