//
//  URLocationManager.m
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface URLocationManager()<CLLocationManagerDelegate>
{
    CLLocationManager   *_locManager;
    CLGeocoder          *_geocoder;
    CLLocation          *_currentLocation;
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

- (void)dealloc
{
    [_locManager stopUpdatingLocation];
}

- (void)initLocation
{
    _locManager = [[CLLocationManager alloc]init];
    _locManager.delegate = self;
    _locManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)getCityName:(CLLocation *)location callback:(request_cityname_block)callback
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    
    [_geocoder reverseGeocodeLocation:location
                    completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                        
        for (CLPlacemark *placeMark in placemarks) {
            if(placeMark.locality > 0) {
                if (callback) {
                    callback(placeMark.locality);
                }
                break;
            }
        }
    }];
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

- (BOOL)canLocationService
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if(![CLLocationManager locationServicesEnabled]) {
        return NO;
    }
    
    if (status != kCLAuthorizationStatusAuthorizedAlways ||
        status != kCLAuthorizationStatusAuthorizedWhenInUse) {
        return NO;
    }
    return YES;
}

#pragma mark - CLLocationManagerDelegate 

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    _currentLocation = [locations lastObject];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSString *errorInfo = @"获取位置失败";
    if (error.code == kCLErrorNetwork) {
        errorInfo = @"获取位置失败, 当前网络错误";
    }
    if (error.code == kCLErrorDenied) {
        errorInfo = @"获取位置失败, 访问被拒绝";
    }
    else if (error.code == kCLErrorLocationUnknown ) {
        errorInfo = @"获取位置失败, 未知位置";
    }
    
    if(self.requestLocationErrorBlock) {
        self.requestLocationErrorBlock(errorInfo);
    }
}

@end
