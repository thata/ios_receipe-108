//
//  TableViewUISampleViewController.m
//  TableViewUISample
//
//  Created by kzsg on 10/10/06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableViewUISampleViewController.h"

@implementation TableViewUISampleViewController

@synthesize items, details;

- (void)dealloc {
	self.items = nil;
	[super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style {
	if ((self = [super initWithStyle:style])) {
		// テーブルビューの初期化をここで行う
		self.title = @"テーブル";
		//self.tableView.rowHeight = 100.0;
		//self.tableView.backgroundColor = [UIColor grayColor];
		self.tableView.backgroundColor = [UIColor clearColor];
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	}
	return self;
}

// テーブルビューに表示する行数を返す
- (NSInteger)tableView:(UITableView *)table 
 numberOfRowsInSection:(NSInteger)section {
	return [items count];
}

// テーブルに表示するセルを返す
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *identifier = @"identifier";
	UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:identifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				// 詳細なラベルを表示する場合はSubtitleの方を使う
				// initWithStyle:UITableViewCellStyleSubtitle
				initWithStyle:UITableViewCellStyleDefault
				 reuseIdentifier:identifier] 
				autorelease];
				// セルの背景を追加する
				// UIImage *cellbg = [UIImage imageNamed:@"cellbg.png"]; 
				// UIImageView *backgroudView = 
				// [[[UIImageView alloc] initWithImage:cellbg] autorelease];
				// cell.backgroundView = backgroudView;		
	}
	cell.textLabel.text = [items objectAtIndex:indexPath.row];
	// 詳細な情報を表示するためのラベルに文字列をセット
	// cell.detailTextLabel.text = @"detail text...";
	// cell.detailTextLabel.numberOfLines = 2;
	return cell;
}

// セルが選択されたときに実行されるメソッド
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *key = [items objectAtIndex:indexPath.row];
	NSMutableArray *array = [details objectForKey:key];
	
	// セルをグループピングして表示するテーブルビュー作成する
	TableViewUISampleViewController *viewController =
	[[[TableViewUISampleViewController alloc]
	  initWithStyle:UITableViewStyleGrouped]
	 autorelease];
	viewController.items = array;
	viewController.title = key;
	[self.navigationController pushViewController:viewController animated:YES];
}


@end
