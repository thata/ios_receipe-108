//
//  MapViewSampleViewController.m
//  MapViewSample
//
//  Created by kzsg on 10/02/14.
//

#import "MapViewSampleViewController.h"
@class Annontation;

@implementation MapViewSampleViewController

@synthesize locationManager, rgCoder, placemark_;

- (void)dealloc {
	[placemark_ release];
	[rgCoder release];
	[locationManager release];
    [super dealloc];
}

- (void)loadView {
	CGRect rect = [[UIScreen mainScreen] applicationFrame];
	MKMapView *mapView = [[[MKMapView alloc] initWithFrame:rect] autorelease];
	self.view = mapView;
	mapView.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	MKMapView *mapView = (MKMapView *) self.view;
	MKCoordinateRegion newRegion = {{35.658639,139.745445}, {0.01, 0.01}};
	[mapView setRegion:newRegion];
	
	NSLog(@"start reverce geocoding...");
	self.rgCoder = [[[MKReverseGeocoder alloc]   
					 initWithCoordinate:mapView.centerCoordinate]  
					autorelease];
	rgCoder.delegate = self;
	[rgCoder start];
}


////
// MKMapViewDelegate mothod.
//
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	NSLog(@"viewForAnnotation...delegate invoke.");
    if (annotation == mapView.userLocation) {
        return nil;
    }
    MKPinAnnotationView *pinView = (MKPinAnnotationView *) 
    [mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if (pinView == nil) {
        pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"] autorelease];
    } else {
        pinView.annotation = annotation;
    }
    pinView.pinColor = MKPinAnnotationColorRed;
    pinView.animatesDrop = YES;
    pinView.canShowCallout = YES;
    return pinView;
}


////
// CoreLocationDelegate method.
//
// 位置情報の測定に成功した際に実行されるCLLoctionManagerDelegateのメソッド
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	printf("現在地 緯度：%f 経度：%f\n", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
	MKMapView *mapview = (MKMapView *)self.view;
	[mapview setCenterCoordinate:newLocation.coordinate animated:YES];
	[locationManager stopUpdatingLocation];
}

// 測定に失敗した際に実行されるCLLoctionManagerDelegateのメソッド
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	NSLog(@"位置情報の更新に失敗しました。:%@", [error localizedDescription]);
	[locationManager stopUpdatingLocation];
}



//// 
// MKReverseGeocoderDelegate method.
//
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error {
	NSLog(@"did fail with error xxxxxxx!");
	NSLog(@"%@", [error description]);
	[rgCoder cancel];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark {
	NSLog(@"did finish placemark ooooooo!");
	self.placemark_ = placemark;
	MKMapView *mapView = (MKMapView *)self.view;
	[mapView removeAnnotations:[mapView annotations]];
	[mapView addAnnotation:self.placemark_];
	
	MKPlacemark *pm = placemark;
	
	//MKPlacemarkのプロパティーを出力
	NSLog(@"MKPlacemark出力 thoroughfare=%@ subThoroughfare=%@ locality=%@ subLocality=%@ administrativeArea=%@ subAdministrativeArea=%@ postalCode=%@ country=%@ countryCode=%@",
		  pm.thoroughfare, pm.subThoroughfare, pm.locality, pm.subLocality,
		  pm.administrativeArea, pm.subAdministrativeArea, pm.postalCode,
		  pm.country, pm.countryCode);
	
	//より詳細な住所はMKPlacemark.addressDictionaryに隠されている
	NSDictionary *dict = pm.addressDictionary;
	for (id key in dict) {
	 NSLog(@"key=%@ value=%@", key, [dict objectForKey:key]);
	}
	
	//FormattedAddressLinesを一行の文字列に連結
	//ドキュメントには明記されているところが見当たらないがFormattedAddressLinesは配列で返って来るらしい
	NSString *line = @"";	
	NSArray *lines = [dict valueForKey:@"FormattedAddressLines"];
	for (int i = 0; i < lines.count; i++) {
		line = [line stringByAppendingFormat:@"%@ ", [lines objectAtIndex:i]];
	}
	
	//上で出力したプロパティーと比較して、こちらにだけ存在する情報があるとわかる
	//（郵便番号や住所の末尾「-3」）
	NSLog(@"%@:FormattedAddressLines出力 lines.count=%d", line, lines.count);
	
	[rgCoder cancel];
}


@end




// アノテーションクラス
@interface Annontation : NSObject <MKAnnotation>
{
	CLLocationCoordinate2D coordinate;
}
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (NSString *)subtitle;
- (NSString *)title;

@end

@implementation Annontation

@synthesize coordinate;

- (id)initWithLatitude:(CLLocationDegrees) latitude longitude:(CLLocationDegrees) longitude {
	self = [super init];
	coordinate.latitude = latitude;
	coordinate.longitude = longitude;
	return self;
}

- (NSString *)subtitle {
	return @"";
}

- (NSString *)title {
	return @"";
}

@end


