//
//  Customer.h
//  DynamicMethodCall
//
//  Created by 森田秀幸 on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Customer : NSObject {
    NSString *name;
    NSString *job;
}

- (void)setName:(NSString *)name job:(NSString *)job;

@property(retain, nonatomic) NSString *name;
@property(retain, nonatomic) NSString *job;

@end
