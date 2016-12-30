//
//  URWWLocationService.h
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class URWWLocationInfo;

extern NSString * URLocationCityNameChangeNotification;
extern NSString * URLocationChangeNotification;

@interface URWWLocationService : NSObject

@property (nonatomic, strong) URWWLocationInfo*     locationInfo;

+ (URWWLocationService *)sharedObject;

- (void)queryCityName;

- (NSString *)getCityName;

- (BOOL)checkLocationService;

@end
