//
//  URWWMainService.m
//  URWindWalk
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWMainService.h"
#import "URWWWeatherSerivce.h"
#import "URWWLocationService.h"

@implementation URWWMainService

+ (URWWMainService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWMainService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWMainService alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



@end
