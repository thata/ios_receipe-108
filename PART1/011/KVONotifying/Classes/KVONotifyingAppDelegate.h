//
//  KVONotifyingAppDelegate.h
//  KVONotifying
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KVONotifyingViewController;

@interface KVONotifyingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    KVONotifyingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KVONotifyingViewController *viewController;

@end

