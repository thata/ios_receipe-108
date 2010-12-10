//
//  TableViewSampleAppDelegate.h
//  TableViewSample
//
//  Created by kzsg on 10/09/11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewSampleViewController;

@interface TableViewSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *viewController;

@end

