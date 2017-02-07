//
//  URProtocolWrapper.m
//  URWindWalk
//
//  Created by weiyan on 29/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URProtocolWrapper.h"
#import "GPBCodedOutputStream.h"
#import "GPBMessage.h"
#import "Urprotocol.pbobjc.h"
#import "UrpacketType.pbobjc.h"

static uint64_t getSeqId() {
    static uint64_t seqID = 0;
    if (seqID == 0) {
        seqID = (uint64_t)[NSDate timeIntervalSinceReferenceDate];
    }
    
    return ++seqID;
}

@implementation URProtocolWrapper

+ (NSData *)loginReq:(NSString *)passport password:(NSString *)password
{
    URLoginReq *loginReq = [URLoginReq new];
    loginReq.passport = passport;
    loginReq.password = password;
    
    URProtocol *protocol = [URProtocol new];
    protocol.uri = URPacketType_KUriPloginReq;
    protocol.loginReq = loginReq;
    
    return [URProtocolWrapper outputStreamWithProto:protocol];
}

+ (BOOL)loginRes:(NSData *)data
{
    NSError *error;
    URProtocol *proto = [URProtocol parseFromData:data error:&error];
    
    if (error) {
        return NO;
    }
    
    if (proto.uri == URPacketType_KUriPloginRes) {
        return YES;
    }
    return NO;
}

#pragma mark - util

+ (NSData *)outputStreamWithProto:(id)proto
{
    NSOutputStream *outStream = [[NSOutputStream alloc] initToMemory];
    [outStream open];
    
    GPBCodedOutputStream *outputStream = [GPBCodedOutputStream streamWithOutputStream:outStream];
    [proto writeToCodedOutputStream:outputStream];
    [outputStream flush];
    
    NSData *data = [outStream propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
    return data;
}

+ (PHeader *)headerWithSeqId:(uint64_t)seqId
{
    PHeader *header = [[PHeader alloc] init];
    header.uid = 0;
    header.seqid = getSeqId();
    header.platform = 1;
    header.version = 1;
    return header;
}

@end
