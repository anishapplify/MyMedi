//
//  HomeScreenViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/9/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "HomeScreenViewController.h"

@interface HomeScreenViewController (){
    
    
    UIView *TopBarView;
    UIView *ProfileBarView;
    UILabel *TopBarLable;
    UIButton *MenuButton;
    AsyncImageView *EditChangeImage;
    NSString *UrlString;
    UILabel *FirstNameLable;
    UILabel *AddressNameLable;
    UIImageView *HomeArrowImageView;
    
    UIButton *AppointmentButton;
    UIButton *MedicalRecordButton;
    UIButton *MedicalViewListRecordButton;
    
    UILabel *RecentAppointmentLable;
    
    UIView *BottomView;
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
    
    UIButton *NoAppointmentButton;
    UIButton *NoAppointmentSecondButton;
    UIButton *NoAppointmentThirdButton;

    UITableView *RecentTableView;
    UIView *footerView;
    UIActivityIndicatorView *activityView;

    UIView *moreButtonBlackview;
    UIView *moreButtonview;
    UISearchBar *SearchBar;
    UIView *horizontalLIneView;

}

@end

@implementation HomeScreenViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:241/255.0 green:245/255.0 blue:246/255.0 alpha:1.0];
    
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    
    TopBarView.userInteractionEnabled=TRUE;
    
    
    [MenuButton removeFromSuperview];
    MenuButton=nil;
    MenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    MenuButton.frame = CGRectMake(260, 15, [UIImage imageNamed:@"menu.png"].size.width, [UIImage imageNamed:@"menu.png"].size.height);
    [MenuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [MenuButton addTarget:self action:@selector(menuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    MenuButton.backgroundColor=[UIColor clearColor];
    [TopBarView addSubview:MenuButton];
    
    
    [EditChangeImage removeFromSuperview];
    EditChangeImage=nil;
    EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(10, 25, 40, 40)];
    NSString *abc=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"image"];
    if(abc.length<1)
    {
        EditChangeImage.image=[UIImage imageNamed:@"Headshot-Placeholder.png"];
    }
    else
    {
        UrlString = [[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] valueForKey:@"image"];
        EditChangeImage.imageURL = [NSURL URLWithString:UrlString];
    }
    EditChangeImage.backgroundColor=[UIColor clearColor];
    EditChangeImage.layer.masksToBounds = YES;
    EditChangeImage.layer.borderWidth = 1;
    EditChangeImage.contentMode = UIViewContentModeScaleAspectFill;
    EditChangeImage.layer.borderColor=[UIColor whiteColor].CGColor;
    EditChangeImage.userInteractionEnabled=YES;
    [[EditChangeImage layer]setCornerRadius:20];
    [TopBarView addSubview:EditChangeImage];
    

    [FirstNameLable removeFromSuperview];
    FirstNameLable=nil;
    FirstNameLable=[[UILabel alloc]initWithFrame:CGRectMake(135, 30, 120, 20)];
    FirstNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"firstname"];
    FirstNameLable.backgroundColor=[UIColor clearColor];
    FirstNameLable.font=[UIFont fontWithName:@"MuseoSans-300" size:18];
    FirstNameLable.textAlignment=NSTextAlignmentLeft;
    FirstNameLable.text = [FirstNameLable.text capitalizedString];
    FirstNameLable.textColor=[UIColor whiteColor];
    [TopBarView addSubview:FirstNameLable];
    [self.view addSubview:TopBarView];

    [ProfileBarView removeFromSuperview];
    ProfileBarView=nil;
    ProfileBarView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, self.view.frame.size.width,50)];
    ProfileBarView.backgroundColor=[UIColor colorWithRed:226/255.0 green:228/255.0 blue:229/255.0 alpha:1.0];
    ProfileBarView.userInteractionEnabled=TRUE;
    

    [SearchBar removeFromSuperview];
    SearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    SearchBar.tag=12345;
    SearchBar.delegate = self;
    SearchBar.placeholder = @"Search";
    
    for (UIView *subview in SearchBar.subviews)
    {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [subview removeFromSuperview];
            break;
        }
    }
    SearchBar.backgroundColor=[UIColor lightGrayColor];
    [SearchBar setTranslucent:YES];
    SearchBar.showsCancelButton = NO;
    [ProfileBarView addSubview:SearchBar];
    [self.view addSubview:ProfileBarView];
    
