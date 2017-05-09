//
//  URForgetPasswordViewController.h
//  URWindWalk
//
//  Created by linweiyan on 2017/5/9.
//  Copyright © 2017年 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URControlType.h"

@interface URForgetPasswordViewController : UIViewController

@property (nonatomic, strong) URTextField   *phoneText;
@property (nonatomic, strong) URTextField   *secureCodeText;
@property (nonatomic, strong) URTextField   *passwordText;
@property (nonatomic, strong) URTextField   *confirmPasswordText;

@property (nonatomic, strong) URButton      *secureCodeButton;
@property (nonatomic, strong) URButton      *loginButton;

@end
