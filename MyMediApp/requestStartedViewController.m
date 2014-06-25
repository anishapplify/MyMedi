//
//  requestStartedViewController.m
//  MiniLuxe_ Customer
//
//  Created by Click Labs on 4/9/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//

#import "requestStartedViewController.h"
#import "Reachability.h"
#import "AsyncImageView.h"
#import "totalBillViewController.h"
#import "RegexKitLite.h"
#import "selectLocationViewController.h"
@interface requestStartedViewController ()
-(NSMutableArray *)decodePolyLine: (NSMutableString *)encoded;
-(void) updateRouteView;
-(NSArray*) calculateRoutesFrom:(CLLocationCoordinate2D) coordinate to: (CLLocationCoordinate2D) new_coordinates;
-(void) centerMap;
@end

@implementation requestStartedViewController
{
    int x;
    AsyncImageView *technicianPhoto;
    MKMapView *mapView;
    NSArray* routes;
    MKAnnotationView *annView;
    MKPolyline *routeLine;
    MKPolylineView *routeLineView;
    MKMapRect routeRect;
    CLLocationManager *lm;
    CLLocation *location;
    CLLocationCoordinate2D searched_coordinates;
    MKCoordinateRegion region;
    int count;
    UIImageView* routeView;
    BOOL flag;
    CLLocationCoordinate2D place_cord[10];
    NSString *place_name[10];
    int places[10];
    MKPointAnnotation *point;
    MKPointAnnotation *my_point[10];
    UIColor *lineColor;
}
@synthesize technicianImageServer;
@synthesize technicianNameServer;
@synthesize technicianRatingServer;

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
    
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"isPushNotification"])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNotificationReceived)  name:@"pushNotification"  object:nil];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterforeground) name:UIApplicationWillEnterForegroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    
    x=0;
    routeA=[[NSMutableArray alloc] init];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewDidLoad];
    backgroundImage=[UIImage imageNamed:@"MiniLuxe Background (Client).png"];
    background=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    background.image=backgroundImage;
    background.userInteractionEnabled=YES;
    [self.view addSubview:background];
    
    //LatArray=[[NSMutableArray alloc]initWithObjects:@"37.772095",@"37.771055",@"37.771566",@"37.776301", nil];
    // LongArray=[[NSMutableArray alloc]initWithObjects:@"-122.445843",@"-122.453785",@"-122.476617",@"-122.484641", nil];
    
       //LatArray=[[NSMutableArray alloc]initWithObjects:@"30.747993",@"30.763704",@"30.771085",@"30.776679",@"30.782438", nil];
    //LongArray=[[NSMutableArray alloc]initWithObjects:@"76.832938",@"76.810108",@"76.798513",@"76.785304",@"76.760272", nil];
    
    
    //LatArray=[[NSMutableArray alloc]initWithObjects:@"37.662896", @"37.655014",@"37.63381",@"37.629731", @"37.594648",@"37.553288", nil];
    //LongArray=[[NSMutableArray alloc]initWithObjects:@"-122.46666",@"-122.45533",@"-122.427521", @"-122.434731",@"-122.372589",@"-122.298431", nil];
    
    //LatArray=[[NSMutableArray alloc]initWithObjects:@"37.775", @"37.775039",@"37.775319",@"37.777083", @"37.780568",@"37.790218",@"37.7965",@"37.801213",@"37.803943",@"37.804596",@"37.806681",@"37.807834",@"37.808", nil];
    
    
    // LongArray=[[NSMutableArray alloc]initWithObjects:@"-122.424398",@"-122.422789",@"-122.421008", @"-122.421362",@"-122.422048",@"-122.424012",@"-122.425288",@"-122.42619",@"-122.42678",@"-122.421855",@"-122.420579",@"-122.418948",@"-122.417743", nil];
    
