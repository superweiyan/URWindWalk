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

NSString *URUpdateRunDistanceNotification = @"URUpdateRunDistanceNotification";

@interface URWWRunService()
{
    NSMutableArray  *_locationArray;
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
    }
    return self;
}

- (void)startRun
{
    _distance = 0;
    self.isRunning = YES;
}

- (void)stopRun
{
    self.isRunning = NO;
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


@end
