//
//  URSocketService+Login.h
//  URWindWalk
//
//  Created by weiyan on 19/02/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URBlock.h"

@protocol URLoginCoreDelegate <NSObject>

- (void)onLoginRes:(NSUInteger)resCode;

@end

@interface URLoginCore : NSObject

@property (nonatomic, assign) id<URLoginCoreDelegate> loginDelegate;

- (BOOL)login:(NSString *)passport password:(NSString *)password timeout:(timeout_block)callback;

@end
