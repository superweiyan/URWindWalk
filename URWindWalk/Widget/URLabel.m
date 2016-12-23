//
//  URLabel.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URLabel.h"

@implementation URLabel

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
        self.font = [UIFont systemFontOfSize:13.0];
    }
    return self;
}

- (void)setFontSize:(CGFloat)fontSize
{
    self.font = [UIFont systemFontOfSize:fontSize];
}

@end
