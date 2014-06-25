//
//  selectLocationViewController.m
//  MiniLuxe_ Customer
//


/*
 0172-2720091/ 92/ 93/ 94/ 95/ 96/ 97/ 98
 01722720091
 
 */
//  Created by Click Labs on 4/4/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//
#import "REVClusterMap.h"

#import "REVClusterAnnotationView.h"
#import "SVProgressHUD.h"
#import "selectLocationViewController.h"
#import "fetchRequestStatusViewController.h"
#import "requestStartedViewController.h"
#import "totalBillViewController.h"
#import "accountSettingsViewController.h"
#import "Reachability.h"
@interface selectLocationViewController ()

@end

@implementation selectLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterforeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
    
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNotificationReceived)  name:@"pushNotification"  object:nil];

    LongitudeArray=[[NSMutableArray alloc]init];
    LatitudeArray=[[NSMutableArray alloc]init];
    newlongArray=[[NSMutableArray alloc]init];
    newlatiArray=[[NSMutableArray alloc]init];
    
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    
    locationManager.distanceFilter = kCLDistanceFilterNone;
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //[locationManager startUpdatingLocation];
    
    
    mapView = [[REVClusterMapView alloc] initWithFrame:CGRectMake(0, 65, 320, 430)];
    
    mapView.delegate = self;
    
    
    [self.view addSubview:mapView];
    
    RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                        selector: @selector(callAfterThreeSecond:) userInfo: nil repeats: YES];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
    
    
    self.view.backgroundColor=[UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1.0];
    
    
    
    //mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 9000, 9000);
   
    
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    header.backgroundColor=[UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1.0];
    [mapImage addSubview:header];

    
    accountButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [accountButton setTitle:@"ACCOUNT" forState:UIControlStateNormal];
    accountButton.titleLabel.font = [UIFont fontWithName:@"Futura Lt BT" size:16];
    [accountButton setTitleColor:[UIColor colorWithRed:74.0/255 green:74.0/255 blue:74.0/255 alpha:1.0] forState:UIControlStateNormal];
    accountButton.exclusiveTouch=true;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            accountButton.frame = CGRectMake(10, 30, 80, 30);
            
            
            
        }
        else
        {
            accountButton.frame = CGRectMake(10, 30, 80, 30);
            
        }
    }
    
    [accountButton addTarget:self action:@selector(accountMethod)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:accountButton];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            headerTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 320, 30) ];
            
            
            
        }
        else
        {
            headerTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 320, 30) ];
            
        }
    }
    
    headerTitle.textAlignment=NSTextAlignmentCenter;
    
    headerTitle.text=@"JUGNOO";
    
    headerTitle.font = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    headerTitle.textColor=[UIColor colorWithRed:74.0/255 green:74.0/255 blue:74.0/255 alpha:1.0];
    
    [self.view addSubview:headerTitle];

    
    selectLocationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [selectLocationButton addTarget:self action:@selector(GPSMethod) forControlEvents:UIControlEventTouchUpInside];
    [selectLocationButton setBackgroundImage:[UIImage imageNamed:@"GPS-Settings.png"] forState:UIControlStateNormal];
   
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            selectLocationButton.frame = CGRectMake(10, 445, 41, 41);
            
            
        }
        else
        {
            
            selectLocationButton.frame = CGRectMake(10, 385, 41, 41);
            
            
        }
    }
    
    
    selectLocationButton.exclusiveTouch=true;
    [self.view addSubview:selectLocationButton];
    
    
    
    requestAtStoreButton= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            requestAtStoreButton.frame = CGRectMake(0, 495, 320, 73);
            
        }
        else
        {
            requestAtStoreButton.frame = CGRectMake(0, 432, 320, 48);
            
        }
    }
    
    requestAtStoreButton.backgroundColor=[UIColor colorWithRed:201.0/255 green:156.0/255 blue:215.0/255 alpha:1.0];
    
    requestAtStoreButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [requestAtStoreButton setTitle:@"Request a Ride" forState:UIControlStateNormal];
    requestAtStoreButton.exclusiveTouch=true;
    
    requestAtStoreButton.titleLabel.font = [UIFont fontWithName:@"Futura Lt BT" size:26];
    
    [requestAtStoreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [requestAtStoreButton addTarget:self action:@selector(requestAtStoreMethod)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:requestAtStoreButton];
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}
-(void)GPSMethod
{
    mycoords= CLLocationCoordinate2DMake ([[[ NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"] doubleValue],[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"]doubleValue]);
    adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(mycoords, 250, 250)];
      [mapView setRegion:adjustedRegion animated:YES];
}
-(void) callAfterThreeSecond:(NSTimer*)t
{
    [self viewDriverAPIcall];
}
-(void)viewDriverAPIcall
{
    
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        NSLog(@"tag is 69");
        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        alertview3.tag = 69;
        
        [alertview3 show];
    
    }
    else
    {
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]];
        
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=view_drivers",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        //NSLog(@"data=%@",data);
        if (data)
        {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
            if([json valueForKey:@"error"])
                
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                alertview3.tag = 1;
                [alertview3 show];
                
            }
            
            else if([json objectForKey:@"drivers"])
            {
                [LatitudeArray removeAllObjects];
                [LongitudeArray removeAllObjects];
                NSArray *dataArray = [[NSArray alloc] initWithArray:[json objectForKey:@"drivers"]];
                
                for (int i=0; i<dataArray.count; i++)
                {
                    [LongitudeArray addObject:[[dataArray objectAtIndex:i] objectForKey:@"longitude"]];
                    [LatitudeArray addObject:[[dataArray objectAtIndex:i] objectForKey:@"latitude"]];
                }
                NSLog(@"%@",LatitudeArray);
                [self showPoint];
                
                // [LongitudeArray addObject:[data objectForKey:@"longitude"]];
                
            }
            
            else
            {
                
            }
            
            
            
        }
        else
        {
           
        }
    }
}
- (void)mapView:(MKMapView *)mapView1 didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(NA, 4_0)
{
    MKAnnotationView* annotationView = [mapView1 viewForAnnotation:userLocation];
    annotationView.canShowCallout = NO;
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation

{
    
    
    [locationManager stopUpdatingLocation];
    
    
    NSLog(@"latitude : %f",newLocation.coordinate.latitude);
    
    if ([LatitudeArray count]>0) {
        
        NSString *lat=[LatitudeArray objectAtIndex:0];
        float lat1=[lat floatValue];
        
        NSString *longi=[LongitudeArray objectAtIndex:0];
        float longi1=[longi floatValue];
        
        latitude = lat1;
        
        longitude = longi1;
        //[GpsIcon setImage:[UIImage imageNamed:@"gps_icon.png"] forState:UIControlStateNormal];
    }
    
    else
    {
        latitude =newLocation.coordinate.latitude;
        
        longitude=newLocation.coordinate.longitude;
    }
    
    // latitude =newLocation.coordinate.latitude;
    
    //longitude=newLocation.coordinate.longitude;
    
    NSLog(@"%f",latitude);
    NSLog(@"%f",longitude);
    
    
    //    //[locationManager stopUpdatingLocation];
    //
  //  locationManager.delegate=nil;
    //
    //locationManager = nil;
    
    
    
    CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(latitude, longitude);
    
     adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, 9000, 9000)];
    
    [mapView setRegion:adjustedRegion animated:YES];
    
    
    
    CLLocationCoordinate2D newCoord =CLLocationCoordinate2DMake (latitude, longitude);
    CLLocationCoordinate2D newCoord1 =CLLocationCoordinate2DMake (newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    currentlocationpin=[[MKUserLocation alloc]init];
    
    CurrentLocation = [[REVClusterPin alloc] init];
    
    //CurrentLocation1 = [[Currentpin alloc] init];
    
    currentlocationpin.title = @"you are here";
    currentlocationpin.subtitle = @"you are here";
    
    CurrentLocation.coordinate = newCoord;
    
    CurrentLocation1.coordinate = newCoord;
    
    currentlocationpin.coordinate = newCoord1;
    
    [mapView addAnnotation:currentlocationpin];
    
    
    
    NSMutableArray *pins = [NSMutableArray array];
    
    
    for(int i=0;i<LongitudeArray.count;i++)
        
    {
        
        CLLocationCoordinate2D newCoord =CLLocationCoordinate2DMake ([[LatitudeArray objectAtIndex:i]doubleValue], [[LongitudeArray objectAtIndex:i]doubleValue]);
        
        pin1 = [[REVClusterPin alloc] init];
        
        pin1.title = [NSString stringWithFormat:@"%i",i+1];
        
        NSLog(@"%@",pin1.title);
        
        
        pin1.coordinate = newCoord;
        [newlongArray addObject:[NSString stringWithFormat:@"%f",pin1.coordinate.longitude]];
        [newlatiArray addObject:[NSString stringWithFormat:@"%f",pin1.coordinate.latitude]];
        [pins addObject:pin1];
        
        
        
    }
    [pins addObject:currentlocationpin ];
    
    [mapView addAnnotations:pins];
    
    
}
-(void)showPoint
{
    //  [locationManager startUpdatingLocation];
    
    NSMutableArray *pins = [NSMutableArray array];
      currentlocationpin=[[MKUserLocation alloc]init];
    
    currentlocationpin.coordinate=CLLocationCoordinate2DMake([[NSUserDefaults standardUserDefaults]doubleForKey:@"myLatitude"], [[NSUserDefaults standardUserDefaults]doubleForKey:@"myLongitude"]);
    for(int i=0;i<LongitudeArray.count;i++)
        
    {
      
        CLLocationCoordinate2D newCoord =CLLocationCoordinate2DMake ([[LatitudeArray objectAtIndex:i]doubleValue], [[LongitudeArray objectAtIndex:i]doubleValue]);
        
        pin1 = [[REVClusterPin alloc] init];
        
        
        pin1.title = [NSString stringWithFormat:@"%i",i+1];
        
        NSLog(@"%@",pin1.title);
        
        
        pin1.coordinate = newCoord;
        [newlongArray addObject:[NSString stringWithFormat:@"%f",pin1.coordinate.longitude]];
        [newlatiArray addObject:[NSString stringWithFormat:@"%f",pin1.coordinate.latitude]];
        [pins addObject:pin1];
        
        
        
    }
    mapView.userInteractionEnabled=YES;
    mapView.delegate=self;
    NSLog(@"%@",pins);
 
    if ([CLLocationManager locationServicesEnabled])
    {
         [pins addObject:currentlocationpin ];
        
    }
   
    [mapView addAnnotations:pins];
    
  //  [self aa];
   // [locationManager startUpdatingLocation];
 
}
//-(void)aa
//{
//    mycoords= CLLocationCoordinate2DMake ([[[ NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"] doubleValue],[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"]doubleValue]);
//    
//    adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(mycoords, 1000, 1000)];
//    
//    [mapView setRegion:adjustedRegion animated:YES];
//}
-(void)viewWillAppear:(BOOL)animated
{
   //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNotificationReceived)  name:@"pushNotification"  object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterforeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    mycoords= CLLocationCoordinate2DMake ([[[ NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"] doubleValue],[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"]doubleValue]);
 
     adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(mycoords, 250, 250)];
    
    [mapView setRegion:adjustedRegion animated:YES];
    
    [self viewDriverAPIcall];
}
#pragma mark Map view delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation

