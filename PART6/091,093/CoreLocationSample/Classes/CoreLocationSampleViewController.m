//
//  CoreLocationSampleViewController.m
//  CoreLocationSample
//
//  Created by kzsg on 10/07/11.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CoreLocationSampleViewController.h"

@implementation CoreLocationSampleViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	clmanager = [[CLLocationManager alloc] init];
	clmanager.delegate = self;
	clmanager.headingFilter = 10.0;
	//if (!clmanager.headingAvailable) { // iOS4.0よりも前のSDKではこちらを使う
	if (![CLLocationManager headingAvailable]) {
		UIAlertView *alert =
		[[[UIAlertView alloc] initWithTitle:@"お知らせ"
									message:@"位置情報サービスを利用できません"
								   delegate:self
						  cancelButtonTitle:@"確認"
						  otherButtonTitles:nil] autorelease];
		[alert show];
		NSLog(@"位置情報サービスを利用できません.");
		return;
	}
	NSLog(@"start update heading...");
	[clmanager startUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
	NSLog(@"heading : %f", newHeading.trueHeading);
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager {
	NSLog(@"locationManagerShouldDisplayHeadingCalibration");
	return YES;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	NSLog(@"error . detail=%@", [error description]);
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
	[clmanager release];
    [super dealloc];
}

@end
