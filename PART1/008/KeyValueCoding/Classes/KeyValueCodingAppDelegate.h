//
//  KeyValueCodingAppDelegate.h
//  KeyValueCoding
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyValueCodingViewController;

@interface KeyValueCodingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    KeyValueCodingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KeyValueCodingViewController *viewController;

@end

