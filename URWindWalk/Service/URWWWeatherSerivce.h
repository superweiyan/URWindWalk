//
//  URWWWeatherSerivce.h
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URWWLocationInfo;
@class URWWWeatherInfo;

@interface URWWWeatherSerivce : NSObject

@property (nonatomic, strong) URWWLocationInfo          *location;
@property (nonatomic, strong) URWWWeatherInfo           *weatherInfo;

+ (URWWWeatherSerivce *)sharedObject;

@end
