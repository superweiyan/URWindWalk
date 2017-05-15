//
//  MeViewController.m
//  URWindWalk
//
//  Created by weiyan on 17/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "MeViewController.h"
#import "URTestViewController.h"
#import "URLogCheckViewController.h"
#import "URMeInfoTableViewCell.h"
#import "URTestProtocolViewController.h"

@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView     *_infoTable;
    NSArray         *_typeArray;
}
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
    
    [self initViews];
    [self initData];
}

- (void)dealloc
{
    _infoTable.delegate = nil;
    _infoTable.dataSource = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTestClicked
{
//    URTestViewController *controller = [[URTestViewController alloc] init];
//    controller.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController pushViewController:controller animated:YES];
    
    URTestProtocolViewController *testProtocolViewController = [[UIStoryboard storyboardWithName:@"URTestProtocolStoryboard"
                                                                                          bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"URTestProtocolViewController"];
    
    [self.navigationController pushViewController:testProtocolViewController animated:YES];
    
}

#pragma mark - init

- (void)initViews
{
    self.navigationItem.title = @"我";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"测试"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(onTestClicked)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    _infoTable = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _infoTable.delegate = self;
    _infoTable.dataSource = self;
    [self.view addSubview:_infoTable];
    _infoTable.backgroundColor = [UIColor clearColor];
    
    UIView  *footView = [[UIView alloc] init];
    _infoTable.tableFooterView = footView;
}

- (void)initData
{
    _typeArray = @[@"日志", @"勋章", @"最佳成绩", @"跑鞋"];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if(section == 1) {
        return _typeArray.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        return [self createMeCell:tableView];
    }
    
    else if (indexPath.section == 1) {
        NSString *title = [_typeArray objectAtIndex:indexPath.row];
        return [self createDefaultTableViewCell:title];
    }
    else if(indexPath.section == 2) {
        return [self createDefaultTableViewCell:@"设置"];
    }
    
    return [UITableViewCell new];
}

- (UITableViewCell *)createDefaultTableViewCell:(NSString *)title
{
    UITableViewCell * newCell = [UITableViewCell new];
    newCell.backgroundColor = [UIColor clearColor];
    newCell.imageView.image = [UIImage imageNamed:@""];
    newCell.textLabel.font = [UIFont systemFontOfSize:13.0];
    newCell.textLabel.text = title;
    return newCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    else if(indexPath.section == 1) {
        URLogCheckViewController *controller = [[URLogCheckViewController alloc] init];
        controller.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 170.0;
    }
    return 50.0;
}

#pragma mark - private

- (UITableViewCell *)createMeCell:(UITableView *)tableView
{
    static NSString *meInfoViewCellIndentifier = @"meInfoViewCellIndentifier";
    URMeInfoTableViewCell *meInfoViewCell = [[URMeInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                                         reuseIdentifier:meInfoViewCellIndentifier];
    return meInfoViewCell;
}

#pragma mark - utils

@end
