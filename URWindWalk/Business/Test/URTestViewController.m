//
//  URTestViewController.m
//  URWindWalk
//
//  Created by weiyan on 26/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URTestViewController.h"
#import "URAFNetWorkingWrapper.h"
#import "URHttpUrlDefine.h"

@interface URTestViewController ()

@end

@implementation URTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
}

- (void)testUrl:(NSString *)location
{
    NSString *url = [NSString stringWithFormat:URQueryThinkPageWeatherUrl, location];
    [URAFNetWorkingWrapper requetURLWithParamForGet:url param:nil callback:^(BOOL result, id responseObject) {
        
    }];
}

@end
