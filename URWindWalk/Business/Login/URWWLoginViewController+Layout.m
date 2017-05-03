//
//  URWWLoginViewController+Layout.m
//  URWindWalk
//
//  Created by linweiyan on 2017/5/4.
//  Copyright © 2017年 weiyan. All rights reserved.
//

#import "URWWLoginViewController+Layout.h"
#import "URImageMacro.h"

@implementation URWWLoginViewController(Layout)

- (void)initViews
{
    self.carouselBgView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSString *path = LocalresourePath(@"loginbg.jpg");
    UIImage  *image = GetImageForPath(path);
    self.carouselBgView.image = image;
    [self.view addSubview:self.carouselBgView];
    
    [self addBlur:[UIScreen mainScreen].bounds];
    
    self.loginView = [[UIView alloc] initWithFrame:CGRectZero];
    self.loginView.backgroundColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:0.6];
    [self.view addSubview:self.loginView];
    
    self.nickName = [[UITextField alloc] initWithFrame:CGRectZero];
    self.nickName.backgroundColor = [UIColor redColor];
    self.nickName.placeholder = @"输入账号";
    self.nickName.textAlignment = NSTextAlignmentCenter;
    self.nickName.font = [UIFont systemFontOfSize:14];
    self.nickName.delegate = self;
    [self.view addSubview:self.nickName];
    
    self.password = [[UITextField alloc] initWithFrame:CGRectZero];
    self.password.placeholder = @"输入密码";
    self.password.secureTextEntry = YES;
    self.password.font = [UIFont systemFontOfSize:14];
    self.password.textAlignment = NSTextAlignmentCenter;
    self.password.delegate = self;
    self.password.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.password];
    
    self.forgetPasswordBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:self.forgetPasswordBtn];
    
    self.rigisterBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.rigisterBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.rigisterBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    self.rigisterBtn.contentVerticalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:self.rigisterBtn];
    
    self.loginBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.loginBtn.backgroundColor = [UIColor redColor];
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    
    [self.view addSubview:self.loginBtn];
    
    self.serviceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.serviceLabel.text = @"我已阅读并同意服务条款";
    self.serviceLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:self.serviceLabel];
}

- (void)layoutSubView
{
    CGSize screenBound = [UIScreen mainScreen].bounds.size;
    
//    self.loginView.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
    self.nickName.frame = CGRectMake(20, 100, screenBound.width - 40, 20);
    
    self.password.frame = CGRectMake(20, CGRectGetMaxY(self.nickName.frame) + 30, screenBound.width - 40, 20);
    
    self.loginBtn.frame = CGRectMake(20, CGRectGetMaxY(self.password.frame) + 30, screenBound.width - 40, 20);
    
    self.forgetPasswordBtn.frame = CGRectMake(20, CGRectGetMaxY(self.loginBtn.frame) + 30, screenBound.width / 2 - 20, 20);
    
    self.rigisterBtn.frame = CGRectMake(screenBound.width / 2, CGRectGetMaxY(self.loginBtn.frame) + 30, screenBound.width / 2 - 20, 20);
    
    self.serviceLabel.frame = CGRectMake(screenBound.width / 2 - 60, screenBound.height - 30, 140, 10);
}

- (void)addBlur:(CGRect)rect
{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = rect;
    [self.view addSubview:effectview];
}


@end
