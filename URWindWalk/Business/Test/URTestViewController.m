//
//  URTestViewController.m
//  URWindWalk
//
//  Created by weiyan on 26/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URTestViewController.h"
#import "URLogWrapper.h"

@interface URTestViewController ()
{
    UITextView      *_logView;
}

@end

@implementation URTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _logView = [[UITextView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_logView];
    self.navigationItem.title = @"日志";
    
    [self loadLog];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _logView.frame = self.view.bounds;
}

- (void)loadLog
{
    NSString *logPath = [[URLogWrapper sharedObject] getLogPath];
    NSData *data = [NSData dataWithContentsOfFile:logPath];
    NSString *textFile  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", textFile);
    
    _logView.text = textFile;
}
@end
