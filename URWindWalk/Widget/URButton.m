//
//  URButton.m
//  URWindWalk
//
//  Created by weiyan on 09/05/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URButton.h"

@implementation URButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}

@end
