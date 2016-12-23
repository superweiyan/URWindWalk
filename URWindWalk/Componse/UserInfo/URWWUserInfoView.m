//
//  URWWUserInfoView.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWUserInfoView.h"
#import "UIImage+URExtension.h"

@interface URWWUserInfoView()
{
    UIImageView *_logoView;
    UILabel     *_nameLabel;
    UILabel     *_IDLabel;
}
@end

@implementation URWWUserInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    _logoView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"b16" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    UIImage *newImage = [image ur_imageWithRoundedCornersAndSize:CGSizeMake(40, 40)];
    _logoView.image = newImage;
    [self addSubview:_logoView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _logoView.frame = CGRectMake(10, 10, 40, 40);
}
@end
