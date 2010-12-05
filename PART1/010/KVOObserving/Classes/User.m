//
//  User.m
//  KVOObserving
//
//  Created by 森田秀幸 on 10/06/19.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name;

- (void)dealloc {
    [name release];
    [super dealloc];
}

@end
