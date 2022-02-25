//
//  MyCollectionViewCell.m
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "Masonry.h"
@implementation MyCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.habitNameLabel=[[UILabel alloc]init];
        [self.contentView addSubview:self.habitNameLabel];
        self.hasInsistDaysLabel=[[UILabel alloc]init];
        [self.contentView addSubview:self.hasInsistDaysLabel];
        self.checkInHabit=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:self.checkInHabit];
        self.deleteHabitButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:self.deleteHabitButton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.habitNameLabel.textAlignment=NSTextAlignmentCenter;
    self.hasInsistDaysLabel.textAlignment=NSTextAlignmentCenter;
    self.hasInsistDaysLabel.font=[UIFont systemFontOfSize:15];
    self.habitNameLabel.font=[UIFont systemFontOfSize:35];
    self.checkInHabit.titleLabel.font=[UIFont systemFontOfSize:18];
    [self.hasInsistDaysLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView).offset(self.contentView.frame.size.width*0.6);
//        make.height.mas_equalTo(self.contentView).offset(self.contentView.frame.size.height*0.2);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView.mas_top).offset(self.contentView.frame.size.height*0.3);
    }];
    
    [self.habitNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.contentView).offset(self.contentView.frame.size.width*0.8);
        //        make.height.mas_equalTo(self.contentView).offset(self.contentView.frame.size.height*0.2);
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView.mas_top).offset(self.contentView.frame.size.height*0.15);
    }];
    
    
    [self.checkInHabit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView.mas_top).offset(self.contentView.frame.size.height*0.8);
//        make.width.mas_equalTo(self.contentView).offset(self.contentView.frame.size.width*0.2);
        make.width.mas_equalTo(self.contentView).multipliedBy(0.3);
        make.height.mas_equalTo(self.contentView).multipliedBy(0.1);
    }];
    
    [self.deleteHabitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-5);
//        make.trailing.mas_equalTo(self.contentView).offset(20);
        make.top.mas_equalTo(self.contentView).offset(5);
        
    }];
    
    
    
    

    self.checkInHabit.layer.cornerRadius=10;
    self.checkInHabit.backgroundColor=[UIColor whiteColor];
    [self.deleteHabitButton setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];

    
}
-(void)setUpData:(DataModel*)dataModel{
    self.habitNameLabel.text=dataModel.habitName;
    self.hasInsistDaysLabel.text=[NSString stringWithFormat:@"已坚持%ld天",dataModel.hasInsistDays];
    self.createTime=dataModel.createTime;
    self.backgroundColor=dataModel.seletedColor;
    self.isChecked=dataModel.isChecked;
    
    
    
    
    
}




@end
