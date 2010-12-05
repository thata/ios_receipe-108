//
//  NowAndTodayAppDelegate.m
//  NowAndToday
//
//  Created by hatakeyama takashi on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NowAndTodayAppDelegate.h"

@implementation NowAndTodayAppDelegate

@synthesize window;

- (void)testNow {
    NSDate *now;
    
    /* 現在の日時を取得する */
    now = [NSDate date];
    NSLog(@"%@", now); // => 2010-09-23 04:20:17 GMT
    
    // alloc, initでもOK
    now = [[NSDate alloc] init];
    NSLog(@"%@", now); // => 2010-09-23 04:20:17 GMT
    [now release];
}

- (void)testNSDateAndNSDateComponents {
    NSDate *now = [NSDate date];
    
    /* 日時オブジェクトから値を取得する */
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = 
    NSYearCalendarUnit      // 年
    | NSMonthCalendarUnit   // 月
    | NSDayCalendarUnit     // 日
    | NSHourCalendarUnit    // 時
    | NSMinuteCalendarUnit  // 分
    | NSSecondCalendarUnit  // 秒
    | NSWeekCalendarUnit    // 今年に入って何週目か
    | NSWeekdayCalendarUnit // 曜日
    | NSWeekdayOrdinalCalendarUnit; // 今月の第何曜日か
    NSDateComponents *comps = [calendar components:unitFlags fromDate:now];
    
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];
    NSInteger second = [comps second];
    NSInteger week = [comps week]; // 今年に入って何週目か
    NSInteger weekday = [comps weekday]; // 曜日
    NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 今月の第何曜日か
    
    NSLog(@"year: %d month: %d, day: %d", year, month, day);
    NSLog(@"hour: %d minute: %d second: %d", hour, minute, second);
    NSLog(@"week: %d weekday: %d weekday ordinal: %d", 
          week, weekday, weekdayOrdinal);
    //  => year: 2010 month: 8, day: 31
    //     hour: 0 minute: 16 second: 7
    //     week: 35 weekday: 3 weekday ordinal: 5    
}

- (void)testToday {
    /* 現在の日付を取得する */
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];

    // 現在の日時から年月日のみを取り出し...
    NSDateComponents *comps;
    NSUInteger unitFlags = NSYearCalendarUnit 
    | NSMonthCalendarUnit 
    | NSDayCalendarUnit;
    comps = [calendar components:unitFlags fromDate:now];

    // ...取り出した年月日を元にNSDateオブジェクトを生成する
    NSDate *today = [calendar dateFromComponents:comps];
 
    // 取得したNSDateオブジェクトを現在の日本標準時として出力する
    NSLocale *locale = [NSLocale autoupdatingCurrentLocale];
    NSLog(@"Today: %@", [today descriptionWithLocale:locale]); 
    //=> Today: 2010年9月23日木曜日0時00分00秒 日本標準時
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self testNow];
    [self testNSDateAndNSDateComponents];
    [self testToday];
    
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
