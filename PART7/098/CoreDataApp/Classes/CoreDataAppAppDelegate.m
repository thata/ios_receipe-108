//
//  CoreDataAppAppDelegate.m
//  CoreDataApp
//
//  Created by hatakeyama takashi on 10/09/25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CoreDataAppAppDelegate.h"
#import "Person.h"

@implementation CoreDataAppAppDelegate

@synthesize window;

- (void)insert {
    // 管理オブジェクトコンテキストをAppDelegateより取得
    CoreDataAppAppDelegate *delegate = 
        [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = 
        [delegate managedObjectContext];
        
    Person *person;
    
    // 大島さんを追加
    person = [NSEntityDescription 
              insertNewObjectForEntityForName:@"Person" 
              inManagedObjectContext:managedObjectContext];
    person.name = @"大島";
    person.age = [NSNumber numberWithInt:21];
    
    // 前田さんを追加
    person = [NSEntityDescription 
              insertNewObjectForEntityForName:@"Person" 
              inManagedObjectContext:managedObjectContext];
    person.name = @"前田";
    person.age = [NSNumber numberWithInt:18];
    
    // 篠田さんを追加
    person = [NSEntityDescription 
              insertNewObjectForEntityForName:@"Person" 
              inManagedObjectContext:managedObjectContext];
    person.name = @"篠田";
    person.age = [NSNumber numberWithInt:24];
    
    // 追加したレコードをDBへ反映
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
}

- (void)findAll {
    // 管理オブジェクトコンテキストをAppDelegateより取得
    CoreDataAppAppDelegate *delegate = 
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = 
    [delegate managedObjectContext];

    // リクエストを生成
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    
    // 取得対象となるエンティティをfetchRequestにセット
    NSEntityDescription *personDescription;
    personDescription = [NSEntityDescription 
                         entityForName:@"Person" 
                         inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:personDescription];
    
    // 年齢の昇順でソート
    NSSortDescriptor *sortByAge = [[NSSortDescriptor alloc] 
                                   initWithKey:@"age" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] 
                                initWithObjects:sortByAge, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // fetchRequestを使ってレコードを取得する
    NSError *error = nil;
    NSArray *result = [managedObjectContext executeFetchRequest:fetchRequest 
                                                          error:&error];
    // 結果を出力
    NSLog(@"%d", [result count]);
    Person *person;
    person = [result objectAtIndex:0];
    NSLog(@"name: %@, age: %@", 
          person.name, person.age); //=> name: 前田, age: 18
    person = [result objectAtIndex:1];
    NSLog(@"name: %@, age: %@", 
          person.name, person.age); //=> name: 大島, age: 21
    person = [result objectAtIndex:2];
    NSLog(@"name: %@, age: %@", 
          person.name, person.age); //=> name: 篠田, age: 24
}

- (void)findAndUpdate {
    // 管理オブジェクトコンテキストをAppDelegateより取得
    CoreDataAppAppDelegate *delegate = 
        [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = 
        [delegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    
    // 取得対象となるエンティティをfetchRequestにセット
    NSEntityDescription *personDescription;
    personDescription = [NSEntityDescription 
                         entityForName:@"Person" 
                         inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:personDescription];
    
    // 名前で絞り込む
    NSPredicate *predicate = [NSPredicate 
                              predicateWithFormat:@"name = %@", @"篠田"];
    [fetchRequest setPredicate:predicate];
    
    // fetchRequestを使ってレコードを取得する
    NSArray *result = [managedObjectContext executeFetchRequest:fetchRequest 
                                                          error:nil];
    // 年齢をプラス1して...
    Person *person = [result objectAtIndex:0];
    NSInteger newAge = [person.age intValue] + 1;
    person.age = [NSNumber numberWithInt:newAge];
    
    // レコードを更新する
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
}

- (void)deleteAll {
    // 管理オブジェクトコンテキストをAppDelegateより取得
    CoreDataAppAppDelegate *delegate = 
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = 
    [delegate managedObjectContext];

    // Personオブジェクトを全件取得して...
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *personDescription;
    personDescription = [NSEntityDescription 
                         entityForName:@"Person" 
                         inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:personDescription];
    
    NSArray *people = [managedObjectContext executeFetchRequest:fetchRequest 
                                                          error:nil];
    // 全件削除して...
    for (Person *person in people) {
        [managedObjectContext deleteObject:person];
    }
    
    // 削除をDBへ反映する
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self insert];
    [self findAll];
    [self findAndUpdate];    
    [self findAll];
    [self deleteAll];
    
    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    [self saveContext];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


- (void)saveContext {
    
    NSError *error = nil;
    if (managedObjectContext_ != nil) {
        if ([managedObjectContext_ hasChanges] && ![managedObjectContext_ save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}    


#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"CoreDataApp" ofType:@"momd"];
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"CoreDataApp.sqlite"]];
    
    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator_;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    
    [managedObjectContext_ release];
    [managedObjectModel_ release];
    [persistentStoreCoordinator_ release];
    
    [window release];
    [super dealloc];
}


@end

