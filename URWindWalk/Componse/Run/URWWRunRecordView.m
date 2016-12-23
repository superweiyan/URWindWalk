//
//  URWWRunRecordView.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWRunRecordView.h"
#import "URLabel.h"

@interface URWWRunRecordView()
{
    URLabel *_totalDistanceLabel;
    URLabel *_totalTimeLabel;
    URLabel *_totalCountLabel;
    URLabel *_lastDistanceLabel;
    URLabel *_lastTimeLabel;
}
@end

@implementation URWWRunRecordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    _totalDistanceLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_totalDistanceLabel];
    
    _totalTimeLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_totalTimeLabel];

    _totalCountLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_totalCountLabel];

    _lastDistanceLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    _lastDistanceLabel.fontSize = 16.0;
    [self addSubview:_lastDistanceLabel];

    _lastTimeLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    _lastTimeLabel.fontSize = 16.0;
    [self addSubview:_lastTimeLabel];
    
    [self updateInfo];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _lastDistanceLabel.frame = CGRectMake(10, 5, 150, 30);
    _lastTimeLabel.frame = CGRectMake(10, 40, 150, 30);
    
    CGFloat offsetLeft = self.bounds.size.width - 120 - 20;
    _totalDistanceLabel.frame = CGRectMake(offsetLeft, 5, 120, 20);
    _totalTimeLabel.frame = CGRectMake(offsetLeft, 30, 120, 20);
    _totalCountLabel.frame = CGRectMake(offsetLeft, 55, 120, 20);
}

- (void)updateInfo
{
    _lastDistanceLabel.text = [NSString stringWithFormat:@"最近距离： %d", 3000];
    _lastTimeLabel.text = [NSString stringWithFormat:@"最近一次： %d", 40];
    
    _totalDistanceLabel.text = [NSString stringWithFormat:@"总距离： %d", 4000];
    _totalTimeLabel.text = [NSString stringWithFormat:@"总时间： %d", 400];
    _totalCountLabel.text = [NSString stringWithFormat:@"总次数： %d", 40];
}

@end
