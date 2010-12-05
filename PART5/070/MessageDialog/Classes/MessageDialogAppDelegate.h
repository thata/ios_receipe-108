//
//  MessageDialogAppDelegate.h
//  MessageDialog
//
//  Created by 森田秀幸 on 10/08/14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageDialogViewController;

@interface MessageDialogAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MessageDialogViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MessageDialogViewController *viewController;

@end

