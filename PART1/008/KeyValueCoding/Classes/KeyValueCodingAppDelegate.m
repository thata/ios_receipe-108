//
//  KeyValueCodingAppDelegate.m
//  KeyValueCoding
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "KeyValueCodingAppDelegate.h"
#import "KeyValueCodingViewController.h"

@implementation KeyValueCodingAppDelegate

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
