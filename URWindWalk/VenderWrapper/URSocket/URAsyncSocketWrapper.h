//
//  URAsyncSocketWrapper.h
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ur_asyncSocketResult_block) (NSUInteger);

@interface URAsyncSocketWrapper : NSObject

@property (nonatomic, copy)     NSString        *ip;
@property (nonatomic, assign)   uint16_t      port;
@property (nonatomic, copy)     ur_asyncSocketResult_block  asySocketResultBlock;

- (BOOL)connectServer;

- (void)sendData:(NSData *)data;

@end
