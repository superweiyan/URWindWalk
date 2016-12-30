//
//  URWWWeatherView.m
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWWeatherView.h"
#import "URWWWeatherSerivce.h"
#import "URWWObjectInfo.h"
#import "URWWLocationService.h"

@interface URWWWeatherView()

@property (nonatomic, strong) UIImageView   * weatherImage;
@property (nonatomic, strong) UILabel       * tempationLabel;
@property (nonatomic, strong) UILabel       * locationLabel;
@property (nonatomic, strong) UILabel       * weatherInfoLabel;

@end

@implementation URWWWeatherView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self loadData];
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
    self.weatherImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"weather-cloudy" ofType:@"jpg"];
    self.weatherImage.image = [UIImage imageWithContentsOfFile:path];
    self.weatherImage.contentMode = UIViewContentModeScaleAspectFill;
    self.weatherImage.clipsToBounds = YES;
    [self addSubview:self.weatherImage];
    
    self.tempationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.tempationLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.tempationLabel];
    
    self.locationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.locationLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.locationLabel];
    
    self.weatherInfoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.weatherInfoLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.weatherInfoLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.weatherImage.frame = self.bounds;
    self.tempationLabel.frame = CGRectMake(10, 70, 60, 20);
    self.locationLabel.frame = CGRectMake(10, 95, 60, 20);
    self.weatherInfoLabel.frame = CGRectMake(self.bounds.size.width - 10 - 100, 70, 100, 20);
}

- (void)loadData
{
    NSString *cityName = [[URWWLocationService sharedObject] getCityName];
    if (cityName) {
        self.locationLabel.text = [NSString stringWithFormat:@"城市: %@", cityName];
    }
}

- (void)initNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onLocationCityNameChangeNotification:)
                                                 name:URLocationCityNameChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onLocationChangeNotification:)
                                                 name:URLocationChangeNotification
                                               object:nil];
    

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onWeatherInfoNotification:)
                                                 name:URWeatherInfoNotification
                                               object:nil];
}

#pragma mark - notification

- (void)onLocationCityNameChangeNotification:(NSNotification *)notification
{
    NSString *cityName = [[URWWLocationService sharedObject] getCityName];
    self.locationLabel.text = [NSString stringWithFormat:@"城市: %@", cityName];
    
    URWWLocationInfo *locationInfo = [URWWLocationService sharedObject].locationInfo;
    NSString *location = [NSString stringWithFormat:@"%f:%f", locationInfo.latitude, locationInfo.longitude];
    [[URWWWeatherSerivce sharedObject] queryWeather:location];
}

- (void)onLocationChangeNotification:(NSNotification *)notification
{
    [[URWWLocationService sharedObject] queryCityName];    
}

- (void)onWeatherInfoNotification:(NSNotification *)notification
{
    URWWWeatherInfo *weatherInfo = [URWWWeatherSerivce sharedObject].weatherInfo;
    self.tempationLabel.text = [NSString stringWithFormat:@"气温: %@", weatherInfo.temperature];
    self.weatherInfoLabel.text = [NSString stringWithFormat:@"天气: %@", weatherInfo.weather];
}

@end
