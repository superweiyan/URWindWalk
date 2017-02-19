//
//  URWWRunService.h
//  URWindWalk
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *URUpdateRunDistanceNotification;
extern NSString *URUpdateStepFrequencyNotification;

@class CLLocation;

@interface URWWRunService : NSObject

@property (nonatomic, assign) BOOL          isRunning;
@property (nonatomic, assign) double        distance;
@property (nonatomic, assign) double        stepFrequency;

//+ (URWWRunService *)sharedObject;

- (void)startRun;

- (void)stopRun;

- (void)updateRunLocation:(CLLocation *)location;

@end
