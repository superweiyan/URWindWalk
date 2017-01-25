//
//  URSocketService.h
//  URWindWalk
//
//  Created by weiyan on 18/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^on_requestTimeout_blcok) (BOOL);

extern NSString * URSocketResultNotification;

@interface URSocketService : NSObject

+ (URSocketService *)sharedObject;

- (BOOL)sendText:(NSString *)content callback:(on_requestTimeout_blcok)callback;

@end
