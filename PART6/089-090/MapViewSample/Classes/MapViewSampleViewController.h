//
//  MapViewSampleViewController.h
//  MapViewSample
//
//  Created by kzsg on 10/02/14.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewSampleViewController : UIViewController <MKMapViewDelegate, MKReverseGeocoderDelegate, CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	MKReverseGeocoder *rgCoder;
	MKPlacemark *placemark_;
}
@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, retain) MKReverseGeocoder *rgCoder;
@property(nonatomic, retain) MKPlacemark *placemark_;
@end

