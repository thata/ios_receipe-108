//
//  AutorotateAppDelegate.h
//  Autorotate
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutorotateViewController;

@interface AutorotateAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AutorotateViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AutorotateViewController *viewController;

@end

