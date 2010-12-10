//
//  FileManagerSampleViewController.h
//  FileManagerSample
//
//  Created by kzsg on 10/09/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileManagerSampleViewController : UIViewController {
	IBOutlet id saveButton;
	IBOutlet id loadButton;
	IBOutlet id resetButton;
	IBOutlet UITextView *textView;
}
- (IBAction)save;
- (IBAction)load;
- (IBAction)reset;

@end

