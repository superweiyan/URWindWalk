//
//  URStepFrequencyUtil.h
//  URWindWalk
//
//  Created by weiyan on 15/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ur_stepFrequencyResult_block)(NSUInteger res,  NSString *);

@interface URStepFrequencyUtil : NSObject

@property (nonatomic, assign) NSUInteger      stepFrequency;

@property (nonatomic, copy) ur_stepFrequencyResult_block stepFrequencyResultBlock;

- (BOOL)isDeviceMotionAvailable;

- (BOOL)startStep;

- (void)stopStep;

@end