LatArray=[[NSMutableArray alloc]initWithObjects:@"37.775039", @"37.777083", @"37.780568",@"37.790218",@"37.7965",@"37.801213",@"37.803943",@"37.804596",@"37.806681",@"37.808", nil];
   LongArray=[[NSMutableArray alloc]initWithObjects: @"-122.422789",@"-122.421362",@"-122.422048",@"-122.424012",@"-122.425288",@"-122.42619",@"-122.42678", @"-122.421855",@"-122.420579",@"-122.417743", nil];
    
    
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    
    header.backgroundColor=[UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1.0];
    
    [background addSubview:header];
    
    technicianPhoto=[[AsyncImageView alloc]initWithFrame:CGRectMake(20, 25, 67,67)];
    
    technicianPhoto.layer.masksToBounds = YES;
    
    technicianPhoto.layer.borderWidth = 0;
    
    [[technicianPhoto layer]setCornerRadius:33.5f];
    
    imageUrl = [NSURL URLWithString:technicianImageServer];
    
    technicianPhoto.imageURL=imageUrl;
    
    [header addSubview:technicianPhoto];
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            technicianName=[[UILabel alloc]initWithFrame:CGRectMake(100, 30, 220, 30) ];
            
            
        }
        else
        {
            technicianName=[[UILabel alloc]initWithFrame:CGRectMake(100, 30, 220, 30) ];
            
        }
    }
    
    technicianName.textAlignment=NSTextAlignmentLeft;
    
    NSLog(@"%@",technicianNameServer);
    
    technicianName.text=technicianNameServer;
    
    technicianName.font = [UIFont fontWithName:@"Futura-Medium" size:20];
    
    technicianName.textColor=[UIColor colorWithRed:74.0/255 green:74.0/255 blue:74.0/255 alpha:1.0];
    
    [header addSubview:technicianName];
    
    
    
    for (int i=0; i<technicianRatingServer; i++)
    {
        
        rateImage=[[UIImageView alloc] init];
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )
        {
            if ([[UIScreen mainScreen] bounds].size.height==568)
            {
                
                rateImage.frame=CGRectMake(100+i*26, 62, 21, 20);
                
                
            }
            
            else
            {
                
                rateImage.frame=CGRectMake(100+i*26, 65, 21, 20);
                
                
            }
        }
        
        
        rateImage.image=[UIImage imageNamed:@"star_highlighted@2x.png"];
        
        [header addSubview:rateImage];
        
    }
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            technicianAvailable=[[UILabel alloc]initWithFrame:CGRectMake(0, 200, 320, 120) ];
            
        }
        else
        {
            technicianAvailable=[[UILabel alloc]initWithFrame:CGRectMake(0, 200, 320, 120) ];
            
        }
    }
    
    technicianAvailable.textAlignment=NSTextAlignmentCenter;
    
    technicianAvailable.text=@"Your Jugnoo\ndriver is on the\nway.";
    
    technicianAvailable.numberOfLines=3;
    
    technicianAvailable.font = [UIFont fontWithName:@"Futura-Medium" size:30];
    
    technicianAvailable.textColor=[UIColor whiteColor];
    
    [self.view addSubview:technicianAvailable];
    
    [[NSUserDefaults standardUserDefaults]setDouble:[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"] doubleValue] forKey:@"currentLatitude" ];
    [[NSUserDefaults standardUserDefaults]setDouble:[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"]doubleValue] forKey:@"currentLongitude" ];
    
    
    [searchingBar removeFromSuperview];
    
    searchingBar=nil;
    
    searchingBar = [[UISearchBar alloc]init];
    
    [searchingBar setFrame:CGRectMake(0, 100, 320, 44)];
    
    searchingBar.autocorrectionType=UITextAutocorrectionTypeNo;
    
    searchingBar.delegate=self;
    
    // [searchingBar layoutSubviews];
    
    // NSLog(@"subview=%@",[searchingBar subviews]);
    
    [self.view addSubview:searchingBar];
    
    
    
    mapView = [[MKMapView alloc] initWithFrame: CGRectMake(0, 144, self.view.frame.size.width, self.view.frame.size.height)];
    [mapView setShowsUserLocation:true];
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    mapView.delegate=self;
    [self.view addSubview:mapView];
    
    coordinate.longitude =[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"] doubleValue];
    coordinate.latitude = [[[NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"] doubleValue];
    
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(coordinate, 9000, 9000)];
    
    
    
    [mapView setRegion:adjustedRegion animated:YES];
    [self showPoint:coordinate user:@"user"];
    
    
    RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 5.0 target: self
                                                        selector: @selector(callAfterFiveSecond:) userInfo: nil repeats: YES];
    
}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)asearchBarhfg

{
    
    return YES;
    
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar

{
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar

{
    
    [searchBar resignFirstResponder];
    
    float  latitude;
    
    float longitude;
    
    latitude =[[LatArray lastObject] floatValue];
    
    longitude=[[LongArray lastObject] floatValue];
    
    
    
    // float  latitude1;
    
    //float longitude1;
    
    //latitude1 =[[LatArray objectAtIndex:0] floatValue];
    
    //longitude1=[[LongArray objectAtIndex:0] floatValue];
    
    // CLLocationCoordinate2D startCoord1 = CLLocationCoordinate2DMake(latitude1, longitude1);
    
    
    
    CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(latitude, longitude);
    
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, 9000, 9000)];
    
    [self sendDestinationAPICall];
    
    [mapView setRegion:adjustedRegion animated:YES];
    
    [self showPoint:startCoord user:@"driver"];
    
    
    // [self showRouteFrom:startCoord1 to:startCoord];
    
    
    
}

-(void)showMap
{
    
    
    mapView = [[MKMapView alloc] initWithFrame: CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    [mapView setShowsUserLocation:true];
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    mapView.delegate=self;
    [self.view addSubview:mapView];
    
    
    
    lm = [[CLLocationManager alloc] init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    lm.distanceFilter = kCLDistanceFilterNone;
    // [lm startUpdatingLocation];
    
    location = [lm location];
    
    
    coordinate.longitude =[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"] doubleValue];
    coordinate.latitude = [[[NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"] doubleValue];
    
    coordinate1.longitude =[[[NSUserDefaults standardUserDefaults]objectForKey:@"myLongitude"] doubleValue];
    coordinate1.latitude = [[[NSUserDefaults standardUserDefaults]objectForKey:@"myLatitude"] doubleValue];
    //coordinate1.longitude =[[LongArray objectAtIndex:0] doubleValue];
    // coordinate1.latitude = [[LatArray objectAtIndex:0] doubleValue];
    
    // coordinate = [location coordinate];
    
    NSLog(@"Latitude of User is %f",coordinate.longitude);
    NSLog(@"Longitude of User is %f",coordinate.latitude);
    
    oldpos=coordinate1;
    
    routeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mapView.frame.size.width, mapView.frame.size.height)];
    routeView.userInteractionEnabled = NO;
    [mapView addSubview:routeView];
    
    place_name[0]=[NSString stringWithFormat:@"Source"];
    
    //[self showClusterPoint: coordinate withPos:place_name[0]];
    
    [self showRouteFrom:coordinate to:coordinate1];
    //[self showPoint:coordinate user:@"driver"];
    [self showPoint:coordinate user:@"user"];
    
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(coordinate, 9000, 9000)];
    
    [mapView setRegion:adjustedRegion animated:YES];
    
    
}

-(void) callAfterFiveSecond:(NSTimer*)t
{
    [self fetchStartStatusAPICall];
}
-(void) callAfterFiveSecondEnd:(NSTimer*)t
{
    
    [lm startUpdatingLocation];
    [self fetchEndStatusAPICall];
}
-(void)fetchStartStatusAPICall
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        //        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        //        alertview3.tag = 69;
        //        [alertview3 show];
        [RepeatRequestTimer invalidate];
        RepeatRequestTimer=nil;
        
        
        RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                            selector: @selector(callAfterFiveSecond:) userInfo: nil repeats: YES];
        
        
    }
    else
    {
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@&engage_id=%ld",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"],(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"engageId"]];  //@"device_token"
        
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=fetch_start_status",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        
        if (data)
        {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
            if([json valueForKey:@"error"])
                
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                
                [alertview3 show];
                
            }
            
            else if([json objectForKey:@"cancel_error"])
            {
                
                NSLog(@"%@",json);
                
                [RepeatRequestTimer invalidate];
                RepeatRequestTimer=nil;
                
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json objectForKey:@"cancel_error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                alertview3.tag=232;
                
                [alertview3 show];
                
            }
            else
            {
                if ([[json objectForKey:@"flag"] integerValue]==1)
                {
                    
                    [RepeatRequestTimer invalidate];
                    RepeatRequestTimer=nil;
                    [RepeatRequestTimer1 invalidate];
                    RepeatRequestTimer1=nil;
                    [self showMap];
                    RepeatRequestTimer1 = [NSTimer scheduledTimerWithTimeInterval: 5.0 target: self
                                                                         selector: @selector(callAfterFiveSecondEnd:) userInfo: nil repeats: YES];
                    
                }
                else
                {
                    NSLog(@"%@",[json objectForKey:@"log"]);
                }
                
            }
        }
        
        else
        {
            
            [RepeatRequestTimer invalidate];
            RepeatRequestTimer=nil;
            
            
            RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                                selector: @selector(callAfterFiveSecond:) userInfo: nil repeats: YES];
            
        }
        
    }
    
}


