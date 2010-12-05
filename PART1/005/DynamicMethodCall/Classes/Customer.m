//
//  Customer.m
//  DynamicMethodCall
//
//  Created by 森田秀幸 on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Customer.h"


@implementation Customer

@synthesize name;
@synthesize job;

- (void)setName:(NSString *)aName job:(NSString *)aJob {
    self.name = aName;
    self.job = aJob;
}

- (void)dealloc {
    [name release];
    [job release];
    [super dealloc];
}

@end
