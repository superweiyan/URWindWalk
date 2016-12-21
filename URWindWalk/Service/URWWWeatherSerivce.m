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
#import "URMapWrapper.h"
#import "URWWLocation.h"

@interface URWWWeatherSerivce()
{
    URLocationManager *_locationManager;
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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onURWWLocationChangeNotification:)
                                                 name:URWWLocationChangeNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onURWeatherSearchLiveNotification:)
                                                 name:URWeatherSearchLiveNotification
                                               object:nil];
}

- (void)locationService
{
    _locationManager = [[URLocationManager alloc] init];
    [_locationManager startLocation];
}

#pragma mark - notification

- (void)onURWWLocationChangeNotification:(NSNotification *)notification
{
    self.location = _locationManager.location;
    
    [[URMapWrapper sharedObject] queryGeocode:self.location.latitude
                                    longitude:self.location.longitude];
}

- (void)onURWeatherSearchLiveNotification:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    
    URWWWeatherModel *weatherModel = [[URWWWeatherModel alloc] init];
    weatherModel.temperature = [userInfo objectForKey:@"temperature"];
    weatherModel.weather = [userInfo objectForKey:@"weather"];
}

@end