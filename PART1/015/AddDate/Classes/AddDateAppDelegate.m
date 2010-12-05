//
//  AddDateAppDelegate.m
//  AddDate
//
//  Created by hatakeyama takashi on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AddDateAppDelegate.h"

@implementation AddDateAppDelegate

@synthesize window;

- (void)testAddDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSLog(@"今: %@", now); // => 今: 2010-09-05 23:49:51
    
    // 7日後の日時を求める
    NSDateComponents *sevenDays = [[NSDateComponents alloc] init];
    [sevenDays setDay:7];
    NSDate *afterSevenDays = [calendar dateByAddingComponents:sevenDays 
                                                       toDate:now 
                                                      options:0];
    NSLog(@"7日後: %@", afterSevenDays); // => 7日後: 2010-09-12 23:49:51
    
    // 8時間前の日時を求める
    NSDateComponents *minusEightHours = [[NSDateComponents alloc] init];
    [minusEightHours setHour:-8];
    NSDate *eightHoursBefore = [calendar dateByAddingComponents:minusEightHours 
                                                         toDate:now 
                                                        options:0];
    NSLog(@"8時間前: %@", eightHoursBefore); // => 8時間前: 2010-09-05 15:49:51
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self testAddDate];
    
    // Override point for customization after application launch.
    
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
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
