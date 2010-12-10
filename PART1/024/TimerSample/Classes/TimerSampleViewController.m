//
//  TimerSampleViewController.m
//  TimerSample
//
//  Created by kzsg on 10/12/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TimerSampleViewController.h"

@implementation TimerSampleViewController

@synthesize timer, num;

- (void)stopTimer {
	[timer invalidate];
	NSLog(@"stop timer.");
}

- (void)increaseNumber:(NSTimer *)theTimer {
	NSNumber *multiple = [[theTimer userInfo] objectForKey:@"multiple"];
	if (num <= 0) {
		num = 1;
	}
	num = num * [multiple integerValue];
	label.text = [[NSNumber numberWithInt:num] stringValue];
	NSLog(@"num = %@", label.text);
}

- (IBAction)start {
	num = 0;
	label.text = [[NSNumber numberWithInt:num] stringValue];
	NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
	[userInfo setObject:[NSNumber numberWithInteger:2] forKey:@"multiple"];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
												  target:self
												selector:@selector(increaseNumber:)
												userInfo:userInfo
												 repeats:YES];
	NSLog(@"タイマーを起動しました");
}

- (IBAction)stop {
	[self.timer invalidate];
	NSLog(@"タイマーを停止しました");
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	self.timer = nil;
}

@end
