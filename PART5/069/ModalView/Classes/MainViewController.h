//
//  MainViewController.h
//  ModalView
//
//  Created by hatakeyama takashi on 10/09/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookmarkViewController.h"

@interface MainViewController : UIViewController <BookmarkViewDelegate> {
    UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
