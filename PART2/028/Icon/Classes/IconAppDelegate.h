//
//  IconAppDelegate.h
//  Icon
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IconViewController;

@interface IconAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IconViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet IconViewController *viewController;

@end

