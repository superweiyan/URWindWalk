//
//  URWWWeatherSerivce.m
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWWeatherSerivce.h"
#import "URLocationManager.h"
#import "URWWObjectInfo.h"
#import "TPWeatherWrapper.h"

NSString * URWeatherInfoNotification = @"URWeatherInfoNotification";

@interface URWWWeatherSerivce()
{
    TPWeatherWrapper *_weatherWrapper;
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
        _weatherWrapper = [[TPWeatherWrapper alloc] init];
        [self initNotification];
        [self initBlock];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initBlock
{
    __weak typeof(self) weakSelf = self;
    _weatherWrapper.weatherInfoBlock = ^(URWWWeatherInfo *weatherInfo) {
        [weakSelf updateWeatherInfo:weatherInfo];
    };
}

#pragma mark - interface

- (void)queryWeather:(NSString *)location
{
    [_weatherWrapper queryWeather:location];
}

#pragma mark - block

- (void)updateWeatherInfo:(URWWWeatherInfo *)weatherInfo
{
    self.weatherInfo = weatherInfo;
    [[NSNotificationCenter defaultCenter] postNotificationName:URWeatherInfoNotification object:nil];
}

#pragma mark - notification

- (void)initNotification
{
    
}

@end
