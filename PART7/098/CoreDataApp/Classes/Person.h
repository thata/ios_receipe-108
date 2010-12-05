//
//  Person.h
//  CoreDataApp
//
//  Created by hatakeyama takashi on 10/09/25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Person :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;

@end



