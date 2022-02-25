//
//  AppDelegate.m
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "AppDelegate.h"
#import "DataModel.h"
#import "DateHelper.h"
#import "DataModel.h"
//#import "HabitViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

//    NSInteger day=[[NSUserDefaults standardUserDefaults]integerForKey:@"day"];
    NSString *date=[[NSUserDefaults standardUserDefaults]stringForKey:@"date"];
    if (date==nil) {
        NSLog(@"空");
        date=[DateHelper getFormatterDate:[NSDate date]];
        [[NSUserDefaults standardUserDefaults]setObject:date forKey:@"date"];
        NSLog(@"%@",date);

    }else{
//        NSLog(@"%@",date);
        NSString *newDate=[DateHelper getFormatterDate:[NSDate date]];
        if ([date isEqualToString:newDate]) {
            NSLog(@"相同的天");
            NSLog(@"%@",date);
        }else{
            NSLog(@"不同的天");
            NSLog(@"%@",newDate);
            [[NSUserDefaults standardUserDefaults]setObject:newDate forKey:@"date"];
            
            NSData *data=[[NSUserDefaults standardUserDefaults]valueForKey:@"habit"];
            if (data!=nil) {
                NSMutableArray *habitArr=[NSKeyedUnarchiver unarchiveObjectWithData:data];
                for (int i=0; i<habitArr.count; i++) {
                    ((DataModel*)habitArr[i]).isChecked=YES;
                }
                NSData *newData=[NSKeyedArchiver archivedDataWithRootObject:habitArr];
                [[NSUserDefaults standardUserDefaults]setObject:newData forKey:@"habit"];
            }
        }
        //        NSInteger newDay=[DateHelper getDay:[NSDate date]];
//        if (day==newDay) {
//            NSLog(@"相同的天");
//        }else{
//            NSLog(@"不同的天");
//            [[NSUserDefaults standardUserDefaults]setInteger:newDay forKey:@"day"];
        }
    return YES;
        
}
    
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timeChange) name:UIApplicationSignificantTimeChangeNotification object:nil];

    


 
 
-(void)timeChange{
    NSData *data=[[NSUserDefaults standardUserDefaults]valueForKey:@"habit"];
    if (data!=nil) {
        NSMutableArray *muarr=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        for (int i=0; i<muarr.count; i++) {
            ((DataModel*)muarr[i]).isChecked=YES;
        }
        NSData *data1=[NSKeyedArchiver archivedDataWithRootObject:muarr];
        [[NSUserDefaults standardUserDefaults]setObject:data1 forKey:@"habit"];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
