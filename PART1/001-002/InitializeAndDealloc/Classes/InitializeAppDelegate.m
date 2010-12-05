//
//  InitializeAppDelegate.m
//  Initialize
//
//  Created by 森田秀幸 on 10/07/09.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "InitializeAppDelegate.h"
#import "InitializeViewController.h"
#import "User.h"

@implementation InitializeAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    User* user = [[[User alloc] init] autorelease];
    user.name = @"Alice";
    NSLog(@"user name: %@", user.name);
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
