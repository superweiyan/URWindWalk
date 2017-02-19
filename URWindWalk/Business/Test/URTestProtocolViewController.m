//
//  URTestProtocolViewController.m
//  URWindWalk
//
//  Created by weiyan on 25/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URTestProtocolViewController.h"
//#import "URSocketService.h"
#import "URWWLoginService.h"

@interface URTestProtocolViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField  *textfield;

@end

@implementation URTestProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    NSString *content = textField.text;
//    for (int i = 0; i < 1000; i++) {
        BOOL isSuccess = [[URWWLoginService sharedObject] login:@"linweiyan" password:@"123456" timeout:^{
            NSLog(@"%s timeout", __func__);
        }];

        if (!isSuccess) {
            NSLog(@"network is broken");
        }
//    }
    
    return YES;
}

@end
