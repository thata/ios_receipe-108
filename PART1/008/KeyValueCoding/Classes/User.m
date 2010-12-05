//
//  User.m
//  KVONotifying
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "User.h"

@implementation User

- (void)dealloc {
    [name release];
    [super dealloc];
}

@end
