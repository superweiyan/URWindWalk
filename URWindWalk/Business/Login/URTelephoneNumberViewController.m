//
//  URTelephoneNumberViewController.m
//  URWindWalk
//
//  Created by weiyan on 05/05/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URTelephoneNumberViewController.h"
#import "URLayoutViewMacro.h"
#import "URButton.h"
#import "URTextField.h"
#import "URActionMacro.h"
#import "URWWService.h"
#import "URWWLoginService.h"

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
    ADD_VIEW(self.telephoneNumberLabel, URTextField);
    ADD_VIEW(self.securityCodeButton, URButton);
    ADD_VIEW(self.securityCodeLabel, URTextField);
    ADD_VIEW(self.registerButton, URButton);
    
    self.securityCodeLabel.placeholder = @"输入验证码";
    self.telephoneNumberLabel.placeholder = @"输入手机号码";
    [self.securityCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    ADD_ACTION(self.securityCodeButton, @selector(onClicked));
    ADD_ACTION(self.registerButton, @selector(onRegisterClicked:));
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.telephoneNumberLabel.frame = CGRectMake(20, 100, VIEW_WIDTH - kSecurityCodeButtonWidth - 40 - 10, 45);
    self.securityCodeButton.frame = CGRectMake(CGRectGetMaxX(self.telephoneNumberLabel.frame) + 10, 100, kSecurityCodeButtonWidth, 45);
    self.securityCodeLabel.frame = CGRectMake(20, CGRectGetMaxY(self.telephoneNumberLabel.frame) + 10, VIEW_WIDTH - 40, 45);
    self.registerButton.frame = CGRectMake(20, CGRectGetMaxY(self.securityCodeLabel.frame) + 10, VIEW_WIDTH - 40, 40);
}

#pragma mark - action

- (void)onClicked
{
    
}

- (IBAction)onRegisterClicked:(id)sender
{
    NSString *telephone = self.telephoneNumberLabel.text;
    NSString *secureCode = self.securityCodeLabel.text;
    [[URWWService sharedObject].loginService registerAccount:telephone :secureCode];
}


@end
