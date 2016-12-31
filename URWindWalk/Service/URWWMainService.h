//
//  URWWMainService.h
//  URWindWalk
//
//  这个类的功能主要是服务于一些不需要界面驱动，但是又要执行的操作的。
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URWWMainService : NSObject

+ (URWWMainService *)sharedObject;

@end
