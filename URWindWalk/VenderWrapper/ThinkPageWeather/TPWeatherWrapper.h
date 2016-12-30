//
//  TPWeatherWrapper.h
//  URWindWalk
//
//  Created by weiyan on 30/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URWWObjectInfo.h"


typedef void(^ur_weatherInfo_block)(URWWWeatherInfo *);

@interface TPWeatherWrapper : NSObject

@property (nonatomic, copy) ur_weatherInfo_block weatherInfoBlock;

- (void)queryWeather:(NSString *)location;

@end
