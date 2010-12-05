//
//  GameCenterAppDelegate.h
//  GameCenter
//
//  Created by 森田秀幸 on 10/09/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameCenterViewController;

@interface GameCenterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GameCenterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GameCenterViewController *viewController;

@end

