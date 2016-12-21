//
//  URMapWrapper.m
//  URWindWalk
//
//  Created by weiyan on 12/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URMapWrapper.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

NSString * URWeatherSearchCityNameNotification = @"URWeatherSearchCityNameNotification";

@interface URMapWrapper()<AMapSearchDelegate>
{
    AMapSearchAPI   *_amapSearchAPI;
    AMapSearchAPI   *_geosearch;
}
@end

@implementation URMapWrapper

+ (id)sharedObject
{
    static dispatch_once_t __once;              \
    static URMapWrapper * __instance = nil;         \
    dispatch_once(&__once, ^{                   \
        __instance = [[URMapWrapper alloc] init];   \
    });                                         \
    return __instance;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [AMapServices sharedServices].apiKey = @"204b3dfcbc0423bd06af7915e3b9411f";
        [[AMapServices sharedServices] setEnableHTTPS:YES];
        
        _amapSearchAPI = [[AMapSearchAPI alloc] init];
        _amapSearchAPI.delegate = self;
    }
    return self;
}

- (void)queryWeather:(NSString *)cityName
{
    AMapWeatherSearchRequest *request = [[AMapWeatherSearchRequest alloc] init];
    request.city = cityName;
    request.type = AMapWeatherTypeLive;
    [_amapSearchAPI AMapWeatherSearch:request];
}

- (void)queryGeocode:(float)latitude longitude:(float)longitude
{
    [AMapServices sharedServices].apiKey = @"204b3dfcbc0423bd06af7915e3b9411f";
    _geosearch = [[AMapSearchAPI alloc] init];
    _geosearch.delegate = self;
    
    AMapReGeocodeSearchRequest *request = [[AMapReGeocodeSearchRequest alloc] init];
    request.location = [AMapGeoPoint locationWithLatitude:latitude longitude:longitude];
    [_geosearch AMapReGoecodeSearch:request];
}

#pragma mark - AMapSearchDelegate

- (void)onWeatherSearchDone:(AMapWeatherSearchRequest *)request response:(AMapWeatherSearchResponse *)response
{
    NSLog(@"+++ %@", request.city);
    for (int i = 0; i < response.lives.count; i++) {
        AMapLocalWeatherLive *weatherLive = [response.lives objectAtIndex:i];
        NSLog(@"++weather %@", weatherLive.temperature);
    }
    
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
}


- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request
                     response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode != nil) {
        AMapReGeocode *regeocode = response.regeocode;
        AMapAddressComponent *addressComponent = regeocode.addressComponent;
        
        NSLog(@"%@", addressComponent.city);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:URWeatherSearchCityNameNotification
                                                            object:nil];
    }
}

@end
