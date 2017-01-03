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

@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView     *_infoTable;
}
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTestClicked
{
    URTestViewController *controller = [[URTestViewController alloc] init];
    controller.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
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

@end
