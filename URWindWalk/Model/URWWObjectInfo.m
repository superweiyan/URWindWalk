//
//  URWWObjectInfo.m
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWObjectInfo.h"
#import "NSDictionary+Safe.h"

@implementation URWWLocationInfo
@end

@implementation URWWWeatherInfo

+ (instancetype)fromDictionary:(NSDictionary *)dict
{
    URWWWeatherInfo *weather = [[URWWWeatherInfo alloc] init];
    weather.code = [dict safeObjectForKey:@"code"];
    weather.temperature = [dict safeObjectForKey:@"temperature"];
    weather.weather = [dict safeObjectForKey:@"text"];
    return weather;
}

@end

@implementation URWWUserInfo
@end
