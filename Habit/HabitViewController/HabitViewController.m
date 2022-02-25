//
//  HabitViewController.m
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "HabitViewController.h"
#import "JZQLayout.h"
#import "MyCollectionViewCell.h"
#import "DataModel.h"
#import "AddHabitViewController.h"
#import "CreateSqlite.h"
#import "Habit+CoreDataClass.h"
#import "DateHelper.h"
@interface HabitViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,AddHabitDelegate>{
    CreateSqlite* creteSqlite;
    //保存当前日期的day
    
    NSUserDefaults *users;
    MyCollectionViewCell *cell;
    UILabel *title;
}

@end

@implementation HabitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化nsuserdefaults
    users=[NSUserDefaults standardUserDefaults];
    //初始化可变数组

    NSData *data=[users valueForKey:@"habit"];
    if (data==nil) {
        _habitData=[NSMutableArray arrayWithCapacity:5];
    }else{
        _habitData=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    title=[[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-100 , self.view.center.y-64-100, 200  , 200)];
    
    title.text=@"请添加习惯";

    title.font=[UIFont systemFontOfSize:35];
    title.textColor=[UIColor grayColor];
    title.textAlignment=NSTextAlignmentCenter;
    //创建coredata
//    creteSqlite=[[CreateSqlite alloc]init];

    //添加collectionview  设置自定义layout
    JZQLayout *layout = [[JZQLayout alloc] init];
    layout.itemSize = CGSizeMake(self.view.frame.size.width*0.6, self.view.frame.size.height*0.6);
    //layout的滑动方向
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    //collectionview的大小
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49);
    //collectionview第一个和最后一个的间隙
    CGFloat margin=(_collection.frame.size.width-layout.itemSize.width)/2;
    _collection = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    _collection.contentInset=UIEdgeInsetsMake(-40, margin, 0, margin);
    _collection.dataSource = self;
    _collection.showsHorizontalScrollIndicator=NO;
    _collection.showsVerticalScrollIndicator=NO;
    _collection.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:title];
    [self.view addSubview:self.collection];
    
    if (self.habitData.count==0) {
        self.collection.hidden=YES;


    }else{
        title.hidden=YES;
    }
    
    
    //加载nib文件  注册cell

    [self.collection registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    

}

//完成添加习惯代理方法
-(void)commitHabitData:(DataModel *)habit{
    
    [self.habitData addObject:habit];
    
    //添加数据到数据库
//    Habit *habitData=[NSEntityDescription insertNewObjectForEntityForName:@"Habit" inManagedObjectContext:creteSqlite.context];
//    habitData.habitName=habit.habitName;
//    habitData.hasInsistDays=habit.hasInsistDays;
//    habitData.createTime=habit.createTime;
////    [checkButtonArr addObject:@"0"];
//    if([creteSqlite.context save:nil]){
//        NSLog(@"添加成功");
//    }
    if (self.habitData.count==1) {
        self.collection.hidden=NO;
        title.hidden=YES;
    }
    //将数据源归档
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:_habitData];
    [users setObject:data forKey:@"habit"];
    //插入cell
    [self.collection insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:_habitData.count-1 inSection:0]] ];
    
}

//跳转设置代理
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //设置代理  回传值
    if ([segue.identifier isEqualToString:@"showAddHabit"]) {
        AddHabitViewController* add=segue.destinationViewController;
        add.delegate=self;
    }
}





