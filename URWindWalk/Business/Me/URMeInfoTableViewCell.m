//
//  URMeInfoTableViewCell.m
//  URWindWalk
//
//  Created by weiyan on 04/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URMeInfoTableViewCell.h"
#import "URPortraitView.h"
#import "URLabel.h"
#import "URWWUserInfoService.h"
#import "URWWUserInfo.h"
#import "URLayoutViewMacro.h"

const CGFloat URPortraitViewWidth = 100;
const CGFloat URPortraitViewHeight = 100;

@interface URMeInfoTableViewCell()
{
    URPortraitView      *_portailImageView;
    URLabel             *_nickNameLabel;
    UIImageView         *_ganderImageView;
}
@end

@implementation URMeInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initViews];
        [self initData];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = (VIEW_WIDTH - URPortraitViewWidth) / 2;
    CGFloat y = 10;
    _portailImageView.frame = CGRectMake(x, y, URPortraitViewWidth, URPortraitViewHeight);
    _nickNameLabel.frame = CGRectMake((self.bounds.size.width - 100) / 2, CGRectGetMaxY(_portailImageView.frame) + 5, 100, 20 );
    _nickNameLabel.textAlignment = NSTextAlignmentCenter;
    _nickNameLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - private

- (void)initViews
{
    ADD_VIEW_IN_VIEW(_portailImageView, URPortraitView, self);
    [self addSubview:_portailImageView];
    _portailImageView.backgroundColor = [UIColor redColor];
    
    ADD_VIEW_IN_VIEW(_nickNameLabel, URLabel, self);
    _nickNameLabel.text = @"Runner";
    [self addSubview:_nickNameLabel];
    
    ADD_VIEW_IN_VIEW(_ganderImageView, UIImageView, self);
    [self addSubview:_ganderImageView];
}

- (void)initData
{
    [_portailImageView loadPortraitUid:0];
    
    NSUInteger myUid = [[URWWUserInfoService alloc] getMyUid];
    URWWUserInfo *userInfo = [[URWWUserInfoService sharedObject] getUserInfoByUid:myUid];
    _nickNameLabel.text = userInfo.nickName;
    
    if (userInfo.gander == URGanderMale) {
        _ganderImageView.backgroundColor = [UIColor redColor];
    }
    else {
        _ganderImageView.backgroundColor = [UIColor blueColor];
    }
}

@end
