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
#import "URWWLoginViewController+Layout.h"
#import "URImageMacro.h"
#import "URActionMacro.h"

@interface URWWLoginViewController ()<UITextFieldDelegate>

@end

@implementation URWWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    self.nickName.delegate = self;
    self.password.delegate = self;
    [self addAction];
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

- (void)addAction
{
    ADD_ACTION(self.loginBtn, @selector(onloginClick:));
}

- (void)initNotification
{
    ADD_NOTIFY(URLoginResultNotification, @selector(onLoginResultNotification:));
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self layoutSubView];
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

#pragma mark - notification

- (void)onLoginResultNotification:(NSNotification *)notification
{
    
}

#pragma mark - delegaate 

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@" +++++++ ");
}

@end
