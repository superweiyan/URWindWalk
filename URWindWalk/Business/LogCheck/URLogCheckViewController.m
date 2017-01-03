//
//  URLogCheckViewController.m
//  URWindWalk
//
//  Created by weiyan on 03/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URLogCheckViewController.h"
#import "URLogWrapper.h"

@interface URLogCheckViewController ()
{
    UITextView                      *_logView;
}
@end

@implementation URLogCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _logView = [[UITextView alloc] initWithFrame:CGRectZero];
    _logView.editable = NO;
    [self.view addSubview:_logView];
    self.navigationItem.title = @"日志";
    
    [self loadLog];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"清除"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self action:@selector(onClearLog)];
    self.navigationItem.rightBarButtonItem = rightItem;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)onClearLog
{
    NSString *logPath = [[URLogWrapper sharedObject] getLogPath];
    NSLog(@"==== %@", logPath);
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSError *error;
    if([fileMgr removeItemAtPath:logPath error:&error]) {
        _logView.text = nil;
        BOOL res = [fileMgr createFileAtPath:logPath contents:nil attributes:nil];
        if (res) {
            [[URLogWrapper sharedObject] logInfo:@"create log file"];
        }
    }
}

@end
