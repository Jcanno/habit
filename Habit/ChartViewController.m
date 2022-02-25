//
//  ChartViewController.m
//  Habit
//
//  Created by JZQ on 2018/6/19.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "ChartViewController.h"

@interface ChartViewController (){
    NSMutableArray *dateArr;
    NSMutableArray *countArr;
    NSUserDefaults *users;
    dispatch_queue_t queue;
    NSInteger oldCount;
    AAChartModel *chartModel;
    
}

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    users=[NSUserDefaults standardUserDefaults];
    dateArr =[NSMutableArray arrayWithCapacity:5];
    countArr=[NSMutableArray arrayWithCapacity:5];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd"];

    queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
      
        NSString *str=[formatter stringFromDate:[NSDate date] ];
        oldCount=[users integerForKey:str];
    });

    dispatch_async(queue, ^{
        for (int i=0; i<7; i++) {
            NSTimeInterval dayInterval=-60*60*24*i;
            NSDate *date=[NSDate dateWithTimeIntervalSinceNow:dayInterval];
            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"MM-dd"];
            NSString *str=[formatter stringFromDate:date ];
            NSInteger count=[users integerForKey:str];
            NSNumber *countNum=[NSNumber numberWithInteger:count];
            [countArr addObject:countNum];
            [dateArr addObject:str];
        }
    });

    CGFloat chartViewWidth  = self.view.frame.size.width;
    CGFloat chartViewHeight = self.view.frame.size.height-250;
    self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 60, chartViewWidth, chartViewHeight)];
    ////设置图表视图的内容高度(默认 contentHeight 和 AAChartView 的高度相同)
    //self.aaChartView.contentHeight = self.view.frame.size.height-250;
    [self.view addSubview:self.aaChartView];
    
    chartModel= AAObject(AAChartModel)
    .chartTypeSet(AAChartTypeLine)//设置图表的类型(这里以设置的为柱状图为例)
    .titleSet(@"最近七天的专注次数")//设置图表标题
    //    .subtitleSet(@"虚拟数据")//设置图表副标题
    .categoriesSet(@[dateArr[0],dateArr[1],dateArr[2],dateArr[3], dateArr[4],dateArr[5],dateArr[6]])//设置图表横轴的内容
    .yAxisTitleSet(@"次")//设置图表 y 轴的单位
    .seriesSet(@[
                 AAObject(AASeriesElement)
                 .nameSet(@"专注次数")
                 .dataSet(@[countArr[0],countArr[1],countArr[2],countArr[3],countArr[4],countArr[5],countArr[6]]),
                 ])
    ;
    [_aaChartView aa_drawChartWithChartModel:chartModel];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    dispatch_async(queue, ^{
        
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd"];
        NSString *newDate=[formatter stringFromDate:[NSDate date] ];
        
        NSInteger count=[users integerForKey:newDate];
        if (count!=oldCount) {
            
            NSMutableArray *newCountArr=[NSMutableArray arrayWithCapacity:5];
            
            for (int i=0; i<7; i++) {
                NSTimeInterval dayInterval=-60*60*24*i;
                NSDate *date=[NSDate dateWithTimeIntervalSinceNow:dayInterval];
                NSString *str=[formatter stringFromDate:date ];
                NSInteger count=[users integerForKey:str];
                NSNumber *countNum=[NSNumber numberWithInteger:count];
                [newCountArr addObject:countNum];
                
            }
            chartModel
            .seriesSet(@[
                         AAObject(AASeriesElement)
                         .nameSet(@"专注次数")
                         .dataSet(@[newCountArr[0],newCountArr[1],newCountArr[2],newCountArr[3],newCountArr[4],newCountArr[5],newCountArr[6]]),
                         ]);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.aaChartView aa_refreshChartWithChartModel:chartModel];
            });
        }
    });
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
