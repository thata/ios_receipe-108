//
//  PredicateFunctionAppDelegate.m
//  PredicateFunction
//
//  Created by hatakeyama takashi on 10/09/26.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PredicateFunctionAppDelegate.h"

@implementation PredicateFunctionAppDelegate

@synthesize window;

- (void)builtInFunctionMaxAndMin {
    // 最大値、最小値を取り出す
    NSArray *numbers = [NSArray arrayWithObjects:
                        [NSNumber numberWithInt:3],
                        [NSNumber numberWithInt:7],
                        [NSNumber numberWithInt:2],
                        [NSNumber numberWithInt:5],
                        [NSNumber numberWithInt:4],
                        nil];
    // 最大値
    NSPredicate *maxPred = [NSPredicate predicateWithFormat:
                            @"SELF == max:(%@)", numbers];
    NSLog(@"%@", [numbers filteredArrayUsingPredicate:maxPred]); //=> (7)
    // 最小値
    NSPredicate *minPred = [NSPredicate predicateWithFormat:
                            @"SELF == min:(%@)", numbers];
    NSLog(@"%@", [numbers filteredArrayUsingPredicate:minPred]); //=> (2)
}

- (void)builtInFunctionModulusBy {
    NSArray *numbers = [NSArray arrayWithObjects:
                        [NSNumber numberWithInt:3],
                        [NSNumber numberWithInt:7],
                        [NSNumber numberWithInt:2],
                        [NSNumber numberWithInt:5],
                        [NSNumber numberWithInt:4],
                        nil];

    // 偶数のみを取り出す(modulus:by:)
    NSPredicate *evenPred = [NSPredicate predicateWithFormat:
                             @"modulus:by:(SELF, 2) == 0"];
    NSLog(@"%@", [numbers filteredArrayUsingPredicate:evenPred]); //=> (2, 4)
}

- (void)originalFunction {
    /* NSStringのメソッドを利用して、スラッシュ以下がcccの要素を取り出したい */
    NSArray *ss = [NSArray arrayWithObjects: 
                   @"base/a", 
                   @"base/bb", 
                   @"base/ccc", 
                   nil];
    NSPredicate *pred;
    pred = [NSPredicate predicateWithFormat:
            @"FUNCTION(SELF, 'componentsSeparatedByString:', '/')[1] == 'ccc'"];
    NSLog(@"%@", [ss filteredArrayUsingPredicate:pred]); //=> ("base/ccc")
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self builtInFunctionMaxAndMin];
    [self builtInFunctionModulusBy];
    [self originalFunction];
    
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
