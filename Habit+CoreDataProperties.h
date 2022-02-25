//
//  Habit+CoreDataProperties.h
//  Habit
//
//  Created by JZQ on 2018/6/16.
//  Copyright © 2018年 Jacano King. All rights reserved.
//
//

#import "Habit+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *habitName;
@property (nonatomic) int16_t hasInsistDays;
@property (nullable, nonatomic, copy) NSDate *createTime;

@end

NS_ASSUME_NONNULL_END
