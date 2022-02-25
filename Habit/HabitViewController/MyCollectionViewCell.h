//
//  MyCollectionViewCell.h
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
@interface MyCollectionViewCell : UICollectionViewCell


@property(strong,nonatomic)UILabel *habitNameLabel;
@property(strong,nonatomic)UILabel *hasInsistDaysLabel;
@property(strong,nonatomic)NSDate *createTime;
@property(strong,nonatomic)UIButton *checkInHabit;
@property(strong,nonatomic)UIButton *deleteHabitButton;
@property(assign,nonatomic)BOOL isChecked;




-(void)setUpData:(DataModel*)dataModel;

@end
