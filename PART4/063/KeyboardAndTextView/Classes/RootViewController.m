//
//  RootViewController.m
//  KeyboardAndTextView
//
//  Created by hatakeyama takashi on 10/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize textView;

#pragma mark KeyboardNotifications

// キーボードが表示された時に呼び出される
- (void)keyboardWasShown:(NSNotification *)aNotification {    
    NSDictionary* info = [aNotification userInfo];

    // キーボードのサイズを取得
    NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey]; 
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    //TextViewとキーボードが重ならないようにTextViewの枠を縮める
    CGRect frame = [textView frame];
    frame.size.height -= keyboardSize.height;
    [textView setFrame:frame];
}

// キーボードが非表示になった時に呼び出される
- (void)keyboardWasHidden:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    
    // キーボードのサイズを取得
    NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey]; 
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    //TextViewを元のサイズに戻す
    CGRect frame = [textView frame];
    frame.size.height += keyboardSize.height;
    [textView setFrame:frame];
}

#pragma mark UIViewController

// Doneボタンが押されたらテキストビューの編集を終える
- (IBAction)doneButtonDidPress {
    [textView resignFirstResponder];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    // UIKeyboardDidShowNotificationとUIKeyboardDidHideNotificationの通知を
    // 受け取るように設定
    [[NSNotificationCenter defaultCenter] 
     addObserver:self 
     selector:@selector(keyboardWasShown:) 
     name:UIKeyboardDidShowNotification 
     object:nil];
    
    [[NSNotificationCenter defaultCenter] 
     addObserver:self 
     selector:@selector(keyboardWasHidden:) 
     name:UIKeyboardDidHideNotification 
     object:nil];
    
	// ナビゲーションバーへDoneボタンを表示
    UIBarButtonItem *doneButton;
    doneButton = [[UIBarButtonItem alloc]
                  initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
                  target:self 
                  action:@selector(doneButtonDidPress)];

    self.navigationItem.rightBarButtonItem = doneButton;
    
    [doneButton release];
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
    [textView release];
    [super dealloc];
}


@end
