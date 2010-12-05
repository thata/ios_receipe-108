//
//  PlayBGMViewController.m
//  PlayBGM
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PlayBGMViewController.h"

@implementation PlayBGMViewController



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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)initPlayer {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] 
                                         pathForResource:@"BGM" 
                                         ofType:@"aif"]];
    NSError *error = nil;
    
    // playerはAVAudioPlayer*型のインスタンス変数
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if (error) {
        // NSLog(@"error");
    }
    
    player.numberOfLoops = 1;
    player.volume = 0.3;
}

- (IBAction)playBGM:(id)sender {
    [player play];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPlayer];
}

- (void)dealloc {
    [player dealloc];
    [super dealloc];
}

@end
