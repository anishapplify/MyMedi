//
//  NewMapViewController.h
//  MyMediApp
//
//  Created by anish on 05/08/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

//AIzaSyB2Wr54OudLM_ezZ246FDxJnkwXrA7Qfgk
#define kGOOGLE_API_KEY @"AIzaSyCsWRfQzO72K48BFEbyDxBfKLKgoQlM32k"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
@interface NewMapViewController : UIViewController<MKMapViewDelegate , CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>

@end
