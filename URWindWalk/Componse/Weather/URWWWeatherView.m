//
//  URWWWeatherView.m
//  URWindWalk
//
//  Created by weiyan on 20/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URWWWeatherView.h"

#import "URMapWrapper.h"

@interface URWWWeatherView()

@property (nonatomic, strong) UIImageView   * weatherImage;

@end

@implementation URWWWeatherView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.weatherImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.weatherImage];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.weatherImage.frame = self.bounds;
}

- (void)queryWeather
{
    [[URMapWrapper sharedObject] queryWeather];
}

@end
