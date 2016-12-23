//
//  URSummaryViewController.h
//  URWindWalk
//
//  Created by weiyan on 17/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URWWWeatherView.h"

extern float URWeatherShowHeight;

@interface URSummaryViewController : UIViewController

@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) URWWWeatherView       *weatherView;

@end
