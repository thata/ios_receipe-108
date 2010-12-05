//
//  CoreAnimationAppDelegate.h
//  CoreAnimation
//
//  Created by 森田秀幸 on 10/08/16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreAnimationViewController;

@interface CoreAnimationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreAnimationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoreAnimationViewController *viewController;

@end

