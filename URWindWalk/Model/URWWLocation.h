//
//  URWWLocation.h
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URWWLocationInfo : NSObject

@property (nonatomic, assign)  double   longitude;  //经度
@property (nonatomic, assign)  double   latitude;    //纬度
@property (nonatomic, assign)  double   altitude;   //海拔

@end

@interface URWWWeatherInfo : NSObject

@property (nonatomic, strong) NSString  *city;
@property (nonatomic, strong) NSString  *weather;
@property (nonatomic, strong) NSString  *temperature;

@end
