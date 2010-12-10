//
//  TableViewSampleViewController.m
//  TableViewSample
//
//  Created by kzsg on 10/09/11.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableViewSampleViewController.h"

@implementation TableViewSampleViewController

@synthesize keys, items;

- (void)dealloc {
	self.items = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style {
	if ((self = [super initWithStyle:style])) {
		// テーブルのタイトル
		self.title = @"テーブル";
		self.navigationItem.rightBarButtonItem = [self editButtonItem];
	}
	return self;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return (NSString*)[keys objectAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [keys count];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	NSString* key = [keys objectAtIndex:section];
	return [[items objectForKey:key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
	NSString* key = [keys objectAtIndex:indexPath.section];
	NSArray* array = [items objectForKey:key];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



@end