{
    MKAnnotationView *annView;
    NSLog(@"%@",[annotation class]);
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        
        NSLog(@"%f",currentlocationpin.coordinate.longitude);
        NSLog(@"%f",currentlocationpin.coordinate.latitude);
        MKAnnotationView* aView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                               reuseIdentifier:@"MyCustomAnnotation"];
        aView.image = [UIImage imageNamed:@"homemap.png"];
        aView.canShowCallout = NO;
        return aView;
        
    }
    else
    {
        REVClusterPin *pin;
        
        pin = (REVClusterPin *)annotation;
        
        // annView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
        
        if([annotation.subtitle isEqualToString:@"you are here"])
        {
            annView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        }
        else
        {
            annView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        }
        
        NSLog(@"%@",annotation.subtitle);
        
        if([annotation.subtitle isEqualToString:@"you are here"])
            
        {
            annView.image = [UIImage imageNamed:@"homemap.png"];
        }
        
        
        [annView setAnnotation:annotation];
        UIImageView *curent2=[[UIImageView alloc]initWithFrame:CGRectMake(28, -10, 26, 26)];
        curent2.image=[UIImage imageNamed:@"car.png"];
        //curent2.backgroundColor=[UIColor blackColor];
        [annView addSubview:curent2];
        annView.canShowCallout = NO;
        
        
        [annView addSubview:curent1];
        
        [annView setAnnotation:annotation];
        
        if( [pin nodeCount] > 0 )
            
        {
            
            annView = (REVClusterAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"cluster"];
            
            if(!annView )
                
                annView = (REVClusterAnnotationView*) [[REVClusterAnnotationView alloc] initWithAnnotation:annotation
                                                                                           reuseIdentifier:@"cluster"];
            
            // NSLog(@"%@",[[pin.nodes objectAtIndex:2]title]);
            
            annView.image = [UIImage imageNamed:@"circle.png"];
            NSString *combinedstring;
            combinedstring=@"";
            if( [pin nodeCount] > 0 )
                
            {
                for (int s=0; s<[pin.nodes count]; s++)
                {
                    NSLog(@"title %@",[[pin.nodes objectAtIndex:s]title]);
                    
                    
                    
                    
                    if (s==[pin.nodes count])
                    {
                        if ([[[pin.nodes objectAtIndex:s]title]isEqualToString:@"you are here"])
                        {
                            
                            curent1.hidden=NO;
                            
                            //curent1.image = [UIImage imageNamed:@"you_are_here_box.png"];
                            [annView addSubview:curent1];
                        }
                        else if ([[[pin.nodes objectAtIndex:s]title]isEqual:NULL])
                        {
                            
                        }
                        else
                        {
                            
                            combinedstring=[combinedstring stringByAppendingString:[[pin.nodes objectAtIndex:s]title]];
                            combinedstring=[combinedstring stringByAppendingString:@"$$##"];
                        }
                    }
                    else
                    {
                        
                        if ([[[pin.nodes objectAtIndex:s]title]isEqualToString:@"you are here"])
                        {
                            
                            curent1.hidden=NO;
                            
                            curent1.image = [UIImage imageNamed:@"homemap.png"];
                            [annView addSubview:curent1];
                            
                        }
                        else if ([[[pin.nodes objectAtIndex:s]title]isEqual:nil])
                        {
                            
                        }
                        else
                        {//[curent1 removeFromSuperview];
                            
                            combinedstring=[combinedstring stringByAppendingString:[[pin.nodes objectAtIndex:s]title]];
                            combinedstring=[combinedstring stringByAppendingString:@"$$##"];
                        }
                    }
                }
            }
            NSLog(@"%@",combinedstring);
            
            
            NSLog(@"arora%@",[NSString stringWithFormat:@"%i",[pin nodeCount]]);
            [(REVClusterAnnotationView*)annView setClusterText:[NSString stringWithFormat:@"%lu",(unsigned long)[pin nodeCount]]];
            
            annView.canShowCallout = NO;
            
        }
        
        return annView;
        
    }
    
    
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
    
}