//设置navbar下面阴影线为白色
-(void)viewWillAppear:(BOOL)animated{

    
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.habitData.count;
    
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    

    //设置cell背景颜色
    cell.backgroundColor=[UIColor yellowColor];
    //设置cell阴影 圆角
//    cell.layer.masksToBounds=YES;
    cell.layer.cornerRadius=10;
    cell.layer.shadowColor=[UIColor blackColor].CGColor;
    cell.layer.shadowOffset=CGSizeMake(0, 0 );
    cell.layer.shadowOpacity=0.5;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRect:cell.bounds].CGPath;
    //设置缓存
    cell.layer.shouldRasterize = YES;
    //设置抗锯齿边缘
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    //设置cell内容
    cell.hasInsistDaysLabel.text=[NSString stringWithFormat:@"已坚持%ld天",((DataModel*)self.habitData[indexPath.row]).hasInsistDays ];
    cell.habitNameLabel.text=((DataModel*)self.habitData[indexPath.row]).habitName;
    cell.isChecked=((DataModel*)self.habitData[indexPath.row]).isChecked;
    cell.createTime=((DataModel*)self.habitData[indexPath.row]).createTime;
    if (cell.isChecked) {
        [cell.checkInHabit setTitle:@"打卡" forState:UIControlStateNormal];
        [cell.checkInHabit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cell.checkInHabit.enabled=YES;
    }else{
        [cell.checkInHabit setTitle:@"完成" forState:UIControlStateNormal];
        [cell.checkInHabit setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        cell.checkInHabit.enabled=NO;
    }
    cell.backgroundColor=((DataModel*)self.habitData[indexPath.row]).seletedColor;
    

//    [cell setUpData:_habitData[indexPath.row]];
    
    
    
    //设置各cell上按钮的回调
    [cell.checkInHabit addTarget:self action:@selector(checkInHabit:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.deleteHabitButton addTarget:self action:@selector(deleteCell:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return cell;
}
//打卡
-(void)checkInHabit:(UIButton*)sender{
    MyCollectionViewCell* cell=(MyCollectionViewCell*)[[sender superview]superview];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"打卡" message:@"确认打卡？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
        [UIView transitionWithView:sender duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
            [sender setTitle:@"完成" forState:UIControlStateNormal];
            
        } completion:^(BOOL finished) {
            

            
            //修改数据
//            NSDate *date=cell.createTime;
//            NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Habit"];
//            NSPredicate *predicate=[NSPredicate predicateWithFormat:@"createTime=%@",date];
//            request.predicate=predicate;
//            NSArray *arr=[creteSqlite.context executeFetchRequest:request error:nil];
//            for(Habit *habit in arr ){
//                NSInteger hasInsistCount=habit.hasInsistDays+1;
//                cell.hasInsistDaysLabel.text=[NSString stringWithFormat:@"已坚持%ld天",hasInsistCount];
//                habit.hasInsistDays=hasInsistCount;
//
//            }
//            if ([creteSqlite.context save:nil]) {
//                NSLog(@"修改成功");
//            }
            
            
            NSIndexPath *index=[self.collection indexPathForCell:cell];
            ((DataModel*)_habitData[index.row]).hasInsistDays++;
            ((DataModel*)_habitData[index.row]).isChecked=NO;
            [self.collection reloadData];
            
            
            
            sender.enabled=NO;
            [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            NSData *data=[NSKeyedArchiver archivedDataWithRootObject:_habitData];
            [users setObject:data forKey:@"habit"];
            
        }];
        
        
        
        
    }];
    UIAlertAction *action2=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}







//删除habitcell
-(void)deleteCell:(UIButton*)sender{
    MyCollectionViewCell* cell=(MyCollectionViewCell*)[[sender superview]superview];
    //删除数据库里的数据;
//    NSDate *date=cell.createTime;
//    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Habit"];
//    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"createTime=%@",date];
//    request.predicate=predicate;
//    NSArray *arr=[creteSqlite.context executeFetchRequest:request error:nil];
//    for(Habit *habit in arr ){
//        [creteSqlite.context deleteObject:habit];
//    }
//    if ([creteSqlite.context save:nil]) {
//        NSLog(@"删除成功");
//    }
    NSIndexPath* indexpath=[_collection indexPathForCell:cell];
    [_habitData removeObjectAtIndex:indexpath.row];
    //将数据源归档
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:_habitData];
    [users setObject:data forKey:@"habit"];
    [_collection deleteItemsAtIndexPaths:@[indexpath]];
    if (self.habitData.count==0) {
        self.collection.hidden=YES;
        title.hidden=NO;
    }
}

- (IBAction)researchSqlite:(id)sender {
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Habit"];
    NSArray *arr=[creteSqlite.context executeFetchRequest:request error:nil];
    for(Habit *habit in arr){
        NSLog(@"habitName=%@,hasInsistDays=%hd",habit.habitName,habit.hasInsistDays);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
