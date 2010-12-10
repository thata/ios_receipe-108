//
//  iPodSampleAppDelegate.h
//  iPodSample
//
//  Created by kzsg on 10/09/01.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iPodSampleViewController;

@interface iPodSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iPodSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iPodSampleViewController *viewController;

@end

