//
//  FooAppDelegate.h
//  FooApp
//
//  Created by 森田秀幸 on 10/08/14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FooAppViewController;

@interface FooAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FooAppViewController *viewController;
    NSString *applicationName;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FooAppViewController *viewController;
@property (nonatomic, copy) NSString *applicationName;

@end

