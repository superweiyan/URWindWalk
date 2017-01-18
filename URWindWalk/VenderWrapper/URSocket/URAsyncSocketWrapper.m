//
//  URAsyncSocketWrapper.m
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URAsyncSocketWrapper.h"
@import CocoaAsyncSocket;

@interface URAsyncSocketWrapper()<GCDAsyncSocketDelegate>
{
    GCDAsyncSocket *_asyncSocket;
}
@end

@implementation URAsyncSocketWrapper


/*
 全局队列（代理的方法是在子线程被调用）
 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
 
 主队列（代理的方法会在主线程被调用）
 dispatch_get_main_queue()
 代理里的动作是耗时的动作，要在子线程中操作
 代理里的动作不是耗时的动作，就可以在主线程中调用
 看情况写队列
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        _asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self
                                                  delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }
    return self;
}


- (BOOL)connectServer
{
    NSError *error;
    if (!self.ip) {
        self.ip = @"120.25.226.101";
        self.port = 8081;
    }
    [_asyncSocket connectToHost:self.ip onPort:self.port error:&error];
    
    if (error) {
        return NO;
    }
    return YES;
}

- (void)sendData:(NSData *)data
{
    
}

#pragma mark - GCDAsyncSocketDelegate

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"didConnectToHost");
    [_asyncSocket readDataWithTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"didReadData:withTag");
}

//消息发送成功的回调
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
       NSLog(@"didWriteDataWithTag");
}

// 如果对象关闭了 这里也会调用
- (void)socketDidDisconnect:(GCDAsyncSocket*)sock withError:(NSError*)err
{
    if(self.asySocketResultBlock) {
        self.asySocketResultBlock(1);
    }
    NSLog(@"连接失败 %@", err);
}


@end
