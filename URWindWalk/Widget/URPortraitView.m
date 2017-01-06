//
//  URPortailView.m
//  URWindWalk
//
//  Created by weiyan on 06/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URPortraitView.h"
#import "UIImage+URExtension.h"

@interface URPortraitView()
{
    UIImageView         *_headPortraitView;
}
@end

@implementation URPortraitView

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
        [self initView];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _headPortraitView.frame = self.bounds;
}

#pragma mark - init

- (void)initView
{
    _headPortraitView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_headPortraitView];
}

#pragma mark - interface

- (void)loadPortraitUid:(NSUInteger)uid
{
    UIImage *image = [UIImage ur_getLocalImageForResouce:@"b16"];
    UIImage *newImage = [image ur_imageWithRoundCornerRadius:CGSizeMake(40, 40) cornerRadius:5.0];
    _headPortraitView.image = newImage;
}

@end
