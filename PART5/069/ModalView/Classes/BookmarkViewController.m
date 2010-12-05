//
//  BookmarkViewController.m
//  ModalView
//
//  Created by hatakeyama takashi on 10/09/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BookmarkViewController.h"

@implementation BookmarkViewController

@synthesize delegate;

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView 
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [sites objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)table 
        numberOfRowsInSection:(NSInteger)section {
    return [sites count];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView 
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択したサイトに応じたURLを取得
    NSURL *url = [NSURL URLWithString:[urls objectAtIndex:indexPath.row]];
    // 選択したURLをもとにdelegateへ処理を委譲する
    [delegate dismissModalAndReturnURL:url];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    sites = [[NSArray alloc] initWithObjects:@"Google", 
             @"Amazon", 
             @"Apple", 
             nil];
    urls = [[NSArray alloc] initWithObjects:@"http://google.com/",
            @"http://amazon.com/",
            @"http://apple.com/",
            nil];
}

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
    [urls release];
    [sites release];
    [super dealloc];
}


@end
