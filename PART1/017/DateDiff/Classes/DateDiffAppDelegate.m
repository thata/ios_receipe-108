//
//  DateDiffAppDelegate.m
//  DateDiff
//
//  Created by hatakeyama takashi on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DateDiffAppDelegate.h"

@implementation DateDiffAppDelegate

@synthesize window;

- (void)getDiffWithDate {
    NSDateComponents *comps;
    NSDateComponents *diff;
    NSInteger unitFlags;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 1月1日
    comps = [[NSDateComponents alloc] init];
    [comps setYear:2010];
    [comps setMonth:1];
    [comps setDay:1];
    NSDate *jan1 = [calendar dateFromComponents:comps];
    
    // 2月14日
    comps = [[NSDateComponents alloc] init];
    [comps setYear:2010];
    [comps setMonth:2];
    [comps setDay:14];
    NSDate *feb14 = [calendar dateFromComponents:comps];
    
    // 1月1日から2月14日までは「何日か」を求める
    unitFlags = NSDayCalendarUnit; // 差を日数で返す
    diff = [calendar components:unitFlags fromDate:jan1 toDate:feb14 options:0];
    NSLog(@"%d日", [diff day]); //=> 44日
    
    // 1月1日から2月14日までは「何ヶ月と何日か」を求める
    unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit; // 差を何ヶ月と何日で返す
    diff = [calendar components:unitFlags fromDate:jan1 toDate:feb14 options:0];
    NSLog(@"%dヶ月と %d日", [diff month], [diff day]); //=> 1ヶ月と 13日    
}

- (void)getDiffWithDate2 {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *comps;
    
    // 9時10分11秒
    comps = [[NSDateComponents alloc] init];
    [comps setHour:9];
    [comps setMinute:10];
    [comps setSecond:11];
    NSDate *from = [calendar dateFromComponents:comps];
    
    // 18時19分20秒
    comps = [[NSDateComponents alloc] init];
    [comps setHour:18];
    [comps setMinute:40];
    [comps setSecond:5];
    NSDate *to = [calendar dateFromComponents:comps];
    
    // 時間の差を求める
    NSInteger unitFlags = NSHourCalendarUnit // 時
    | NSMinuteCalendarUnit // 分
    | NSSecondCalendarUnit; // 秒
    NSDateComponents *diff = [calendar components:unitFlags 
                                         fromDate: from
                                           toDate:to 
                                          options:0];
    NSLog(@"%d時間 %d分 %d秒", 
          [diff hour],
          [diff minute],
          [diff second]); //=> 9時間 29分 54秒    
}

- (void)getDiffWithTimeinterval {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *comps;
    
    // 9時10分11秒
    comps = [[NSDateComponents alloc] init];
    [comps setHour:9];
    [comps setMinute:10];
    [comps setSecond:11];
    NSDate *fromDate = [calendar dateFromComponents:comps];
    
    // 18時19分20秒
    comps = [[NSDateComponents alloc] init];
    [comps setHour:18];
    [comps setMinute:40];
    [comps setSecond:5];
    NSDate *toDate = [calendar dateFromComponents:comps];
    
    // 時間の差を求める    
    NSTimeInterval from = [fromDate timeIntervalSince1970];
    NSTimeInterval to = [toDate timeIntervalSince1970];
    NSTimeInterval diff = to - from;
    NSLog(@"%.2f秒", diff); //=> 34194.00秒
    
    // 時
    NSInteger secondsPerHour = 60 * 60;
    NSInteger hour = diff / secondsPerHour;
    diff = diff - (hour * secondsPerHour);
    // 分
    NSInteger secondsPerMinute = 60;
    NSInteger minute = diff / secondsPerMinute;
    diff = diff - (minute * secondsPerMinute);
    // 秒
    NSTimeInterval second = diff;
    NSLog(@"%d時間 %d分 %.2f秒", hour, minute, second); //=> 9時間 29分 54.00秒
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self getDiffWithDate];
    [self getDiffWithDate2];
    [self getDiffWithTimeinterval];
    
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
