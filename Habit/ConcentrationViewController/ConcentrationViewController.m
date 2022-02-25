//
//  ConcentrationViewController.m
//  Habit
//
//  Created by JZQ on 2018/6/18.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "ConcentrationViewController.h"
#import "ConcentrateCircleView.h"
#import "RestCircleView.h"
#import "HUD/ZSProgressHUD.h"


@interface ConcentrationViewController (){
    ConcentrateCircleView *concentrateView;
    dispatch_source_t timer;
    ConcentrateCircleView *restView;
    dispatch_source_t resttimer;
    
}

@end

@implementation ConcentrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加两个视图并初始化
    CGRect viewFrame=CGRectMake(20, 20, self.view.frame.size.width-50 ,self.view.frame.size.width-50  );
    concentrateView=[self ViewWithFrame:viewFrame withType:1 progress:10 timeCount:@"25:00"];

    [self.view addSubview:concentrateView];
    concentrateView.center=self.view.center;

    restView=[self ViewWithFrame:viewFrame withType:0 progress:10 timeCount:@"05:00"];
    //添加按钮边框
    self.concentrateButton.layer.borderColor=[[UIColor blackColor]CGColor];
    self.concentrateButton.layer.borderWidth=2.0f;
    self.stopButton.layer.borderColor=[[UIColor blackColor]CGColor];
    self.stopButton.layer.borderWidth=2.0f;
    
    //默认设置停止按钮为灰色
    self.stopButton.enabled=NO;
    [self.stopButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view.
}

//初始化视图
-(ConcentrateCircleView *)ViewWithFrame:(CGRect)frame withType:(NSInteger)type progress:(NSInteger)progress timeCount:(NSString*)timeCount{
    ConcentrateCircleView *concenView;
    concenView=[[ConcentrateCircleView alloc]initWithFrame:frame];
    concenView.type=type;
    concenView.progress=progress;
    concenView.cLabel.text=timeCount;
    concenView.center=self.view.center;
    return concenView;
}

//停止按钮逻辑
- (IBAction)rest:(id)sender {
    
    [self changeButtonSatate:@"stop"];
    //设timer为空值，并使视图回到初始化状态
    timer=nil;
    concentrateView.cLabel.text=@"25:00";
    concentrateView.progress=10;
    
    //以下有修改
    restView.progress=10;
    restView.cLabel.text=@"05:00";
    
    
    [restView setNeedsDisplay];
    [concentrateView setNeedsDisplay];
    //如果包含休息视图移除休息视图，添加专注视图
    if ([self.view.subviews containsObject:restView]) {
        [restView removeFromSuperview];
        [self.view addSubview:concentrateView];
    }
    
}

-(void)changeButtonSatate:(NSString*)type{
    //type表示处理的类型
    if ([type isEqualToString:@"stop"]) {
        //打开专注按钮交互，关闭停止按钮交互
        self.concentrateButton.enabled=YES;
        [self.concentrateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.stopButton.enabled=NO;
        [self.stopButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else{
        //点击后设置专注按钮为灰色，打开停止按钮交互
        self.concentrateButton.enabled=NO;
        [self.concentrateButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.stopButton.enabled=YES;
        [self.stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

//初始化并配置timer
-(void)initTimer{
    
}


//开始专注按钮逻辑
- (IBAction)start:(id)sender {
    
    [self changeButtonSatate:@"start"];
    //用GCD创建timer并计时
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t mainqueue=dispatch_get_main_queue();
    timer=dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1*NSEC_PER_SEC, 0);
    
    
    dispatch_source_set_event_handler(timer, ^{
        concentrateView.progress--;
        //如果专注时间结束，则添加休息视图并开始计时
        if (concentrateView.progress<=0) {
            //存储次数
            NSUserDefaults *users=[NSUserDefaults standardUserDefaults];
            NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"MM-dd"];
            NSString *str=[formatter stringFromDate:[NSDate date]];
            NSInteger count=[users integerForKey:str];
            [users setInteger:count+1 forKey:str];

            dispatch_async(mainqueue, ^{
                [ZSProgressHUD showDpromptText:@"休息一下！"];
                [concentrateView removeFromSuperview];
                
                
                restView.progress=10;
                restView.cLabel.text=@"05:00";
                [self.view addSubview:restView];
                
            });
            //休息视图计时
            dispatch_source_set_event_handler(timer, ^{
                
                restView.progress--;
                //休息计时正常结束后逻辑安排，添加专注视图并初始化，设置两个按钮交互初始化
                //有修改
                if (restView.progress<=0) {
                    dispatch_source_cancel(timer);
                    timer=nil;
                    dispatch_async(mainqueue, ^{
                        [ZSProgressHUD showDpromptText:@"继续努力！"];
                        [restView removeFromSuperview];
                        [self.view addSubview:concentrateView];
                        concentrateView.progress=10;
                        concentrateView.cLabel.text=@"25:00";
                        
                        
                        //有修改
                        restView.progress=10;
                        restView.cLabel.text=@"05:00";
                        
                        
                        [self changeButtonSatate:@"stop"];
                        
                        
                        
                    });
                }
                //更新休息视图label
                dispatch_async(mainqueue, ^{
                    
                    //有修改
                    restView.cLabel.text=[NSString stringWithFormat:@"%02i:%02i", (int)restView.progress/60,(int)restView.progress%60];
                    [restView setNeedsDisplay];
                });
    
            });
        }
        //更新专注视图label
        dispatch_async(mainqueue, ^{
            concentrateView.cLabel.text = [NSString stringWithFormat:@"%02i:%02i", (int)concentrateView.progress/60,(int)concentrateView.progress%60];
            [concentrateView setNeedsDisplay];
        });
    });
    //开始计时
    dispatch_resume(timer);
    
    
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
