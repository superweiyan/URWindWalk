//
//  URWWCalendarView.m
//  URWindWalk
//
//  Created by weiyan on 24/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWCalendarView.h"
#import "URLabel.h"
#import "URWWCalendarCollectionViewCell.h"
#import "NSDateUtil.h"

@interface URWWCalendarView()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    URLabel                         *_calendarLabel;
    URLabel                         *_monthDistaneLabel;
    UICollectionView                *_monthCalendarView;
    NSMutableArray                  *_showDateArray;
}
@end

@implementation URWWCalendarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDate];
        [self initViews];
    }
    return self;
}

- (void)loadDate
{
    _showDateArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 7; i++) {
        [_showDateArray addObject:@(i)];
    }
    
    NSUInteger offsetDay = [NSDateUtil getFirstDayOfMonth:[NSDate date]];
    for (int i = 0; i < offsetDay; i++) {
        [_showDateArray addObject:@(0)];
    }
    
    NSUInteger offAllDay = [NSDateUtil getDayInMonth:[NSDate date]];
    
    for (int i = 0; i < offAllDay; i++) {
        [_showDateArray addObject:@(i)];
    }
}

- (void)initViews
{
    _calendarLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    _calendarLabel.text = @"日历";
    [self addSubview:_calendarLabel];
    
    _monthDistaneLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    _monthDistaneLabel.text = @(20.1).stringValue;
    _monthDistaneLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_monthDistaneLabel];
    
    UICollectionViewFlowLayout *_flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    _flowLayOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _flowLayOut.minimumInteritemSpacing = 5;
    _flowLayOut.minimumLineSpacing = 8.0;

    _monthCalendarView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayOut];
    [_monthCalendarView registerClass:[URWWCalendarCollectionViewCell class]  forCellWithReuseIdentifier:@"CollectionCell"];
    _monthCalendarView.delegate = self;
    _monthCalendarView.dataSource = self;
    [self addSubview:_monthCalendarView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _calendarLabel.frame = CGRectMake(10, 15, 100, 20);
    CGFloat x = self.bounds.size.width - 20 - 100;
    _monthDistaneLabel.frame = CGRectMake(x, 15, 100, 20);
 
    _monthCalendarView.frame = CGRectMake(0,
                                          CGRectGetMaxY(_calendarLabel.frame) + 15,
                                          self.bounds.size.width,
                                          180);
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _showDateArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    URWWCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell"
                                                                                              forIndexPath:indexPath];
    
    NSNumber *num = [_showDateArray objectAtIndex:indexPath.row];
    [cell updateInfo:num.unsignedIntegerValue];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemWidth = (self.bounds.size.width - 20 - 5 * 6) / 7;
    return CGSizeMake(itemWidth, 20);
}

@end
