//
//  MapViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/14.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "MapViewController.h"
#import "MAMapKit.h"
#import <AMapFoundationKit/AMapFoundationKit.h>

#import <AMapLocationKit/AMapLocationKit.h>

#import "CallOutView.h"
static NSString * const MapKey = @"8421f13f7a017e7f8615e494b6178c79";
@interface MapViewController ()<MAMapViewDelegate,AMapLocationManagerDelegate>
@property (nonatomic,strong) MAMapView *mapView;
@property (nonatomic,strong) AMapLocationManager *locationManager;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[AMapServices sharedServices].apiKey = MapKey;
	[AMapServices sharedServices].enableHTTPS = YES;
	self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
	self.mapView.delegate = self;
	self.mapView.showTraffic = YES;
	[self.view addSubview:self.mapView];
	_mapView.showsUserLocation = YES;
	_mapView.userTrackingMode = MAUserTrackingModeFollow;
	
	self.locationManager = [[AMapLocationManager alloc] init];
	self.locationManager.delegate = self;
	self.locationManager.distanceFilter = 0;
	self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
	[self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
			NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
		NSLog(@"reGeocode:%@", regeocode);
	}];
	
	
	MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
	pointAnnotation.coordinate = CLLocationCoordinate2DMake(30.551991, 104.063526);
	pointAnnotation.title = @"长虹科技大厦";
	pointAnnotation.subtitle = @"天府四街";
	
	[_mapView addAnnotation:pointAnnotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MAMapViewDelegate
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
	if ([annotation isKindOfClass:[MAUserLocation class]]) {
		return nil;
	}else if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
		static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
		CallOutView*annotationView = (CallOutView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
		if (annotationView == nil)
		{
			annotationView = [[CallOutView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
		}
		UIImage *image = [UIImage imageNamed:@"hongbao.png"];
		CGRect rect = CGRectMake(0, 0, 40, 40);
		UIGraphicsBeginImageContext(rect.size);
		[image drawInRect:rect];
		UIImage * returnImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		annotationView.image = returnImage;
//		annotationView.centerOffset = CGPointMake(0, -10);
//		annotationView.calloutOffset = CGPointMake(-100, -35);
		annotationView.canShowCallout= NO;       //设置气泡可以弹出，默认为NO
//		annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//		annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//		annotationView.pinColor = MAPinAnnotationColorPurple;
		return annotationView;
	}else {
		MAAnnotationView *view = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"view"];
		return view;
	}
}

#pragma mark - AMapLocationManagerDelegate

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
	NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
	if (reGeocode)
	{
		NSLog(@"reGeocode:%@", reGeocode);
	}
}

@end
