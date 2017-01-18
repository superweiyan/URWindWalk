//
//  URLoginViewController.m
//  URWindWalk
//
//  Created by weiyan on 05/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWLoginViewController.h"

@interface URWWLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)  UIImageView      *carouselBgView;
@property (nonatomic, strong)  UITextField      *nickName;
@property (nonatomic, strong)  UITextField      *password;
@property (nonatomic, strong)  UIButton         *loginBtn;
@property (nonatomic, strong)  UIButton         *rigisterBtn;
@property (nonatomic, strong)  UIButton         *forgetPasswordBtn;

@end

@implementation URWWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
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

- (void)initViews
{
    self.carouselBgView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.carouselBgView];
    
    self.nickName = [[UITextField alloc] initWithFrame:CGRectZero];
    self.nickName.placeholder = @"输入账号";
    self.nickName.delegate = self;
    [self.view addSubview:self.nickName];
    
    self.password = [[UITextField alloc] initWithFrame:CGRectZero];
    self.password.placeholder = @"输入密码";
    self.password.secureTextEntry = YES;
    self.password.delegate = self;
    [self.view addSubview:self.password];
    
    self.forgetPasswordBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.forgetPasswordBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.forgetPasswordBtn addTarget:self action:@selector(onloginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.forgetPasswordBtn];
    
    self.rigisterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.rigisterBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:self.rigisterBtn];

    self.loginBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.loginBtn];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.nickName.frame = CGRectMake(100, 200, 100, 20);
    self.password.frame = CGRectMake(100, 400, 100, 20);
    
    self.loginBtn.frame = CGRectMake(100, 500, 50, 20);
    self.password.frame = CGRectMake(100, 500, 150, 20);
    self.forgetPasswordBtn.frame = CGRectMake(100, 600, 150, 20);
}

#pragma mark - action

- (IBAction)onloginClick:(id)sender
{
    
}
@end
