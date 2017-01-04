//
//  URMarcoUtil.h
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "URLogWrapper.h"

#define URLog(info, modelName) [[URLogWrapper sharedObject] logInfo:info model:modelName funName:__func__];

#define URLogBase(info, modelName) [[URLogWrapper sharedObject] logInfo:info model:modelName];
