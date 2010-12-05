//
//  User.h
//  KVONotifying
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface User : NSObject {
    NSString* name;
    NSMutableArray* friends;
}

- (void)pushFriend:(NSString *)theFriend;
- (NSString*)popFriend;

@property(nonatomic, retain) NSString* name;
@property(nonatomic, retain) NSMutableArray* friends;

@end
