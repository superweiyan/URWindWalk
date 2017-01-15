//
//  URStepFrequencyUtil.m
//  URWindWalk
//
//  Created by weiyan on 15/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URStepFrequencyUtil.h"
#import <CoreMotion/CoreMotion.h>
#import "URMarcoUtil.h"

@interface URStepFrequencyUtil()
{
    CMMotionManager *_motionManager;
    
    BOOL            _isValidStey;
}
@end

@implementation URStepFrequencyUtil

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.deviceMotionUpdateInterval = 1.0 / 30;
}

- (BOOL)isDeviceMotionAvailable
{
    return _motionManager.isDeviceMotionAvailable;
}

- (BOOL)startStep
{
    
    if (![self isDeviceMotionAvailable]) {
        return NO;
    }
    
    _stepFrequency = 0;
    
    __weak typeof(self) weakSelf = self;
    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        if (!error) {
            [weakSelf calcStepFrequency:accelerometerData];
        }
        else {
            if(weakSelf.stepFrequencyResultBlock) {
                weakSelf.stepFrequencyResultBlock(NO, error.localizedDescription);
            }
        }
    }];
    
    return YES;
}

- (void)stopStep
{
    [_motionManager stopDeviceMotionUpdates];
}

- (void)calcStepFrequency:(CMAccelerometerData *)accelerometerData
{
    double sqrtValue =  sqrt(accelerometerData.acceleration.x * accelerometerData.acceleration.x
                              + accelerometerData.acceleration.y * accelerometerData.acceleration.y
                              + accelerometerData.acceleration.z * accelerometerData.acceleration.z);
    
    if (!_isValidStey && sqrtValue > 0.2) {
        _stepFrequency += 1;
        _isValidStey = YES;
    }
    else {
        _isValidStey = NO;
    }
    
    NSString *keyValue = [NSString stringWithFormat:@"accelerometer x:%f, y:%f, z:%f,sqrt: %f, valida:%d",
                          accelerometerData.acceleration.x,
                          accelerometerData.acceleration.y,
                          accelerometerData.acceleration.z,
                          sqrtValue,
                          _isValidStey ];
    
    URLog(keyValue, @"util");
}

@end
