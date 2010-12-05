//
//  PropertyAppDelegate.h
//  Property
//
//  Created by 森田秀幸 on 10/08/12.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PropertyViewController;

@interface PropertyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PropertyViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PropertyViewController *viewController;

@end

