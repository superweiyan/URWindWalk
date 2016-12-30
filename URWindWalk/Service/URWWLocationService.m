//
//  URWWLocationService.m
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWLocationService.h"
#import "URLocationManager.h"

NSString * URLocationCityNameChangeNotification = @"URLocationCityNameChangeNotification";
NSString * URLocationChangeNotification = @"URLocationChangeNotification";

@interface URWWLocationService()
{
    URLocationManager   *_locationManager;    
    NSString            *_cityName;
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
    
    _locationManager.updateLocationBlock = ^{
        [weakSelf updateLocation];
    };
}

- (void)getCurrentLocation
{
    [self loadCity];
}

- (void)queryCityName
{
    __weak typeof(self) weakSelf = self;
    if (_locationInfo) {
        [_locationManager getCityName:_locationInfo callback:^(NSString *cityName) {
            [weakSelf updateCityname:cityName];
        }];
    }
}

- (NSString *)getCityName
{
    if (_cityName.length > 0) {
        return _cityName;
    }
    
    [self queryCityName];
    return nil;
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

#pragma mark - block

- (void)updateLocation
{
     _locationInfo = _locationManager.locationInfo;
    [[NSNotificationCenter defaultCenter] postNotificationName:URLocationChangeNotification object:nil];
}

- (void)updateCityname:(NSString *)cityName
{
    _cityName = cityName;
    [[NSNotificationCenter defaultCenter] postNotificationName:URLocationCityNameChangeNotification object:nil];
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
