//
//  ListOfAppoinmentViewController.h
//  MyMediApp
//
//  Created by Applify Tech on 11/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "SWTableViewCell.h"

@interface UserHomeScreenViewController : UIViewController<UIImagePickerControllerDelegate,UIPickerViewDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,UIActionSheetDelegate,UIScrollViewDelegate, MKMapViewDelegate , CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UIGestureRecognizerDelegate, SWTableViewCellDelegate>
{

}
@end
