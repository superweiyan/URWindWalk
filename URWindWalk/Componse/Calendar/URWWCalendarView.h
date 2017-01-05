//
//  URWWCalendarView.h
//  URWindWalk
//
//  Created by weiyan on 24/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface URWWCalendarView : UIView

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithFrameWithDate:(CGRect)frame date:(NSDate *)date;

@end
