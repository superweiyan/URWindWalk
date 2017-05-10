//
//  URProtocolWrapper.h
//  URWindWalk
//
//  Created by weiyan on 29/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PHeader;


@interface URProtocolWrapper : NSObject

+ (NSData *)outputStreamWithProto:(id)proto;

+ (PHeader *)initHeader;

//+ (NSData *)loginReq:(NSString *)passport password:(NSString *)password;
//+ (BOOL)loginRes:(NSData *)data;

@end
