//
//  TableViewUISampleAppDelegate.m
//  TableViewUISample
//
//  Created by kzsg on 10/10/06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableViewUISampleAppDelegate.h"
#import "TableViewUISampleViewController.h"

@implementation TableViewUISampleAppDelegate

@synthesize window, viewController;


#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	TableViewUISampleViewController *tableViewController =
	[[[TableViewUISampleViewController alloc]
	  initWithStyle:UITableViewStylePlain]
	 autorelease];
	
	// ルートビューに表示されるデータ
	tableViewController.items = [NSArray arrayWithObjects:@"item1",@"item2",
								 @"item3",@"item4",nil];
	// セルを選択したときに表示されるデータ
	NSMutableDictionary *details = [NSMutableDictionary dictionary];
	NSArray *detail1 = [NSArray arrayWithObjects:@"item1-1", @"item1-2",
						@"item1-3",nil];
	[details setObject:detail1 forKey:@"item1"];
	NSArray *detail2 = [NSArray arrayWithObjects:@"item2-1", @"item2-2",
						@"item2-3",nil];
	[details setObject:detail2 forKey:@"item2"];
	NSArray *detail3 = [NSArray arrayWithObjects:@"item3-1", @"item3-2",
						@"item3-3",nil];
	[details setObject:detail3 forKey:@"item3"];
	NSArray *detail4 = [NSArray arrayWithObjects:@"item4-1", @"item4-2",
						@"item4-3",nil];
	[details setObject:detail4 forKey:@"item4"];
	tableViewController.details = details;
	
	// ナビゲーションビューにテーブルビューを追加
	self.viewController =
	[[[UINavigationController alloc]
	  initWithRootViewController:tableViewController]
	 autorelease];
	
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
