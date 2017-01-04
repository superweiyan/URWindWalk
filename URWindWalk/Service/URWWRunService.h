//
//  URWWRunService.h
//  URWindWalk
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URWWRunService : NSObject

@property (nonatomic, assign) BOOL isRunning;

+ (URWWRunService *)sharedObject;

- (void)startRun;

- (void)stopRun;

@end
