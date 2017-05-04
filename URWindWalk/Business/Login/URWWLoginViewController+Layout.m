//
//  URWWLoginViewController+Layout.m
//  URWindWalk
//
//  Created by linweiyan on 2017/5/4.
//  Copyright © 2017年 weiyan. All rights reserved.
//

#import "URWWLoginViewController+Layout.h"
#import "URImageMacro.h"
#import "URLayoutViewMacro.h"

CGFloat URViewWidth = 300;

@implementation URWWLoginViewController(Layout)

- (void)initViews
{    
    AddView(self.carouselBgView, UIImageView);
    
    NSString *path = LocalresourePath(@"loginbg.jpg");
    UIImage  *image = GetImageForPath(path);
    self.carouselBgView.image = image;
    [self.view addSubview:self.carouselBgView];
    self.carouselBgView.userInteractionEnabled = YES;
    
    [self addBlur:[UIScreen mainScreen].bounds];
    
    AddView(self.loginView, UIView);
    self.loginView.userInteractionEnabled = YES;
    self.loginView.backgroundColor = URColor(255, 255, 255, 0.6);
    
    AddView(self.portailImage, UIImageView);
    
    AddViewInView(self.nickName, UITextField, self.loginView);
    self.nickName.backgroundColor = [UIColor redColor];
    self.nickName.placeholder = @"输入账号";
    self.nickName.textAlignment = NSTextAlignmentCenter;
    self.nickName.font = [UIFont systemFontOfSize:14];

    AddViewInView(self.password, UITextField, self.loginView);
    self.password.placeholder = @"输入密码";
    self.password.secureTextEntry = YES;
    self.password.font = [UIFont systemFontOfSize:14];
    self.password.textAlignment = NSTextAlignmentCenter;
    self.password.backgroundColor = [UIColor redColor];
    
    AddViewInView(self.forgetPasswordBtn, UIButton, self.loginView);
    [self.forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    self.forgetPasswordBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    
    AddViewInView(self.rigisterBtn, UIButton, self.loginView);
    [self.rigisterBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.rigisterBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    self.rigisterBtn.contentVerticalAlignment = UIControlContentHorizontalAlignmentRight;
    self.rigisterBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    AddViewInView(self.loginBtn, UIButton, self.loginView);
    self.loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.loginBtn.backgroundColor = [UIColor redColor];
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    
    AddViewInView(self.serviceLabel, UILabel, self.loginView);
    self.serviceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.serviceLabel.text = @"我已阅读并同意服务条款";
    self.serviceLabel.font = [UIFont systemFontOfSize:12.0];
}

- (void)layoutSubView
{
    CGSize screenBound = self.view.bounds.size;
    
    self.carouselBgView.frame = [UIScreen mainScreen].bounds;
    
    CGFloat portailX = ( VIEW_WIDTH - 80 ) / 2;
    self.portailImage.frame = CGRectMake(portailX, 90, 80, 80);
    
    CGFloat x = (screenBound.width - URViewWidth) / 2;
    CGFloat y = CGRectGetMaxY(self.portailImage.frame) + 15;
    
    self.nickName.frame = CGRectMake(x, y, URViewWidth, 20);
    self.password.frame = CGRectMake(x, CGRectGetMaxY(self.nickName.frame) + 20, URViewWidth, 20);

    self.forgetPasswordBtn.frame = CGRectMake(20, CGRectGetMaxY(self.password.frame) + 20, VIEW_WIDTH / 2 - 20, 20);
    self.rigisterBtn.frame = CGRectMake(VIEW_WIDTH / 2 + 20, CGRectGetMaxY(self.password.frame) + 20, VIEW_WIDTH / 2 - 20, 20);
    
    self.loginBtn.frame = CGRectMake(x, CGRectGetMaxY(self.forgetPasswordBtn.frame) + 20, URViewWidth, 20);
    self.serviceLabel.frame = CGRectMake(URViewWidth / 2 - 60, URViewWidth - 30, 140, 10);
}

- (void)addBlur:(CGRect)rect
{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = rect;
    [self.view addSubview:effectview];
}

@end
