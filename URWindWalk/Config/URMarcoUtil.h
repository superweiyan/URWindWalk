//
//  URMarcoUtil.h
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

//#import <Foundation/Foundation.h>

#define URDEBUG "test"

#import "URLog.h"

#define URLog(info, modelName) [[URLog sharedObject] logInfo:info model:modelName funName:__func__];

#define weak_Self __weak __typeof__(self) weakSelf = self;
