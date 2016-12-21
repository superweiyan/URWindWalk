//
//  URWWWeatherSerivce.m
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWWeatherSerivce.h"
#import "URLocationManager.h"

@implementation URWWWeatherSerivce

+ (id)sharedObject
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
    }
    return self;
}

- (void)locationService
{
    URLocationManager *locationManager = [[URLocationManager alloc] init];
    [locationManager startLocation];
}


@end
