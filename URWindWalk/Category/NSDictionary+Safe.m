//
//  NSDictionary+Safe.m
//  URWindWalk
//
//  Created by weiyan on 30/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary(Safe)

- (id)safeObjectForKey:(NSString *)key
{
    id obj = [self objectForKey:key];
    if (obj == (id) [NSNull null])
        return nil;
    return obj;
}

@end
