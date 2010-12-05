//
//  ApplicationTerminationAppDelegate.h
//  ApplicationTermination
//
//  Created by 森田秀幸 on 10/08/15.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationTerminationViewController;

@interface ApplicationTerminationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ApplicationTerminationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ApplicationTerminationViewController *viewController;

@end

