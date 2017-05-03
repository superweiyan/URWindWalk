//
//  URImageMacro.h
//  URWindWalk
//
//  Created by weiyan on 03/05/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LocalresourePath(n) [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:n]

#define GetImageForPath(p) [[UIImage alloc] initWithContentsOfFile:p];
