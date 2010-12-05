//
//  KVOObservingAppDelegate.m
//  KVOObserving
//
//  Created by 森田秀幸 on 10/06/19.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "KVOObservingAppDelegate.h"
#import "KVOObservingViewController.h"

@implementation KVOObservingAppDelegate

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
