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
#import "URMapWrapper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [[URLog sharedObject] logInfo:@"xxx" model:@"start" funName:[NSString stringWithUTF8String:__func__]];
    
//    NSString *info = @"xxx";
//    URLog(info, info);
    
    [[URMapWrapper sharedObject] queryWeather];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
