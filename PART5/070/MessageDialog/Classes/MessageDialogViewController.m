//
//  MessageDialogViewController.m
//  MessageDialog
//
//  Created by 森田秀幸 on 10/08/14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MessageDialogViewController.h"

@implementation MessageDialogViewController



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

- (IBAction)showAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"Alert"
                          message:@"シンプルなアラートを表示します。"
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];	
    [alert release];    
}

- (void)alertView:(UIAlertView *)alertView
        clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            // cancelButtonTitleのインデックス値は0
            NSLog(@"Cancel");
            break;
        case 1:
            // otherButtonTitlesのインデックス値は1から始まる
            NSLog(@"YES");
            break;
        case 2:
            NSLog(@"NO");
            break;            
        default:
            NSLog(@"Error");
            break;
    }
}

- (IBAction)showYesNoCancelAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"Alert"
                          message:@"複雑なアラートを表示します。"
                          // selfはUIAlertViewDelegateを実装している。
                          delegate:self 
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"YES", @"NO", nil];
    [alert show];	
    [alert release];
}

- (void)confirmActionSheet:(UIActionSheet *)actionSheet
        clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            // destructiveButtonTitleのインデックス値は0
            NSLog(@"影響の大きい動作");
            break;
        case 1:
            // otherButtonTitlesが指定されていないため、
            // cancelButtonTitleのインデックス値は1
            NSLog(@"Cancel");
            break;
        default:
            NSLog(@"Error");
            break;
    }
}

- (IBAction)confirmAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"影響の多い動作を行いますか?"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:@"影響の多い動作を実行"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
}

- (void)selectActionSheet:(UIActionSheet *)actionSheet
     clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            // otherButtonTitlesのインデックス値は0から始まる
            NSLog(@"動作1");
            break;
        case 1:
            NSLog(@"動作2");
            break;
        case 2:
            NSLog(@"動作3");
            break;
        case 3:
            // cancelButtonTitleのインデックス値は、
            // otherButtonTitlesの最後のインデックス値+1
            NSLog(@"Cancel");
            break;
        default:
            NSLog(@"Error");
            break;
    }
}

- (IBAction)selectAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"先の動作を選択してください"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"動作1", @"動作2", @"動作3", nil];
    [actionSheet showInView:self.view];
    [actionSheet release];    
}

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([actionSheet.title isEqualToString:@"影響の多い動作を行いますか?"]) {
        [self confirmActionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    } else {
        [self selectActionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    }
    
}

- (void)dealloc {
    [super dealloc];
}

@end
