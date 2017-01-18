//
//  URWWObjectInfo.h
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URWWUserInfo;

typedef NS_ENUM(NSUInteger, URGendar) {
    URGendarFemale = 0,
    URGendarMale = 1
};

@interface URWWLocationInfo : NSObject

@property (nonatomic, assign)  double   longitude;  //经度
@property (nonatomic, assign)  double   latitude;    //纬度
@property (nonatomic, assign)  double   altitude;   //海拔

@end

@interface URWWWeatherInfo : NSObject

@property (nonatomic, copy) NSString  *code;       // 天气代码
@property (nonatomic, copy) NSString  *weather;       // 天气气象文字
@property (nonatomic, copy) NSString  *temperature;   // 温度

+ (instancetype)fromDictionary:(NSDictionary *)dict;

@end

@interface URWWUserRunInfo : NSObject

@property (nonatomic, strong)   URWWUserInfo        *nickName;
@property (nonatomic, assign)   URGendar            gendar;
@property (nonatomic, assign)   NSUInteger          level;
@property (nonatomic, assign)   NSUInteger          score;

@end
