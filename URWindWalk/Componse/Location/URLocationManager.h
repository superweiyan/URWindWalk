//
//  URLocationManager.h
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocation;

typedef void(^request_cityname_block) (NSString *cityName);
typedef void(^update_location_block) (CLLocation *);
typedef void(^request_location_error_block) (NSString *errorInfo);

@interface URLocationManager : NSObject

@property (nonatomic, copy) request_location_error_block requestLocationErrorBlock;

- (void)getCityName:(CLLocation *)location callback:(request_cityname_block)callback;

- (void)startLocation;

- (void)stopLocation;

- (BOOL)canLocationService;

@end
