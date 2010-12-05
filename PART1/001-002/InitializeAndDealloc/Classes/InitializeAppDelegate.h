//
//  InitializeAppDelegate.h
//  Initialize
//
//  Created by 森田秀幸 on 10/07/09.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InitializeViewController;

@interface InitializeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    InitializeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet InitializeViewController *viewController;

@end

