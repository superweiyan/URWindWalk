//
//  URAsyncSocketWrapper+timeout.h
//  URWindWalk
//
//  Created by weiyan on 24/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URAsyncSocketWrapper.h"

@interface URAsyncSocketWrapper(timeout)

- (void)addSendCallback:(NSUInteger)key value:(id)callback;

- (void)removeSendCallback:(NSUInteger)key;

- (id)getCallbackForKey:(NSUInteger)key;

@end
