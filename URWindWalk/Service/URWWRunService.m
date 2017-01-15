//
//  URWWRunService.m
//  URWindWalk
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWRunService.h"
#import <CoreLocation/CoreLocation.h>
#import "URMarcoUtil.h"
#import "URStepFrequencyUtil.h"

NSString *URUpdateRunDistanceNotification = @"URUpdateRunDistanceNotification";

NSString *URUpdateStepFrequencyNotification = @"URUpdateStepFrequencyNotification";

@interface URWWRunService()
{
    NSMutableArray              *_locationArray;
    URStepFrequencyUtil         *_stepFrequencyUtil;
    
    NSTimer                     *_getStepTimer;
}
@end

@implementation URWWRunService

+ (URWWRunService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWRunService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWRunService alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationArray = [[NSMutableArray alloc] init];
        
        _stepFrequencyUtil = [[URStepFrequencyUtil alloc] init];
    }
    return self;
}

- (void)startRun
{
    _distance = 0;
    self.isRunning = YES;
    
    if(![_stepFrequencyUtil startStep]) {
        URLog(@"无法获取步数", @"run");
    }
    else {
        _getStepTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:self
                                                       selector:@selector(onUpdateStepTimeout)
                                                       userInfo:nil
                                                        repeats:YES];
    }
}

- (void)stopRun
{
    self.isRunning = NO;
    [_stepFrequencyUtil stopStep];
    
    if(_getStepTimer) {
        [_getStepTimer invalidate];
        _getStepTimer = nil;
    }
}

- (void)updateRunLocation:(CLLocation *)location
{
    if (!self.isRunning) {
        return ;
    }
    
    if (_locationArray.count != 0) {
        
        CLLocation *lastLocation = [_locationArray lastObject];
        
        [self calcDistance:location end:lastLocation];
    }
    
    [_locationArray addObject:location];
}

- (void)calcDistance:(CLLocation *)startLocation end:(CLLocation *)endLocation
{
    double distance = [endLocation distanceFromLocation:startLocation];
    _distance += distance;
    
    URLog(@"", @"run");
    [[NSNotificationCenter defaultCenter] postNotificationName:URUpdateRunDistanceNotification object:nil];
}

#pragma mark - init

- (void)initBlock
{
    __weak typeof(self) weakSelf = self;
    _stepFrequencyUtil.stepFrequencyResultBlock = ^(NSUInteger res,  NSString * resultError) {
        [weakSelf updateStepFrequencyResult:resultError ext:resultError];
    };
}

#pragma mark - block

- (void)updateStepFrequencyResult:(NSString *)res ext:(NSString *)resInfo
{
    if (res) {
        
    }
    else {
        URLog(@"获取步数失败", @"run");
    }
}

#pragma mark - time

- (void)onUpdateStepTimeout
{
    self.stepFrequency += _stepFrequencyUtil.stepFrequency;
    [[NSNotificationCenter defaultCenter] postNotificationName:URUpdateStepFrequencyNotification object:nil];
}

@end
