//
//  TableViewUISampleViewController.h
//  TableViewUISample
//
//  Created by kzsg on 10/10/06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewUISampleViewController : UITableViewController {
	// テーブルに表示する値を保持するNSArray
	NSMutableArray *items;
	NSMutableDictionary *details;
}
@property(retain, nonatomic) NSMutableArray *items;
@property(retain, nonatomic) NSMutableDictionary *details;

@end


