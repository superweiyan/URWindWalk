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
    ADD_NOTIFY(@"URShowLoginNotification", @selector(showLoginView:));
}

- (void)pushViewController:(UIViewController *)viewController
{
    [[self getNavigationController] pushViewController:viewController animated:YES];
}

- (UINavigationController *)getNavigationController
{
    return (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
}

#pragma mark - notification

- (void)showLoginView:(NSNotification *)notification
{
//    UIViewController *controller = [[NSClassFromString(@"URWWLoginViewController") alloc] init];
//    [self pushViewController:controller];
}

@end
