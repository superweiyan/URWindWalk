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
#import "URActionMacro.h"

@interface URWWLoginService()<URLoginCoreDelegate>
{
    URLoginCore  *_loginCore;
}
@end

@implementation URWWLoginService

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        [self initNotification];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initData
{
    _loginCore = [[URLoginCore alloc] init];
    _loginCore.loginDelegate = self;
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
    return NO;
    
    if (YES) {
        POST_NOTIFY(URShowLoginNotification);
    }
    else {
        
    }
    
    return YES;
}

- (void)registerAccount:(NSString *)telephoneName :(NSString *)secureCode
{
    POST_NOTIFY(URRegisterNotification);
}

#pragma mark - notification

- (void)onLoginResultNotification:(NSNotification *)notification
{
    
}

#pragma mark - URLoginCoreDelegate

- (void)onLoginRes:(NSUInteger)resCode
{
    [[NSNotificationCenter defaultCenter] postNotificationName:URLoginResultNotification
                                                        object:nil
                                                      userInfo:@{URLoginResultKey:@(resCode)}];
}

@end
