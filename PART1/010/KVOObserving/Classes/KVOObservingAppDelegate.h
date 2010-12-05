//
//  KVOObservingAppDelegate.h
//  KVOObserving
//
//  Created by 森田秀幸 on 10/06/19.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KVOObservingViewController;

@interface KVOObservingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    KVOObservingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KVOObservingViewController *viewController;

@end

