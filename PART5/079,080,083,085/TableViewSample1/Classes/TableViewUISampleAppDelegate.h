//
//  TableViewUISampleAppDelegate.h
//  TableViewUISample
//
//  Created by kzsg on 10/10/06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewUISampleViewController;

@interface TableViewUISampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *viewController;

@end

