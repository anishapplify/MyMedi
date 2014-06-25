//
//  requestStartedViewController.h
//  MiniLuxe_ Customer
//
//  Created by Click Labs on 4/9/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SVAnnotation.h"
#import "SVPulsingAnnotationView.h"
@interface requestStartedViewController : UIViewController< MKMapViewDelegate , CLLocationManagerDelegate , MKAnnotation,UISearchBarDelegate>
{
    UIImage *backgroundImage;
    UIImageView *headerImage;
    UILabel *technicianName;
     UILabel *technicianAvailable;
    UIImageView *rateImage;
    NSURL *imageUrl;
     NSTimer* RepeatRequestTimer;
    NSTimer* RepeatRequestTimer1;
    UIImageView *background;
    CLLocationCoordinate2D oldpos;
     CLLocationCoordinate2D coordinate;
    CLLocationCoordinate2D coordinate1;
    NSMutableArray *LatArray;
    NSMutableArray *LongArray;
    NSMutableArray *routeA;
    UISearchBar *searchingBar;
}
@property(nonatomic,retain)NSString *technicianNameServer;
@property(nonatomic,retain)NSString *technicianImageServer;
@property(nonatomic,readwrite)int technicianRatingServer;
@end
