//
//  Habit+CoreDataProperties.m
//  Habit
//
//  Created by JZQ on 2018/6/16.
//  Copyright © 2018年 Jacano King. All rights reserved.
//
//

#import "Habit+CoreDataProperties.h"

@implementation Habit (CoreDataProperties)

+ (NSFetchRequest<Habit *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Habit"];
}

@dynamic habitName;
@dynamic hasInsistDays;
@dynamic createTime;

@end
