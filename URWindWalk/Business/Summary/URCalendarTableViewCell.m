//
//  URCalendarTableViewCell.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URCalendarTableViewCell.h"
#import "URWWCalendarView.h"

@interface URCalendarTableViewCell()
{
    URWWCalendarView   *_calendarView;
}
@end

@implementation URCalendarTableViewCell

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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = YES;
        _calendarView = [[URWWCalendarView alloc] initWithFrameWithDate:CGRectZero date:[NSDate date]];
        [self addSubview:_calendarView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _calendarView.frame = self.bounds;
}

@end
