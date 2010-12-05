//
//  DynamicMethodCallAppDelegate.m
//  DynamicMethodCall
//
//  Created by 森田秀幸 on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DynamicMethodCallAppDelegate.h"
#import "DynamicMethodCallViewController.h"
#import "Customer.h"

@implementation DynamicMethodCallAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (SEL)fetchStrategy {
    return @selector(setName:job:);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    {
        Customer *customer = [[[Customer alloc] init] autorelease];
        [customer setName:@"Alice" job:@"Programmer"];
        NSLog(@"name: %@, job: %@\n", customer.name, customer.job);
    }
    
    {
        Customer *customer = [[[Customer alloc] init] autorelease];
        SEL strategy = [self fetchStrategy];
        [customer performSelector:strategy
                       withObject:@"Bob"
                       withObject:@"Designer"];
        NSLog(@"name: %@, job: %@\n", customer.name, customer.job);
    }
    
    {
        Customer *customer = [[[Customer alloc] init] autorelease];
        [customer setName:@"Chris" job:@"Director"];
        SEL sel = @selector(name);
        // unrecognized selector sent to instance ***
        //SEL sel = @selector(name:);
        NSLog(@"name: %@, job: %@\n", [customer performSelector:sel], customer.job);
    }
    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
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
    [viewController release];
    [window release];
    [super dealloc];
}


@end
