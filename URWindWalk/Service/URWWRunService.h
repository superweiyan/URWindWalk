//
//  URWWRunService.h
//  URWindWalk
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *URUpdateRunDistanceNotification;

@class CLLocation;

@interface URWWRunService : NSObject

@property (nonatomic, assign) BOOL          isRunning;
@property (nonatomic, assign) double        distance;

+ (URWWRunService *)sharedObject;

- (void)startRun;

- (void)stopRun;

- (void)updateRunLocation:(CLLocation *)location;

@end
