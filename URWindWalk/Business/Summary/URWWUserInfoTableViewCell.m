//
//  URWWUserInfoTableViewCell.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWUserInfoTableViewCell.h"
#import "URWWUserInfoView.h"

@interface URWWUserInfoTableViewCell()
{
    URWWUserInfoView    *_userView;
}
@end

@implementation URWWUserInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _userView = [[URWWUserInfoView alloc] initWithFrame:CGRectZero];
        [self addSubview:_userView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _userView.frame = self.bounds;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