-(void)showPoint:(CLLocationCoordinate2D)coordinatePin user:(NSString *)userType

{
    
    NSLog(@"cor=%f",coordinate.latitude);
    
    NSLog(@"cor=%f",coordinate.longitude);
    
    SVAnnotation *annotation = [[SVAnnotation alloc] initWithCoordinate:coordinatePin];
    
    if([userType isEqualToString:@"user"])
        
    {
        
        annotation.title = @"New Request";
        annotation.PinType=@"user";
        
        
    }
    
    else if([userType isEqualToString:@"driver"])
        
    {
        
        annotation.title = @"You are here";
        annotation.PinType=@"driver";
        
    }
    [mapView addAnnotation:annotation];
    
}





- (MKAnnotationView *)mapView:(MKMapView *)mapView1 viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    if([annotation isKindOfClass:[SVAnnotation class]]) {
        
        static NSString *identifier = @"currentLocation";
        
        annView = (MKAnnotationView*)[mapView1 dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        SVPulsingAnnotationView *pulsingView = (SVPulsingAnnotationView *)[mapView1 dequeueReusableAnnotationViewWithIdentifier:identifier] ;
        
        
        
        
        
        if(pulsingView == nil) {
            
            pulsingView = [[SVPulsingAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
            
            
            if([((SVAnnotation *)annotation).PinType isEqualToString:@"user"])
                
                pulsingView.image=[UIImage imageNamed:@"homemap.png"];
            
            if([((SVAnnotation *)annotation).PinType isEqualToString:@"driver"])
                
                pulsingView.image=[UIImage imageNamed:@"car.png"];
            
            pulsingView.canShowCallout = NO;
            
            pulsingView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
        }
        
        
        return pulsingView;
        
    }
    
    
    
    return nil;
    
}

-(void) showRouteFrom:(CLLocationCoordinate2D) coordinates to: (CLLocationCoordinate2D) new_coordinates
{
	
	if(routes)
    {
		[mapView removeAnnotations:[mapView annotations]];
		
	}
    
    
    
	routes = [self calculateRoutesFrom:coordinates to:new_coordinates];
	
	[self updateRouteView];
	[self centerMap];
}

// FUNCTION TO FIND ROUTE FROM SOURCE TO DESTINATION

-(NSArray*) calculateRoutesFrom:(CLLocationCoordinate2D) coordinates to: (CLLocationCoordinate2D) new_coordinates

{
    
	NSString* saddr = [NSString stringWithFormat:@"%f,%f",coordinates.latitude, coordinate.longitude];
	NSString* daddr = [NSString stringWithFormat:@"%f,%f", new_coordinates.latitude, new_coordinates.longitude];
	NSString* apiUrlStr = [NSString stringWithFormat:@"http://maps.google.com/maps?output=dragdir&saddr=%@&daddr=%@", saddr, daddr];
	NSURL* apiUrl = [NSURL URLWithString:apiUrlStr];
	NSLog(@"api url: %@", apiUrl);
    NSError* error = nil;
    NSString* apiResponse = [NSString stringWithContentsOfURL:apiUrl encoding:NSASCIIStringEncoding error:&error];
    //	NSString *apiResponse = [NSString stringWithContentsOfURL:apiUrl];
	NSString* encodedPoints = [apiResponse stringByMatching:@"points:\\\"([^\\\"]*)\\\"" capture:1L];
	
	return [self decodePolyLine:[encodedPoints mutableCopy]];
}


// FUNCTION TO DECODE POLYLINE INTO ARRAY OF COORDINATES

-(NSMutableArray *)decodePolyLine: (NSMutableString *)encoded {
	[encoded replaceOccurrencesOfString:@"\\\\" withString:@"\\"
								options:NSLiteralSearch
								  range:NSMakeRange(0, [encoded length])];
	NSInteger len = [encoded length];
	NSInteger index = 0;
	NSMutableArray *array = [[NSMutableArray alloc] init] ;
	NSInteger lat=0;
	NSInteger lng=0;
	while (index < len) {
		NSInteger b;
		NSInteger shift = 0;
		NSInteger result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lat += dlat;
		shift = 0;
		result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lng += dlng;
		NSNumber *latitude = [[NSNumber alloc] initWithFloat:lat * 1e-5] ;
		NSNumber *longitude = [[NSNumber alloc] initWithFloat:lng * 1e-5] ;
		printf("[%f,", [latitude doubleValue]);
		printf("%f]", [longitude doubleValue]);
		CLLocation *loc = [[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]];
		[array addObject:loc];
        [routeA  addObject:loc];
	}
	
	return routeA;
}

// FUNCTION TO DRAW PATH

-(void) updateRouteView
{
	CGContextRef context = CGBitmapContextCreate(nil, routeView.frame.size.width, routeView.frame.size.height,8, 4 * routeView.frame.size.width, CGColorSpaceCreateDeviceRGB(),kCGImageAlphaPremultipliedLast);
	
	CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
	CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
	CGContextSetLineWidth(context, 5.0);
	
	for(int i = 0; i < routes.count; i++)
    {
        location = [routes objectAtIndex:i];
		CGPoint points = [mapView convertCoordinate:location.coordinate toPointToView:routeView];
		if(i == 0)
        {
			CGContextMoveToPoint(context, points.x, routeView.frame.size.height - points.y);
            
        }
        else
        {
			CGContextAddLineToPoint(context, points.x, routeView.frame.size.height - points.y);
            
            
        }
	}
	
	CGContextStrokePath(context);
    CGImageRef image = CGBitmapContextCreateImage(context);
	UIImage* img = [UIImage imageWithCGImage:image];
    routeView.image = img;
    CGContextRelease(context);
    
    
}

// FUNCTION TO FIND CENTER POSITION

-(void) centerMap
{
    
	CLLocationDegrees maxLat = -90;
	CLLocationDegrees maxLon = -180;
	CLLocationDegrees minLat = 90;
	CLLocationDegrees minLon = 180;
	
    for(int idx = 0; idx < routes.count; idx++)
	{
		CLLocation* currentLocation = [routes objectAtIndex:idx];
		if(currentLocation.coordinate.latitude > maxLat)
			maxLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.latitude < minLat)
			minLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.longitude > maxLon)
			maxLon = currentLocation.coordinate.longitude;
		if(currentLocation.coordinate.longitude < minLon)
			minLon = currentLocation.coordinate.longitude;
        
        
        
    }
	region.center.latitude     = (maxLat + minLat) / 2;
	region.center.longitude    = (maxLon + minLon) / 2;
	region.span.latitudeDelta  = (maxLat - minLat)+0.01;
	region.span.longitudeDelta =(maxLon - minLon)+0.01;
	
	[mapView setRegion:region animated:YES];
    
    
}