-(void)accountMethod
{
    accountSettingsViewController *accountSetting =[[accountSettingsViewController alloc]init];
    [self.navigationController pushViewController:accountSetting animated:YES];
}
-(void)pushNotificationReceived
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"pushNotificationFlag"] integerValue]==1 )
    {
         totalBillViewController *technicianReady = [[totalBillViewController alloc] init];
        NSMutableArray *allControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        
        if(allControllers.count>0){
            
            for(int i=0;i<allControllers.count;i++){
                
                id objj = [allControllers objectAtIndex:i];
                
                if([objj isKindOfClass:[technicianReady class]]){
                    
                    [allControllers removeObjectAtIndex:i];
                    
                    break;
                    
                }
                
            }}
        
        [self.navigationController setViewControllers:allControllers animated:NO];
      
        [self.navigationController pushViewController:technicianReady animated:NO];
    }
    else
    {
         requestStartedViewController *technicianReady = [[requestStartedViewController alloc] init];
        NSMutableArray *allControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        
        if(allControllers.count>0){
            
            for(int i=0;i<allControllers.count;i++){
                
                id objj = [allControllers objectAtIndex:i];
                
                if([objj isKindOfClass:[technicianReady class]]){
                    
                    [allControllers removeObjectAtIndex:i];
                    
                    break;
                    
                }
                
            }}
        
        [self.navigationController setViewControllers:allControllers animated:NO];
        
        [self.navigationController pushViewController:technicianReady animated:NO];
    }
    
    

    
}

