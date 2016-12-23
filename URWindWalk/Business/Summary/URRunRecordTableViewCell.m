//
//  URRunRecordTableViewCell.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URRunRecordTableViewCell.h"
#import "URWWRunRecordView.h"

@interface URRunRecordTableViewCell()
{
    URWWRunRecordView *_recordView;
}
@end

@implementation URRunRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _recordView = [[URWWRunRecordView alloc] initWithFrame:CGRectZero];
        [self addSubview:_recordView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _recordView.frame = self.bounds;
}

@end
