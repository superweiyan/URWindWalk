//
//  NSDateUtil.m
//  URWindWalk
//
//  Created by weiyan on 14/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "NSDateUtil.h"

#define ChineseMonths @[@"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",@"九月", @"十月", @"冬月", @"腊月"]
#define ChineseFestival @[@"除夕",@"春节",@"中秋",@"五一",@"国庆",@"儿童",@"圣诞",@"七夕",@"端午"]
#define ChineseDays @[@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",@"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十", @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"]
#define ChineseWeatherFestival @[@"立春",@"雨水",@"惊蛰",@"春分",@"清明",@"谷雨",@"立夏",@"小满",@"忙种",@"夏至",@"小暑",@"大暑",@"立秋",@"处暑",@"寒露",@"霜降",@"白露",@"秋分",@"立冬",@"小雪",@"大雪",@"冬至",@"小寒",@"大寒"]

@implementation NSDateUtil

- (NSString *)getDateString:(NSDate *)date
{
//    NSCalendar *cal = [NSCalendar currentCalendar];
//    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
//    NSDateComponents *dd = [cal components:unitFlags fromDate:date];
//    
//    NSInteger y = [dd year];
//    NSInteger m = [dd month];
//    NSInteger d = [dd day];
//
//    return [NSString stringWithFormat:@"%ld%ld%ld",y , m, (long)d];
    
    
//    int hour = [dd hour];
//    int min = [dd minute];
//    int sec = [dd second];
    
    return [self  getDateString:date style:@"yyyy-MM-dd"];
}

- (NSString *)getDateString:(NSDate *)date style:(NSString *)style
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:style];
    return  [dateFormat stringFromDate:date];
}

- (NSUInteger)getTotalDaysInMonth:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange days = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return days.length;
}

+ (NSUInteger)getDayInMonth:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitDay ;
    NSDateComponents *dd = [cal components:unitFlags fromDate:date];
    return [dd day];
}

- (NSUInteger)getMonthInYear:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitMonth ;
    NSDateComponents *dd = [cal components:unitFlags fromDate:date];
    return [dd month];
}

- (NSString *)chineseCalendarOfDate:(NSDate *)date
{
    NSCalendar *chineseCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *components = [chineseCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    //NSString *dayDate;
    NSCalendar *normalDate = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *Datecomponents = [normalDate components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    NSString *_day;
    
    if (components.day == 1 ) {
        _day = ChineseMonths[components.month - 1];
        
    } else {
        
        _day = ChineseDays[components.day - 1];
    }
    //农历节日
    
    if (components.day == 1 && components.month == 1) {
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[1]];  //春节
    } if(components.month == 8 && components.day == 15){
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[2]]; //中秋
    }else if(components.day == 1 && components.month == 1){
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[0]];//除夕
    }else if(components.month == 7 && components.day == 7){
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[7]]; //七夕
    }else if(components.month == 5 && components.day == 5){
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[8]]; //端午
    }
    //阳历节日
    if (Datecomponents.month == 6 && Datecomponents.day == 1) {       //儿童节
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[5]];
    }else if(Datecomponents.month == 10 && Datecomponents.day == 1){  //国庆节
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[4]];
    }else if(Datecomponents.month == 5 && Datecomponents.day == 1){   //劳动节
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[3]];
    }else if(Datecomponents.month == 12 && Datecomponents.day == 25){ //圣诞节
        _day = [NSString stringWithFormat:@"%@",ChineseFestival[6]];
    }
    else if ([self isNewYearEve:date]) {
        return @"除夕";
    }
    
    return _day;
}

+ (NSUInteger)getWeekDayWithDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    return [comps weekday] - 1;
}

+ (NSUInteger)getFirstDayOfMonth:(NSDate *)date
{
    NSUInteger day = [self getDayInMonth:date];
    NSUInteger week = [self getWeekDayWithDate:date];

    NSUInteger offset = day % 7;
    
    NSUInteger offsetDay = (offset - week) > 0 ? (offset - week) % 7 : week - offset;
   
    return offsetDay;
}

#pragma mark - private

- (BOOL)isNewYearEve:(NSDate *)date
{
    //    //除夕 另外提出放在所有节日的末尾执行，除夕是在春节前一天，即把components当天时间前移一天，放在所有节日末尾，避免其他节日全部前移一天
    NSTimeInterval timeInterval_day = 60 * 60 * 24;
    NSDate *nextDay_date = [NSDate dateWithTimeInterval:timeInterval_day sinceDate:date];
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay;
    NSDateComponents *components = [localeCalendar components:unitFlags fromDate:nextDay_date];
    if ( 1 == components.month && 1 == components.day ) {
        return @"除夕";
    }
    return nil;
}



@end