-(void)requestAtStoreMethod
{
    [self requestAtStoreAPICall];
    
    
}

-(void)requestAtStoreAPICall
{
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        alertview3.tag = 69;
        [alertview3 show];
        
        
    }
    else
    {
        
        
        
        [self ShowActivityIndicatorWithTitle:@"Loading..."];
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@&latitude=%@&longitude=%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"],[[ NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"],[[ NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"]];
        
        
        NSLog(@"post %@",post);
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=search_driver",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        // NSLog(@"data=%@",data);
        if (data)
        {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
            if([json valueForKey:@"error"])
                
            {
                                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                                alertview3.tag = 1;
                                [alertview3 show];
                
            }
            
            else if([json objectForKey:@"log"])
            {
                
                    NSLog(@"Request sent");
                
                fetchRequestStatusViewController *fetchRequest=[[fetchRequestStatusViewController alloc]init];
                
                CATransition* transition = [CATransition animation];
                transition.duration = 0.3;
                transition.type = kCATransitionFade;
                transition.subtype = kCATransitionFromTop;
                
                [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
                 fetchRequest.engageId=[[json objectForKey:@"engage_id"] integerValue];
                [self.navigationController pushViewController:fetchRequest animated:NO];
                
                  
            }
            else
            {
                    
                    selectLocationViewController *noTechnicianAvailablePage=[[selectLocationViewController alloc]init];
                    [self.navigationController pushViewController:noTechnicianAvailablePage animated:YES];
            }
            
            
            
            
        }
        else
        {
            //NULL Json
            UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
            alertview3.tag = 69;
            [alertview3 show];
            
        }
        
        [self HideActivityIndicator];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if((alertView.tag ==69) ||  (alertView.tag ==65))
    {
        if(buttonIndex == 1)
        {
            [self requestAtStoreAPICall];
        }
    }
}

-(void)ShowActivityIndicatorWithTitle:(NSString *)Title
{
    [SVProgressHUD showWithStatus:Title maskType:SVProgressHUDMaskTypeGradient];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    
}
-(void)HideActivityIndicator
{
    
    [SVProgressHUD dismiss];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [RepeatRequestTimer invalidate];
    RepeatRequestTimer=nil;
}
-(void)enterforeground
{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNotificationReceived)  name:@"pushNotification"  object:nil];
}

-(void)enterBackground
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
