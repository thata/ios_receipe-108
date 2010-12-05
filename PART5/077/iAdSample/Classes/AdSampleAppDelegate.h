//
//  AdSampleAppDelegate.h
//  AdSample
//
//  Created by kzsg on 10/08/31.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdSampleViewController;

@interface AdSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AdSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AdSampleViewController *viewController;

@end

