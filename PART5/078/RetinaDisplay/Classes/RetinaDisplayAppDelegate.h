//
//  RetinaDisplayAppDelegate.h
//  RetinaDisplay
//
//  Created by 森田秀幸 on 10/08/16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RetinaDisplayViewController;

@interface RetinaDisplayAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RetinaDisplayViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RetinaDisplayViewController *viewController;

@end

