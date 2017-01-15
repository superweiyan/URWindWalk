//
//  NSDictionary+Safe.h
//  URWindWalk
//
//  Created by weiyan on 30/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(Safe)

- (id)safeObjectForKey:(NSString *)key;

@end
