//
//  URLocationManager.m
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URLocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import "URWWLocation.h"

NSString * URWWLocationAuthorizationStatusChangeNotification = @"URWWLocationAuthorizationStatusChangeNotification";
NSString * URWWLocationChangeNotification = @"URWWLocationChangeNotification";

@interface URLocationManager()<CLLocationManagerDelegate>
{
    CLLocationManager *_locManager;
}
@end

@implementation URLocationManager

- (id)init
{
    self = [super init];
    if (self) {
        [self initLocation];
    }
    return self;
}

- (void)initLocation
{
    _locManager = [[CLLocationManager alloc]init];
    _locManager.delegate = self;
    _locManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)startLocation
{
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [_locManager requestWhenInUseAuthorization];
        [_locManager startUpdatingLocation];
    }
    else if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse ||
       [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways ) {
     
        [_locManager startUpdatingLocation];
    }
}

- (void)stopLocation
{
    [_locManager stopUpdatingLocation];
}

#pragma mark - private

- (BOOL)canLocationService
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status != kCLAuthorizationStatusAuthorizedAlways ||
        status != kCLAuthorizationStatusAuthorizedWhenInUse) {
        return NO;
    }
    return YES;
}

#pragma mark - CLLocationManagerDelegate 

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    [[NSNotificationCenter defaultCenter] postNotificationName:URWWLocationAuthorizationStatusChangeNotification
                                                        object:nil];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    CLLocation *currentLocation = [locations lastObject];

    if (!self.location) {
        self.location = [[URWWLocation alloc] init];
    }
    
    self.location.longitude = currentLocation.coordinate.longitude;
    self.location.latitude = currentLocation.coordinate.latitude;
    self.location.altitude = currentLocation.altitude;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:URWWLocationChangeNotification object:nil];
}

@end
