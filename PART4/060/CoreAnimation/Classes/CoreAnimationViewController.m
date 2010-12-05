//
//  CoreAnimationViewController.m
//  CoreAnimation
//
//  Created by 森田秀幸 on 10/08/16.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CoreAnimationViewController.h"

@implementation CoreAnimationViewController



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

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID isEqualToString:@"button animation"]) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        animationButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
        animationButton.alpha = 1.0;
        [UIView commitAnimations];
    }
}

- (IBAction)startAnimation:(id)sender {
	// [UIView beginAnimations:@"button animation" context:nil];
	// [UIView setAnimationDuration:0.5];
    // [UIView setAnimationDelay:0.5];
    // [UIView setAnimationRepeatCount:2.0];
    // [UIView setAnimationDelegate:self];
    // [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	// animationButton.transform = CGAffineTransformMakeScale(2.0, 2.0);
    // animationButton.alpha = 0.5;
	// [UIView commitAnimations];

    [UIView animateWithDuration:0.5
                     animations:^{
                         // animationButton.transform = CGAffineTransformMake(2.0, 0.0, 0.0, 2.0, 0.0, 0.0);
                         animationButton.transform = CGAffineTransformMakeScale(2.0, 2.0);
                         // animationButton.transform = CGAffineTransformMakeRotation(3.14);
                         // animationButton.transform = CGAffineTransformMakeTranslation(20.0, 20.0);
                         
                         animationButton.alpha = 0.5;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.5
                                          animations:^{
                                               animationButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                               animationButton.alpha = 1.0;
                                           }
                          ];
                     }
     ];
}

- (void)dealloc {
    [super dealloc];
}

@end
