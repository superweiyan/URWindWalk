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
    
    NSDate                          *_date;
}
@end

@implementation URWWCalendarView

- (instancetype)initWithFrameWithDate:(CGRect)frame date:(NSDate *)date;
{
    self = [super initWithFrame:frame];
    if (self) {
        _date = date;
        [self loadDate];
        [self initViews];
    }
    return self;
}

- (void)loadDate
{
    _showDateArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 7; i++) {
        
        [_showDateArray addObject:[self convertChineseForNumber:i]];
    }
    
    NSUInteger offsetDay = [NSDateUtil getFirstDayOfMonth:_date];
    for (int i = 0; i < offsetDay; i++) {
        [_showDateArray addObject:@(0).stringValue];
    }
    
    NSUInteger offAllDay = [NSDateUtil getTotalDaysInMonth:_date];
    
    for (int i = 0; i < offAllDay; i++) {
        [_showDateArray addObject:@(i + 1).stringValue];
    }
}

- (void)initViews
{
    _calendarLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    
    NSString *month = [NSDateUtil getChineseMonthInYear:_date];
    NSString *title = [NSString stringWithFormat:@"日历(%@)", month];
    _calendarLabel.text = title;
    
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
    _monthCalendarView.backgroundColor = [UIColor whiteColor];
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
    
    NSString *num = [_showDateArray objectAtIndex:indexPath.row];
    [cell updateInfo:num];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemWidth = (self.bounds.size.width - 20 - 5 * 6) / 7;
    return CGSizeMake(itemWidth, 20);
}

#pragma mark - private 

- (NSString *)convertChineseForNumber:(NSUInteger)number
{
    switch (number) {
        case 0:
            return @"日";
            break;
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
        case 5:
            return @"五";
            break;
        case 6:
            return @"六";
            break;
        default:
            break;
    }
    return @"日";
}

@end
