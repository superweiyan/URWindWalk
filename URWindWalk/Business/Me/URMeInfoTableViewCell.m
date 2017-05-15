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
    UILabel             *_IDLabel;
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
    
    _portailImageView.frame = CGRectMake(LEFT_TO_VIEW_CENTER(URPortraitViewWidth/2),
                                         10,
                                         URPortraitViewWidth,
                                         URPortraitViewHeight);
    _nickNameLabel.frame = CGRectMake(LEFT_TO_VIEW_CENTER(50),
                                      BOTTOM_TO_VIEW(_portailImageView, 5), 100, 20 );
    _IDLabel.frame = CGRectMake(LEFT_TO_VIEW_CENTER(100),
                                BOTTOM_TO_VIEW(_nickNameLabel, 5), 100, 15);
    _IDLabel.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - private

- (void)initViews
{
    self.backgroundColor = [UIColor clearColor];
    
    ADD_VIEW_IN_VIEW(_portailImageView, URPortraitView, self);
    ADD_VIEW_IN_VIEW(_nickNameLabel, URLabel, self);
    ADD_VIEW_IN_VIEW(_ganderImageView, UIImageView, self);
    ADD_VIEW_IN_VIEW(_IDLabel, UILabel, self);
    
    _portailImageView.backgroundColor = [UIColor redColor];
    _nickNameLabel.text = @"Runner";
    _nickNameLabel.textAlignment = NSTextAlignmentCenter;
    _nickNameLabel.textColor = [UIColor whiteColor];
    
    _IDLabel.text = @"1";
    _IDLabel.textColor = [UIColor whiteColor];
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
