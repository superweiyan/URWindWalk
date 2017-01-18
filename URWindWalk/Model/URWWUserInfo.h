//
//  URWWUserInfo.h
//  URWindWalk
//
//  Created by weiyan on 06/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, URGander) {
    URGanderMale = 0,
    URGanderFelma = 1
};

@interface URWWUserInfo : NSObject

@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, assign) URGander *gander;

@end
