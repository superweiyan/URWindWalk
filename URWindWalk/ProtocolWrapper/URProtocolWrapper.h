//
//  URProtocolWrapper.h
//  URWindWalk
//
//  Created by weiyan on 29/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PHeader;

static uint64_t getSeqId() {
    static uint64_t seqID = 0;
    if (seqID == 0) {
        seqID = (uint64_t)[NSDate timeIntervalSinceReferenceDate];
    }
    
    return ++seqID;
}

@interface URProtocolWrapper : NSObject

+ (NSData *)outputStreamWithProto:(id)proto;

+ (PHeader *)initHeader;

//+ (NSData *)loginReq:(NSString *)passport password:(NSString *)password;
//+ (BOOL)loginRes:(NSData *)data;

@end
