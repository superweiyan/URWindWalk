//
//  TPWeatherWrapper.m
//  URWindWalk
//
//  Created by weiyan on 30/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "TPWeatherWrapper.h"
#import "URAFNetWorkingWrapper.h"
#import "URHttpUrlDefine.h"

@implementation TPWeatherWrapper

- (void)queryWeather:(NSString *)location
{
    NSString *url = [NSString stringWithFormat:URQueryThinkPageWeatherUrl, location];
    
    [URAFNetWorkingWrapper requetURLWithParamForGet:url param:nil callback:^(BOOL result, id responseObject) {
        if (result) {
            [self paserWeatherData:responseObject];
        }
    }];
}


- (void)paserWeatherData:(NSDictionary *)weatherInfo
{
    if(![NSJSONSerialization isValidJSONObject:weatherInfo]) {
        return;
    }
    
    NSArray *resultArray = [weatherInfo objectForKey:@"results"];
    if (resultArray.count == 0) {
        return;
    }
    
    NSDictionary *info = [resultArray objectAtIndex:0];
    
    if (!info) {
        return ;
    }
    
    NSDictionary *now = [info objectForKey:@"now"];
    if (!now) {
        return;
    }
    
    URWWWeatherInfo *newWeatherInfo = [URWWWeatherInfo fromDictionary:now];
    
    if (self.weatherInfoBlock) {
        self.weatherInfoBlock(newWeatherInfo);
    }
}

@end
