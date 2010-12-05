//
//  MapViewSampleAppDelegate.m
//  MapViewSample
//
//  Created by kzsg on 10/02/14.
//

#import "MapViewSampleAppDelegate.h"
#import "MapViewSampleViewController.h"

@implementation MapViewSampleAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
