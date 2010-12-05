//
//  MapViewSampleAppDelegate.h
//  MapViewSample
//
//  Created by kzsg on 10/02/14.
//

#import <UIKit/UIKit.h>

@class MapViewSampleViewController;

@interface MapViewSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapViewSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapViewSampleViewController *viewController;

@end

