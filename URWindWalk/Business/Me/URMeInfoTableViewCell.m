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
    
    CGFloat x = (VIEW_WIDTH - 80) / 2;
    CGFloat y = 10;
    _portailImageView.frame = CGRectMake(x, y, 80, 80);
    
//    _nickNameLabel.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
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
    
//    _nickNameLabel = [[URLabel alloc] initWithFrame:CGRectMake(70, 10, 100, 20)];
    ADD_VIEW_IN_VIEW(_nickNameLabel, URLabel, self);
    [self addSubview:_nickNameLabel];
    
//    _ganderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(45, 45, 20, 20)];
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
