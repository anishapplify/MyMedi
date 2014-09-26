//
//  NewMapViewController.m
//  MyMediApp
//
//  Created by anish on 05/08/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "NewMapViewController.h"

@interface NewMapViewController (){
    

    UIView *MapTopBarView;
    UILabel *MapTitleLable;
    UIView *BottomView;
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *LocateButton;
    UIButton *SettingButton;
    
    UIImageView *FirstFrameImageView;
    UIImageView *SecondFrameImageView;
    UIImageView *ThirdFrameImageView;
    UIImageView *FourthFrameImageView;
    UIImageView *FifthFrameImageView;
    
    UIImage *MedicalRecordsImageDefault;
    UIImage *MedicalRecordsImageAferClick;
    
    UIImage *AppointmentsImageDefault;
    UIImage *AppointmentsImageAfterClick;
    
    UIImage *MapImageDefault;
    UIImage *MapImageAfterClick;
    UIImage *SliderBarDefault;
    CLLocationManager *locationManager;
    
     ASIFormDataRequest *RequestForSync;
    float latitude;
    float longitude;
    
    CLLocationCoordinate2D currentCentre;
    int currenDist;
    BOOL firstLaunch;
    MKMapView *mapView;
    
    UITableView *MapViewTableView;
    NSDictionary* json;
    BOOL isFirstTimeLoad;
    NSInteger selectedIndexObject;
    
}

@end

@implementation NewMapViewController

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
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
     isFirstTimeLoad=YES;
    
    
    MapTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,64)];
    MapTopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    
    MapTitleLable=[[UILabel  alloc]initWithFrame:CGRectMake(0, 25, 320, 30)];
    MapTitleLable.backgroundColor=[UIColor clearColor];
    MapTitleLable.text=@"Nearby hospitals";
    MapTitleLable.font=[UIFont fontWithName:helveticaRegular size:16];
    MapTitleLable.textColor=[UIColor whiteColor];
    MapTitleLable.textAlignment=NSTextAlignmentCenter;
    [MapTopBarView addSubview:MapTitleLable];
    [self.view addSubview:MapTopBarView];
    
    mapView  = [[MKMapView alloc] init];
    [mapView setShowsUserLocation:true];
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    mapView.delegate=self;
    [self.view addSubview:mapView];
    
//    MKCoordinateRegion region;
//    region.center = mapView.userLocation.coordinate;
//    MKCoordinateSpan span;
//    span.latitudeDelta  = 15;
//    span.longitudeDelta = 15;
//    region.span = span;
//    [mapView setRegion:region animated:YES];
    
    [self CurrentLocationIdentifier];
    
