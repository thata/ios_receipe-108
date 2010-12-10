//
//  CoreLocationSampleAppDelegate.h
//  CoreLocationSample
//
//  Created by kzsg on 10/07/11.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreLocationSampleViewController;

@interface CoreLocationSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreLocationSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreLocationSampleViewController *viewController;

@end

