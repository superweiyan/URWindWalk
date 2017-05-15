//
//  URLayoutViewMacro.h
//  URWindWalk
//
//  Created by weiyan on 04/05/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define VIEW_WIDTH  [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT  [UIScreen mainScreen].bounds.size.height


//#define newObj(z) [[z alloc] initWithFrame:CGRectZero];

#define ADD_VIEW(z, t) z = [[t alloc] initWithFrame:CGRectZero]; [self.view addSubview:z];

#define ADD_VIEW_IN_VIEW(z, t, s) z = [[t alloc] initWithFrame:CGRectZero]; [s addSubview:z];

#define URCOLOR(r,g,b,a) [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:a];

//Layout
#define LEFT_TO_VIEW_CENTER(__OFFSET_WIDTH__)  self.center.x - __OFFSET_WIDTH__

//距离 __VIEW__ 左边间距
#define LEFT_TO_VIEW(__VIEW__, __OFFSET__)  CGRectGetMinX(__VIEW__.frame) + __OFFSET__

//距离 __VIEW__ 右边间距
#define RIGHT_TO_VIEW(__VIEW__, __OFFSET__)  CGRectGetMaxX(__VIEW__.frame) + __OFFSET__

//距离 __VIEW__ 顶部间距
#define TOP_TO_VIEW(__VIEW__, __OFFSET__)  CGRectGetMinY(__VIEW__.frame) + __OFFSET__

//距离 __VIEW__ 底部间距
#define BOTTOM_TO_VIEW(__VIEW__, __OFFSET__)  CGRectGetMaxY(__VIEW__.frame) + __OFFSET__

//居中
#define LEFT_OFFSET_TO_VIEW_CENTER(__VIEW__) (CGRectGetWidth(__VIEW__.superview.frame) - CGRectGetWidth(__VIEW__.frame)) / 2  
