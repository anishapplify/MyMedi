//
//  selectLocationViewController.h
//  MiniLuxe_ Customer
//
//  Created by Click Labs on 4/4/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "REVClusterMapView.h"
#import "REVClusterPin.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "Currentpin.h"
@interface selectLocationViewController : UIViewController<MKAnnotation,MKMapViewDelegate,CLLocationManagerDelegate>
{
      NSTimer* RepeatRequestTimer;
    UIImageView *mapImage;
    CLLocationCoordinate2D mycoords;
    UILabel *selectLocationLabel;
    UIButton *selectLocationButton;
    UIButton *requestAtStoreButton;
    UILabel *miniLuxeName;
    UILabel *miniLuxeAddress;
    UIView *whiteBg;
    UIButton *accountButton;
    UILabel *headerTitle;
     CLLocationManager *locationManager;
    MKCoordinateRegion adjustedRegion;
    NSMutableArray *LongitudeArray;
    NSMutableArray *LatitudeArray;
    NSMutableArray *newlongArray;
    NSMutableArray *newlatiArray;
   
    REVClusterMapView *mapView;
    CLLocationCoordinate2D SearchAddressCordinates;
    
    double latitude;
    double longitude;
    MKUserLocation *currentlocationpin;
    REVClusterPin *CurrentLocation;
    Currentpin *CurrentLocation1;
    UIImageView *curent1;
    REVClusterPin *pin1;

}

@end
