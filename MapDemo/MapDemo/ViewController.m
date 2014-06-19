//
//  ViewController.m
//  MapDemo
//
//  Created by rongfzh on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnnotation.h"

@interface ViewController ()

@end

@implementation ViewController

//添加大头针
-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) coords {
	CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithCoordinate: 
									coords];
	annotation.title = @"标题";
	annotation.subtitle = @"子标题";
	[map addAnnotation:annotation];
}

- (void)viewDidLoad{
    //构建一个MapView
    map = [[MKMapView alloc] initWithFrame:[self.view bounds]];
	map.showsUserLocation = YES;
	map.mapType = MKMapTypeSatellite;
    [self.view addSubview:map];

    //构建一个地理坐标
	CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(39.915352,116.397105);

    //设置地图显示的中心和范围
	float zoomLevel = 0.02;
	MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
	[map setRegion:[map regionThatFits:region] animated:YES];
		
	map.delegate = self;

    //在坐标点构建一个标注(大头针)
	[self createAnnotationWithCoords:coords];

    //定位到当前位置
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//实现协议方法收到定位成功后的经纬度
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [locationManager stopUpdatingLocation];
    
    NSString *strLat = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.latitude];
    NSString *strLng = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.longitude];
    NSLog(@"Lat: %@  Lng: %@", strLat, strLng);
    
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(newLocation.coordinate.latitude,newLocation.coordinate.longitude);
	float zoomLevel = 0.02;
	MKCoordinateRegion region = MKCoordinateRegionMake(coords,MKCoordinateSpanMake(zoomLevel, zoomLevel));
	[map setRegion:[map regionThatFits:region] animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locError:%@", error);

}


- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
