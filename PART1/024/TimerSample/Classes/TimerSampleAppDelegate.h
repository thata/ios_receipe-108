//
//  TimerSampleAppDelegate.h
//  TimerSample
//
//  Created by kzsg on 10/12/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TimerSampleViewController;

@interface TimerSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TimerSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TimerSampleViewController *viewController;

@end

