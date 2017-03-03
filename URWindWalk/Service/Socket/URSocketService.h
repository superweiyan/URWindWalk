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


/*
    对于服务器广播，哪个模块需要，就可以通过注册对应的uri
    以及 通知的名字。这样协议返回，一旦符合这个规范，
    就会发这个广播出来。
*/
- (void)registerNotification:(NSUInteger)uri
                notification:(NSString *)notification;

/*
    取消想要注册的值
 */
- (void)unregisterNotification:(NSUInteger)uri;

@end
