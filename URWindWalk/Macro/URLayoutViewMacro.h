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


