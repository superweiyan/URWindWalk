//
//  URWWWeatherSerivce.h
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URWWLocation;

@interface URWWWeatherSerivce : NSObject

@property (nonatomic, strong) URWWLocation  *location;

+ (URWWWeatherSerivce *)sharedObject;

@end