#pragma mark BottomView
    
    BottomView=[[UIView alloc]init];
    MapViewTableView=[[UITableView alloc]init];
   
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            BottomView.frame=CGRectMake(0, 520, 320, 49);
              mapView.frame=CGRectMake(0,MapTopBarView.frame.size.height+MapTopBarView.frame.origin.y, 320, 250);
            MapViewTableView.frame=CGRectMake(0, mapView.frame.size.height+mapView.frame.origin.y+5, self.view.frame.size.width, 200);
          

        }
        else
        {
            BottomView.frame=CGRectMake(0, 432, 320, 49);
            mapView.frame=CGRectMake(0,MapTopBarView.frame.size.height+MapTopBarView.frame.origin.y, 320, 150);
            MapViewTableView.frame=CGRectMake(0, mapView.frame.size.height+mapView.frame.origin.y+5, self.view.frame.size.width, 200);
            
        }
    }
    BottomView.backgroundColor=[UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width,[UIImage imageNamed:@"bottommymedi.png"].size.height)];
    HomeButton.backgroundColor=[UIColor clearColor];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi.png"] forState:UIControlStateNormal];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateHighlighted];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateSelected];
    //HomeButton.userInteractionEnabled=FALSE;
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    
    [ShortCutButton removeFromSuperview];
    ShortCutButton=nil;
    ShortCutButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width, 0,[UIImage imageNamed:@"bottomshortcut.png"].size.width,[UIImage imageNamed:@"bottomshortcut.png"].size.height)];
    ShortCutButton.backgroundColor=[UIColor clearColor];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut.png"] forState:UIControlStateNormal];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateSelected];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateHighlighted];
    [ShortCutButton addTarget:self action:@selector(ShortCutButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ShortCutButton];
    
    [ProfileButton removeFromSuperview];
    ProfileButton=nil;
    ProfileButton=[[UIButton alloc]initWithFrame:CGRectMake(ShortCutButton.frame.size.width+ShortCutButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomprofile.png"].size.width,[UIImage imageNamed:@"bottomprofile.png"].size.height)];
    ProfileButton.backgroundColor=[UIColor clearColor];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile.png"] forState:UIControlStateNormal];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateSelected];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateHighlighted];
    [ProfileButton addTarget:self action:@selector(ProfileButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ProfileButton];
    
    
    [LocateButton removeFromSuperview];
    LocateButton=nil;
    LocateButton=[[UIButton alloc]initWithFrame:CGRectMake(ProfileButton.frame.size.width+ProfileButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomlocate.png"].size.width,[UIImage imageNamed:@"bottomlocate.png"].size.height)];
    LocateButton.backgroundColor=[UIColor clearColor];//bottomlocate_sel.png
    [LocateButton setBackgroundImage:[UIImage imageNamed:@"bottomlocate_sel.png"] forState:UIControlStateNormal];
    [LocateButton setBackgroundImage:[UIImage imageNamed:@"bottomlocate.png"] forState:UIControlStateSelected];
    [LocateButton setBackgroundImage:[UIImage imageNamed:@"bottomlocate_sel.png"] forState:UIControlStateHighlighted];
    [LocateButton addTarget:self action:@selector(LocateButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:LocateButton];
    
    [SettingButton removeFromSuperview];
    SettingButton=nil;
    SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(LocateButton.frame.size.width+LocateButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomsettings.png"].size.width,[UIImage imageNamed:@"bottomsettings.png"].size.height)];
    SettingButton.backgroundColor=[UIColor clearColor];//bottomsettings.png //bottomsettings_sel.png
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateNormal];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings_sel.png"] forState:UIControlStateSelected];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings_sel.png"] forState:UIControlStateHighlighted];
    [SettingButton addTarget:self action:@selector(SettingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SettingButton];
    [self.view addSubview:BottomView];
    
    
    [mapView setShowsUserLocation:YES];
    
    //Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
    
    //Make this controller the delegate for the location manager.
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    latitude = locationManager.location.coordinate.latitude;
    longitude = locationManager.location.coordinate.longitude;
    
    //Set the first launch instance variable to allow the map to zoom on the user location when first launched.
    firstLaunch=YES;
    [self queryGooglePlaces:@"hospital"];
    
   

}
//------------ Current Location Address-----
-(void)CurrentLocationIdentifier
{
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.distanceFilter = kCLDistanceFilterNone;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    locationManager.delegate = self;
//    [locationManager startUpdatingLocation];
    
    
    
    NSLog(@"latitude is %f and long. is %f",latitude,longitude);
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
//    NSLog(@"didFailWithError: %@", error);
//    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [errorAlert show];
}

//- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    NSLog(@"didUpdateToLocation: %@", newLocation);
//    CLLocation *currentLocation = newLocation;
//    if (currentLocation != nil) {
//        longitudeLabel =  currentLocation.coordinate.longitude;
//        latitudeLabel =  currentLocation.coordinate.latitude;
//        NSLog(@"longitudeLabel is %f and latitudeLabel. is %f",longitudeLabel,latitudeLabel);
//    }
//}
-(void)SyncButtonScreen{
    
}
-(void)SettingButtonAction{
    SettingScreenViewController *settingView=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:settingView animated:NO];
}
-(void)LocateButtonAction{
}
-(void)ShortCutButtonAction{
    
}
-(void)HomeButtonAction{
    HomeScreenViewController *HomeView=[[HomeScreenViewController alloc]init];
    [self.navigationController pushViewController:HomeView animated:NO];
}
-(void)AppointmentButtonAction{
    
}
-(void)MedicalButtonAction{
    
    
}
-(void)ProfileButtonAction{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) queryGooglePlaces: (NSString *) googleType
{
    
    // Build the url string we are going to sent to Google. NOTE: The kGOOGLE_API_KEY is a constant which should contain your own API key that you can obtain from Google. See this link for more info:
    // https://developers.google.com/maps/documentation/places/#Authentication
    
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@", latitude, longitude, [NSString stringWithFormat:@"%i", 1000], @"hospital", kGOOGLE_API_KEY];
    
    NSLog(@"url=%@",url);
    //Formulate the string as URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}
- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    NSLog(@"json=%@",json);
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"];
    
    //Write out the data to the console.
    NSLog(@"Google Data: %lu", (unsigned long)[[json objectForKey:@"results"]count]);
    
    
    [MapViewTableView setDelegate:self];
    MapViewTableView.dataSource=self;
    [MapViewTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [MapViewTableView setSeparatorColor:[UIColor grayColor]];
    [MapViewTableView setSeparatorInset:UIEdgeInsetsZero];
    MapViewTableView.backgroundColor=[UIColor clearColor];
    MapViewTableView.showsVerticalScrollIndicator = NO;
    
    MapViewTableView.alwaysBounceVertical = NO;
    [self.view addSubview:MapViewTableView];
    
    //Plot the data in the places array onto the map with the plotPostions method.
    [self plotPositions:places];
    
    
}
- (void)plotPositions:(NSArray *)data
{
    //Remove any existing custom annotations but not the user location blue dot.
    for (id<MKAnnotation> annotation in mapView.annotations)
    {
        if ([annotation isKindOfClass:[MapPoint class]])
        {
            [mapView removeAnnotation:annotation];
        }
    }
    
    
    //Loop through the array of places returned from the Google API.
    for (int i=0; i<[data count]; i++)
    {
        
        //Retrieve the NSDictionary object in each index of the array.
        NSDictionary* place = [data objectAtIndex:i];
        
        //There is a specific NSDictionary object that gives us location info.
        NSDictionary *geo = [place objectForKey:@"geometry"];
        
        
        //Get our name and address info for adding to a pin.
        NSString *name=[place objectForKey:@"name"];
        NSString *vicinity=[place objectForKey:@"vicinity"];
        
        //Get the lat and long for the location.
        NSDictionary *loc = [geo objectForKey:@"location"];
        
        //Create a special variable to hold this coordinate info.
        CLLocationCoordinate2D placeCoord;
        
        //Set the lat and long.
        placeCoord.latitude=[[loc objectForKey:@"lat"] doubleValue];
        placeCoord.longitude=[[loc objectForKey:@"lng"] doubleValue];
        
        //Create a new annotiation.
        MapPoint *placeObject = [[MapPoint alloc] initWithName:name address:vicinity coordinate:placeCoord];
        
        
        [mapView addAnnotation:placeObject];
    }
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    
    //Zoom back to the user location after adding a new set of annotations.
    
    //Get the center point of the visible map.
   // CLLocationCoordinate2D centre = [mv centerCoordinate];
    
    MKCoordinateRegion region;
    
    //If this is the first launch of the app then set the center point of the map to the user's location.
   
        region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,2000,2000);
        firstLaunch=NO;
   // }
//    else
//    {
//        //Set the center point to the visible region of the map and change the radius to match the search radius passed to the Google query string.
//        region = MKCoordinateRegionMakeWithDistance(centre,currenDist,currenDist);
//    }
    
    //Set the visible region of the map.
    [mv setRegion:region animated:YES];
    
}
- (void)mapView:(MKMapView *)mapView1 regionDidChangeAnimated:(BOOL)animated {
    
    //Get the east and west points on the map so we calculate the distance (zoom level) of the current map view.
    MKMapRect mRect = mapView1.visibleMapRect;
    MKMapPoint eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect));
    MKMapPoint westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect));
    
    //Set our current distance instance variable.
    currenDist = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint);
    
    //Set our current centre point on the map instance variable.
    currentCentre = mapView.centerCoordinate;
}
#pragma mark -UITableView Datasource and Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"count=%lu",(unsigned long)[[json objectForKey:@"results"]count]);
    
    return [[json objectForKey:@"results"]count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (isFirstTimeLoad)
    {
        return 50;
    } else
    {
        if (indexPath.row==selectedIndexObject)
        {
            
            return 50+50;
            //return 0;
        }
        else
        {
            return 50;
        }
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImage *cellBackGrounImageView=[UIImage imageNamed:@"whitelistpatch@2x.png"];
    static NSString *CellIdentifier =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.backgroundView=[[UIView alloc] initWithFrame:cell.bounds];
        cell.backgroundColor=[UIColor clearColor];
        
        
        
    } else
    {
        UIButton *CellButtonClick=(UIButton *)[cell.contentView viewWithTag:1506];
        [CellButtonClick removeFromSuperview];
        CellButtonClick=nil;
        
        UIImageView *descriptionBackground=(UIImageView*)[cell.contentView viewWithTag:1507];
        [descriptionBackground removeFromSuperview];
        descriptionBackground=nil;
    }
    
   [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    

    UIButton *CellButtonClick;
    CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    [CellButtonClick setTag:1506];
    CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
    CellButtonClick.backgroundColor=[UIColor grayColor];
   
    [CellButtonClick setTitle:[NSString stringWithFormat:@"%d",indexPath.row] forState:UIControlStateNormal];
    [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    
    [CellButtonClick setBackgroundImage:cellBackGrounImageView forState:UIControlStateNormal];
    [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
      [CellButtonClick addTarget:self action:@selector(CastingJobCellDiscription:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if (!isFirstTimeLoad)
    {
        
        if (selectedIndexObject==indexPath.row)
        {
            [CellButtonClick setSelected:YES];
            UIImageView *detailImageView=[self createDescriptionView];
            [detailImageView setFrame:CGRectMake(0, CellButtonClick.frame.origin.y+CellButtonClick.frame.size.height, tableView.frame.size.width, 50)];
            detailImageView.backgroundColor=[UIColor whiteColor];
            [cell.contentView addSubview:detailImageView];
            
        } else
        {
            [CellButtonClick setSelected:NO];
        }
    } else
    {
        [CellButtonClick setSelected:NO];
    }
    
    
    UILabel *nameLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    nameLable.backgroundColor=[UIColor whiteColor];
    nameLable.tag=1506;
    nameLable.textColor=[UIColor blackColor];
    
    nameLable.text=[NSString stringWithFormat:@"    %@",[[[json objectForKey:@"results"] valueForKey:@"name"] objectAtIndex:indexPath.row]];
    nameLable.textAlignment=NSTextAlignmentLeft;
    //[nameLable sizeToFit];
    
    nameLable.font=[UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:15];
    [CellButtonClick addSubview:nameLable];
    [cell.contentView addSubview:CellButtonClick];
    
    return cell;
}
-(IBAction)CastingJobCellDiscription:(UIButton*)sender
{
  
    if (sender.selected==NO)
    {
         selectedIndexObject=[sender.titleLabel.text integerValue];
        NSLog(@"selectedIndexObject=%ld",(long)selectedIndexObject);
        isFirstTimeLoad=NO;
       
        [MapViewTableView reloadData];
        [MapViewTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:selectedIndexObject inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    } else
    {
       
        isFirstTimeLoad=YES;
        [MapViewTableView reloadData];
    }
}

- (UIImageView *)createDescriptionView
{
    UIImageView *descriptionBackground=[[UIImageView alloc] init];
    [descriptionBackground setTag:1507];
    [descriptionBackground setFrame:CGRectMake(0, 0, 320, 50)];
    [descriptionBackground setBackgroundColor:[UIColor whiteColor]];
    descriptionBackground.userInteractionEnabled=TRUE;
    
    
    UILabel *descriptionLabel=[[UILabel alloc] init];
    [descriptionLabel setFrame:CGRectMake(10, 0, 320, 40)];
    [descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [descriptionLabel setNumberOfLines:2];
    descriptionLabel.font=[UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:11];
    descriptionLabel.text=[[[json objectForKey:@"results"] valueForKey:@"vicinity"] objectAtIndex:selectedIndexObject];
    [descriptionLabel setBackgroundColor:[UIColor whiteColor]];
    descriptionLabel.textAlignment=NSTextAlignmentJustified;
    [descriptionBackground addSubview:descriptionLabel];
    
    
//    UIButton *DirectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    DirectionButton.frame = CGRectMake(220, 20, 60, 30);
//    [DirectionButton addTarget:self action:@selector(directACTION) forControlEvents:UIControlEventTouchUpInside];
//    DirectionButton.backgroundColor = [UIColor redColor];
//    DirectionButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
//    [DirectionButton setTitle:@"Direction" forState:UIControlStateNormal];
//    [DirectionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    DirectionButton.exclusiveTouch = YES;
//    DirectionButton.hidden = NO;
//    DirectionButton.layer.cornerRadius=2.0;
//    [DirectionButton setClipsToBounds:YES];
//    [descriptionBackground addSubview:DirectionButton];
    
    return descriptionBackground;
}
-(void)directACTION
{

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
