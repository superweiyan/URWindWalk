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
#import "URAsyncSocketWrapper.h"
#import "UrpacketType.pbobjc.h"

@implementation URProtocolWrapper

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
