//
//  TimerSampleViewController.h
//  TimerSample
//
//  Created by kzsg on 10/12/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerSampleViewController : UIViewController {
	IBOutlet id startButton;
	IBOutlet id stopButton;
	IBOutlet UILabel *label;
	NSTimer *timer;
	NSUInteger num;
}
@property (nonatomic, retain) NSTimer *timer;
@property NSUInteger num;



- (IBAction)start;
- (IBAction)stop;

@end