// FUNCTION CALL WHEN MAP IS HIDDEN

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	routeView.hidden = YES;
    [searchingBar resignFirstResponder];
}

// FUNCTION CALL WHEN MAP IS SHOWN

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	[self updateRouteView];
    
	routeView.hidden = NO;
   	[routeView setNeedsDisplay];
}
//
//
//-(MKPointAnnotation *)showClusterPoint:(CLLocationCoordinate2D)coords withPos:(NSString *)place
//{
//    point = [[MKPointAnnotation alloc]init];
//    annView=[[MKAnnotationView alloc]init];
//    point.coordinate = coords;
//    annView.image = [UIImage imageNamed:@"car.png"];
//
//    point.title=place;
//
//    [mapView addAnnotation:point];
//    [annView setAnnotation:point];
//    return point;
//}


-(void)sendDestinationAPICall
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        //        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        //        alertview3.tag = 69;
        //        [alertview3 show];
        
        
    }
    else
    {
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@&engage_id=%ld&latitude=%f&longitude=%f",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"],(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"engageId"],[[LatArray lastObject]floatValue],[[LongArray lastObject]floatValue]];  //@"device_token"
        
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=set_destination",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        
        if (data)
        {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
            if([json valueForKey:@"error"])
                
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                
                [alertview3 show];
                
            }
            else
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"Your destination has been selected." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                
                [alertview3 show];
                [RepeatRequestTimer invalidate];
                RepeatRequestTimer=nil;
                RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 5.0 target: self
                                                                    selector: @selector(callAfterFiveSecond:) userInfo: nil repeats: YES];
                
            }
        }
    }
    
}

