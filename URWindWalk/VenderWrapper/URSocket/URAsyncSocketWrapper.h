//
//  URAsyncSocketWrapper.h
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URSocketDataArrivedDelegate <NSObject>

- (void)onDataArrived:(NSData *)data;

@end

typedef void(^ur_asyncSocketResult_block) (NSUInteger);
typedef void(^ur_asyncSocketTimeout_block) (BOOL);

@interface URAsyncSocketWrapper : NSObject

@property (nonatomic, copy)     id<URSocketDataArrivedDelegate> dataArrivedDelegate;

@property (nonatomic, copy)     NSString        *ip;

@property (nonatomic, assign)   uint16_t      port;

@property (nonatomic, strong)   NSMutableDictionary   *connectSocketDict;

@property (nonatomic, copy)     ur_asyncSocketResult_block  asySocketResultBlock;

- (BOOL)connectServer;

- (BOOL)sendData:(NSData *)data callback:(ur_asyncSocketTimeout_block)callback;

- (void)disconnection;

@end