#pragma mark BottomView
    
    [BottomView removeFromSuperview];
    BottomView=nil;
    BottomView=[[UIView alloc]init];
    
    [horizontalLIneView removeFromSuperview];
    horizontalLIneView = nil;
    horizontalLIneView = [[UIView alloc]init];
    horizontalLIneView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:horizontalLIneView];
    
    
    
   RecentAppointmentLable=nil;
    [RecentAppointmentLable removeFromSuperview];
     RecentAppointmentLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
    [RecentTableView removeFromSuperview];
    RecentTableView=nil;
    RecentTableView=[[UITableView alloc]init];
 
    
   
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            BottomView.frame=CGRectMake(0, 520, 320, 49);
             horizontalLIneView.frame = CGRectMake(0, 519, 320, 1);
            RecentTableView.frame=CGRectMake(0,ProfileBarView.frame.size.height+ProfileBarView.frame.origin.y+10, self.view.frame.size.width, 300);
        }
        else
        {
            BottomView.frame=CGRectMake(0, 432, 320, 49);
            horizontalLIneView.frame = CGRectMake(0, 432, 320, 1);
            RecentTableView.frame=CGRectMake(0, ProfileBarView.frame.size.height+ProfileBarView.frame.origin.y+10, self.view.frame.size.width, 160);
        }
    }
    
    RecentAppointmentLable.text=@"   ALL ACTIVITY";
    RecentAppointmentLable.backgroundColor=[UIColor clearColor];
    RecentAppointmentLable.font=[UIFont fontWithName:@"Europa-Regular" size:15];
    RecentAppointmentLable.textAlignment=NSTextAlignmentLeft;
    RecentAppointmentLable.textColor=[UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    RecentTableView.tableHeaderView = RecentAppointmentLable;
    
    [RecentTableView setDelegate:self];
    RecentTableView.dataSource=self;
    // [RecentTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    //[RecentTableView setSeparatorColor:[UIColor grayColor]];
    [RecentTableView setSeparatorInset:UIEdgeInsetsZero];
    RecentTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    RecentTableView.backgroundColor=[UIColor clearColor];
    RecentTableView.showsVerticalScrollIndicator = YES;
    RecentTableView.alwaysBounceVertical = YES;
    [self.view addSubview:RecentTableView];
   
    
    BottomView.backgroundColor=[UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width,[UIImage imageNamed:@"bottommymedi.png"].size.height)];
    HomeButton.backgroundColor=[UIColor clearColor];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateNormal];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateHighlighted];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateSelected];
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    [AppointmentsBottomButton removeFromSuperview];
    AppointmentsBottomButton=nil;
    AppointmentsBottomButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.size.width+HomeButton.frame.origin.x, 0, [UIImage imageNamed:@"appointments.png"].size.width,[UIImage imageNamed:@"appointments.png"].size.height)];
    AppointmentsBottomButton.backgroundColor=[UIColor clearColor];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateNormal];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateSelected];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateHighlighted];
    [AppointmentsBottomButton addTarget:self action:@selector(appointmentlistview) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:AppointmentsBottomButton];

   
    
    [ProfileButton removeFromSuperview];
    ProfileButton=nil;
    ProfileButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentsBottomButton.frame.size.width+AppointmentsBottomButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomprofile.png"].size.width,[UIImage imageNamed:@"bottomprofile.png"].size.height)];
    ProfileButton.backgroundColor=[UIColor clearColor];
   [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile.png"] forState:UIControlStateNormal];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateSelected];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateHighlighted];
    [ProfileButton addTarget:self action:@selector(ProfileButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ProfileButton];
    
    
    [ShortCutButton removeFromSuperview];
    ShortCutButton=nil;
    ShortCutButton=[[UIButton alloc]initWithFrame:CGRectMake(ProfileButton.frame.origin.x+ProfileButton.frame.size.width, 0,[UIImage imageNamed:@"bottomshortcut.png"].size.width,[UIImage imageNamed:@"bottomshortcut.png"].size.height)];
    ShortCutButton.backgroundColor=[UIColor clearColor];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut.png"] forState:UIControlStateNormal];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateSelected];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateHighlighted];
    [ShortCutButton addTarget:self action:@selector(ShortCutButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ShortCutButton];
    
    
    [SettingButton removeFromSuperview];
    SettingButton=nil;
    SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(ShortCutButton.frame.size.width+ShortCutButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomsettings.png"].size.width,[UIImage imageNamed:@"bottomsettings.png"].size.height)];
    SettingButton.backgroundColor=[UIColor clearColor];
   [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateNormal];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings_sel.png"] forState:UIControlStateSelected];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings_sel.png"] forState:UIControlStateHighlighted];
    [SettingButton addTarget:self action:@selector(SettingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SettingButton];
    [self.view addSubview:BottomView];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
     SearchBar.showsCancelButton=YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar
{
    [aSearchBar resignFirstResponder];
    [self.view endEditing:YES];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [SearchBar resignFirstResponder];
    SearchBar.showsCancelButton=NO;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    footerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 40.0)];
    
   // activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityView.tag = 98989;
    
    activityView.frame = CGRectMake(150.0, 10.0, 20.0, 20.0);
    
    activityView.hidesWhenStopped = YES;
    
    [footerView addSubview:activityView];
    
    activityView = nil;
    
    return footerView;
}
#pragma  mark serverCallLoadMoreRows
-(void)serverCallLoadMoreRows

{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        
        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [unable show];
    }
    else
    {
        
        
          // [(UIActivityIndicatorView *)[footerView viewWithTag:98989] stopAnimating];
        
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        NSDictionary *params = @{
//                                 @"type":@"search_jobs_single_params",
//                                 };
//        NSLog(@"serverCallForSearchForKeyWord=>%@",params);
//        
//        [manager POST:[NSString stringWithFormat:@"%@",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
//         {
//             NSLog(@"serverCallForSearchForKeyWord JSON--->%@",json);
//             if([[json objectForKey:@"code"] isEqualToString:@"1"])
//             {
//
//             }
//    
//          
//         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             NSLog(@"Error: %@", error.description);
//        
//             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//             [unable show];
//         }];
    }
}
//#pragma Mark First Recent Tap Button Click View
//-(void)NewUpdateView :(int)indexRow
//{
//    [NoAppointmentButton removeFromSuperview];
//    NoAppointmentButton=nil;
//    NoAppointmentButton=[[UIButton alloc]initWithFrame:CGRectMake(0, UpcomingAppointmentLable.frame.size.height+UpcomingAppointmentLable.frame.origin.y+10, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.width, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height)];
//    NoAppointmentButton.backgroundColor=[UIColor clearColor];
//    [NoAppointmentButton setBackgroundImage:[UIImage imageNamed:@"ButtonBackGroundImage.png"] forState:UIControlStateNormal];
//    NoAppointmentButton.userInteractionEnabled=FALSE;
//    [HomeScrollView addSubview:NoAppointmentButton];
//    
//    
//    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,15,220,10)];
//    AppointmentNameTitleShow.textColor = [UIColor blackColor];
//    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
//    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
//    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
//    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
//    AppointmentNameTitleShow.numberOfLines=0;
//    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
//    [AppointmentNameTitleShow sizeToFit];
//    [NoAppointmentButton addSubview:AppointmentNameTitleShow];
//    
//    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
//    TypeNameTitleShow.textColor = [UIColor grayColor];
//    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
//    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
//    [TypeNameTitleShow sizeToFit];
//    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
//    TypeNameTitleShow.minimumScaleFactor=0.3;
//    
//    [NoAppointmentButton addSubview:TypeNameTitleShow];
//    
//    
//    
//    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(TypeNameTitleShow.frame.size.width+TypeNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
//    ProviderNameTitleShow.textColor = [UIColor grayColor];
//    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
//    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:indexRow];
//    
//    [ProviderNameTitleShow sizeToFit];
//    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
//    ProviderNameTitleShow.minimumScaleFactor=0.3;
//    [NoAppointmentButton addSubview:ProviderNameTitleShow];
//    
//    
//    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
//    NSString *date=[dateSplitArray objectAtIndex:0];
//    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
//    NSString *date2=[dateSplitArray2 objectAtIndex:1];
//    NSString *date3=[dateSplitArray2 objectAtIndex:2];
//    NSString *date4=[dateSplitArray2 objectAtIndex:0];
//    
//    if([date2 isEqualToString:@"01"]) date2=@"Jan";
//    if([date2 isEqualToString:@"02"]) date2=@"Feb";
//    if([date2 isEqualToString:@"03"]) date2=@"Mar";
//    if([date2 isEqualToString:@"04"]) date2=@"Apr";
//    if([date2 isEqualToString:@"05"]) date2=@"May";
//    if([date2 isEqualToString:@"06"]) date2=@"Jun";
//    if([date2 isEqualToString:@"07"]) date2=@"Jul";
//    if([date2 isEqualToString:@"08"]) date2=@"Aug";
//    if([date2 isEqualToString:@"09"]) date2=@"Sep";
//    if([date2 isEqualToString:@"10"]) date2=@"Oct";
//    if([date2 isEqualToString:@"11"]) date2=@"Nov";
//    if([date2 isEqualToString:@"12"]) date2=@"Dec";
//    
//    UILabel *DateLable = [[UILabel alloc] init];
//    DateLable.textColor = [UIColor grayColor];
//    DateLable.backgroundColor = [UIColor clearColor];
//    DateLable.textAlignment = NSTextAlignmentLeft;
//    DateLable.textColor=[UIColor colorWithRed:32/255.0 green:202/255.0 blue:168/255.0 alpha:1.0];
//    DateLable.font = [UIFont fontWithName:helveticaRegular size:20];
//    DateLable.text =[NSString stringWithFormat:@"%@",date3];
//    DateLable.numberOfLines=0;
//    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [DateLable sizeToFit];
//    DateLable.frame=CGRectMake(15,18,DateLable.frame.size.width,15);
//    [NoAppointmentButton addSubview:DateLable];
//    
//    UILabel *MonthLable = [[UILabel alloc] init];
//    MonthLable.textColor = [UIColor grayColor];
//    MonthLable.backgroundColor = [UIColor clearColor];
//    MonthLable.textAlignment = NSTextAlignmentLeft;
//    MonthLable.textColor=[UIColor lightGrayColor];
//    MonthLable.font = [UIFont fontWithName:helveticaRegular size:10];
//    MonthLable.text =[NSString stringWithFormat:@"%@",date2];
//    MonthLable.numberOfLines=0;
//    MonthLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [MonthLable sizeToFit];
//    MonthLable.text = [MonthLable.text uppercaseString];
//    MonthLable.frame=CGRectMake(15,DateLable.frame.size.height+DateLable.frame.origin.y+3,DateLable.frame.size.width,15);
//    [NoAppointmentButton addSubview:MonthLable];
//    
//    UILabel *YearLable = [[UILabel alloc] init];
//    YearLable.textColor = [UIColor grayColor];
//    YearLable.backgroundColor = [UIColor clearColor];
//    YearLable.textAlignment = NSTextAlignmentLeft;
//    YearLable.textColor=[UIColor lightGrayColor];
//    YearLable.font = [UIFont fontWithName:helveticaRegular size:8];
//    YearLable.numberOfLines=0;
//    YearLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [YearLable sizeToFit];
//    YearLable.text = [NSString stringWithFormat:@"%@",date4];
//    YearLable.frame=CGRectMake(15,MonthLable.frame.size.height+MonthLable.frame.origin.y,25,15);
//    [NoAppointmentButton addSubview:YearLable];
//
//}
//#pragma Mark Second Update Tap Button Click View
//-(void)NewUpdateView2 :(int)indexRow
//{
//    
//    [NoAppointmentButton removeFromSuperview];
//    NoAppointmentButton=nil;
//    NoAppointmentButton=[[UIButton alloc]initWithFrame:CGRectMake(0, UpcomingAppointmentLable.frame.size.height+UpcomingAppointmentLable.frame.origin.y, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.width, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height)];
//    NoAppointmentButton.backgroundColor=[UIColor clearColor];
//    [NoAppointmentButton setBackgroundImage:[UIImage imageNamed:@"ButtonBackGroundImage.png"] forState:UIControlStateNormal];
//    NoAppointmentButton.userInteractionEnabled=FALSE;
//    [HomeScrollView addSubview:NoAppointmentButton];
//    
//    
//    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,15,220,10)];
//    AppointmentNameTitleShow.textColor = [UIColor blackColor];
//    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
//    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
//    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
//    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
//    AppointmentNameTitleShow.numberOfLines=0;
//    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
//    [AppointmentNameTitleShow sizeToFit];
//    [NoAppointmentButton addSubview:AppointmentNameTitleShow];
//    
//    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
//    TypeNameTitleShow.textColor = [UIColor grayColor];
//    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
//    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
//    [TypeNameTitleShow sizeToFit];
//    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
//    TypeNameTitleShow.minimumScaleFactor=0.3;
//    
//    [NoAppointmentButton addSubview:TypeNameTitleShow];
//    
//    
//    
//    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(TypeNameTitleShow.frame.size.width+TypeNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
//    ProviderNameTitleShow.textColor = [UIColor grayColor];
//    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
//    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:indexRow];
//    
//    [ProviderNameTitleShow sizeToFit];
//    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
//    ProviderNameTitleShow.minimumScaleFactor=0.3;
//    [NoAppointmentButton addSubview:ProviderNameTitleShow];
//    
//    
//    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
//    NSString *date=[dateSplitArray objectAtIndex:0];
//    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
//    NSString *date2=[dateSplitArray2 objectAtIndex:1];
//    NSString *date3=[dateSplitArray2 objectAtIndex:2];
//    NSString *date4=[dateSplitArray2 objectAtIndex:0];
//
//    
//    if([date2 isEqualToString:@"01"]) date2=@"Jan";
//    if([date2 isEqualToString:@"02"]) date2=@"Feb";
//    if([date2 isEqualToString:@"03"]) date2=@"Mar";
//    if([date2 isEqualToString:@"04"]) date2=@"Apr";
//    if([date2 isEqualToString:@"05"]) date2=@"May";
//    if([date2 isEqualToString:@"06"]) date2=@"Jun";
//    if([date2 isEqualToString:@"07"]) date2=@"Jul";
//    if([date2 isEqualToString:@"08"]) date2=@"Aug";
//    if([date2 isEqualToString:@"09"]) date2=@"Sep";
//    if([date2 isEqualToString:@"10"]) date2=@"Oct";
//    if([date2 isEqualToString:@"11"]) date2=@"Nov";
//    if([date2 isEqualToString:@"12"]) date2=@"Dec";
//    
//    UILabel *DateLable = [[UILabel alloc] init];
//    DateLable.textColor = [UIColor grayColor];
//    DateLable.backgroundColor = [UIColor clearColor];
//    DateLable.textAlignment = NSTextAlignmentLeft;
//    DateLable.textColor=[UIColor colorWithRed:32/255.0 green:202/255.0 blue:168/255.0 alpha:1.0];
//    DateLable.font = [UIFont fontWithName:helveticaRegular size:20];
//    DateLable.text =[NSString stringWithFormat:@"%@",date3];
//    DateLable.numberOfLines=0;
//    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [DateLable sizeToFit];
//    DateLable.frame=CGRectMake(15,18,DateLable.frame.size.width,15);
//    [NoAppointmentButton addSubview:DateLable];
//    
//    UILabel *MonthLable = [[UILabel alloc] init];
//    MonthLable.textColor = [UIColor grayColor];
//    MonthLable.backgroundColor = [UIColor clearColor];
//    MonthLable.textAlignment = NSTextAlignmentLeft;
//    MonthLable.textColor=[UIColor lightGrayColor];
//    MonthLable.font = [UIFont fontWithName:helveticaRegular size:10];
//    MonthLable.text =[NSString stringWithFormat:@"%@",date2];
//    MonthLable.numberOfLines=0;
//    MonthLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [MonthLable sizeToFit];
//    MonthLable.text = [MonthLable.text uppercaseString];
//    MonthLable.frame=CGRectMake(15,DateLable.frame.size.height+DateLable.frame.origin.y+3,DateLable.frame.size.width,15);
//    [NoAppointmentButton addSubview:MonthLable];
//    
//    UILabel *YearLable = [[UILabel alloc] init];
//    YearLable.textColor = [UIColor grayColor];
//    YearLable.backgroundColor = [UIColor clearColor];
//    YearLable.textAlignment = NSTextAlignmentLeft;
//    YearLable.textColor=[UIColor lightGrayColor];
//    YearLable.font = [UIFont fontWithName:helveticaRegular size:8];
//    YearLable.numberOfLines=0;
//    YearLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [YearLable sizeToFit];
//    YearLable.text = [NSString stringWithFormat:@"%@",date4];
//    YearLable.frame=CGRectMake(15,MonthLable.frame.size.height+MonthLable.frame.origin.y,25,15);
//    [NoAppointmentButton addSubview:YearLable];
//    
//}
//#pragma Mark Third Update Tap Button Click View
//-(void)NewUpdateView3 :(int)indexRow
//{
//    NoAppointmentSecondButton=[[UIButton alloc]initWithFrame:CGRectMake(0, NoAppointmentButton.frame.size.height+NoAppointmentButton.frame.origin.y, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.width, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height)];
//    NoAppointmentSecondButton.backgroundColor=[UIColor clearColor];
//    [NoAppointmentSecondButton setBackgroundImage:[UIImage imageNamed:@"ButtonBackGroundImage.png"] forState:UIControlStateNormal];
//    NoAppointmentSecondButton.userInteractionEnabled=FALSE;
//    [HomeScrollView addSubview:NoAppointmentSecondButton];
//    
//    
//    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,15,220,10)];
//    AppointmentNameTitleShow.textColor = [UIColor blackColor];
//    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
//    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
//    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
//    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
//    AppointmentNameTitleShow.numberOfLines=0;
//    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
//    [AppointmentNameTitleShow sizeToFit];
//    [NoAppointmentSecondButton addSubview:AppointmentNameTitleShow];
//    
//    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
//    TypeNameTitleShow.textColor = [UIColor grayColor];
//    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
//    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
//    [TypeNameTitleShow sizeToFit];
//    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
//    TypeNameTitleShow.minimumScaleFactor=0.3;
//    
//    [NoAppointmentSecondButton addSubview:TypeNameTitleShow];
//    
//    
//    
//    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(TypeNameTitleShow.frame.size.width+TypeNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
//    ProviderNameTitleShow.textColor = [UIColor grayColor];
//    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
//    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:indexRow];
//    
//    [ProviderNameTitleShow sizeToFit];
//    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
//    ProviderNameTitleShow.minimumScaleFactor=0.3;
//    [NoAppointmentSecondButton addSubview:ProviderNameTitleShow];
//    
//    
//    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
//    NSString *date=[dateSplitArray objectAtIndex:0];
//    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
//    NSString *date2=[dateSplitArray2 objectAtIndex:1];
//    NSString *date3=[dateSplitArray2 objectAtIndex:2];
//     NSString *date4=[dateSplitArray2 objectAtIndex:0];
//    if([date2 isEqualToString:@"01"]) date2=@"Jan";
//    if([date2 isEqualToString:@"02"]) date2=@"Feb";
//    if([date2 isEqualToString:@"03"]) date2=@"Mar";
//    if([date2 isEqualToString:@"04"]) date2=@"Apr";
//    if([date2 isEqualToString:@"05"]) date2=@"May";
//    if([date2 isEqualToString:@"06"]) date2=@"Jun";
//    if([date2 isEqualToString:@"07"]) date2=@"Jul";
//    if([date2 isEqualToString:@"08"]) date2=@"Aug";
//    if([date2 isEqualToString:@"09"]) date2=@"Sep";
//    if([date2 isEqualToString:@"10"]) date2=@"Oct";
//    if([date2 isEqualToString:@"11"]) date2=@"Nov";
//    if([date2 isEqualToString:@"12"]) date2=@"Dec";
//    
//    UILabel *DateLable = [[UILabel alloc] init];
//    DateLable.textColor = [UIColor grayColor];
//    DateLable.backgroundColor = [UIColor clearColor];
//    DateLable.textAlignment = NSTextAlignmentLeft;
//    DateLable.textColor=[UIColor colorWithRed:32/255.0 green:202/255.0 blue:168/255.0 alpha:1.0];
//    DateLable.font = [UIFont fontWithName:helveticaRegular size:20];
//    DateLable.text =[NSString stringWithFormat:@"%@",date3];
//    DateLable.numberOfLines=0;
//    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [DateLable sizeToFit];
//    DateLable.frame=CGRectMake(15,18,DateLable.frame.size.width,15);
//    [NoAppointmentSecondButton addSubview:DateLable];
//    
//    UILabel *MonthLable = [[UILabel alloc] init];
//    MonthLable.textColor = [UIColor grayColor];
//    MonthLable.backgroundColor = [UIColor clearColor];
//    MonthLable.textAlignment = NSTextAlignmentLeft;
//    MonthLable.textColor=[UIColor lightGrayColor];
//    MonthLable.font = [UIFont fontWithName:helveticaRegular size:10];
//    MonthLable.text =[NSString stringWithFormat:@"%@",date2];
//    MonthLable.numberOfLines=0;
//    MonthLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [MonthLable sizeToFit];
//    MonthLable.text = [MonthLable.text uppercaseString];
//    MonthLable.frame=CGRectMake(15,DateLable.frame.size.height+DateLable.frame.origin.y+3,DateLable.frame.size.width,15);
//    [NoAppointmentSecondButton addSubview:MonthLable];
//    
//    
//    UILabel *YearLable = [[UILabel alloc] init];
//    YearLable.textColor = [UIColor grayColor];
//    YearLable.backgroundColor = [UIColor clearColor];
//    YearLable.textAlignment = NSTextAlignmentLeft;
//    YearLable.textColor=[UIColor lightGrayColor];
//    YearLable.font = [UIFont fontWithName:helveticaRegular size:8];
//    YearLable.numberOfLines=0;
//    YearLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [YearLable sizeToFit];
//    YearLable.text = [NSString stringWithFormat:@"%@",date4];
//    YearLable.frame=CGRectMake(15,MonthLable.frame.size.height+MonthLable.frame.origin.y,25,15);
//    [NoAppointmentSecondButton addSubview:YearLable];
//
//}
//#pragma Mark Third Update Tap Button Click View
//-(void)NewUpdateView4 :(int)indexRow
//{
//    
//    NoAppointmentThirdButton=[[UIButton alloc]initWithFrame:CGRectMake(0, NoAppointmentSecondButton.frame.size.height+NoAppointmentSecondButton.frame.origin.y, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.width, [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height)];
//    NoAppointmentThirdButton.backgroundColor=[UIColor clearColor];
//    [NoAppointmentThirdButton setBackgroundImage:[UIImage imageNamed:@"ButtonBackGroundImage.png"] forState:UIControlStateNormal];
//    NoAppointmentThirdButton.userInteractionEnabled=FALSE;
//    [HomeScrollView addSubview:NoAppointmentThirdButton];
//    
//    
//    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,15,220,10)];
//    AppointmentNameTitleShow.textColor = [UIColor blackColor];
//    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
//    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
//    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
//    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
//    AppointmentNameTitleShow.numberOfLines=0;
//    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
//    [AppointmentNameTitleShow sizeToFit];
//    [NoAppointmentThirdButton addSubview:AppointmentNameTitleShow];
//    
//    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
//    TypeNameTitleShow.textColor = [UIColor grayColor];
//    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
//    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
//    [TypeNameTitleShow sizeToFit];
//    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
//    TypeNameTitleShow.minimumScaleFactor=0.3;
//    [NoAppointmentThirdButton addSubview:TypeNameTitleShow];
//    
//    
//    
//    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(TypeNameTitleShow.frame.size.width+TypeNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
//    ProviderNameTitleShow.textColor = [UIColor grayColor];
//    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
//    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
//    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:indexRow];
//    
//    [ProviderNameTitleShow sizeToFit];
//    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
//    ProviderNameTitleShow.minimumScaleFactor=0.3;
//    [NoAppointmentThirdButton addSubview:ProviderNameTitleShow];
//    
//    
//    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
//    NSString *date=[dateSplitArray objectAtIndex:0];
//    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
//    NSString *date2=[dateSplitArray2 objectAtIndex:1];
//    NSString *date3=[dateSplitArray2 objectAtIndex:2];
//    NSString *date4=[dateSplitArray2 objectAtIndex:0];
//    if([date2 isEqualToString:@"01"]) date2=@"Jan";
//    if([date2 isEqualToString:@"02"]) date2=@"Feb";
//    if([date2 isEqualToString:@"03"]) date2=@"Mar";
//    if([date2 isEqualToString:@"04"]) date2=@"Apr";
//    if([date2 isEqualToString:@"05"]) date2=@"May";
//    if([date2 isEqualToString:@"06"]) date2=@"Jun";
//    if([date2 isEqualToString:@"07"]) date2=@"Jul";
//    if([date2 isEqualToString:@"08"]) date2=@"Aug";
//    if([date2 isEqualToString:@"09"]) date2=@"Sep";
//    if([date2 isEqualToString:@"10"]) date2=@"Oct";
//    if([date2 isEqualToString:@"11"]) date2=@"Nov";
//    if([date2 isEqualToString:@"12"]) date2=@"Dec";
//    
//    UILabel *DateLable = [[UILabel alloc] init];
//    DateLable.textColor = [UIColor grayColor];
//    DateLable.backgroundColor = [UIColor clearColor];
//    DateLable.textAlignment = NSTextAlignmentLeft;
//    DateLable.textColor=[UIColor colorWithRed:32/255.0 green:202/255.0 blue:168/255.0 alpha:1.0];
//    DateLable.font = [UIFont fontWithName:helveticaRegular size:20];
//    DateLable.text =[NSString stringWithFormat:@"%@",date3];
//    DateLable.numberOfLines=0;
//    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [DateLable sizeToFit];
//    DateLable.frame=CGRectMake(15,18,DateLable.frame.size.width,15);
//    [NoAppointmentThirdButton addSubview:DateLable];
//    
//    UILabel *MonthLable = [[UILabel alloc] init];
//    MonthLable.textColor = [UIColor grayColor];
//    MonthLable.backgroundColor = [UIColor clearColor];
//    MonthLable.textAlignment = NSTextAlignmentLeft;
//    MonthLable.textColor=[UIColor lightGrayColor];
//    MonthLable.font = [UIFont fontWithName:helveticaRegular size:10];
//    MonthLable.text =[NSString stringWithFormat:@"%@",date2];
//    MonthLable.numberOfLines=0;
//    MonthLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [MonthLable sizeToFit];
//    MonthLable.text = [MonthLable.text uppercaseString];
//    MonthLable.frame=CGRectMake(15,DateLable.frame.size.height+DateLable.frame.origin.y+3,DateLable.frame.size.width,15);
//    [NoAppointmentThirdButton addSubview:MonthLable];
//    
//    UILabel *YearLable = [[UILabel alloc] init];
//    YearLable.textColor = [UIColor grayColor];
//    YearLable.backgroundColor = [UIColor clearColor];
//    YearLable.textAlignment = NSTextAlignmentLeft;
//    YearLable.textColor=[UIColor lightGrayColor];
//    YearLable.font = [UIFont fontWithName:helveticaRegular size:8];
//    YearLable.numberOfLines=0;
//    YearLable.lineBreakMode =NSLineBreakByCharWrapping;
//    [YearLable sizeToFit];
//    YearLable.text = [NSString stringWithFormat:@"%@",date4];
//    YearLable.frame=CGRectMake(15,MonthLable.frame.size.height+MonthLable.frame.origin.y,25,15);
//    [NoAppointmentThirdButton addSubview:YearLable];
//    
//}
#pragma mark -UITableView Datasource and Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"recentupdates=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] count]);
    return [[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellIdentifier = @"Cell";
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.leftUtilityButtons = [self leftButtons];
        cell.rightUtilityButtons = [self rightButtons];
        cell.delegate = self;
    }
    else
    {
        UIButton *btnRemove = (UIButton*)[cell.contentView viewWithTag:1111];
        [btnRemove removeFromSuperview];
        btnRemove = nil;
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    UIButton *CellButtonClick;
    CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,[UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height);
    CellButtonClick.backgroundColor=[UIColor clearColor];
    [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    CellButtonClick.layer.masksToBounds = NO;
    CellButtonClick.exclusiveTouch=YES;
   // CellButtonClick.tag=[[arrayForIDs objectAtIndex:indexPath.row]integerValue];
    [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"ButtonBackGroundImage.png"] forState:UIControlStateNormal];
    [CellButtonClick addTarget:self action:@selector(cellButtonClickUpcomingInfromation:) forControlEvents:UIControlEventTouchUpInside];
    CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    CellButtonClick.layer.borderWidth = 0.5f;
    
    
    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,15,220,10)];
    AppointmentNameTitleShow.textColor = [UIColor blackColor];
    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmentname"] objectAtIndex:indexPath.row]; AppointmentNameTitleShow.numberOfLines=0;
    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [AppointmentNameTitleShow sizeToFit];
    [CellButtonClick addSubview:AppointmentNameTitleShow];
    
    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
    TypeNameTitleShow.textColor = [UIColor grayColor];
    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttype"] objectAtIndex:indexPath.row];
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
    TypeNameTitleShow.minimumScaleFactor=0.3;
    [CellButtonClick addSubview:TypeNameTitleShow];
    
   
    
    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(TypeNameTitleShow.frame.size.width+TypeNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
    ProviderNameTitleShow.textColor = [UIColor grayColor];
    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"provider"]objectAtIndex:indexPath.row];
    
    [ProviderNameTitleShow sizeToFit];
    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [CellButtonClick addSubview:ProviderNameTitleShow];
    
    
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttime"] objectAtIndex:indexPath.row] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    NSString *date4=[dateSplitArray2 objectAtIndex:0];

    
    if([date2 isEqualToString:@"01"]) date2=@"Jan";
    if([date2 isEqualToString:@"02"]) date2=@"Feb";
    if([date2 isEqualToString:@"03"]) date2=@"Mar";
    if([date2 isEqualToString:@"04"]) date2=@"Apr";
    if([date2 isEqualToString:@"05"]) date2=@"May";
    if([date2 isEqualToString:@"06"]) date2=@"Jun";
    if([date2 isEqualToString:@"07"]) date2=@"Jul";
    if([date2 isEqualToString:@"08"]) date2=@"Aug";
    if([date2 isEqualToString:@"09"]) date2=@"Sep";
    if([date2 isEqualToString:@"10"]) date2=@"Oct";
    if([date2 isEqualToString:@"11"]) date2=@"Nov";
    if([date2 isEqualToString:@"12"]) date2=@"Dec";
    
    UILabel *DateLable = [[UILabel alloc] init];
    DateLable.textColor = [UIColor grayColor];
    DateLable.backgroundColor = [UIColor clearColor];
    DateLable.textAlignment = NSTextAlignmentLeft;
    DateLable.textColor=[UIColor colorWithRed:32/255.0 green:202/255.0 blue:168/255.0 alpha:1.0];
    DateLable.font = [UIFont fontWithName:helveticaRegular size:20];
    DateLable.text =[NSString stringWithFormat:@"%@",date3];
    DateLable.numberOfLines=0;
    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
    [DateLable sizeToFit];
    DateLable.frame=CGRectMake(15,18,DateLable.frame.size.width,15);
    [CellButtonClick addSubview:DateLable];
    
    UILabel *MonthLable = [[UILabel alloc] init];
    MonthLable.textColor = [UIColor grayColor];
    MonthLable.backgroundColor = [UIColor clearColor];
    MonthLable.textAlignment = NSTextAlignmentLeft;
    MonthLable.textColor=[UIColor lightGrayColor];
    MonthLable.font = [UIFont fontWithName:helveticaRegular size:10];
    MonthLable.text =[NSString stringWithFormat:@"%@",date2];
    MonthLable.numberOfLines=0;
    MonthLable.lineBreakMode =NSLineBreakByCharWrapping;
    [MonthLable sizeToFit];
    MonthLable.text = [MonthLable.text uppercaseString];
    MonthLable.frame=CGRectMake(15,DateLable.frame.size.height+DateLable.frame.origin.y+3,50,15);
    [CellButtonClick addSubview:MonthLable];
    
    
    UILabel *YearLable = [[UILabel alloc] init];
    YearLable.textColor = [UIColor grayColor];
    YearLable.backgroundColor = [UIColor clearColor];
    YearLable.textAlignment = NSTextAlignmentLeft;
    YearLable.textColor=[UIColor lightGrayColor];
    YearLable.font = [UIFont fontWithName:helveticaRegular size:8];
    YearLable.numberOfLines=0;
    YearLable.lineBreakMode =NSLineBreakByCharWrapping;
    [YearLable sizeToFit];
    YearLable.text = [NSString stringWithFormat:@"%@",date4];
    YearLable.frame=CGRectMake(15,MonthLable.frame.size.height+MonthLable.frame.origin.y,25,15);
    [CellButtonClick addSubview:YearLable];
    
    
    [cell.contentView addSubview:CellButtonClick];
    
    return cell;
}
-(IBAction)cellButtonClickUpcomingInfromation:(id)sender{
    
}
#pragma mark -UITableView Datasource and Delegate methods

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                               title:@"Shortcut"];
    
    return leftUtilityButtons;
}

