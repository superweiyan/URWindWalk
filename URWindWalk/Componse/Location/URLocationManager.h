//
//  URLocationManager.h
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * URWWLocationAuthorizationStatusChangeNotification;
extern NSString * URWWLocationChangeNotification;

@class URWWLocation;

@interface URLocationManager : NSObject

@property (nonatomic, strong) URWWLocation * location;

- (void)startLocation;

- (void)stopLocation;

@end
