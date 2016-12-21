//
//  URMapWrapper.h
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * URWeatherSearchCityNameNotification;

@interface URMapWrapper : NSObject

+ (id)sharedObject;

- (void)queryWeather:(NSString *)cityName;

- (void)queryGeocode:(float)latitude longitude:(float)longitude;

@end
