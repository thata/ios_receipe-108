//
//  KVOObservingViewController.m
//  KVOObserving
//
//  Created by 森田秀幸 on 10/06/19.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "KVOObservingViewController.h"
#import "User.h"

@implementation KVOObservingViewController



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
    [super viewDidLoad];
    
    User* user = [[[User alloc] init] autorelease];
    
    [user addObserver:self
           forKeyPath:@"name" 
              options:(NSKeyValueObservingOptionNew |
                       NSKeyValueObservingOptionOld)
              context:NULL];
    
    user.name = @"alice";
    
    [user removeObserver:self forKeyPath:@"name"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object 
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqual:@"name"]) {
        NSLog(@"a user's name changed: '%@'", ((User*)object).name);
    }
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
