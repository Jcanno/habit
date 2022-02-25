//
//  DataModel.h
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DataModel : NSObject<NSCoding>


@property(strong)NSString* habitName;
@property(assign)NSInteger hasInsistDays;
@property(strong)NSDate* createTime;
@property(strong)UIColor* seletedColor;
@property(assign)BOOL isChecked;
@end
