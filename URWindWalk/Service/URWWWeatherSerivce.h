//
//  URWWWeatherSerivce.h
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * URWeatherInfoNotification;

@class URWWWeatherInfo;

@interface URWWWeatherSerivce : NSObject

@property (nonatomic, strong) URWWWeatherInfo           *weatherInfo;

+ (URWWWeatherSerivce *)sharedObject;

- (void)queryWeather:(NSString *)location;

@end
