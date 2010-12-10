//
//  EditableTableView.h
//  TableViewSample
//
//  Created by kzsg on 10/09/12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EditableTableViewController : UITableViewController {
	NSMutableArray* items;
	NSMutableArray* images;
}
@property(retain, nonatomic) NSMutableArray* items;
@property(retain, nonatomic) NSMutableArray* images;

@end
