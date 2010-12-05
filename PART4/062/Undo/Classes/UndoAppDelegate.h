//
//  UndoAppDelegate.h
//  Undo
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UndoViewController;

@interface UndoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UndoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UndoViewController *viewController;

@end

