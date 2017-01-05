//
//  NSDateUtil.h
//  URWindWalk
//
//  Created by weiyan on 14/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateUtil : NSObject



- (NSString *)getDateString:(NSDate *)date;

/**
 *  y 表示年
 *  M 表示月，只表示一个数字，如果表示10， 那么是MM
 *  d 表示日
 *  H 表示小时
 *  m 表示分钟
 *  s 表示秒
 */

+ (NSString *)getDateString:(NSDate *)date style:(NSString *)style;

+ (NSUInteger)getTotalDaysInMonth:(NSDate *)date;

+ (NSUInteger)getDayInMonth:(NSDate *)date;

+ (NSUInteger)getMonthInYear:(NSDate *)date;

+ (NSString *)chineseCalendarOfDate:(NSDate *)date;

+ (NSUInteger)getWeekDayWithDate:(NSDate *)date;

+ (NSUInteger)getFirstDayOfMonth:(NSDate *)date;

+ (NSString *)getChineseMonthInYear:(NSDate *)date;

@end
