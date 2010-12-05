//
//  AdSampleViewController.m
//  AdSample
//
//  Created by kzsg on 10/08/31.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AdSampleViewController.h"

@implementation AdSampleViewController

@synthesize bannerView;

- (void)viewDidLoad {
    [super viewDidLoad];
	ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
	adView.delegate = self;
	self.bannerView = adView;
	adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
	adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
	adView.backgroundColor = [UIColor greenColor];
	[self.view addSubview:adView];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
		self.bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier480x32;
	} else {
		self.bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
	}
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
	NSLog(@"iAdの読み込み成功.");;
}

// iAdはiPhone実機でのみ動作します。
// 実機で動作させるためにはデベロッパープログラムへの加入が必要です。
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
	[UIView beginAnimations:@"animateAdBannerOff" context:NULL];
	banner.frame = CGRectOffset(banner.frame, 0, -50);
	[UIView commitAnimations];
	NSLog(@"load iAd failed.error:%@", [error description]);
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
	
	NSLog(@"Banner view is beginning an ad action");
	BOOL shouldExecuteAction = YES;
	if (!willLeave && shouldExecuteAction) {
		// ここにコードを挿入して、広告と競合する可能性のあるサービスを保留する
	}
	NSLog(@"willLeave=%d, shoudExecueAction=%d", willLeave,shouldExecuteAction);
	return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
	NSLog(@"iAdから復帰.");
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
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
