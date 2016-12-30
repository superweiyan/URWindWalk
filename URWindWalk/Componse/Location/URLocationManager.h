//
//  URLocationManager.h
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URWWLocationInfo;

typedef NS_ENUM(NSUInteger, URDesiredAccuracy){
    URDesiredAccuracyBest = 0,          //
    URDesiredAccuracyNormal = 1,        //百米
    URDesiredAccuracyLow = 2            //千米
};

typedef void(^request_cityname_block) (NSString *cityName);
typedef void(^update_location_block) ();
typedef void(^request_location_error_block) (NSString *errorInfo);

@interface URLocationManager : NSObject

@property (nonatomic, copy) request_location_error_block    requestLocationErrorBlock;

@property (nonatomic, copy) update_location_block           updateLocationBlock;

@property (nonatomic, assign) URDesiredAccuracy             desiredAccuracy;

@property (nonatomic, strong) URWWLocationInfo              *locationInfo;

- (void)getCityName:(URWWLocationInfo *)location callback:(request_cityname_block)callback;

- (void)startLocation;

- (void)stopLocation;

- (BOOL)canLocationService;

@end
