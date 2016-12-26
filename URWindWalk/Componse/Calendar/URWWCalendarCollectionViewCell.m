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
    UILabel     *_typeView;
    UIButton    *_maskBtn;
    
    URShowType  _showType;
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
    _showType = 0;
    
    _typeView = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_typeView];
    
    _maskBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [_maskBtn addTarget:self action:@selector(onClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_maskBtn];
    
    self.backgroundColor = [UIColor blueColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _typeView.frame = self.bounds;
    _maskBtn.frame = self.bounds;
}

//- (void)setType:(URShowType)type
//{
//    _showType = type;
//    
//    if (type == URShowTypeText) {
//        if (!_typeView && [_typeView isKindOfClass:[UILabel class]]) {
//            _typeView = [[UILabel alloc] initWithFrame:self.bounds];
//            [self insertSubview:_typeView atIndex:0];
//        }
//    }
//    else if(type == URShowTypeImage){
//        if (!_typeView && [_typeView isKindOfClass:[UIImageView class]]) {
//            _typeView = [[UIImageView alloc] initWithFrame:self.bounds];
//            [self insertSubview:_typeView atIndex:0];
//        }
//    }
//    else if(type == UIShowTypeActive) {
//        if (!_typeView && [_typeView isKindOfClass:[UIImageView class]]) {
//            _typeView = [[UIImageView alloc] initWithFrame:self.bounds];
//            [self insertSubview:_typeView atIndex:0];
//        }
//    }
//}

- (void)updateInfo:(NSUInteger)info
{
    _typeView.text = @(info).stringValue;
}

- (void)onClicked
{
    if (_showType != UIShowTypeActive ) {
        return ;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(onCellClicked)]) {
        [self.delegate onCellClicked];
    }
}

@end
