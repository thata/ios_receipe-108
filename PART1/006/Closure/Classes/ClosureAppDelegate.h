//
//  ClosureAppDelegate.h
//  Closure
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClosureViewController;

@interface ClosureAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ClosureViewController *viewController;
    void (^instanceBlockFoo)();
    void (^instanceBlockBar)();
    NSString *bar;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ClosureViewController *viewController;

@end

