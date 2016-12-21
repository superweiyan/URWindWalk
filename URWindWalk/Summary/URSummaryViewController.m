//
//  URSummaryViewController.m
//  URWindWalk
//
//  Created by weiyan on 17/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URSummaryViewController.h"
#import "URSummaryViewController+URLayout.h"

float URWeatherShowHeight = 150.0;

@interface URSummaryViewController ()<UITableViewDelegate, UITableViewDataSource>

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

#pragma mark - init

- (void)initSubViews
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.weatherView = [[URWWWeatherView alloc] initWithFrame:CGRectZero];
    self.weatherView.tag = 1000;
    
    [self.tableView addSubview:self.weatherView];
}

#pragma mark  - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

#pragma mark - 

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

@end
