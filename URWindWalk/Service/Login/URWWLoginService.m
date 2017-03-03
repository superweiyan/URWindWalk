//
//  URWWLoginService.m
//  URWindWalk
//
//  Created by weiyan on 16/01/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import "URWWLoginService.h"
#import "URNotification.h"
#import "URLoginCore.h"

NSString * URShowLoginNotification = @"URShowLoginNotification";

@interface URWWLoginService()
{
    URLoginCore  *_loginCore;
}
@end

@implementation URWWLoginService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _loginCore = [[URLoginCore alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)login:(NSString *)passport password:(NSString *)password timeout:(timeout_block)callback
{
    if (passport.length == 0 || password.length == 0) {
        return NO;
    }
    
    [_loginCore login:passport password:password timeout:^{
        if (callback) {
            callback();
        }
    }];
    
    return YES;
}

- (void)logout
{
    
}

- (void)initNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onLoginResultNotification:)
                                                 name:URLoginResultNotification
                                               object:nil];
}

- (BOOL)autoLogin
{
    if (YES) {
        [[NSNotificationCenter defaultCenter] postNotificationName:URShowLoginNotification object:nil];
    }
    else {
        
    }
    
    return YES;
}

#pragma mark - notification

- (void)onLoginResultNotification:(NSNotification *)notification
{
    
}

@end
