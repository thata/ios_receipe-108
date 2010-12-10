//
//  FileManagerSampleAppDelegate.h
//  FileManagerSample
//
//  Created by kzsg on 10/09/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FileManagerSampleViewController;

@interface FileManagerSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FileManagerSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FileManagerSampleViewController *viewController;

@end

