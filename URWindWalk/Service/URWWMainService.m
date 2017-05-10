//
//  URWWMainService.m
//  URWindWalk
//
//  Created by weiyan on 31/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "URWWMainService.h"
#import "URWWWeatherSerivce.h"
#import "URWWLocationService.h"
#import "URActionMacro.h"


@implementation URWWMainService

+ (URWWMainService *)sharedObject
{
    static dispatch_once_t __once;              \
    static URWWMainService * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URWWMainService alloc] init];   \
    });                                         \
    return __instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initNotification];
    }
    return self;
}

- (void)initNotification
{
    ADD_NOTIFY(@"URShowLoginNotification", @selector(showMainView));
}

- (void)pushViewController:(UIViewController *)viewController
{
    [[self getNavigationController] pushViewController:viewController animated:YES];
}

- (UINavigationController *)getNavigationController
{
    return (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
}

- (void)showLoginView
{
    [[self getNavigationController] popViewControllerAnimated:NO];
    UIViewController *viewController = [[NSClassFromString(@"URWWLoginViewController") alloc] init];
    [self switchRootView:viewController];
}

- (void)showMainView
{
    [[self getNavigationController] popViewControllerAnimated:NO];
    UIViewController *viewController = [[NSClassFromString(@"URWWLoginViewController") alloc] init];
    [self switchRootView:viewController];
}

#pragma mark - notification


#pragma mark - utils

- (void)switchRootView:(UIViewController *)viewController
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = navigationController;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
}

@end
