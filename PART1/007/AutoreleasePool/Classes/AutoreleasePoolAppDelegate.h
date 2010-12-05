//
//  AutoreleasePoolAppDelegate.h
//  AutoreleasePool
//
//  Created by 森田秀幸 on 10/07/07.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutoreleasePoolViewController;

@interface AutoreleasePoolAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AutoreleasePoolViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AutoreleasePoolViewController *viewController;

@end

