//
//  DynamicMethodCallAppDelegate.h
//  DynamicMethodCall
//
//  Created by 森田秀幸 on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DynamicMethodCallViewController;

@interface DynamicMethodCallAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DynamicMethodCallViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DynamicMethodCallViewController *viewController;

@end