#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state
{
    switch (state) {
        case 0:
            NSLog(@"utility buttons closed");
            break;
        case 1:
            NSLog(@"left utility buttons open");
            break;
        case 2:
            NSLog(@"right utility buttons open");
            break;
        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}

- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    switch (state) {
        case 1:
            // set to NO to disable all left utility buttons appearing
            return YES;
            break;
        case 2:
            // set to NO to disable all right utility buttons appearing
            return YES;
            break;
        default:
            break;
    }
    
    return YES;
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    if (index == 0)
    {
        NSLog(@"Shortcut button is pressed");
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    if (index == 0)
    {
        NSLog(@"delete button is pressed");
        
        
        
        NSIndexPath *cellIndexPath = [RecentTableView indexPathForCell:cell];
        NSString *appointmentID         =       [[[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"] valueForKey:@"appointmentid"] objectAtIndex:cellIndexPath.row];
        
        NSLog(@"appointmentID %@",appointmentID);
        

        
        UIAlertView *alertDelete = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Are you sure you want to delete?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil];
        alertDelete.tag=3;
        [alertDelete show];
    }
}
-(void)SettingButtonAction
{
    SettingScreenViewController *settingView=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:settingView animated:NO];
}
-(void)appointmentlistview
{
    AppointmentCalenderViewController  *Appointmentslistview=[[AppointmentCalenderViewController alloc]init];
    [self.navigationController pushViewController:Appointmentslistview animated:NO];
}
-(void)ShortCutButtonAction{
    
}
-(void)HomeButtonAction{
   
}
-(void)AppointmentButtonAction{
    
    AppointmentListViewController *appointmentList=[[AppointmentListViewController alloc]init];
    [self.navigationController pushViewController:appointmentList animated:NO];
}
-(void)MedicalButtonAction{

    MedicalListViewController *MedialList=[[MedicalListViewController alloc]init];
    [self.navigationController pushViewController:MedialList animated:NO];
}
-(void)ProfileButtonAction{
    ProfileViewController *MedialList=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:MedialList animated:NO];
}
-(IBAction)menuButtonAction:(UIButton*)sender
{
    if (sender.selected==NO)
    {
    
    sender.selected=YES;
    [moreButtonview removeFromSuperview];
    moreButtonview=nil;
    moreButtonview=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+moreButtonview.frame.origin.y, self.view.frame.size.width,183)];
    moreButtonview.backgroundColor=[UIColor clearColor];
 
    [AppointmentButton removeFromSuperview];
    AppointmentButton=nil;
    AppointmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    AppointmentButton.frame = CGRectMake(0, 0, [UIImage imageNamed:@"addappointment.png"].size.width, [UIImage imageNamed:@"addappointment.png"].size.height);
    AppointmentButton .backgroundColor=[UIColor clearColor];
    [AppointmentButton setBackgroundImage:[UIImage imageNamed:@"addappointment.png"] forState:UIControlStateNormal];
    [AppointmentButton addTarget:self action:@selector(AddNewAppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [moreButtonview addSubview:AppointmentButton];
    
    [MedicalRecordButton removeFromSuperview];
    MedicalRecordButton=nil;
    MedicalRecordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    MedicalRecordButton.frame = CGRectMake(0, AppointmentButton.frame.size.height+AppointmentButton.frame.origin.y,  [UIImage imageNamed:@"addmedicalrecord.png"].size.width, [UIImage imageNamed:@"addmedicalrecord.png"].size.height);
    [MedicalRecordButton setBackgroundImage:[UIImage imageNamed:@"addmedicalrecord.png"] forState:UIControlStateNormal];
    MedicalRecordButton.layer.borderColor = [UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0].CGColor;;
    MedicalRecordButton.layer.borderWidth = 1;
    [MedicalRecordButton addTarget:self action:@selector(AddNewMedicalRecordsButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [moreButtonview addSubview:MedicalRecordButton];
    
    [MedicalViewListRecordButton removeFromSuperview];
    MedicalViewListRecordButton=nil;
    MedicalViewListRecordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    MedicalViewListRecordButton.frame = CGRectMake(0, MedicalRecordButton.frame.size.height+MedicalRecordButton.frame.origin.y, [UIImage imageNamed:@"viewbyhealthcare.png"].size.width, [UIImage imageNamed:@"viewbyhealthcare.png"].size.height);
    MedicalViewListRecordButton .backgroundColor=[UIColor clearColor];
    [MedicalViewListRecordButton setBackgroundImage:[UIImage imageNamed:@"viewbyhealthcare.png"] forState:UIControlStateNormal];
    [MedicalViewListRecordButton addTarget:self action:@selector(viewbyhealthcareprovider) forControlEvents:UIControlEventTouchUpInside];
    [moreButtonview addSubview:MedicalViewListRecordButton];
    [self.view addSubview:moreButtonview];
    
    [moreButtonBlackview removeFromSuperview];
    moreButtonBlackview=nil;
    moreButtonBlackview=[[UIView alloc]initWithFrame:CGRectMake(0, moreButtonview.frame.size.height+moreButtonview.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    moreButtonBlackview.backgroundColor=[UIColor blackColor];
    moreButtonBlackview.alpha=0.5;
    [self.view addSubview:moreButtonBlackview];
    }
    else
    {
        
        [moreButtonview removeFromSuperview];
        [moreButtonBlackview removeFromSuperview];
        moreButtonBlackview=nil;
        moreButtonview=nil;
        
         sender.selected=NO;
    }
}
-(void)viewbyhealthcareprovider
{
    MedicalListViewController *viewhealthcareprovider=[[MedicalListViewController alloc]init];
    [self.navigationController pushViewController:viewhealthcareprovider animated:YES];
}
-(void)AddNewAppointmentButtonAction
{
    AddAppointmentViewController *AddNewAppointments=[[AddAppointmentViewController alloc]init];
    [self.navigationController pushViewController:AddNewAppointments animated:YES];
}
-(void)AddNewMedicalRecordsButtonAction
{
    AddMedicalRecordViewController *AddNewMedicalrecords=[[AddMedicalRecordViewController alloc]init];
    [self.navigationController pushViewController:AddNewMedicalrecords animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
