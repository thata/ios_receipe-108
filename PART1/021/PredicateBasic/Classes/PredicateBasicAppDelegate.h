//
//  PredicateBasicAppDelegate.h
//  PredicateBasic
//
//  Created by hatakeyama takashi on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface User : NSObject
{
    NSString *name;
    NSInteger age;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSInteger age;

- (id)initWithName:(NSString *)newName age:(NSInteger)newAge;

@end

@interface PredicateBasicAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