-(void)fetchEndStatusAPICall
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        //        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        //        alertview3.tag = 69;
        //        [alertview3 show];
        [RepeatRequestTimer1 invalidate];
        RepeatRequestTimer1=nil;
        
        RepeatRequestTimer1 = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                             selector: @selector(callAfterFiveSecondEnd:) userInfo: nil repeats: YES];
        
    }
    else
    {
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@&engage_id=%ld",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"],(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"engageId"]];  //@"device_token"
        
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=fetch_end_status",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        
        if (data)
        {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
            if([json valueForKey:@"error"])
                
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                
                [alertview3 show];
                
            }
            else
            {
                if ([[json objectForKey:@"flag"] integerValue]==0)
                {
                    
                    [RepeatRequestTimer1 invalidate];
                    RepeatRequestTimer1=nil;
                    [RepeatRequestTimer invalidate];
                    RepeatRequestTimer=nil;
                    [[NSNotificationCenter defaultCenter]removeObserver:self];
                    [[NSUserDefaults standardUserDefaults] setFloat:[[json objectForKey:@"amount"] floatValue] forKey:@"amount"];
                    [[NSUserDefaults standardUserDefaults] setFloat:[[json objectForKey:@"distance"] floatValue] forKey:@"totalDistance"];
                    [[NSUserDefaults standardUserDefaults]synchronize];
                    
                    totalBillViewController *totalBill=[[totalBillViewController alloc]init];
                    [self.navigationController pushViewController:totalBill animated:YES];
                    
                }
                else
                {
                    NSLog(@"%@",[json objectForKey:@"log"]);
                    
                }
                
            }
        }
        
        else
        {
            
            [RepeatRequestTimer1 invalidate];
            RepeatRequestTimer1=nil;
            RepeatRequestTimer1 = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                                 selector: @selector(callAfterFiveSecondEnd:) userInfo: nil repeats: YES];
            
        }
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==232)
    {
        selectLocationViewController *selectLocation=[[selectLocationViewController alloc]init];
        [self.navigationController pushViewController:selectLocation animated:YES];
    }
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation

