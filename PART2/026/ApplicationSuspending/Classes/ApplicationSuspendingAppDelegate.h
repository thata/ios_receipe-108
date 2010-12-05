//
//  ApplicationSuspendingAppDelegate.h
//  ApplicationSuspending
//
//  Created by 森田秀幸 on 10/08/15.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationSuspendingViewController;

@interface ApplicationSuspendingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ApplicationSuspendingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ApplicationSuspendingViewController *viewController;

@end

