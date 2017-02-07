//
//  URProtocolWrapper.h
//  URWindWalk
//
//  Created by weiyan on 29/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URProtocolWrapper : NSObject

+ (NSData *)loginReq:(NSString *)passport password:(NSString *)password;

+ (BOOL)loginRes:(NSData *)data;

@end
