//
//  URMeInfoTableViewCell.m
//  URWindWalk
//
//  Created by weiyan on 04/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URMeInfoTableViewCell.h"
#import "URPortraitView.h"

@interface URMeInfoTableViewCell()
{
    URPortraitView     *_portailImageView;
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
    _portailImageView.frame = CGRectMake(10, 10, 50, 50);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark - private

- (void)initViews
{
    _portailImageView = [[URPortraitView alloc] initWithFrame:CGRectZero];
    [self addSubview:_portailImageView];
}

- (void)initData
{
    [_portailImageView loadPortraitUid:0];
}

@end
