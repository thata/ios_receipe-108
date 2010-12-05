//
//  CoreLocationSampleViewController.h
//  CoreLocationSample
//
//  Created by kzsg on 10/07/11.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CoreLocationSampleViewController : UIViewController <CLLocationManagerDelegate> {
	CLLocationManager *clmanager;
}

@end

