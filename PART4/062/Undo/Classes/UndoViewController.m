//
//  UndoViewController.m
//  Undo
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "UndoViewController.h"

@implementation UndoViewController

@synthesize undoManager;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self resignFirstResponder];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
        
    NSUndoManager *anUndoManager = [[[NSUndoManager alloc] init] autorelease];
    self.undoManager = anUndoManager;
    
    schedules = [[NSMutableArray alloc] init];
    
    NSNotificationCenter *dnc = [NSNotificationCenter defaultCenter];
    [dnc addObserver:self selector:@selector(undoManagerDidUndo:)
               name:NSUndoManagerDidUndoChangeNotification object:self.undoManager];
    [dnc addObserver:self selector:@selector(undoManagerDidRedo:)
               name:NSUndoManagerDidRedoChangeNotification object:self.undoManager];
}

- (void)reloadScheduleTable {
    NSMutableString *scheduleTable = [NSMutableString string];
    for (NSDate* date in schedules) {
        [scheduleTable appendFormat:@"%@: 予定あり\n", [date description]];
    }
    textView.text = scheduleTable;
}

- (void)undoManagerDidUndo:(NSNotification *)notification {
    [self reloadScheduleTable];
}

- (void)undoManagerDidRedo:(NSNotification *)notification {
    [self reloadScheduleTable];
}
     
- (IBAction)addScheduleAction:(id)sender {
    NSDate* date = datePicker.date;
    [self pushSchedule:date];
    [self reloadScheduleTable];
}

- (void)pushSchedule:(NSDate*)date {
    [schedules addObject:date];
        
    [self.undoManager registerUndoWithTarget:self selector:@selector(popSchedule:) object:date];
    if (![self.undoManager isUndoing]) {
       [self.undoManager setActionName:@"add schedule"];
    }
}

- (void)popSchedule:(NSDate*)date {
    [schedules removeLastObject];
    
    [self.undoManager registerUndoWithTarget:self selector:@selector(pushSchedule:) object:date];
    if (![self.undoManager isUndoing]) {
        [self.undoManager setActionName:@"remove schedule"];
    }    
}

- (void)dealloc {
    [schedules release];
    [undoManager release];
    [super dealloc];
}

@end
