//
//  URAsyncSocketWrapper.m
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URAsyncSocketWrapper.h"
#import "URAsyncSocketWrapper+timeout.h"

typedef NS_ENUM(NSUInteger, URAsyncSocketState) {
    URAsyncSocketStateNormal = 0,
    URAsyncSocketStateLink = 1,
    URAsyncSocketStateServerBroken = 2,
    URAsyncSocketStateUserBroken
};

@import CocoaAsyncSocket;

static long count = 0;

@interface URAsyncSocketWrapper()<GCDAsyncSocketDelegate>
{
    GCDAsyncSocket *_asyncSocket;
    
    NSTimer         *_relinkTimer;
    NSTimer         *_heartBeatTimer;
    
    URAsyncSocketState  _socketState;
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
        
        self.connectSocketDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)initHeartBeat
{
    if (_heartBeatTimer) {
        [_heartBeatTimer invalidate];
        _heartBeatTimer = nil;
    }
    
    _heartBeatTimer = [NSTimer scheduledTimerWithTimeInterval:5
                                                       target:self
                                                     selector:@selector(onSendHeartBeat)
                                                     userInfo:nil
                                                      repeats:YES];
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

- (BOOL)sendData:(NSData *)data callback:(ur_asyncSocketTimeout_block)callback
{
    if (_socketState != URAsyncSocketStateLink) {
        return NO;
    }
    long key = [URAsyncSocketWrapper getUniqueness];
    [_asyncSocket writeData:data withTimeout:10 tag:key];
    
    [self addSendCallback:key value:callback];
    
    return YES;
}

- (void)disconnection
{
    _socketState = URAsyncSocketStateUserBroken;
    [_asyncSocket disconnect];
}

#pragma mark - GCDAsyncSocketDelegate

/**
 *   连接回调
 */
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"didConnectToHost");
    [sock readDataWithTimeout:-1 tag:0];
    
    _socketState = URAsyncSocketStateLink;
    
    [self initHeartBeat];
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"didReadData:withTag");
    
    NSString *aStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@" %@", aStr);
    
    if (self.dataArrivedDelegate && [self.dataArrivedDelegate respondsToSelector:@selector(onDataArrived:)]) {
        [self.dataArrivedDelegate onDataArrived:data];
    }
    
    [sock readDataWithTimeout:-1 tag:0];
}

//消息发送成功的回调
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    NSLog(@"didWriteDataWithTag");
    [self removeSendCallback:tag];
}

- (void)socketDidCloseReadStream:(GCDAsyncSocket *)sock
{
    NSLog(@"%s",  __func__);
}

// 如果对象关闭了 这里也会调用
- (void)socketDidDisconnect:(GCDAsyncSocket*)sock withError:(NSError*)err
{
    if(self.asySocketResultBlock) {
        self.asySocketResultBlock(1);
    }
    
    if (_socketState == URAsyncSocketStateLink) {
        NSLog(@"断开链接 %@", err);
    }
    else {
        _socketState = URAsyncSocketStateServerBroken;
        NSLog(@"连接失败 %@", err);
    }
    
    [self closeHeartBeat];
    
    /*
     *  开始断线重连
     */
    
    if (_socketState == URAsyncSocketStateServerBroken) {
        _relinkTimer = [NSTimer scheduledTimerWithTimeInterval:5
                                                        target:self
                                                      selector:@selector(connectServer)
                                                      userInfo:nil
                                                       repeats:NO];
    }
}

- (NSTimeInterval)socket:(GCDAsyncSocket *)sock shouldTimeoutWriteWithTag:(long)tag
                 elapsed:(NSTimeInterval)elapsed
               bytesDone:(NSUInteger)length
{
    NSLog(@"%s",  __func__);
    
    ur_asyncSocketTimeout_block callback = [self getCallbackForKey:tag];
    
    if (callback) {
        callback(1);
    }
    
    return 0;
}

- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
    NSLog(@"%s", __func__);
}

- (NSTimeInterval)socket:(GCDAsyncSocket *)sock shouldTimeoutReadWithTag:(long)tag
                 elapsed:(NSTimeInterval)elapsed
               bytesDone:(NSUInteger)length
{
    NSLog(@"%s",  __func__);
    return 0;
}
#pragma mark - util

+ (long)getUniqueness
{
    count += 1;
    
    if (count == 20000) {
        count = 1;
    }
    return count;
}

- (void)closeHeartBeat
{
    if(_heartBeatTimer) {
        [_heartBeatTimer invalidate];
        _heartBeatTimer = nil;
    }
}

#pragma mark - select

/*
 *  定时发送心跳包，让服务器可以判断客户端还连接
 */
- (void)onSendHeartBeat
{
    [_asyncSocket writeData:[NSData data] withTimeout:-1 tag:0];
}

@end
