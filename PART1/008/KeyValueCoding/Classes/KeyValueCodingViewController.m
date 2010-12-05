//
//  KeyValueCodingViewController.m
//  KeyValueCoding
//
//  Created by 森田秀幸 on 10/06/20.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "KeyValueCodingViewController.h"
#import "Application.h"

@implementation KeyValueCodingViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    Application* application = [[[Application alloc] init] autorelease];
    User* user = [[[User alloc] init] autorelease];
    
    [user setValue:@"alice" forKey:@"name"];
    [application setValue:user forKey:@"user"];
    
    NSLog(@"valueForKey: '%@'", [user valueForKey:@"name"]);
    NSLog(@"valueForKeyPath: '%@'", [application valueForKeyPath:@"user.name"]);
    
    [application setValue:@"bob" forKeyPath:@"user.name"];
    NSLog(@"valueForKeyPath after [setValue:forKeyPath:] : '%@'", [application valueForKeyPath:@"user.name"]);
    
    [super viewDidLoad];
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
