//
//  GeometryGraphicsAppDelegate.h
//  GeometryGraphics
//
//  Created by 森田秀幸 on 10/08/03.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GeometryGraphicsViewController;

@interface GeometryGraphicsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GeometryGraphicsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GeometryGraphicsViewController *viewController;

@end

