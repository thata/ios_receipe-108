//
//  SpecifiedDateAppDelegate.m
//  SpecifiedDate
//
//  Created by hatakeyama takashi on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SpecifiedDateAppDelegate.h"

@implementation SpecifiedDateAppDelegate

@synthesize window;

- (void)testDateFromComponents {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSLocale *locale = [NSLocale autoupdatingCurrentLocale];

    // 年月日、時分秒を指定して日時オブジェクトを生成する
    comps= [[NSDateComponents alloc] init];
    [comps setYear:2010];
    [comps setMonth:1];
    [comps setDay:2];
    [comps setHour:3];
    [comps setMinute:4];
    [comps setSecond:5];
    NSDate *date = [calendar dateFromComponents:comps];
    NSLog(@"%@", [date descriptionWithLocale:locale]); 
    //=> 2010年1月2日土曜日3時04分05秒 日本標準時
    
    // 年月日だけを指定することも可能
    comps = [[NSDateComponents alloc] init];
    [comps setYear:2010];
    [comps setMonth:1];
    [comps setDay:2];
    date = [calendar dateFromComponents:comps];
    NSLog(@"%@", [date descriptionWithLocale:locale]); 
    //=> 2010年1月2日土曜日0時00分00秒 日本標準時
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self testDateFromComponents];
    
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
