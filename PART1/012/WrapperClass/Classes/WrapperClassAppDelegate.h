//
//  WrapperClassAppDelegate.h
//  WrapperClass
//
//  Created by 森田秀幸 on 10/08/14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WrapperClassViewController;

@interface WrapperClassAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WrapperClassViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WrapperClassViewController *viewController;

@end

