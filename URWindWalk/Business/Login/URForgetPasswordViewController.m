//
//  URForgetPasswordViewController.m
//  URWindWalk
//
//  Created by linweiyan on 2017/5/9.
//  Copyright © 2017年 weiyan. All rights reserved.
//

#import "URForgetPasswordViewController.h"
#import "URLayoutViewMacro.h"

@interface URForgetPasswordViewController ()

@end

@implementation URForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubview];
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

- (void)setupSubview
{
    ADD_VIEW(self.phoneText, URTextField);
    ADD_VIEW(self.secureCodeText, URTextField);
    ADD_VIEW(self.passwordText, URTextField);
    ADD_VIEW(self.confirmPasswordText, URTextField);
    ADD_VIEW(self.loginButton, URButton);
    ADD_VIEW(self.secureCodeButton, URButton);
    
    self.phoneText.placeholder = @"输入手机号码";
    self.secureCodeText.placeholder = @"输入验证码";
    self.passwordText.placeholder = @"新密码";
    self.confirmPasswordText.placeholder = @"再次输入密码";
    [self.secureCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (void)layoutSubview
{
    self.phoneText.frame = CGRectMake(20, 100, VIEW_WIDTH - 40, 30);
    self.secureCodeText.frame = CGRectMake(20, CGRectGetMaxY(self.phoneText.frame) + 10 , VIEW_WIDTH - 40 - 10 - 100, 30);
    self.secureCodeButton.frame = CGRectMake(CGRectGetMaxX(self.secureCodeText.frame) + 10, CGRectGetMaxY(self.phoneText.frame) + 10, 100, 30);
    self.passwordText.frame = CGRectMake(20, CGRectGetMaxY(self.secureCodeText.frame) + 10, VIEW_WIDTH - 40, 30);
    self.confirmPasswordText.frame = CGRectMake(20, CGRectGetMaxY(self.passwordText.frame) + 10, VIEW_WIDTH - 40, 30);
    self.loginButton.frame = CGRectMake(20, CGRectGetMaxY(self.confirmPasswordText.frame) + 10, VIEW_WIDTH - 40, 30);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self layoutSubview];
}

@end
