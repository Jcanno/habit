//
//  DateHelper.h
//  Habit
//
//  Created by JZQ on 2018/6/19.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject


+(NSInteger)getDay:(NSDate*)date;
+(NSString*)getFormatterDate:(NSDate*)date;

@end
