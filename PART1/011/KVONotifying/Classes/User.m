//
//  User.m
//  KVONotifying
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name;
@synthesize friends;

- (id)init {
    if(self = [super init]){
        friends = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)keyName {
    if ([keyName isEqualToString:@"name"]) {
        return NO;
    }
    
    return [super automaticallyNotifiesObserversForKey:keyName];
}

- (void)setName:(NSString *)theName {
    if (theName != name) {
        [self willChangeValueForKey:@"name"];
        name = theName;
        [self didChangeValueForKey:@"name"];
    }
}

- (void)pushFriend:(NSString *)theFriend {
    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:[friends count]];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexSet forKey:@"friends"];
    [friends insertObjects:[NSArray arrayWithObject:theFriend] atIndexes:indexSet];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexSet forKey:@"friends"];
}

- (NSString*)popFriend {
    if ([friends count] < 1) {
        return nil;
    }

    NSString* popedFriend = [friends lastObject];

    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndex:([friends count] - 1)];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexSet forKey:@"friends"];
    [friends removeObjectsAtIndexes:indexSet];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexSet forKey:@"friends"];

    return popedFriend;
}

- (void)dealloc {
    [name release];
    [friends release];
    [super dealloc];
}

@end
