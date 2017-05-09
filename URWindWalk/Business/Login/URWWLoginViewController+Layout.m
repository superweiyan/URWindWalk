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
    ADD_VIEW(self.carouselBgView, UIImageView);
    
    NSString *path = LocalresourePath(@"loginbg.jpg");
    UIImage  *image = GetImageForPath(path);
    self.carouselBgView.image = image;
    [self.view addSubview:self.carouselBgView];
    self.carouselBgView.userInteractionEnabled = YES;
    
    [self addBlur:[UIScreen mainScreen].bounds];
    
    ADD_VIEW(self.portailImage, UIImageView);
    
    ADD_VIEW_IN_VIEW(self.nickName, UITextField, self.view);
    self.nickName.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    self.nickName.placeholder = @"输入账号";
    self.nickName.textAlignment = NSTextAlignmentCenter;
    self.nickName.font = [UIFont systemFontOfSize:14];
    self.nickName.delegate = self;
    
    ADD_VIEW_IN_VIEW(self.password, UITextField, self.view);
    self.password.placeholder = @"输入密码";
    self.password.secureTextEntry = YES;
    self.password.font = [UIFont systemFontOfSize:14];
    self.password.textAlignment = NSTextAlignmentCenter;
    self.password.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    self.password.delegate = self;
    
    ADD_VIEW_IN_VIEW(self.forgetPasswordBtn, UIButton, self.view);
    [self.forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    self.forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    self.forgetPasswordBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    
    ADD_VIEW_IN_VIEW(self.registerBtn, UIButton, self.view);
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
//    self.registerBtn.contentVerticalAlignment = UIControlContentHorizontalAlignmentRight;
    self.registerBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    
    ADD_VIEW_IN_VIEW(self.loginBtn, UIButton, self.view);
    self.loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.loginBtn.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    
    ADD_VIEW_IN_VIEW(self.serviceLabel, UILabel, self.view);
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
    self.portailImage.backgroundColor = [UIColor redColor];
    
    CGFloat x = (screenBound.width - URViewWidth) / 2;
    CGFloat y = CGRectGetMaxY(self.portailImage.frame) + 15;
    
    self.nickName.frame = CGRectMake(x, y, URViewWidth, 30);
    self.password.frame = CGRectMake(x, CGRectGetMaxY(self.nickName.frame) + 20, URViewWidth, 30);

    self.forgetPasswordBtn.frame = CGRectMake(20, CGRectGetMaxY(self.password.frame) + 20, VIEW_WIDTH / 2 - 20, 30);
    self.registerBtn.frame = CGRectMake(VIEW_WIDTH / 2 + 20, CGRectGetMaxY(self.password.frame) + 20, VIEW_WIDTH / 2 - 20, 30);
    
    self.loginBtn.frame = CGRectMake(x, CGRectGetMaxY(self.forgetPasswordBtn.frame) + 20, URViewWidth, 30);
    self.serviceLabel.frame = CGRectMake(URViewWidth / 2 - 60, URViewWidth - 30, 140, 10);
}

- (void)addBlur:(CGRect)rect
{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.userInteractionEnabled = YES;
    effectview.frame = rect;
    [self.view addSubview:effectview];
}

@end
