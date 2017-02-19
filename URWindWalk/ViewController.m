//
//  ViewController.m
//  URWindWalk
//
//  Created by weiyan on 04/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "ViewController.h"
#import "URLog.h"
#import "URMarcoUtil.h"
#import "URSummaryViewController.h"
#import "RunViewController.h"
#import "MeViewController.h"
#import "URWWWeatherSerivce.h"

@interface ViewController ()<UITabBarDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addChildViewControllers];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewControllers
{
    URSummaryViewController *summaryController = [[URSummaryViewController alloc] init];
    [self addChildViewController:summaryController andTitle:@"首页" andImageName:@""];
    
    RunViewController *runController = [[RunViewController alloc] init];
    [self addChildViewController:runController andTitle:@"跑步" andImageName:@""];

    MeViewController *meController = [[MeViewController alloc] init];
    [self addChildViewController:meController andTitle:@"我" andImageName:@""];
}

- (void)addChildViewController:(UIViewController *)VC andTitle:(NSString *)title andImageName:(NSString *)imageName
{
    VC.title=title;
    
    VC.tabBarItem.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@nor",imageName]];
    
    VC.tabBarItem.selectedImage=[UIImage imageNamed:[NSString stringWithFormat:@"%@press",imageName]];
    
    self.tabBar.tintColor=[UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
    
    [self addChildViewController:nav];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqualToString:@"日历"]) {
        
    }
    else if ([item.title isEqualToString:@"新建事件"]){
        
    }
    else {
        
    }}

@end
