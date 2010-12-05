//
//  MainViewController.m
//  ModalView
//
//  Created by hatakeyama takashi on 10/09/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "BookmarkViewController.h"

@implementation MainViewController

@synthesize webView;

#pragma mark BookmarkViewDelegate

// ブックマーク画面でサイトを選択したあとの処理を記述する
- (void)dismissModalAndReturnURL:(NSURL *)url {
    // 渡されたURLのページをブラウザでひらく
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    // モーダルビューを閉じる
    [self.modalViewController dismissModalViewControllerAnimated:YES];
}

#pragma mark イベントハンドラ

- (void)bookmarkDidPress {
    // ブックマーク一覧を生成
    BookmarkViewController *bookmarkVC = 
        [[BookmarkViewController alloc]
         initWithNibName:@"BookmarkViewController" 
         bundle:nil];
    // ブックマークを選択したときに呼び出されるデリゲートとして自身をセット(後述します)
    bookmarkVC.delegate = self;
    // ブックマーク画面をモーダルビューとして表示
    [self presentModalViewController:bookmarkVC animated:YES];
    // ブックマーク一覧をリリース
    [bookmarkVC release];
}

#pragma mark ビューコントローラ

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
    
    UIBarButtonItem *bookmarkButton = [[UIBarButtonItem alloc] 
                                       initWithTitle:@"Bookmark" 
                                       style:UIBarButtonItemStylePlain 
                                       target:self 
                                       action:@selector(bookmarkDidPress)];
    self.navigationItem.rightBarButtonItem = bookmarkButton;
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
    [webView release];
    [super dealloc];
}


@end
