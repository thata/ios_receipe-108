//
//  PlayBGMAppDelegate.h
//  PlayBGM
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayBGMViewController;

@interface PlayBGMAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PlayBGMViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PlayBGMViewController *viewController;

@end

