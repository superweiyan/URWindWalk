//
//  URTelephoneNumberViewController.h
//  URWindWalk
//
//  Created by weiyan on 05/05/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URTelephoneNumberViewController : UIViewController

@property (nonatomic, strong) UITextField  *telephoneNumberLabel;
@property (nonatomic, strong) UITextField  *securityCodeLabel;

@property (nonatomic, strong) UIButton     *securityCodeButton;
@property (nonatomic, strong) UIButton     *registerButton;

@end
