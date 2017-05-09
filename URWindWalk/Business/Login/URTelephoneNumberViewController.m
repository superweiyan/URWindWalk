//
//  URTelephoneNumberViewController.m
//  URWindWalk
//
//  Created by weiyan on 05/05/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URTelephoneNumberViewController.h"
#import "URLayoutViewMacro.h"

CGFloat kSecurityCodeButtonWidth = 92;

@interface URTelephoneNumberViewController ()

@end

@implementation URTelephoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"验证手机号码";
    
    [self initSubView];
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

- (void)initSubView
{
    ADD_VIEW(self.telephoneNumberLabel, UITextField);
    ADD_VIEW(self.securityCodeButton, UIButton);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
//    self.telephoneNumberLabel.frame = CGRectMake(x, 100, VIEW_WIDTH - 100 - kSecurityCodeButtonWidth, 45);
//    self.securityCodeButton.frame = CGRectMake(x, 100, kSecurityCodeButtonWidth, 45);
    
}

@end
