//
//  URWWUserInfoView.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWUserInfoView.h"
#import "UIImage+URExtension.h"
#import "URLabel.h"

@interface URWWUserInfoView()
{
    UIImageView *_logoView;
    URLabel     *_nameLabel;
    URLabel     *_IDLabel;
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
    
    UIImage *image = [UIImage ur_getLocalImageForResouce:@"b16"];
    UIImage *newImage = [image ur_imageWithRoundCornerRadius:CGSizeMake(40, 40) cornerRadius:5.0];
    _logoView.image = newImage;
    [self addSubview:_logoView];
    
    _nameLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    _nameLabel.text = @"林伟彦";
    [self addSubview:_nameLabel];
    
    _IDLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    _IDLabel.text = @"123456789";
    [self addSubview:_IDLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _logoView.frame = CGRectMake(10, 10, 40, 40);
    
    _nameLabel.frame = CGRectMake(60, 5, 100, 20);
    
    _IDLabel.frame = CGRectMake(60, 30, 100, 20);
}
@end
