//
//  KVONotifyingAppDelegate.m
//  KVONotifying
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "KVONotifyingAppDelegate.h"
#import "KVONotifyingViewController.h"

@implementation KVONotifyingAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
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
