//
//  URWWCalendarCollectionViewCell.m
//  URWindWalk
//
//  Created by weiyan on 25/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWCalendarCollectionViewCell.h"


@interface URWWCalendarCollectionViewCell()
{
    UILabel         *_typeView;
    UIImageView     *_maskStyleView;
    UIButton        *_maskBtn;
}

@end

@implementation URWWCalendarCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    _typeView = [[UILabel alloc] initWithFrame:CGRectZero];
    _typeView.textAlignment = NSTextAlignmentCenter;
    _typeView.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:_typeView];
    
    _maskStyleView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:_maskStyleView];
    
    _maskBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [_maskBtn addTarget:self action:@selector(onClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_maskBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _maskStyleView.frame = self.bounds;
    _typeView.frame = self.bounds;
    _maskBtn.frame = self.bounds;
}

- (void)updateInfo:(NSString *)info
{
    _typeView.text = info;
}

- (void)onClicked
{    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onCellClicked)]) {
        [self.delegate onCellClicked];
    }
}

@end
