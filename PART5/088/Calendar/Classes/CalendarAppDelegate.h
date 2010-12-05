//
//  CalendarAppDelegate.h
//  Calendar
//
//  Created by hatakeyama takashi on 10/09/25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeatDayCalendarViewController;

@interface CalendarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MeatDayCalendarViewController *meatDayCalendarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

