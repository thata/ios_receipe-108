//
//  PredicateStringAppDelegate.m
//  PredicateString
//
//  Created by hatakeyama takashi on 10/09/26.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PredicateStringAppDelegate.h"

@implementation PredicateStringAppDelegate

@synthesize window;

- (void)beginsWithAndContainsAndEndsWith {
    NSArray *languages = [NSArray arrayWithObjects:
                          @"Java",
                          @"JavaScript",
                          @"Ruby",
                          @"Python",
                          @"Perl",
                          @"ActionScript",
                          nil];

    NSPredicate *pred;
    NSArray *result;    

    // BEGINSWITH
    pred = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH 'P'"];
    result = [languages filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (Python, Perl)

    pred = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH 'Java'"];
    result = [languages filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (Java, JavaScript)

    // ENDSWITH
    pred = [NSPredicate predicateWithFormat:@"SELF ENDSWITH 'Script'"];
    result = [languages filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (JavaScript, ActionScript)

    // CONTAINS
    pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS 'y'"];
    result = [languages filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (Ruby, Python)

    pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS 'on'"];
    result = [languages filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (Python, ActionScript)

    /* Case Insensitive オプションの有無 */

    // オプションなし(アルファベットの大文字小文字を無視しない)
    pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS 'p'"];
    result = [languages filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (JavaScript, ActionScript)

    // オプションあり(アルファベットの大文字小文字を無視する)
    pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] 'p'"];
    result = [languages filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (JavaScript, Perl, Python, ActionScript)
}

- (void)like {
    NSPredicate *pred;
    NSArray *result;
    NSArray *menus = [NSArray arrayWithObjects:
                      @"カレー",
                      @"ハンバーグカレー",
                      @"カレーうどん",
                      @"カツカレー",
                      @"カレーパン",
                      @"カレー粉",
                      nil];

    // * は0文字以上の任意の文字にマッチする
    pred = [NSPredicate predicateWithFormat:@"SELF LIKE '*カレー'"];
    result = [menus filteredArrayUsingPredicate:pred];
    NSLog(@"%@", [result objectAtIndex:0]); //=> カレー
    NSLog(@"%@", [result objectAtIndex:1]); //=> ハンバーグカレー
    NSLog(@"%@", [result objectAtIndex:2]); //=> カツカレー

    pred = [NSPredicate predicateWithFormat:@"SELF LIKE 'カレー*'"];
    result = [menus filteredArrayUsingPredicate:pred];
    NSLog(@"%@", [result objectAtIndex:0]); //=> カレー
    NSLog(@"%@", [result objectAtIndex:1]); //=> カレーうどん
    NSLog(@"%@", [result objectAtIndex:2]); //=> カレーパン
    NSLog(@"%@", [result objectAtIndex:3]); //=> カレー粉

    // ? は任意の1文字にマッチする
    pred = [NSPredicate predicateWithFormat:@"SELF LIKE 'カレー?'"];
    result = [menus filteredArrayUsingPredicate:pred];
    NSLog(@"%@", [result objectAtIndex:0]); //=> カレー粉
}

- (void)matches {
    NSPredicate *pred;
    NSArray *result;
    NSArray *menus = [NSArray arrayWithObjects:
                      @"カレー",
                      @"ハンバーグカレー",
                      @"カレーうどん",
                      @"カツカレー",
                      @"カレーパン",
                      @"カレー粉",
                      nil];

    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES '.*カレー'"];
    result = [menus filteredArrayUsingPredicate:pred];
    NSLog(@"%@", [result objectAtIndex:0]); //=> カレー
    NSLog(@"%@", [result objectAtIndex:1]); //=> ハンバーグカレー
    NSLog(@"%@", [result objectAtIndex:2]); //=> カツカレー

    pred = [NSPredicate predicateWithFormat:@"SELF MATCHES 'カレー(うどん|パン)'"];
    result = [menus filteredArrayUsingPredicate:pred];
    NSLog(@"%@", [result objectAtIndex:0]); //=> カレーうどん
    NSLog(@"%@", [result objectAtIndex:1]); //=> カレーパン
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self beginsWithAndContainsAndEndsWith];
    [self like];
    [self matches];
    
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
