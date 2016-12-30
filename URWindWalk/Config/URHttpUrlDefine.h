//
//  URHttpUrlDefine.h
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 location=需要添加经纬度，用冒号隔开，纬度在前，经度在后
 */
static NSString *URQueryThinkPageWeatherUrl = @"https://api.thinkpage.cn/v3/weather/now.json?key=eg2nxph8ki3nmk7p&location=%@";

@interface URHttpUrlDefine : NSObject

@end
