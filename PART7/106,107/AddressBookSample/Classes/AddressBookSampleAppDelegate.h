//
//  AddressBookSampleAppDelegate.h
//  AddressBookSample
//
//  Created by kzsg on 10/08/24.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddressBookSampleViewController;

@interface AddressBookSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AddressBookSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AddressBookSampleViewController *viewController;

@end

