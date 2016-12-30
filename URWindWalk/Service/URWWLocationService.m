//
//  URWWLocationService.m
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWLocationService.h"
#import "URLocationManager.h"

@interface URWWLocationService()
{
    URLocationManager *_locationManager;
}
@end

@implementation URWWLocationService

+ (URWWLocationService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWLocationService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWLocationService alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[URLocationManager alloc] init];
        
        [self initBlock];
    }
    return self;
}

- (void)initBlock
{
    __weak typeof(self) weakSelf = self;
    _locationManager.requestLocationErrorBlock = ^(NSString *error) {
        [weakSelf showTip:error];
    };
}

- (void)getCityName
{
    
}

- (BOOL)checkLocationService
{
    return [_locationManager canLocationService];
}

- (void)startUpdate
{
    [_locationManager startLocation];
}

- (void)stopUpdate
{
    [_locationManager stopLocation];
}

#pragma mark - 

- (void)loadCity
{
    if ([self checkLocationService]) {
        [self startUpdate];
    }
}


- (void)showTip:(NSString *)error
{
    
}

@end
