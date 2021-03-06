//
//  URSummaryViewController.m
//  URWindWalk
//
//  Created by weiyan on 17/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URSummaryViewController.h"
#import "URSummaryViewController+URLayout.h"
#import "URWWUserInfoTableViewCell.h"
#import "URRunRecordTableViewCell.h"
#import "URCalendarTableViewCell.h"
#import "URLog.h"
#import "URWWRunService.h"

#import <URUtilityManager/BSDicUtils.h>

float URWeatherShowHeight = 150.0;

@interface URSummaryViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    BOOL  _hasCalendarSelected;
}
@end

@implementation URSummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    
    [self initSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self layoutSubViews];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - init

- (void)initSubViews
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    
    self.weatherView = [[URWWWeatherView alloc] initWithFrame:CGRectZero];
    self.weatherView.tag = 1000;
    [self.tableView addSubview:self.weatherView];
}


#pragma mark  - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [self createWeatherTableViewCell:tableView];
    }
    else if(indexPath.row == 1) {
        return [self createRunRecordTableViewCell:tableView];
    }
    else if(indexPath.row == 2) {
        return [self createCalenderIdentifierTableViewCell:tableView];
    }
    else if(indexPath.row == 3) {
        UITableViewCell *cell = [UITableViewCell new];
        cell.textLabel.text = @"训练计划";
        return cell;
    }
    else if(indexPath.row == 4) {
        UITableViewCell *cell = [UITableViewCell new];
        cell.textLabel.text = @"挑战行动";
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60.0;
    }
    else if(indexPath.row == 1) {
        return 80.0f;
    }
    else if(indexPath.row == 2) {
        if (_hasCalendarSelected) {
            return 230;
        }
        else {
            return 50;
        }
    }
    
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 2) {
        return;
    }
    
    _hasCalendarSelected = !_hasCalendarSelected;
    [tableView beginUpdates];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

    [tableView endUpdates];
}


#pragma mark - UIScrollView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offSet = scrollView.contentOffset.y;
    
    if (offSet < -URWeatherShowHeight)
    {
        URWWWeatherView * tempImageView = (URWWWeatherView *)[self.view viewWithTag:1000];
        
        CGRect f = tempImageView.frame;
        //保持图片原点仍为屏幕左上方
        f.origin.y = offSet;
        //保证图片根据滑动高度拉伸
        f.size.height = -offSet;
        //给图片重新设置坐标
        tempImageView.frame = f;
    }
}

#pragma mark - tableViewCell

- (UITableViewCell *)createWeatherTableViewCell:(UITableView *)tableView
{
    static NSString *URUserInfoIdentifier = @"URUserInfoIdentifier";
    URWWUserInfoTableViewCell *userInfoCell = [tableView dequeueReusableCellWithIdentifier:URUserInfoIdentifier];
    if (!userInfoCell) {
        userInfoCell = [[URWWUserInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:URUserInfoIdentifier];
    }
    return userInfoCell;
}

- (UITableViewCell *)createRunRecordTableViewCell:(UITableView *)tableView
{
    static NSString *URRunRecordIdentifier = @"URRunRecordIdentifier";
    URRunRecordTableViewCell *runRecordCell = [tableView dequeueReusableCellWithIdentifier:URRunRecordIdentifier];
    if (!runRecordCell) {
        runRecordCell = [[URRunRecordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:URRunRecordIdentifier];
    }
    return runRecordCell;
}

- (UITableViewCell *)createCalenderIdentifierTableViewCell:(UITableView *)tableView
{
    static NSString *URCalenderIdentifier = @"URCalenderIdentifier";
    URCalendarTableViewCell *calendarCell = [tableView dequeueReusableCellWithIdentifier:URCalenderIdentifier];
    if (!calendarCell) {
        calendarCell = [[URCalendarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:URCalenderIdentifier];
    }
    return calendarCell;
}

@end
