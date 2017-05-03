//
//  URLoginViewController.m
//  URWindWalk
//
//  Created by weiyan on 05/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWLoginViewController.h"
#import "URWWService.h"
#import "URWWLoginService.h"
#import "URNotification.h"
#import "URImageMacro.h"

@interface URWWLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)  UIImageView      *carouselBgView;
@property (nonatomic, strong)  UITextField      *nickName;
@property (nonatomic, strong)  UITextField      *password;
@property (nonatomic, strong)  UIButton         *loginBtn;
@property (nonatomic, strong)  UIButton         *rigisterBtn;
@property (nonatomic, strong)  UIButton         *forgetPasswordBtn;

@property (nonatomic, strong)  UILabel          *serviceLabel;

@end

@implementation URWWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    [self initNotification];
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
//    self.carouselBgView.image = [UIImage imageNamed:@"IMG_4050.png"];
    
    NSString *path = LocalresourePath(@"loginbg.jpg");
    UIImage  *image = GetImageForPath(path);
    self.carouselBgView.image = image;
    [self.view addSubview:self.carouselBgView];
    
    [self addBlur:[UIScreen mainScreen].bounds];
    
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
    [self.loginBtn addTarget:self action:@selector(onloginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.loginBtn];
    
    self.serviceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.serviceLabel.text = @"我已阅读并同意服务条款";
    self.serviceLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:self.serviceLabel];
}

- (void)initNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onLoginResultNotification:)
                                                 name:URLoginResultNotification
                                               object:nil];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGSize screenBound = [UIScreen mainScreen].bounds.size;
    
    self.nickName.frame = CGRectMake(20, 100, screenBound.width - 40, 20);
    
    self.password.frame = CGRectMake(20, CGRectGetMaxY(self.nickName.frame) + 30, screenBound.width - 40, 20);
    
    self.loginBtn.frame = CGRectMake(20, CGRectGetMaxY(self.password.frame) + 30, screenBound.width - 40, 20);
    
    self.forgetPasswordBtn.frame = CGRectMake(20, CGRectGetMaxY(self.loginBtn.frame) + 30, screenBound.width / 2 - 20, 20);
    
    self.rigisterBtn.frame = CGRectMake(screenBound.width / 2, CGRectGetMaxY(self.loginBtn.frame) + 30, screenBound.width / 2 - 20, 20);
    
    self.serviceLabel.frame = CGRectMake(screenBound.width / 2 - 60, screenBound.height - 30, 140, 10);
}

#pragma mark - action

- (IBAction)onloginClick:(id)sender
{
    if( self.nickName.text.length == 0 || self.password.text.length == 0) {
    }
    else {
        
        [[URWWService sharedObject].loginService login:self.nickName.text password:self.password.text timeout:^{
            
        }];
    }
}

#pragma mark - util

- (UIImage *)converBlurredImage:(UIImage *)image
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *sourceImage = [CIImage imageWithCGImage:image.CGImage];
    NSString *clampFilterName = @"CIGaussianBlur";
    CIFilter *clamp = [CIFilter filterWithName:clampFilterName];
    [clamp setValue:sourceImage forKey:kCIInputImageKey];
    [clamp setValue:[NSNumber numberWithFloat:30.0]
             forKey:@"inputRadius"];
    CIImage *result = [clamp valueForKey:kCIOutputImageKey];
    CGImageRef outImage = [context createCGImage: result fromRect:[result extent]];
    return [UIImage imageWithCGImage:outImage];
}

- (void)addBlur:(CGRect)rect
{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = rect;
    [self.view addSubview:effectview];
}

#pragma mark - notification

- (void)onLoginResultNotification:(NSNotification *)notification
{
    
}

@end
