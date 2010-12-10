//
//  AddressBookSampleAppDelegate.m
//  AddressBookSample
//
//  Created by kzsg on 10/08/24.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AddressBookSampleAppDelegate.h"
#import "AddressBookSampleViewController.h"

@implementation AddressBookSampleAppDelegate

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
