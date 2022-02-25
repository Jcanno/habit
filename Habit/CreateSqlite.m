//
//  CreateSqlite.m
//  Habit
//
//  Created by JZQ on 2018/6/16.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "CreateSqlite.h"
#import <CoreData/CoreData.h>
@implementation CreateSqlite
//懒加载model 模型文件
-(NSManagedObjectModel*)model{
    if (!_model) {
        NSURL* url=[[NSBundle mainBundle ]URLForResource:@"Habit" withExtension:@"momd"];
        _model=[[NSManagedObjectModel alloc]initWithContentsOfURL:url];
        
    }
    return _model;
}

-(NSPersistentStoreCoordinator*)psc{
    if (!_psc) {
        _psc=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.model];
        NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
        NSString *urlString=[path stringByAppendingString:@"habit.sqlite"];
        NSURL *url=[NSURL fileURLWithPath:urlString];
        
        NSError *error=nil;
        
        [_psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
        if (error) {
            NSLog(@"添加数据库失败:%@",error);
        }else{
            NSLog(@"添加数据库成功");
        }
    }
    return _psc;
    
    
    
}


-(NSManagedObjectContext*)context{
    if (!_context) {
        
        _context=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        _context.persistentStoreCoordinator=self.psc;
    }
    return _context;
    
    
}



@end
