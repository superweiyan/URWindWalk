//
//  URDefine.h
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *URThinkPageAPIKey = @"eg2nxph8ki3nmk7p";
static NSString *URThinkPageUIDKey = @"UE020775F7";

#ifdef URDEBUG
    static NSString *URServiceIP = @"120.25.226.101";
#else
    static NSString *URServiceIP = @"127.0.0.1";
#endif

static uint16_t URServicePort = 7777;

@interface URDefine : NSObject

+ (int32_t)protocolVersion;

@end
