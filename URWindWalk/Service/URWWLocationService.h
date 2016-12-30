//
//  URWWLocationService.h
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URWWLocationService : NSObject

+ (URWWLocationService *)sharedObject;

- (void)getCityName;

- (BOOL)checkLocationService;

- (void)startUpdate;

- (void)stopUpdate;

@end
