//
//  AddHabitViewController.h
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
@protocol AddHabitDelegate

-(void)commitHabitData:(DataModel*)habit;


@end



@interface AddHabitViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationBar *addHabitNavBar;
@property (weak, nonatomic) IBOutlet UITextField *inputHabitText;
@property(strong)NSMutableArray* colorArray;
@property(weak)id<AddHabitDelegate> delegate;
@end
