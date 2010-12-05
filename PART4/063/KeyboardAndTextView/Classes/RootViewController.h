//
//  RootViewController.h
//  KeyboardAndTextView
//
//  Created by hatakeyama takashi on 10/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController {
    UITextView *textView;
}
@property (nonatomic, retain) IBOutlet UITextView *textView;

- (IBAction)doneButtonDidPress;
@end
