//
//  RunViewController.m
//  URWindWalk
//
//  Created by weiyan on 17/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "RunViewController.h"

@interface RunViewController ()

@end

@implementation RunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"跑步";
    self.navigationItem.titleView.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
