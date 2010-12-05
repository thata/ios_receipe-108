//
//  PlaySEAppDelegate.h
//  PlaySE
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlaySEViewController;

@interface PlaySEAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PlaySEViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PlaySEViewController *viewController;

@end

