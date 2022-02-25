//
//  CreateSqlite.h
//  Habit
//
//  Created by JZQ on 2018/6/16.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface CreateSqlite : NSObject
@property(strong,nonatomic)NSManagedObjectModel *model;
@property(strong,nonatomic)NSPersistentStoreCoordinator *psc;
@property(strong,nonatomic)NSManagedObjectContext *context;
@end
