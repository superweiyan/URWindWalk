//
//  URAsyncSocketWrapper+timeout.m
//  URWindWalk
//
//  Created by weiyan on 24/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URAsyncSocketWrapper+timeout.h"

@implementation URAsyncSocketWrapper(timeout)

- (void)addSendCallback:(NSUInteger)key value:(id)callback
{
    [self.connectSocketDict setObject:callback forKey:@(key).stringValue];
}

- (void)removeSendCallback:(NSUInteger)key
{
    [self.connectSocketDict removeObjectForKey:@(key).stringValue];
}

- (id)getCallbackForKey:(NSUInteger)key
{
    return [self.connectSocketDict objectForKey:@(key).stringValue];
}

@end
