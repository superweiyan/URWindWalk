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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - private

- (void)initViews
{
    _portailImageView = [[URPortraitView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    [self addSubview:_portailImageView];
    
    _nickNameLabel = [[URLabel alloc] initWithFrame:CGRectMake(70, 10, 100, 20)];
    [self addSubview:_nickNameLabel];
    
    _ganderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(45, 45, 20, 20)];
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
