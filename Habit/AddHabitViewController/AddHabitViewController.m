//
//  AddHabitViewController.m
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "AddHabitViewController.h"
#import "AddHabitCollectionViewCell.h"
#import "DataModel.h"
@interface AddHabitViewController (){
    DataModel* habitData;
}

@end

@implementation AddHabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    habitData=[[DataModel alloc]init];
    
    habitData.seletedColor=[UIColor yellowColor];
    _colorArray=[NSMutableArray arrayWithCapacity:5];
    UIColor* color1=[UIColor colorWithRed:(float)129/255 green:(float)255/255 blue:(float)54/255 alpha:1];
    [_colorArray addObject:color1];
    UIColor* color2=[UIColor colorWithRed:(float)255/255 green:(float)219/255 blue:(float)29/255 alpha:1];
    [_colorArray addObject:color2];
    UIColor* color3=[UIColor colorWithRed:(float)255/255 green:(float)142/255 blue:(float)40/255 alpha:1];
    [_colorArray addObject:color3];
    UIColor* color4=[UIColor colorWithRed:(float)112/255 green:(float)255/255 blue:(float)241/255 alpha:1];
    [_colorArray addObject:color4];
    UIColor* color5=[UIColor colorWithRed:(float)130/255 green:(float)207/255 blue:(float)255/255 alpha:1];
    [_colorArray addObject:color5];
    UIColor* color6=[UIColor colorWithRed:(float)255/255 green:(float)180/255 blue:(float)212/255 alpha:1];
    [_colorArray addObject:color6];
    UIColor* color7=[UIColor colorWithRed:(float)165/255 green:(float)164/255 blue:(float)255/255 alpha:1];
    [_colorArray addObject:color7];
    UIColor* color8=[UIColor colorWithRed:(float)255/255 green:(float)108/255 blue:(float)173/255 alpha:1];
    [_colorArray addObject:color8];
    UIColor* color9=[UIColor colorWithRed:(float)172/255 green:(float)107/255 blue:(float)255/255 alpha:1];
    [_colorArray addObject:color9];
    UIColor* color10=[UIColor colorWithRed:(float)255/255 green:(float)100/255 blue:(float)88/255 alpha:1];
    [_colorArray addObject:color10];
    UIColor* color11=[UIColor colorWithRed:(float)255/255 green:(float)174/255 blue:(float)153/255 alpha:1];
    [_colorArray addObject:color11];
    UIColor* color12=[UIColor colorWithRed:(float)199/255 green:(float)255/255 blue:(float)147/255 alpha:1];
    [_colorArray addObject:color12];
    // Do any additional setup after loading the view.
}


//设置navbar下面阴影线为白色
-(void)viewWillAppear:(BOOL)animated{
    self.addHabitNavBar.shadowImage=[UIImage new];
}



//提交已编辑的习惯数据
- (IBAction)commitAddHabit:(id)sender {
    
    habitData.habitName=self.inputHabitText.text;
    habitData.hasInsistDays=0;
    habitData.createTime=[NSDate date];
    habitData.isChecked=YES;
    [self.delegate commitHabitData:habitData];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


//取消或关闭添加习惯页面
- (IBAction)dimissAddHabitController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AddHabitCollectionViewCell* cell=(AddHabitCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"AddHabitCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor=self.colorArray[indexPath.row];
    
    return cell;
}


//设置选中cell边框
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AddHabitCollectionViewCell* cell=(AddHabitCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.layer.borderColor=[[UIColor blackColor]CGColor];
    cell.layer.borderWidth=2.0f;
    habitData.seletedColor=cell.backgroundColor;
}

//取消选中cell 取消边框
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    AddHabitCollectionViewCell* cell=(AddHabitCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.layer.borderColor=[[UIColor whiteColor]CGColor];
    cell.layer.borderWidth=0;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//点击空白处撤回编辑键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.inputHabitText resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
