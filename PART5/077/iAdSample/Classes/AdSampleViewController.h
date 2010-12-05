//
//  AdSampleViewController.h
//  AdSample
//
//  Created by kzsg on 10/08/31.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface AdSampleViewController : UIViewController <ADBannerViewDelegate> {

	ADBannerView *bannerView;
}

@property(retain, nonatomic) ADBannerView *bannerView;

@end

