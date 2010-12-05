//
//  MessageDialogViewController.h
//  MessageDialog
//
//  Created by 森田秀幸 on 10/08/14.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageDialogViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate> {

}

- (IBAction)showAlert:(id)sender;
- (IBAction)showYesNoCancelAlert:(id)sender;
- (IBAction)confirmAction:(id)sender;
- (IBAction)selectAction:(id)sender;

@end

