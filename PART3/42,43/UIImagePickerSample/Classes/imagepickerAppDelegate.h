//
//  imagepickerAppDelegate.h
//  imagepicker
//
//  Created by kzsg on 10/10/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class imagepickerViewController;

@interface imagepickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    imagepickerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet imagepickerViewController *viewController;

@end

