//
//  URWWWeatherSerivce.m
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWWeatherSerivce.h"
#import "URLocationManager.h"
#import "URLocationManager.h"
#import "URWWObjectInfo.h"

@interface URWWWeatherSerivce()
{
    URLocationManager *_locationManager;
    
    NSString        *_cityName;
}
@end

@implementation URWWWeatherSerivce

+ (URWWWeatherSerivce *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWWeatherSerivce * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWWeatherSerivce alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self locationService];
        [self initNotification];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initNotification
{
}

- (void)locationService
{
    _locationManager = [[URLocationManager alloc] init];
    [_locationManager startLocation];
}

#pragma mark - notification

- (void)onURWeatherSearchLiveNotification:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    
    URWWWeatherInfo *weatherInfo = [[URWWWeatherInfo alloc] init];
    weatherInfo.temperature = [userInfo objectForKey:@"temperature"];
    weatherInfo.weather = [userInfo objectForKey:@"weather"];
    weatherInfo.city = _cityName;
}

- (void)onURWeatherSearchCityNameNotification:(NSNotification *)notification
{
    _cityName = [notification.userInfo objectForKey:@"key"];
}

@end
