//
//  URSummaryViewController+URLayout.m
//  URWindWalk
//
//  Created by weiyan on 21/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URSummaryViewController+URLayout.h"

@implementation URSummaryViewController(URLayout)

- (void)layoutSubViews
{
    self.tableView.frame = CGRectMake(0,
                                      0,
                                      self.view.bounds.size.width,
                                      self.view.bounds.size.height);
    
    self.tableView.contentInset = UIEdgeInsetsMake(URWeatherShowHeight,
                                                   0,
                                                   0,
                                                   0);
    
    self.weatherView.frame = CGRectMake(0,
                                         -URWeatherShowHeight,
                                         self.view.bounds.size.width,
                                         URWeatherShowHeight);
}

@end
