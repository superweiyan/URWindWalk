//
//  URSocketService.m
//  URWindWalk
//
//  Created by weiyan on 18/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URSocketService.h"
#import "URAsyncSocketWrapper.h"
#import "URProtocolWrapper.h"
#import "Urprotocol.pbobjc.h"
#import "UrpacketType.pbobjc.h"

NSString * URSocketResultNotification = @"URSocketResultNotification";

@interface ReqInfo : NSObject
@property (assign, nonatomic) uint64_t              uriRes;
@property (strong, nonatomic) timeout_block         timeoutHandler;
@property (strong, nonatomic) onDataCallback_block  callbackHandler;
@end;

@implementation ReqInfo

@end


@interface URSocketService()<URSocketDataArrivedDelegate>
{
    URAsyncSocketWrapper   *_asyncSocketWrapper;
    NSMutableDictionary    *_blockDict;
    NSMutableDictionary    *_notificationDict;
}
@end

@implementation URSocketService

+ (URSocketService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URSocketService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URSocketService alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _asyncSocketWrapper = [[URAsyncSocketWrapper alloc] init];
        _asyncSocketWrapper.port = 7777;
        _asyncSocketWrapper.ip = @"127.0.0.1";
        _asyncSocketWrapper.dataArrivedDelegate = self;
        [self initData];
    }
    return self;
}

- (void)initData
{
    if([_asyncSocketWrapper connectServer]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:URSocketResultNotification object:nil];
    }
    
    _blockDict = [[NSMutableDictionary alloc] init];
    _notificationDict = [[NSMutableDictionary alloc] init];
}

#pragma mark -

- (BOOL)sendData:(NSUInteger)uri data:(URProtocol *)protocolData callback:(onRawDataArrived_block)callback timeout:(timeout_block)timeout
{
    protocolData.uri = URPacketType_KUriPloginReq;
    protocolData.header = [URProtocolWrapper initHeader];
    NSData *data = [URProtocolWrapper outputStreamWithProto:protocolData];
    
    NSString *blockId = [self genernateUniqueness:protocolData.header.seqid uri:(uri+1)];
    
    ReqInfo *info = [ReqInfo new];
    info.uriRes = protocolData.header.seqid;
    info.timeoutHandler = timeout;
    info.callbackHandler = callback;
    [_blockDict setObject:info forKey:blockId];
    
    BOOL issuccess = [_asyncSocketWrapper sendData:data callback:^{
            timeout();
    }];
    
    [self watchTimeout:blockId];
    
    return issuccess;
}

- (void)registerNotification:(NSUInteger)uri notification:(NSString *)notification
{
    [_notificationDict setObject:notification forKey:@(uri)];
}

- (void)unregisterNotification:(NSUInteger)uri
{
    [_notificationDict removeObjectForKey:@(uri)];
}

#pragma mark - callback

- (void)onDataArrived:(NSData *)data
{
    NSError *error;
    URProtocol *proto = [URProtocol parseFromData:data error:&error];
    
    if (error) {
        return ;
    }
    
    NSString *notificationName = [_notificationDict objectForKey:@(proto.uri)];
    if (notificationName) {
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:proto];
    }
    else {
        [self dispatchUri:proto];
    }
}

#pragma mark - private

- (void)watchTimeout:(NSString *)blockId
{
    __weak __typeof__(self) weakSelf = self;
    dispatch_time_t timeout = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC));
    dispatch_after(timeout, dispatch_get_main_queue(), ^(void) {
        [weakSelf handleRequestTimeout:blockId];
    });

}

- (void)handleRequestTimeout:(NSString *)blockId
{
    ReqInfo *reqInfo = (ReqInfo *)[_blockDict objectForKey:blockId];
    if (reqInfo) {
        [_blockDict removeObjectForKey:blockId];
        if (reqInfo.timeoutHandler) {
            reqInfo.timeoutHandler();
        }
    }
}

- (void)dispatchUri:(URProtocol *)proto
{
    URPacketType uri = proto.uri;
    
    NSString *blockid = [self genernateUniqueness:proto.header.seqid uri:uri];
    
    ReqInfo *info = [_blockDict objectForKey:blockid];
    
    if (info.callbackHandler) {
        info.callbackHandler(proto);
    }
    
    [_blockDict removeObjectForKey:blockid];
}

- (NSString *)genernateUniqueness:(uint64_t)sequid uri:(NSUInteger)uri
{
    return [NSString stringWithFormat:@"%@_%lu", @(sequid), (unsigned long)uri];
}

@end
