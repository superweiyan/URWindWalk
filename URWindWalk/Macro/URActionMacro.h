//
//  URActionMacro.h
//  URWindWalk
//
//  Created by weiyan on 04/05/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ADD_NOTIFY(__NAME__, __SELECTOR__) [[NSNotificationCenter defaultCenter] addObserver:self selector:__SELECTOR__ name:__NAME__ object:nil];

#define ADD_ACTION(__OBJ__, __SELECTOR__) [__OBJ__ addTarget:self action:__SELECTOR__ forControlEvents:UIControlEventTouchUpInside];

#define ADD_NOTIFY_OBJ (__NAME__, __SELECTOR__, __OBJ__)   [[NSNotificationCenter defaultCenter] addObserver:self \\
                                                                                selector:__SELECTOR__ \\
                                                                                name:__NAME__ \\
                                                                                object:__OBJ__];

#define POST_NOTIFY(__NAME__) [[NSNotificationCenter defaultCenter] postNotificationName:__NAME__ object:nil];
#define POST_OBJ_NOTIFY(__NAME__, __OBJ__) [[NSNotificationCenter defaultCenter] postNotificationName:__NAME__ object:__OBJ__];
