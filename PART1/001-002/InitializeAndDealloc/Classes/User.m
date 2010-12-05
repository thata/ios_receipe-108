//
//  User.m
//  Initialize
//
//  Created by 森田秀幸 on 10/07/09.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize name;

- (id)init {                   // ... (1)
	if (self = [super init]) { // ... (2)
		self.name = @"";       // ... (3)
	}
	return self;               // ... (4)
}

- (void)dealloc {    // ... (1)
    [name release];  // ... (2)
    [super dealloc]; // ... (3)
}

@end
