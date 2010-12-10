//
//  FileManagerSampleViewController.m
//  FileManagerSample
//
//  Created by kzsg on 10/09/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FileManagerSampleViewController.h"

@implementation FileManagerSampleViewController

-(void)viewDidLoad {
	[super viewDidLoad];
	
	NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
	NSString* filePath = [bundlePath stringByAppendingPathComponent:@"temp.txt"];
	[[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
}

- (IBAction)save {
	NSFileHandle* handle;
	@try {
		NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
		NSString *filePath = [bundlePath stringByAppendingPathComponent:@"temp.txt"];
		NSLog(@"file path: %@", filePath);
		handle = [NSFileHandle fileHandleForWritingAtPath:filePath];
		[handle writeData:[textView.text dataUsingEncoding:NSUTF8StringEncoding]];
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"お知らせ"
							  message:@"保存しました"
							  delegate:self
							  cancelButtonTitle:nil
							  otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
	} @finally {
		[handle closeFile];
	}
}

- (IBAction)load {
	NSFileHandle* handle;
	@try {
		NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
		NSString *filePath = [bundlePath stringByAppendingPathComponent:@"temp.txt"];
		NSLog(@"file path: %@", filePath);
		handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
		NSData *data = [handle readDataToEndOfFile];
		NSLog(@"dataLength :%d", [data length]);
		NSString *string = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
		textView.text = string;
		NSLog(@"load text: %@", string);
	} @finally {
		[handle closeFile];
	}
}

- (IBAction)reset {
	textView.text = @"";
}

- (void)saveData {

}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
