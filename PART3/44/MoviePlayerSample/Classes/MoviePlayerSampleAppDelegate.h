//
//  MoviePlayerSampleAppDelegate.h
//  MoviePlayerSample
//
//  Created by kzsg on 10/09/28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MoviePlayerSampleViewController;

@interface MoviePlayerSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MoviePlayerSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MoviePlayerSampleViewController *viewController;

@end

