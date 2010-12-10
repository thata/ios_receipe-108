//
//  EditableTableView.m
//  TableViewSample
//
//  Created by kzsg on 10/09/12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EditableTableViewController.h"


@implementation EditableTableViewController

@synthesize items, images;

- (void)dealloc {
	self.items = nil;
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style {
	if ((self = [super initWithStyle:style])) {
		// テーブルのタイトル
		self.title = @"テーブル";
		self.navigationItem.rightBarButtonItem = [self editButtonItem];
		self.tableView.rowHeight = 100.0;
		//self.tableView.backgroundColor = [UIColor blackColor];
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	}
	return self;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
											forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (UITableViewCellEditingStyleDelete == editingStyle) {
		[items removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
						 withRowAnimation:UITableViewRowAnimationRight];
	} else if (UITableViewCellEditingStyleInsert == editingStyle) {
		[items insertObject:@"新しいデータ" atIndex:items.count-1];
		[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
	}
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (tableView.editing && indexPath.row >= items.count-1) {
		return UITableViewCellEditingStyleInsert;
	} else {
		return UITableViewCellEditingStyleDelete;
	}
}

// オーバーライド
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	if (editing) {
		// 編集モードになったら、"新規追加"の行を挿入
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:items.count inSection:0];
		[items addObject:@"新規作成"];
		[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
	} else {
		// 編集モードから抜けたら、挿入していた行を削除
		NSIndexPath* indexPath = [NSIndexPath indexPathForRow:items.count-1 inSection:0];
		[items removeLastObject];
		[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
						 withRowAnimation:UITableViewRowAnimationLeft];
	}
	[super setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	//
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
	//
}


- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
    }
	
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
	cell.textLabel.textColor = [UIColor blueColor];
	cell.textLabel.font = [UIFont systemFontOfSize:32.0];
	cell.textLabel.textAlignment = UITextAlignmentRight;
	
	//cell.detailTextLabel.text = @"詳細な情報をここに表示することができます。";
	cell.detailTextLabel.font = [UIFont systemFontOfSize:24.0];
	cell.detailTextLabel.numberOfLines = 2;
	
	if (indexPath.row < [images count]) {
		cell.imageView.image = [images objectAtIndex:indexPath.row];
	} else {
		cell.detailTextLabel.text = @"";
	}
	
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

- (void)viewDidload {
	[super viewDidLoad];

	//self.tableView.
	NSLog(@"viewDidLoad");
}



@end