{
    
    [lm stopUpdatingLocation];
    
    
    //  NSLog(@"latitude : %f",newLocation.coordinate.latitude);
    
    //float  latitude =newLocation.coordinate.latitude;
    
    // float longitude=newLocation.coordinate.longitude;
    
    
    float  latitude;
    float longitude;
    
    
    if (x<LatArray.count)
    {
        latitude =[[LatArray objectAtIndex:x] floatValue];
        
        longitude=[[LongArray objectAtIndex:x] floatValue];
        x++;
    }
    else
    {
        latitude =[[LatArray lastObject] floatValue];
        
        longitude=[[LongArray lastObject] floatValue];
        [lm stopUpdatingLocation];
        lm.delegate=nil;
        lm=nil;
    }
    
    
    NSLog(@"%f",latitude);
    NSLog(@"%f",longitude);
    [[NSUserDefaults standardUserDefaults]setDouble:latitude forKey:@"currentLatitude" ];
    [[NSUserDefaults standardUserDefaults]setDouble:longitude forKey:@"currentLongitude" ];
    
    
    CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(latitude, longitude);
    
    coordinate=oldpos;
    coordinate1=startCoord;
    
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord, 5000, 7000)];
    
    [mapView setRegion:adjustedRegion animated:YES];
    
    MKUserLocation *currentlocationpin=[[MKUserLocation alloc]init];
    
    //REVClusterPin *CurrentLocation = [[REVClusterPin alloc] init];
    
    //CurrentLocation1 = [[Currentpin alloc] init];
    
    //CurrentLocation.coordinate = newCoord;
    
    currentlocationpin.coordinate = coordinate1;
    
    [mapView addAnnotation:currentlocationpin];
    
    
    NSMutableArray *pins = [NSMutableArray array];
    
    [pins addObject:currentlocationpin];
    
    [mapView addAnnotations:pins];
    
    
    lineColor =[UIColor colorWithRed:197.0/255 green:162.0/255 blue:214.0/255 alpha:1.0];
    oldpos=startCoord;
    //[self showClusterPoint: coordinate withPos:@"Source"];
    
    //  [ self showClusterPoint: startCoord withPos:@"Destination"];
    
    [self showRouteFrom:coordinate to:coordinate1];
    CLLocationCoordinate2D firstCo = CLLocationCoordinate2DMake([[NSUserDefaults standardUserDefaults] floatForKey:@"myLatitude"], [[NSUserDefaults standardUserDefaults] floatForKey:@"myLongitude"]);
    [self showPoint:firstCo user:@"driver"];
    [self showPoint:coordinate1 user:@"driver"];
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

-(void)enterforeground
{
    [RepeatRequestTimer1 invalidate];
    RepeatRequestTimer1=nil;
    [RepeatRequestTimer invalidate];
    RepeatRequestTimer=nil;
    RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 4.0 target: self
                                                        selector: @selector(callAfterFiveSecond:) userInfo: nil repeats: YES];
    RepeatRequestTimer1 = [NSTimer scheduledTimerWithTimeInterval: 2.0 target: self
                                                         selector: @selector(callAfterFiveSecondEnd:) userInfo: nil repeats: YES];

    
}
-(void)enterBackground
{
    [RepeatRequestTimer invalidate];
    RepeatRequestTimer=nil;

    [RepeatRequestTimer1 invalidate];
    RepeatRequestTimer1=nil;
  
}
-(void)viewDidDisappear:(BOOL)animated
{
    [RepeatRequestTimer invalidate];
    RepeatRequestTimer=nil;
    
    [RepeatRequestTimer1 invalidate];
    RepeatRequestTimer1=nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [searchingBar resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
