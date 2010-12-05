//
//  UndoViewController.h
//  Undo
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UndoViewController : UIViewController {
    NSMutableArray *schedules;
    NSUndoManager *undoManager;
    IBOutlet UITextView* textView;
    IBOutlet UIDatePicker* datePicker;
}

@property (retain) NSUndoManager *undoManager;

- (IBAction)addScheduleAction:(id)sender;
- (void)pushSchedule:(NSDate*)date;
- (void)popSchedule:(NSDate*)date;

@end

