//
//  DateHelper.m
//  Habit
//
//  Created by JZQ on 2018/6/19.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper
+(NSInteger)getDay:(NSDate*)date{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSInteger day=[calendar component:NSCalendarUnitDay fromDate:date];
    return day;
}
+(NSString *)getFormatterDate:(NSDate *)date{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString=[formatter stringFromDate:date];
    return dateString;
}
@end
