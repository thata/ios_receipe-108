    //
//  MeatDayCalendarViewController.m
//  Calendar
//
//  Created by hatakeyama takashi on 10/09/25.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MeatDayCalendarViewController.h"


@implementation MeatDayCalendarViewController

// 選択した期間内でのドットマークの有無を返す
- (NSArray*) calendarMonthView:(TKCalendarMonthView*)monthView 
                 marksFromDate:(NSDate*)startDate 
                        toDate:(NSDate*)lastDate{
    NSMutableArray *marks = [NSMutableArray array];
    
    NSDate *d = startDate;
    while (YES) {
        // 終了判定
        if ([d compare:lastDate] == NSOrderedDescending) {
            break;
        }
        
        TKDateInformation dateInfo = [d dateInformation];
        
        // 今日が29日の場合はYESを、違う場合にはNOをセットする
        if (dateInfo.day == 29) {
            [marks addObject:[NSNumber numberWithBool:YES]];
        } else {
            [marks addObject:[NSNumber numberWithBool:NO]];
        }
        
        // 日付を1日すすめる
        dateInfo.day++;
        d = [NSDate dateFromDateInformation:dateInfo];
    }
    
    return marks;
}

// カレンダー上の日付を選択した場合、カレンダー下部のテーブルをリロードする
- (void) calendarMonthView:(TKCalendarMonthView*)monthView 
             didSelectDate:(NSDate*)d{
    [self.tableView reloadData];
}

// 月を移動した場合、カレンダー下部のテーブルをリロードする
- (void) calendarMonthView:(TKCalendarMonthView*)mv 
            monthDidChange:(NSDate*)d{
    [self.tableView reloadData];
}

// カレンダーテーブルのセクション数を返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // セクション数は常に1
    return 1;
}

// カレンダーテーブルの行数を返す
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    // 肉の日であれば1を、そうでなければ0を返す
    NSDate *d = [monthView dateSelected];
    TKDateInformation dateInfo = [d dateInformation];
    if (dateInfo.day == 29) {
        return 1;
    } else {
        return 0;
    }
}

// 選択した日のメモの書かれたセルを返す
- (UITableViewCell *)tableView:(UITableView *)tv 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = 
        [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
        cell = [[[UITableViewCell alloc] 
                 initWithFrame:CGRectZero 
                 reuseIdentifier:CellIdentifier] autorelease];
    
    // 現在選択している日付が29日の場合はテーブルに「肉の日」と表示する
    NSDate *d = [monthView dateSelected];
    TKDateInformation dateInfo = [d dateInformation];
    if (dateInfo.day == 29) {
        cell.textLabel.text = @"肉の日";
    } else {
        cell.textLabel.text = @"";
    }
    
    return cell;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
