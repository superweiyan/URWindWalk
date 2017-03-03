//
//  URSocketService+Login.h
//  URWindWalk
//
//  Created by weiyan on 19/02/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "URBlock.h"

@interface URLoginCore : NSObject

- (BOOL)login:(NSString *)passport password:(NSString *)password timeout:(timeout_block)callback;

@end
