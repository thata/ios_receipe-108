//
//  GeometryGraphicsByUIKitAppDelegate.h
//  GeometryGraphicsByUIKit
//
//  Created by 森田秀幸 on 10/08/16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GeometryGraphicsByUIKitViewController;

@interface GeometryGraphicsByUIKitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GeometryGraphicsByUIKitViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GeometryGraphicsByUIKitViewController *viewController;

@end

