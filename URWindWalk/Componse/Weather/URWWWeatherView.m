//
//  URWWWeatherView.m
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWWeatherView.h"
#import "URWWWeatherSerivce.h"
#import "URWWLocation.h"

@interface URWWWeatherView()

@property (nonatomic, strong) UIImageView   * weatherImage;
@property (nonatomic, strong) UILabel       * tempationLabel;
@property (nonatomic, strong) UILabel       * locationLabel;

@end

@implementation URWWWeatherView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self loadData];
    }
    return self;
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
    self.tempationLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.tempationLabel];
    
    self.locationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.locationLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:self.locationLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.weatherImage.frame = self.bounds;
    self.tempationLabel.frame = CGRectMake(10, 70, 100, 30);
    self.locationLabel.frame = CGRectMake(100, 70, 100, 30);
}

- (void)loadData
{
    URWWLocationInfo *location = [URWWWeatherSerivce sharedObject].location;
    self.tempationLabel.text = [NSString stringWithFormat:@"海拔: %f", location.altitude];
    
    URWWWeatherInfo *weatherInfo = [URWWWeatherSerivce sharedObject].weatherInfo;
    self.locationLabel.text = weatherInfo.city;
}

@end
