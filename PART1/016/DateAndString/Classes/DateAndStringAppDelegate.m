//
//  DateAndStringAppDelegate.m
//  DateAndString
//
//  Created by hatakeyama takashi on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DateAndStringAppDelegate.h"

@implementation DateAndStringAppDelegate

@synthesize window;

- (void)testStringFromDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // 表示用のNSDateオブジェクトを生成
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *date = [formatter dateFromString:@"2010-09-03 04:05:06 +0900"];
    
    // よくある年月日形式
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 2010-09-03
    
    // 年
    [formatter setDateFormat:@"y"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 2010
    
    // yを2つ指定した場合は、年の下二桁のみを表示する
    [formatter setDateFormat:@"yy"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 10
    
    // yを4つ指定した場合は、1つ指定した場合と同じ動作となる
    [formatter setDateFormat:@"yyyy"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 2010
    
    // 月
    [formatter setDateFormat:@"M"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 9
    
    [formatter setDateFormat:@"MM"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 09
    
    // 日
    [formatter setDateFormat:@"d"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 3
    
    [formatter setDateFormat:@"dd"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 03
    
    // 時(24時間制)
    [formatter setDateFormat:@"H"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 4
    
    [formatter setDateFormat:@"HH"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 04
    
    // 時(12時間制) + 午前午後
    [formatter setDateFormat:@"a h時"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 午前 4時
    
    // 分
    [formatter setDateFormat:@"m"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 5
    
    [formatter setDateFormat:@"mm"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 05
    
    // sec
    [formatter setDateFormat:@"s"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 6
    
    [formatter setDateFormat:@"ss"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 06
    
    // 曜日
    [formatter setDateFormat:@"E"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 金
    
    [formatter setDateFormat:@"EEEE"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> 金曜日
    
    // タイムゾーン
    [formatter setDateFormat:@"z"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> JST
    [formatter setDateFormat:@"Z"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> +0900
    
    // フォーマット文字以外の文字はシングルクォートで囲う必要がある
    [formatter setDateFormat:@"'He was born on' yyyy-MM-dd"];
    NSLog(@"%@", [formatter stringFromDate:date]); 
    //=> He was born on 2010-09-03
    
    // 日本語はシングルクォートで囲まなくてもOK
    [formatter setDateFormat:@"yyyy年MM月dd日 HH時mm分ss秒 Z"];
    NSLog(@"%@", [formatter stringFromDate:date]); 
    //=> 2010年09月03日 04時05分06秒 +0900
    
    // 曜日を英語表記にしたい場合はロケールを変更する
    NSLocale *locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
    [formatter setLocale:locale];
    
    [formatter setDateFormat:@"E"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> Fri
    [formatter setDateFormat:@"EEEE"];
    NSLog(@"%@", [formatter stringFromDate:date]); //=> Friday
}

- (void)testDateFromString {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSLocale *locale = [NSLocale autoupdatingCurrentLocale]; //現在のロケール
    
    NSDate *date;

    // 年月日
    [formatter setDateFormat:@"yyyy-M-d"];
    date = [formatter dateFromString:@"2010-7-8"];
    NSLog(@"%@", [date descriptionWithLocale:locale]); 
    //=> 2010年7月8日木曜日0時00分00秒 日本標準時
    
    // ISO8601形式(2007-08-31T15:30:00+0900)
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    date = [formatter dateFromString:@"2007-08-31T15:30:00+0900"];
    NSLog(@"%@", [date descriptionWithLocale:locale]); 
    //=> 2007年8月31日金曜日15時30分00秒 日本標準時
    
    // RFC822形式(Wed, 22 Oct 2008 10:32:33 +0900)
    // 「Wed」と「Oct」をパースするためにNSDateFormatterのロケールをen_USにする
    NSLocale *localeEnUs = [[[NSLocale alloc] 
                             initWithLocaleIdentifier:@"en_US"] 
                            autorelease];
    [formatter setLocale:localeEnUs];
    [formatter setDateFormat:@"E',' d M y H:m:s Z"];
    date = [formatter dateFromString:@"Wed, 22 Oct 2008 10:32:33 +0900"];
    NSLog(@"%@", [date descriptionWithLocale:locale]); 
    //=> 2008年10月22日水曜日10時32分33秒 日本標準時
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self testStringFromDate];
    [self testDateFromString];
    
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
