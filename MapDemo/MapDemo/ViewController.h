//
//  ViewController.h
//  MapDemo
//
//  Created by rongfzh on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController 
<MKMapViewDelegate, CLLocationManagerDelegate> {
    MKMapView *map;
    CLLocationManager *locationManager;
}
@end
