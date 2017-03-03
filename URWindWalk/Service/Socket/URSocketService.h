//
//  URSocketService.h
//  URWindWalk
//
//  Created by weiyan on 18/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URBlock.h"

extern NSString * URSocketResultNotification;

@interface URSocketService : NSObject

+ (URSocketService *)sharedObject;

- (BOOL)sendData:(NSUInteger)uri
            data:(URProtocol *)protocolData
        callback:(onRawDataArrived_block)callback
         timeout:(timeout_block)timeout;

@end
