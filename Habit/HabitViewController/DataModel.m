//
//  DataModel.m
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel


- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.habitName forKey:@"habitName"];
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:self.seletedColor forKey:@"seletedColor"];
    [aCoder encodeInteger:self.hasInsistDays forKey:@"hasInsistDays"];
    [aCoder encodeBool:self.isChecked forKey:@"isChecked"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init] ) {
        self.habitName=[aDecoder decodeObjectForKey:@"habitName"];
        self.createTime=[aDecoder decodeObjectForKey:@"createTime"];
        self.seletedColor=[aDecoder decodeObjectForKey:@"seletedColor"];
        self.hasInsistDays=[aDecoder decodeIntegerForKey:@"hasInsistDays"];
        self.isChecked=[aDecoder decodeBoolForKey:@"isChecked"];
    }
    return self;
}
@end
