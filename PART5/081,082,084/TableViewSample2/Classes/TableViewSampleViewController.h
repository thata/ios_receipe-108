//
//  TableViewSampleViewController.h
//  TableViewSample
//
//  Created by kzsg on 10/09/11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewSampleViewController : UITableViewController {
	NSArray* keys;
	NSMutableDictionary* items;
}
@property(retain, nonatomic) NSArray* keys;
@property(retain, nonatomic) NSMutableDictionary* items;

@end

