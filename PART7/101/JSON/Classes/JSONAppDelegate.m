//
//  JSONAppDelegate.m
//  JSON
//
//  Created by hatakeyama takashi on 10/09/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "JSONAppDelegate.h"
#import "JSON.h"

@implementation JSONAppDelegate

@synthesize window;

- (void)testJSONValue {
    /* JSONからオブジェクトへ変換する */
    NSString *str;

    // JSON -> NSDictionary
    str = @"{ \"name\": \"田中一郎\", \"age\": 18, \"superuser\": true }";
    NSDictionary *user = [str JSONValue];
    NSString *name = [user objectForKey:@"name"];
    NSNumber *age = [user objectForKey:@"age"];
    NSNumber *superuser = [user objectForKey:@"superuser"];
    NSLog(@"user[name]: %@", name); 
    //=> 田中一郎
    NSLog(@"user[age]: %@", age); 
    //=> 18
    NSLog(@"user[superuser]: %@", [superuser boolValue] ? @"true" : @"false");	
    //=> true

    // JSON -> NSArray
    str = @"[ \"バナナ\", \"リンゴ\", \"パイナップル\" ]";
    NSArray *fruits = [str JSONValue];
    NSLog(@"fruits[0]: %@", [fruits objectAtIndex:0]);
    //=> バナナ
    NSLog(@"fruits[1]: %@", [fruits objectAtIndex:1]);
    //=> リンゴ
    NSLog(@"fruits[2]: %@", [fruits objectAtIndex:2]);
    //=> パイナップル
}

- (void)testJSONRepresentation {
    /* オブジェクトからJSONへ変換する */
    NSString *jsonString;
    
    // NSDictionary -> JSON
    NSMutableDictionary *currencies = [NSMutableDictionary dictionary];
    [currencies setValue:@"ドル" forKey:@"アメリカ"];
    [currencies setValue:@"ポンド" forKey:@"イギリス"];
    [currencies setValue:@"円" forKey:@"日本"];
    jsonString = [currencies JSONRepresentation];
    NSLog(@"currencies: %@", jsonString);
    //=> currencies: {"アメリカ":"ドル","イギリス":"ポンド","日本":"円"}
    
    // NSArray -> JSON
    NSMutableArray *colors = [NSMutableArray array];
    [colors addObject:@"赤"];
    [colors addObject:@"緑"];
    [colors addObject:@"青"];
    jsonString = [colors JSONRepresentation];
    NSLog(@"colors: %@", jsonString);
    //=> colors: ["赤","緑","青"]
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self testJSONValue];
    [self testJSONRepresentation];
    
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
