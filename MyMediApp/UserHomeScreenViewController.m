//
//  ListOfAppoinmentViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 11/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "UserHomeScreenViewController.h"


@interface UserHomeScreenViewController ()

{

    UIView *BackGroundBlackView;
    UIScrollView *ScrollerView;
    UIPageControl *pageControl;
    UIButton *EmergencyButton;
    UIButton *ShortCutButton;
    UILabel *firstNameLable;
    UILabel *lastNameLable;
    UILabel *addressNameLable;
    UILabel *PhoneNumberNameLable;
    UIButton*UpcommingButtonActionArrow;
    UIButton*RecentButtonActionArrow;
    AsyncImageView *EditChangeImage;
   
    NSString *urlString2;
    UIButton *HomeButton;
    UIButton *MedicalRecordButton;
    UIButton *AppointmentButton;
    UIButton *MapButton;
    UIButton *SlidMenuButton;
    UIView *TopBarView;
    UIView *MedicalTopBarView;
    UIView *CenterView;
    UIView *BottomView;
    
    UIView *SliderViewBar;
    NSString *savedImagePath;
    NSData *imageData;
    
    UIImageView *LestGuiderHeaderImageView;
    UILabel *LetsGuideLable;
    UIButton *CrossButtonClick;
    
    UIImageView *FirstFrameImageView;
    UIImageView *SecondFrameImageView;
    UIImageView *ThirdFrameImageView;
    UIImageView *FourthFrameImageView;
    UIImageView *FifthFrameImageView;
    UIImageView *SelectBarImageView;

    
    UIButton *NextClickButton;
    UIButton *NextClickButton2;
    UIButton *NextClickButton3;
    UIButton *NextClickButton4;
    UIButton *NextClickButton5;
    UIActivityIndicatorView *activityView;
    
    UIView *MapSubView;
    UIView *lineView;
    UIImage *HomeImage;
    UIImage *HomeAfterClick;
    UIImage *MedicalRecordsImageDefault;
    UIImage *MedicalRecordsImageAferClick;
    
    UIImage *AppointmentsImageDefault;
    UIImage *AppointmentsImageAfterClick;
    
    UIImage *MapImageDefault;
    UIImage *MapImageAfterClick;
    
    UIImage *SliderBarDefault;
    NSString *path;
    UIImage *FirstImage;
    UIImage *secondImage;
    UIImage *ThirdImage;
    UIImage *FourthImage;
    UIImage *FifthImage;
    
    UIView *UserHomeGroundView;
    UIView *MedicalHomeGroundView;
    UIView *AppointmentGroudView;
    UIView *MapGroundView;
    
    
    //medical elements
    UIButton *SortButton;
    UIButton *SearchButton;
    UIImageView *DemoImageView;
    UIButton *CreateNewMedicalButton;
    
    
    //appointments elements
    UIView *AppointmentTopBarView;
    UIButton *AppointmentSortButton;
    UIButton *AppointmentSearchButton;
    UIImageView *AppointmentDemoImageView;
    UIButton *CreateNewAppointmentsButton;
    UIButton *FirstRowCellButtonClick;;
    
     UIButton *SecondRowCellButtonClick;;
    
    //Map Elements
    UIView *MapTopBarView;
    int BottomNavigationButtonFlag;
    int SliderBarViewSatus;
    
    UIScrollView *UserGuideScrollView;
    UIButton *EmergencySliderButton;
    UIButton *SyncButton;
    UIImageView *loginImageView;
    UIImageView *divImageView;
    
    UIView *UpcommingView;
    UIView *RecentView;
      UIView *footerView;
    UITapGestureRecognizer *tap;
    
    UIButton *AccountButton;
    UIButton *SettingButton;
    UIButton *HelpButton;
    UIButton *ReportButton;
    UIButton *LegalButton;
    UILabel *copyRightLable;
    
    CLLocationManager *locationManager;
    
    UITableView *AddAppointmentTableView;
    UIView *AppointmentSubView;
    
    UISearchBar *SearchBar;
    
    NSDictionary *appointmentsDictionary;
    NSArray *appointmentSectionTitles;
    NSMutableArray *appointmentIDArrayForDelete;
    NSMutableArray *appointmentIDsTag;
    
     NSMutableArray *tempArrayForAppointmentID;
     NSMutableArray *tempArrayForAppointmentName;
     NSMutableArray *tempArrayForAppointmentTime;
     NSMutableArray *tempArrayForConsultantName;
     NSMutableArray *tempArrayForHospital;
     NSMutableArray *tempArrayForNotes;
     NSMutableArray *tempArrayForProvider;
    
    
    NSMutableArray *ArrayForAppointmentID;
    NSMutableArray *ArrayForAppointmentName;
    NSMutableArray *ArrayForAppointmentTime;
    NSMutableArray *ArrayForConsultantName;
    NSMutableArray *ArrayForHospital;
    NSMutableArray *ArrayForNotes;
    NSMutableArray *ArrayForProvider;

    NSArray *tempappointmentSectionTitles;
    
    int rowTappedForDelete;
    
}
@end

@implementation UserHomeScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isNewAppointmentCreatedByUser"] == YES)
    {
        NSLog(@"API RUN");
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isNewAppointmentCreatedByUser"];
        [self APICallForUserAppointment];       // API CALL FOR USER APPOINTMENTS
    }
    else
    {
        NSLog(@"API NOT RUN");
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isNewAppointmentCreatedByUser"];
   
    appointmentSectionTitles = [NSArray arrayWithObjects:@"July",@"August",@"September",@"October",@"November",@"December",@"January",@"February",@"March",@"April",@"May",@"June", nil];
    tempappointmentSectionTitles  = [appointmentSectionTitles mutableCopy];
    NSLog(@"tempappointmentSectionTitles is %@",tempappointmentSectionTitles);

    
    NSLog(@"heightheightheight=%f",self.view.frame.size.height);
    appointmentsDictionary = [[NSDictionary alloc]init];
    appointmentIDArrayForDelete = [[NSMutableArray alloc]init];
    appointmentIDsTag =[[NSMutableArray alloc]init];
    
    
    ArrayForAppointmentID = [[NSMutableArray alloc]init];
    ArrayForAppointmentName = [[NSMutableArray alloc]init];
    ArrayForAppointmentTime = [[NSMutableArray alloc]init];
    ArrayForConsultantName = [[NSMutableArray alloc]init];
    ArrayForHospital = [[NSMutableArray alloc]init];
    ArrayForNotes = [[NSMutableArray alloc]init];
    ArrayForProvider = [[NSMutableArray alloc]init];

    
    
    tempArrayForAppointmentID = [[NSMutableArray alloc]init];
    tempArrayForAppointmentName = [[NSMutableArray alloc]init];
    tempArrayForAppointmentTime = [[NSMutableArray alloc]init];
    tempArrayForConsultantName = [[NSMutableArray alloc]init];
    tempArrayForHospital = [[NSMutableArray alloc]init];
    tempArrayForNotes = [[NSMutableArray alloc]init];
    tempArrayForProvider = [[NSMutableArray alloc]init];

    
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
   
    ScrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    ScrollerView.backgroundColor=[UIColor clearColor];
    ScrollerView.pagingEnabled=TRUE;
    ScrollerView.delegate=self;
    ScrollerView.bounces=NO;
    ScrollerView.scrollEnabled=FALSE;
    ScrollerView.showsHorizontalScrollIndicator=NO;
    [ScrollerView setContentSize:CGSizeMake(320*4,568-50)];
   

#pragma mark UserHomeGroundView
    
    
       UserHomeGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 518)];
       UserHomeGroundView.backgroundColor=[UIColor clearColor];
    
       TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width,255/2+20)];
       TopBarView.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
       TopBarView.userInteractionEnabled=TRUE;
    
        EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(20, 30, 100, 100)];
        urlString2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"image_url"];
        EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
        EditChangeImage.image=[UIImage imageNamed:@"ProfileImage.jpeg"];
        EditChangeImage.backgroundColor=[UIColor clearColor];
        EditChangeImage.layer.masksToBounds = YES;
        EditChangeImage.layer.borderWidth = 1;
        EditChangeImage.contentMode = UIViewContentModeScaleAspectFill;
        EditChangeImage.layer.borderColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
        EditChangeImage.userInteractionEnabled=YES;
        [[EditChangeImage layer]setCornerRadius:50];
    
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
        [tap setNumberOfTouchesRequired:1];
        [EditChangeImage addGestureRecognizer:tap];
        [TopBarView addSubview:EditChangeImage];
    
    firstNameLable=[[UILabel alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+20, 40, 120, 20)];
    firstNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"firstname"];
    firstNameLable.backgroundColor=[UIColor clearColor];
    firstNameLable.font=[UIFont fontWithName:helveticaRegular size:17];
    firstNameLable.textAlignment=NSTextAlignmentLeft;
    firstNameLable.textColor=[UIColor blackColor];
    [TopBarView addSubview:firstNameLable];
    
    lastNameLable=[[UILabel alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+20, firstNameLable.frame.size.height+firstNameLable.frame.origin.y, 120, 20)];
    if ([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"lastname"] isEqualToString:@""]) {
            lastNameLable.text=@"---";
    }
    else{
    lastNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"lastname"];
    }
    lastNameLable.backgroundColor=[UIColor clearColor];
    lastNameLable.font=[UIFont fontWithName:helveticaRegular size:17];
    lastNameLable.textAlignment=NSTextAlignmentLeft;
    lastNameLable.textColor=[UIColor blackColor];
    [TopBarView addSubview:lastNameLable];
    
    UIImageView *addressStaticImage=[[UIImageView alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.y+10, firstNameLable.frame.size.height+firstNameLable.frame.origin.y+35, [UIImage imageNamed:@"staticaddress.png"].size.width, [UIImage imageNamed:@"staticaddress.png"].size.height)];
    addressStaticImage.image=[UIImage imageNamed:@"staticaddress.png"];
    addressStaticImage.backgroundColor=[UIColor clearColor];
    [TopBarView addSubview:addressStaticImage];
    
    
    addressNameLable=[[UILabel alloc]initWithFrame:CGRectMake(addressStaticImage.frame.size.width+addressStaticImage.frame.origin.x+5, firstNameLable.frame.size.height+firstNameLable.frame.origin.y+35, 120, 20)];
    if ([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"] isEqualToString:@""]) {
        addressNameLable.text=@"---";
    }
    else{
        addressNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"];
    }
    addressNameLable.backgroundColor=[UIColor clearColor];
    addressNameLable.font=[UIFont fontWithName:helveticaRegular size:13];
    addressNameLable.textAlignment=NSTextAlignmentLeft;
    addressNameLable.textColor=[UIColor blackColor];
    [TopBarView addSubview:addressNameLable];
    
    
    UIImageView *PhoneStaticImage=[[UIImageView alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.y+10, addressNameLable.frame.size.height+addressNameLable.frame.origin.y+5, [UIImage imageNamed:@"staticelephone.png"].size.width, [UIImage imageNamed:@"staticelephone.png"].size.height)];
    PhoneStaticImage.image=[UIImage imageNamed:@"staticelephone.png"];
    PhoneStaticImage.backgroundColor=[UIColor clearColor];
    [TopBarView addSubview:PhoneStaticImage];
    
    PhoneNumberNameLable=[[UILabel alloc]initWithFrame:CGRectMake(PhoneStaticImage.frame.size.width+PhoneStaticImage.frame.origin.x+5, addressNameLable.frame.size.height+addressNameLable.frame.origin.y+2, 120, 20)];
    PhoneNumberNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"phone"];
    PhoneNumberNameLable.backgroundColor=[UIColor clearColor];
    PhoneNumberNameLable.font=[UIFont fontWithName:helveticaRegular size:13];
    PhoneNumberNameLable.textAlignment=NSTextAlignmentLeft;
    PhoneNumberNameLable.textColor=[UIColor blackColor];
    [TopBarView addSubview:PhoneNumberNameLable];
    
     NSLog(@"login data=%@",[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData]);
    
     [UserHomeGroundView addSubview:TopBarView];
    
        CenterView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, self.view.frame.size.width, 398)];
        CenterView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];

        EmergencyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        EmergencyButton.frame = CGRectMake(0, 2, [UIImage imageNamed:@"emergency.png"].size.width, [UIImage imageNamed:@"emergency.png"].size.height);
        [EmergencyButton setImage:[UIImage imageNamed:@"emergency.png"] forState:UIControlStateNormal];
        [EmergencyButton addTarget:self action:@selector(EmergencyButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [CenterView addSubview:EmergencyButton];
    

        ShortCutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        ShortCutButton.frame = CGRectMake(EmergencyButton.frame.size.width+EmergencyButton.frame.origin.x+1, 2, [UIImage imageNamed:@"shortcut.png"].size.width+2, [UIImage imageNamed:@"shortcut.png"].size.height);
        [ShortCutButton setImage:[UIImage imageNamed:@"shortcut.png"] forState:UIControlStateNormal];
        [ShortCutButton setTitleColor:[UIColor clearColor] forState:(UIControlStateNormal)];
        [ShortCutButton addTarget:self action:@selector(shortCutsAction) forControlEvents:UIControlEventTouchUpInside];
        [CenterView addSubview:ShortCutButton];
    
    UpcommingView=[[UIView alloc]initWithFrame:CGRectMake(10, ShortCutButton.frame.size.height+ShortCutButton.frame.origin.y+14, 300, 121)];
    UpcommingView.userInteractionEnabled=TRUE;
    
    UpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    UpcommingButtonActionArrow.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
    [UpcommingButtonActionArrow addTarget:self action:@selector(UpcomingViewAction) forControlEvents:UIControlEventTouchUpInside];
    [UpcommingButtonActionArrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UpcommingButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    UpcommingButtonActionArrow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [UpcommingButtonActionArrow setTitle:@"UPCOMING APPOINTMENTS" forState:(UIControlState)UIControlStateNormal];
    [UpcommingButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [UpcommingButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [UpcommingButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"bar_with_arrow.png"] forState:UIControlStateNormal];
    UpcommingButtonActionArrow.titleEdgeInsets = UIEdgeInsetsMake(5, 20, 0, 0);
    
    
    
    NSLog(@"upcomingappointments=%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"]);
    
   // NSLog(@"count=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]);
    
    NSLog(@"upcomingappointments=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]);
   
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]<1)
    {
    
    UIButton*FirstUpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, UpcommingButtonActionArrow.frame.size.height+UpcommingButtonActionArrow.frame.origin.y, 300, 40)];
    FirstUpcommingButtonActionArrow.backgroundColor=[UIColor whiteColor];
    [FirstUpcommingButtonActionArrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [FirstUpcommingButtonActionArrow setTitle:@"NO APPOINTMENTS CREATED" forState:(UIControlState)UIControlStateNormal];
    FirstUpcommingButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 12];
    [FirstUpcommingButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [FirstUpcommingButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [UpcommingView addSubview:FirstUpcommingButtonActionArrow];
        
    }
else
{
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]==1){
        [self NewUpdateView :0];
    }
    else
        
         NSLog(@"count=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]);
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]>=2)
    {
        [self NewUpdateView :0];
        [self SecondUpdateFunciton :1];
    }
    
    
}
    
    
//        UIButton*FirstUpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, UpcommingButtonActionArrow.frame.size.height+UpcommingButtonActionArrow.frame.origin.y, 300, 40)];
//        FirstUpcommingButtonActionArrow.backgroundColor=[UIColor yellowColor];
//        [FirstUpcommingButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
//        [UpcommingView addSubview:FirstUpcommingButtonActionArrow];
//    
//        UIButton*SecondViewUpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, FirstUpcommingButtonActionArrow.frame.size.height+FirstUpcommingButtonActionArrow.frame.origin.y+1, 300, 40)];
//        SecondViewUpcommingButtonActionArrow.backgroundColor=[UIColor yellowColor];
//         [SecondViewUpcommingButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
       [UpcommingView addSubview:FirstRowCellButtonClick];
    
    [UpcommingView addSubview:SecondRowCellButtonClick];
    
    
        [UpcommingView addSubview:UpcommingButtonActionArrow];
        [CenterView addSubview:UpcommingView];

    RecentView=[[UIView alloc]initWithFrame:CGRectMake(10, UpcommingView.frame.size.height+UpcommingView.frame.origin.y+25, 300, 160)];
    RecentView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    RecentButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    [RecentButtonActionArrow addTarget:self action:@selector(RecentViewAction) forControlEvents:UIControlEventTouchUpInside];
    RecentButtonActionArrow.backgroundColor=[UIColor blackColor];
    [RecentButtonActionArrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    RecentButtonActionArrow.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
    RecentButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    RecentButtonActionArrow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [RecentButtonActionArrow setTitle:@"RECENT UPDATES" forState:(UIControlState)UIControlStateNormal];
    [RecentButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [RecentButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [RecentButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"bar_with_arrow.png"] forState:UIControlStateNormal];
    RecentButtonActionArrow.titleEdgeInsets = UIEdgeInsetsMake(5, 20, 0, 0);
    
    
    
    UIButton*FirstRecntButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, RecentButtonActionArrow.frame.size.height+RecentButtonActionArrow.frame.origin.y, 300, 40)];
        FirstRecntButtonActionArrow.backgroundColor=[UIColor whiteColor];
      [FirstRecntButtonActionArrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [FirstRecntButtonActionArrow setTitle:@"NO RECENT UPDATES" forState:(UIControlState)UIControlStateNormal];
        FirstRecntButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 12];
    [FirstRecntButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [RecentButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
       // [FirstRecntButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
       [RecentView addSubview:FirstRecntButtonActionArrow];
    
//        UIButton*SecondViewRecentButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, FirstRecntButtonActionArrow.frame.size.height+FirstRecntButtonActionArrow.frame.origin.y+1, 300, 40)];
//        SecondViewRecentButtonActionArrow.backgroundColor=[UIColor whiteColor];
//         [SecondViewRecentButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
//        [RecentView addSubview:SecondViewRecentButtonActionArrow];
//    
//        UIButton*ThirdRecentButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, SecondViewRecentButtonActionArrow.frame.size.height+SecondViewRecentButtonActionArrow.frame.origin.y+1, 300, 40)];
//        ThirdRecentButtonActionArrow.backgroundColor=[UIColor whiteColor];
//         [ThirdRecentButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
//        [RecentView addSubview:ThirdRecentButtonActionArrow];
        [RecentView addSubview:RecentButtonActionArrow];
    
        [CenterView addSubview:RecentView];
        [UserHomeGroundView addSubview:CenterView];
        [ScrollerView addSubview:UserHomeGroundView];
    
    
#pragma mark MedicalHomeGroundView
    
     MedicalHomeGroundView=[[UIView alloc]initWithFrame:CGRectMake(UserHomeGroundView.frame.size.width+UserHomeGroundView.frame.origin.x, 0, self.view.frame.size.width, 490)];
     MedicalHomeGroundView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    
    MedicalTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width,70)];
    MedicalTopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    MedicalTopBarView.userInteractionEnabled=TRUE;
    
    SortButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 20,[UIImage imageNamed:@"sort_button.png"].size.width ,[UIImage imageNamed:@"sort_button.png"].size.height)];
    [SortButton setImage:[UIImage imageNamed:@"sort_button.png"] forState:UIControlStateNormal];
    SortButton.backgroundColor=[UIColor clearColor];
    [MedicalTopBarView addSubview:SortButton];
    
    
    UILabel *MedicalTitleLable=[[UILabel  alloc]initWithFrame:CGRectMake(80, 30, 150, 20)];
    MedicalTitleLable.backgroundColor=[UIColor clearColor];
    MedicalTitleLable.text=@"MEDICAL RECORDS";
    MedicalTitleLable.font=[UIFont fontWithName:helveticaRegular size:15];
    MedicalTitleLable.textColor=[UIColor blackColor];
    MedicalTitleLable.textAlignment=NSTextAlignmentCenter;
    [MedicalTopBarView addSubview:MedicalTitleLable];
    
    
    SearchButton=[[UIButton alloc]initWithFrame:CGRectMake(SortButton.frame.size.width+SortButton.frame.origin.y+15, 15,[UIImage imageNamed:@"SearchButtonImage"].size.width ,[UIImage imageNamed:@"SearchButtonImage"].size.height)];
    SearchButton.backgroundColor=[UIColor clearColor];
    [SearchButton setImage:[UIImage imageNamed:@"SearchButtonImage"] forState:UIControlStateNormal];
    [MedicalTopBarView addSubview:SearchButton];
    
    CreateNewMedicalButton=[[UIButton alloc]initWithFrame:CGRectMake(275, 20,[UIImage imageNamed:@"add_button.png"].size.width ,[UIImage imageNamed:@"add_button.png"].size.height)];
    CreateNewMedicalButton.backgroundColor=[UIColor clearColor];
    [CreateNewMedicalButton setImage:[UIImage imageNamed:@"add_button.png"] forState:UIControlStateNormal];
    //[CreateNewMedicalButton addTarget:self action:@selector(CreateNewMedicalReport) forControlEvents:UIControlEventTouchUpInside];
    [MedicalTopBarView addSubview:CreateNewMedicalButton];
    [MedicalHomeGroundView addSubview:MedicalTopBarView];
    
    UIView *MedicalSubView=[[UIView alloc]initWithFrame:CGRectMake(0, MedicalTopBarView.frame.size.height+MedicalTopBarView.frame.origin.y, self.view.frame.size.width, 443)];
    MedicalSubView.backgroundColor=[UIColor whiteColor];
    MedicalSubView.clipsToBounds = YES;
    
    CALayer *rightBorder1 = [CALayer layer];
    rightBorder1.borderColor = [UIColor blackColor].CGColor;
    rightBorder1.borderWidth = 1;
    rightBorder1.frame = CGRectMake(1, 1, CGRectGetWidth(MedicalSubView.frame),1);
    
    [MedicalSubView.layer addSublayer:rightBorder1];
    
    
    
DemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 80, [UIImage imageNamed:@"medecal_records_tuts.png"].size.width, [UIImage imageNamed:@"medecal_records_tuts.png"].size.height)];
 DemoImageView.image=[UIImage imageNamed:@"medecal_records_tuts.png"];
    [MedicalSubView addSubview:DemoImageView];
    
    
    [MedicalHomeGroundView addSubview:MedicalSubView];
    [ScrollerView addSubview:MedicalHomeGroundView];
    
    
#pragma mark AppointmentGroudView
    
    AppointmentGroudView=[[UIView alloc]initWithFrame:CGRectMake(MedicalHomeGroundView.frame.size.width+MedicalHomeGroundView.frame.origin.x, 0, self.view.frame.size.width, 490)];
    AppointmentGroudView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    
    
    AppointmentTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width,70)];
    AppointmentTopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    AppointmentTopBarView.userInteractionEnabled=TRUE;
    
    UILabel *AppointmentTitleLable=[[UILabel  alloc]initWithFrame:CGRectMake(60, 30, 200, 30)];
    AppointmentTitleLable.backgroundColor=[UIColor clearColor];
    AppointmentTitleLable.text=@"APPOINTMENT RECORDS";
    AppointmentTitleLable.font=[UIFont fontWithName:helveticaRegular size:15];
    AppointmentTitleLable.textColor=[UIColor blackColor];
    AppointmentTitleLable.textAlignment=NSTextAlignmentCenter;
    [AppointmentTopBarView addSubview:AppointmentTitleLable];
    
    
    
    AppointmentSortButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 20,[UIImage imageNamed:@"sort_button.png"].size.width ,[UIImage imageNamed:@"sort_button.png"].size.height)];
   [AppointmentSortButton setImage:[UIImage imageNamed:@"sort_button.png"] forState:UIControlStateNormal];
     AppointmentSortButton.backgroundColor=[UIColor clearColor];
    [AppointmentTopBarView addSubview:AppointmentSortButton];
    
    
    CreateNewAppointmentsButton=[[UIButton alloc]initWithFrame:CGRectMake(275, 20,[UIImage imageNamed:@"add_button.png"].size.width ,[UIImage imageNamed:@"add_button.png"].size.height)];
    CreateNewAppointmentsButton.backgroundColor=[UIColor clearColor];
    [CreateNewAppointmentsButton setImage:[UIImage imageNamed:@"add_button.png"] forState:UIControlStateNormal];
    [CreateNewAppointmentsButton addTarget:self action:@selector(CreateNewAppointments) forControlEvents:UIControlEventTouchUpInside];
    [AppointmentTopBarView addSubview:CreateNewAppointmentsButton];
    
    
    
    AppointmentSearchButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentSortButton.frame.size.width+AppointmentSortButton.frame.origin.y+15, 15,[UIImage imageNamed:@"SearchButtonImage"].size.width ,[UIImage imageNamed:@"SearchButtonImage"].size.width)];
    AppointmentSearchButton.backgroundColor=[UIColor clearColor];
    [AppointmentSearchButton setImage:[UIImage imageNamed:@"SearchButtonImage"] forState:UIControlStateNormal];
    [AppointmentTopBarView addSubview:AppointmentSearchButton];
    [AppointmentGroudView addSubview:AppointmentTopBarView];
    
    
    AppointmentSubView=[[UIView alloc]initWithFrame:CGRectMake(0, AppointmentTopBarView.frame.size.height+AppointmentTopBarView.frame.origin.y, self.view.frame.size.width, 443)];
    AppointmentSubView.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
    
     AppointmentSubView.clipsToBounds = YES;
    CALayer *rightBorder = [CALayer layer];
    rightBorder.borderColor = [UIColor blackColor].CGColor;
    rightBorder.borderWidth = 1;
    rightBorder.frame = CGRectMake(1, 1, CGRectGetWidth(AppointmentSubView.frame),1);
    
    [AppointmentSubView.layer addSublayer:rightBorder];
    
    
    
  //  [self AddAppointmentTableViewFunction];
    [AppointmentGroudView addSubview:AppointmentSubView];
    [ScrollerView addSubview:AppointmentGroudView];
    
#pragma mark MapGroundView
    
    MapGroundView=[[UIView alloc]initWithFrame:CGRectMake(AppointmentGroudView.frame.size.width+AppointmentGroudView.frame.origin.x, 0, self.view.frame.size.width, 490)];
    MapGroundView.userInteractionEnabled=TRUE;
   MapGroundView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    
    MapTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width,70)];
    MapTopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    UILabel *MapTitleLable=[[UILabel  alloc]initWithFrame:CGRectMake(105, 25, 100, 30)];
    MapTitleLable.backgroundColor=[UIColor clearColor];
    MapTitleLable.text=@"MAP";
    MapTitleLable.font=[UIFont fontWithName:helveticaRegular size:18];
    MapTitleLable.textColor=[UIColor blackColor];
    MapTitleLable.textAlignment=NSTextAlignmentCenter;
    [MapTopBarView addSubview:MapTitleLable];
    [MapGroundView  addSubview:MapTopBarView];
    
    MapSubView=[[UIView alloc]initWithFrame:CGRectMake(0, MapTopBarView.frame.size.height+MapTopBarView.frame.origin.y, self.view.frame.size.width, 443)];
    MapSubView.backgroundColor=[UIColor whiteColor];
    
    MapSubView.clipsToBounds = YES;
    CALayer *rightBorder2 = [CALayer layer];
    rightBorder2.borderColor = [UIColor blackColor].CGColor;
    rightBorder2.borderWidth = 1;
    rightBorder2.frame = CGRectMake(1, 1, CGRectGetWidth(MapSubView.frame),1);
    [MapSubView.layer addSublayer:rightBorder2];
    
    [MapGroundView addSubview:MapSubView];
    
    
    [ScrollerView addSubview:MapGroundView];
    [self.view addSubview:ScrollerView];

#pragma mark BottomView

    BottomView=[[UIView alloc]initWithFrame:CGRectMake(0, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, 320, 50)];
    BottomView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    SelectBarImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, [UIImage imageNamed:@"selected_bar.png"].size.width, [UIImage imageNamed:@"selected_bar.png"].size.height)];
    SelectBarImageView.image=[UIImage imageNamed:@"selected_bar.png"];
    [BottomView addSubview:SelectBarImageView];
//
    HomeImage=[UIImage  imageNamed:@"home_icocn_non_selected.png"];
    HomeAfterClick=[UIImage imageNamed:@"home_iconNav.png"];
    
    NSLog(@"HomeImage=%f",HomeImage.size.width);
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, HomeImage.size.width,HomeImage.size.height)];
    HomeButton.backgroundColor=[UIColor clearColor];
    [HomeButton setImage:HomeImage forState:UIControlStateNormal];
    
    [HomeButton setImage:HomeAfterClick forState:UIControlStateSelected];
    [HomeButton setImage:HomeAfterClick forState:UIControlStateHighlighted];
    HomeButton.userInteractionEnabled=FALSE;
    [HomeButton addTarget:self action:@selector(HomeButtonActionDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    
    MedicalRecordsImageDefault=[UIImage imageNamed:@"medical_records.png"];
    MedicalRecordsImageAferClick=[UIImage imageNamed:@"medical_records_selected.png"];
    
     NSLog(@"MedicalRecordsImageDefault=%f",MedicalRecordsImageDefault.size.width);
    
    MedicalRecordButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width, 0, MedicalRecordsImageDefault.size.width, MedicalRecordsImageDefault.size.height)];
    MedicalRecordButton.backgroundColor=[UIColor clearColor];
   [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateSelected];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateHighlighted];
    [MedicalRecordButton addTarget:self action:@selector(MedicalButtonActionDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MedicalRecordButton];

    
    AppointmentsImageDefault=[UIImage  imageNamed:@"appoinment_icon.png"];
    AppointmentsImageAfterClick=[UIImage  imageNamed:@"appoinment_selected_icon.png"];
    
    NSLog(@"AppointmentsImageDefault=%f",AppointmentsImageDefault.size.width);
    
    AppointmentButton=[[UIButton alloc]initWithFrame:CGRectMake(MedicalRecordButton.frame.size.width+MedicalRecordButton.frame.origin.x, 0, AppointmentsImageDefault.size.width, AppointmentsImageDefault.size.height)];
    AppointmentButton.backgroundColor=[UIColor clearColor];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateSelected];
    [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateHighlighted];
    //[AppointmentButton addTarget:self action:@selector(AppointmentsButtonAction) forControlEvents:UIControlEventTouchUpInside];
     [AppointmentButton addTarget:self action:@selector(AppointmentsButtonDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:AppointmentButton];

    
    MapImageDefault=[UIImage imageNamed:@"location_iconNav.png"];
    MapImageAfterClick=[UIImage imageNamed:@"location_icon_selected.png"];
    
     NSLog(@"MapImageAfterClick=%f",MapImageAfterClick.size.width);
    
    MapButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentButton.frame.size.width+AppointmentButton.frame.origin.x+5, 0, MapImageDefault.size.width, MapImageDefault.size.height)];
    MapButton.backgroundColor=[UIColor clearColor];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateSelected];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateHighlighted];
    [MapButton addTarget:self action:@selector(MapButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MapButton];
    
    SliderBarDefault=[UIImage imageNamed:@"side_barNav.png"];
    
     NSLog(@"SliderBarDefault=%f",SliderBarDefault.size.width);
    
    SlidMenuButton=[[UIButton alloc]initWithFrame:CGRectMake(MapButton.frame.size.width+MapButton.frame.origin.x+5, 0, SliderBarDefault.size.width, SliderBarDefault.size.height)];
    SlidMenuButton.backgroundColor=[UIColor clearColor];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [SlidMenuButton addTarget:self action:@selector(SliderButtonDownDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SlidMenuButton];
    [self.view addSubview:BottomView];
    
    BackGroundBlackView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    BackGroundBlackView.backgroundColor=[UIColor blackColor];
    BackGroundBlackView.alpha=0.5;
    [self.view addSubview:BackGroundBlackView];
    BackGroundBlackView.hidden=YES;
    
    SliderViewBar=[[UIView alloc]initWithFrame:CGRectMake(400, 20, 300,self.view.frame.size.height)];
    SliderViewBar.backgroundColor=[UIColor colorWithRed:245/255.0 green:242/255.0 blue:237/255.0 alpha:1.0];
    SliderViewBar.tag=200;
    SliderViewBar.userInteractionEnabled=TRUE;
    
   EmergencySliderButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SliderViewBar.frame.size.width, 50)];
    [EmergencySliderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   // [EmergencySliderButton addTarget:self action:@selector(SubmitButtonAction)forControlEvents:UIControlEventTouchUpInside];
    EmergencySliderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [EmergencySliderButton setTitle:@"EMERGENCY" forState:(UIControlState)UIControlStateNormal];
    EmergencySliderButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 25];
    EmergencySliderButton.titleEdgeInsets = UIEdgeInsetsMake(5, 50, 0, 0);
    EmergencySliderButton.backgroundColor=[UIColor blackColor];
    [EmergencySliderButton addTarget:self action:@selector(EmergencyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [SliderViewBar addSubview:EmergencySliderButton];
    
    
    UILabel *SizeLable=[[UILabel alloc]initWithFrame:CGRectMake(25, EmergencySliderButton.frame.size.height+EmergencySliderButton.frame.origin.y+40, 270, 15)];
    SizeLable.backgroundColor=[UIColor clearColor];
    SizeLable.textAlignment=NSTextAlignmentLeft;
    SizeLable.textColor=[UIColor blackColor];
    SizeLable.text=@"Current monthly usage : 20 MB of 60 MB";
    SizeLable.font=[UIFont fontWithName:helveticaThin size:12];
    [SliderViewBar addSubview:SizeLable];
    
    UIView *lineView1=[[UIView alloc]initWithFrame:CGRectMake(25,EmergencySliderButton.frame.size.height+EmergencySliderButton.frame.origin.y+60,215,1)];
    lineView1.layer.borderColor = [UIColor blackColor].CGColor;
    lineView1.backgroundColor=[UIColor darkGrayColor];
    lineView1.layer.borderWidth = 1.0f;
    [SliderViewBar addSubview:lineView1];
    
    UILabel *SyncLable=[[UILabel alloc]initWithFrame:CGRectMake(90, lineView1.frame.size.height+lineView1.frame.origin.y+10, 100, 15)];
    SyncLable.backgroundColor=[UIColor clearColor];
    SyncLable.textAlignment=NSTextAlignmentLeft;
    SyncLable.textColor=[UIColor blackColor];
    SyncLable.text=@"Last sync 10/8";
    SyncLable.font=[UIFont fontWithName:helveticaThin size:12];
    [SliderViewBar addSubview:SyncLable];

    
    
    SyncButton=[[UIButton alloc]initWithFrame:CGRectMake(10, EmergencySliderButton.frame.size.height+EmergencySliderButton.frame.origin.y+140,250 ,40)];
    [SyncButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[SyncButton addTarget:self action:@selector(SyncButtonAction)forControlEvents:UIControlEventTouchUpInside];
    SyncButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    SyncButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [SyncButton setTitle:@"Sync Now" forState:(UIControlState)UIControlStateNormal];
    SyncButton.titleEdgeInsets = UIEdgeInsetsMake(5, 90, 0, 0);
    SyncButton.backgroundColor=[UIColor colorWithRed:168/255.0 green:227/255.0 blue:249/255.0 alpha:1.0];
    SyncButton.clipsToBounds = YES;
    SyncButton.layer.cornerRadius=5;
    [SliderViewBar addSubview:SyncButton];

    loginImageView=[[UIImageView alloc]init];
    [loginImageView setFrame:CGRectMake(0, SyncButton.frame.size.height+SyncButton.frame.origin.y+40, 270, 250)];
    [loginImageView setBackgroundColor:[UIColor grayColor]];
    loginImageView.userInteractionEnabled  =TRUE;
    [loginImageView setUserInteractionEnabled:YES];
    [SliderViewBar addSubview:loginImageView];

    for(int i=0;i<6;i++)
    {
        divImageView=[[UIImageView alloc]init];
        [divImageView setFrame:CGRectMake(0, 51*i, 270, 1)];
        [divImageView setBackgroundColor:[UIColor blackColor]];
        [divImageView setUserInteractionEnabled:YES];
        [loginImageView addSubview:divImageView];
    }
    
    AccountButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,270 ,50)];
    [AccountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [AccountButton setTitle:@"Account" forState:(UIControlState)UIControlStateNormal];
    AccountButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    AccountButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    AccountButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [AccountButton addTarget:self action:@selector(AccountScreen) forControlEvents:UIControlEventTouchUpInside];
    AccountButton.backgroundColor=[UIColor colorWithRed:168/255.0 green:227/255.0 blue:249/255.0 alpha:1.0];
    [loginImageView addSubview:AccountButton];

    SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(0, AccountButton.frame.size.height+AccountButton.frame.origin.y+1,270 ,50)];
    [SettingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [SettingButton setTitle:@"Settings" forState:(UIControlState)UIControlStateNormal];
    SettingButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    SettingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    SettingButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [SettingButton addTarget:self action:@selector(settingsScreen) forControlEvents:UIControlEventTouchUpInside];
    SettingButton.backgroundColor=[UIColor colorWithRed:168/255.0 green:227/255.0 blue:249/255.0 alpha:1.0];
    [loginImageView addSubview:SettingButton];

    HelpButton=[[UIButton alloc]initWithFrame:CGRectMake(0, SettingButton.frame.size.height+SettingButton.frame.origin.y+1,270 ,50)];
    [HelpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [HelpButton setTitle:@"Help" forState:(UIControlState)UIControlStateNormal];
    HelpButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    HelpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    HelpButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    HelpButton.backgroundColor=[UIColor colorWithRed:168/255.0 green:227/255.0 blue:249/255.0 alpha:1.0];
    [HelpButton addTarget:self action:@selector(HelpScreen) forControlEvents:UIControlEventTouchUpInside];
    [loginImageView addSubview:HelpButton];

    ReportButton=[[UIButton alloc]initWithFrame:CGRectMake(0, HelpButton.frame.size.height+HelpButton.frame.origin.y+1,270 ,50)];
    [ReportButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ReportButton setTitle:@"Report" forState:(UIControlState)UIControlStateNormal];
    ReportButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    ReportButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    ReportButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    ReportButton.backgroundColor=[UIColor colorWithRed:168/255.0 green:227/255.0 blue:249/255.0 alpha:1.0];
    [ReportButton addTarget:self action:@selector(ReportScreen) forControlEvents:UIControlEventTouchUpInside];
    [loginImageView addSubview:ReportButton];

    LegalButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ReportButton.frame.size.height+ReportButton.frame.origin.y+1,270 ,51)];
    [LegalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [LegalButton setTitle:@"Legal" forState:(UIControlState)UIControlStateNormal];
    LegalButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    LegalButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    LegalButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [LegalButton addTarget:self action:@selector(LegalScreen) forControlEvents:UIControlEventTouchUpInside];
    LegalButton.backgroundColor=[UIColor colorWithRed:168/255.0 green:227/255.0 blue:249/255.0 alpha:1.0];
    [loginImageView addSubview:LegalButton];
    
    copyRightLable=[[UILabel  alloc]initWithFrame:CGRectMake(180, loginImageView.frame.size.height+loginImageView.frame.origin.y+8, 80, 20)];
    copyRightLable.backgroundColor=[UIColor clearColor];
    copyRightLable.text=@"Copyright 2014";
    copyRightLable.font=[UIFont fontWithName:helveticaRegular size:10];
    copyRightLable.textColor=[UIColor blackColor];
    copyRightLable.textAlignment=NSTextAlignmentCenter;
    [SliderViewBar addSubview:copyRightLable];
    [self.view addSubview:SliderViewBar];
    
    SliderViewBar.hidden=YES;
    SliderBarViewSatus=5;
    BottomNavigationButtonFlag=1;
    
    [self HideActivityIndicator];
    NSLog(@"view_tutorial=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"view_tutorial"] integerValue]);
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"view_tutorial"] integerValue]==0)
    {
        [self userGuide];
    }
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"AddAppointmentClick"];
}

-(void) NewUpdateView :(int)indexRow
{

    FirstRowCellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    
    FirstRowCellButtonClick.frame = CGRectMake(0, UpcommingButtonActionArrow.frame.size.height+UpcommingButtonActionArrow.frame.origin.y, 300.5, 50);
    
    FirstRowCellButtonClick.backgroundColor=[UIColor clearColor];
    [FirstRowCellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    FirstRowCellButtonClick.layer.masksToBounds = NO;
    FirstRowCellButtonClick.exclusiveTouch=YES;
    [FirstRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
    [FirstRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
    
    //[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] objectAtIndex:0]
    
    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
    AppointmentNameTitleShow.textColor = [UIColor blackColor];
    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
    AppointmentNameTitleShow.numberOfLines=0;
    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [AppointmentNameTitleShow sizeToFit];
    [FirstRowCellButtonClick addSubview:AppointmentNameTitleShow];
    
    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
    TypeNameTitleShow.textColor = [UIColor grayColor];
    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
    //TypeNameTitleShow.textAlignment = NSTextAlignmentLeft;
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
    // TypeNameTitleShow.numberOfLines=0;
    // TypeNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
    
    //TypeNameTitleShow.lineBreakMode = NSLineBreakByCharWrapping;
    //[TypeNameTitleShow setAdjustsFontSizeToFitWidth:YES];
    TypeNameTitleShow.minimumScaleFactor=0.3;
    
    [FirstRowCellButtonClick addSubview:TypeNameTitleShow];
    
    CGRect size_label = [TypeNameTitleShow.text boundingRectWithSize:CGSizeMake(320, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
                                                          attributes:@{ NSFontAttributeName : [UIFont fontWithName:helveticaRegular size:12]}
                                                             context:nil];
    
    UIView* line=[[UIView alloc]initWithFrame:CGRectMake(size_label.size.width+TypeNameTitleShow.frame.origin.x-7,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5, 1,12)];
    line.layer.borderColor = [UIColor grayColor].CGColor;
    line.layer.borderWidth = 1.0f;
    [FirstRowCellButtonClick addSubview:line];
    
    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(line.frame.size.width+line.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
    ProviderNameTitleShow.textColor = [UIColor grayColor];
    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:indexRow];
    
    [ProviderNameTitleShow sizeToFit];
    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
    
    //TypeNameTitleShow.lineBreakMode = NSLineBreakByCharWrapping;
    //[TypeNameTitleShow setAdjustsFontSizeToFitWidth:YES];
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [FirstRowCellButtonClick addSubview:ProviderNameTitleShow];
    
    
    
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    
    NSString *date4=[dateSplitArray2 objectAtIndex:0];
    
    NSLog(@"date2=%@",date2);
    
    NSLog(@"date3=%@",date3);
    
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
    DateLable.font = [UIFont fontWithName:helveticaRegular size:10];
    DateLable.text =[NSString stringWithFormat:@"%@ %@ %@",date3,date2,date4];
    DateLable.numberOfLines=0;
    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
    [DateLable sizeToFit];
    DateLable.frame=CGRectMake(290-DateLable.frame.size.width,10,DateLable.frame.size.width,15);
    [FirstRowCellButtonClick addSubview:DateLable];
    
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    //  NSString *TimeString2=[TimeSplitArray2 objectAtIndex:2];
    
    NSLog(@"TimeString1=%@",TimeString1);
    
    UILabel *TimeLable = [[UILabel alloc] init];
    TimeLable.textColor = [UIColor grayColor];
    TimeLable.backgroundColor = [UIColor clearColor];
    TimeLable.textAlignment = NSTextAlignmentLeft;
    TimeLable.font = [UIFont fontWithName:helveticaRegular size:10];
    TimeLable.text =[NSString stringWithFormat:@"%@",TimeString1];
    TimeLable.numberOfLines=0;
    TimeLable.lineBreakMode =NSLineBreakByCharWrapping;
    [TimeLable sizeToFit];
    TimeLable.frame=CGRectMake(290-TimeLable.frame.size.width,DateLable.frame.size.height+DateLable.frame.origin.y+3,TimeLable.frame.size.width,13);
    [FirstRowCellButtonClick addSubview:TimeLable];
    


}


-(void)SecondUpdateFunciton:(int)indexRow
{
    
        
        SecondRowCellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
        
        SecondRowCellButtonClick.frame = CGRectMake(0, FirstRowCellButtonClick.frame.size.height+FirstRowCellButtonClick.frame.origin.y, 300.5, 50);
        
        SecondRowCellButtonClick.backgroundColor=[UIColor clearColor];
        [SecondRowCellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        SecondRowCellButtonClick.layer.masksToBounds = NO;
        SecondRowCellButtonClick.exclusiveTouch=YES;
        [SecondRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
        [SecondRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
        
        
        UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
        AppointmentNameTitleShow.textColor = [UIColor blackColor];
        AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
        AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
        AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
        AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
        AppointmentNameTitleShow.numberOfLines=0;
        AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
        [AppointmentNameTitleShow sizeToFit];
        [SecondRowCellButtonClick addSubview:AppointmentNameTitleShow];
        
        UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
        TypeNameTitleShow.textColor = [UIColor grayColor];
        TypeNameTitleShow.backgroundColor = [UIColor clearColor];
        //TypeNameTitleShow.textAlignment = NSTextAlignmentLeft;
        TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
        TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
        // TypeNameTitleShow.numberOfLines=0;
        // TypeNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
        [TypeNameTitleShow sizeToFit];
        TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
        
        //TypeNameTitleShow.lineBreakMode = NSLineBreakByCharWrapping;
        //[TypeNameTitleShow setAdjustsFontSizeToFitWidth:YES];
        TypeNameTitleShow.minimumScaleFactor=0.3;
        
        [SecondRowCellButtonClick addSubview:TypeNameTitleShow];
        
        CGRect size_label = [TypeNameTitleShow.text boundingRectWithSize:CGSizeMake(320, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
                                                              attributes:@{ NSFontAttributeName : [UIFont fontWithName:helveticaRegular size:12]}
                                                                 context:nil];
        
        UIView* line=[[UIView alloc]initWithFrame:CGRectMake(size_label.size.width+TypeNameTitleShow.frame.origin.x-7,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5, 1,12)];
        line.layer.borderColor = [UIColor grayColor].CGColor;
        line.layer.borderWidth = 1.0f;
        [SecondRowCellButtonClick addSubview:line];
        
        UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(line.frame.size.width+line.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
        ProviderNameTitleShow.textColor = [UIColor grayColor];
        ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
        ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
        ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:indexRow];
        
        [ProviderNameTitleShow sizeToFit];
        ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
        
        //TypeNameTitleShow.lineBreakMode = NSLineBreakByCharWrapping;
        //[TypeNameTitleShow setAdjustsFontSizeToFitWidth:YES];
        ProviderNameTitleShow.minimumScaleFactor=0.3;
        [SecondRowCellButtonClick addSubview:ProviderNameTitleShow];
        
        
        
        
        NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
        NSString *date=[dateSplitArray objectAtIndex:0];
        
        NSString *dateTime=[dateSplitArray objectAtIndex:1];
        
        
        NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
        NSString *date2=[dateSplitArray2 objectAtIndex:1];
        NSString *date3=[dateSplitArray2 objectAtIndex:2];
        
        NSString *date4=[dateSplitArray2 objectAtIndex:0];
        
        NSLog(@"date2=%@",date2);
        
        NSLog(@"date3=%@",date3);
        
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
        DateLable.font = [UIFont fontWithName:helveticaRegular size:10];
        DateLable.text =[NSString stringWithFormat:@"%@ %@ %@",date3,date2,date4];
        DateLable.numberOfLines=0;
        DateLable.lineBreakMode =NSLineBreakByCharWrapping;
        [DateLable sizeToFit];
        DateLable.frame=CGRectMake(290-DateLable.frame.size.width,10,DateLable.frame.size.width,15);
        [SecondRowCellButtonClick addSubview:DateLable];
        
        
        NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
        NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
        //  NSString *TimeString2=[TimeSplitArray2 objectAtIndex:2];
        
        NSLog(@"TimeString1=%@",TimeString1);
        
        UILabel *TimeLable = [[UILabel alloc] init];
        TimeLable.textColor = [UIColor grayColor];
        TimeLable.backgroundColor = [UIColor clearColor];
        TimeLable.textAlignment = NSTextAlignmentLeft;
        TimeLable.font = [UIFont fontWithName:helveticaRegular size:10];
        TimeLable.text =[NSString stringWithFormat:@"%@",TimeString1];
        TimeLable.numberOfLines=0;
        TimeLable.lineBreakMode =NSLineBreakByCharWrapping;
        [TimeLable sizeToFit];
        TimeLable.frame=CGRectMake(290-TimeLable.frame.size.width,DateLable.frame.size.height+DateLable.frame.origin.y+3,TimeLable.frame.size.width,13);
        [SecondRowCellButtonClick addSubview:TimeLable];
        
        
    

}


#pragma mark UserAppointment API
-(void)APICallForUserAppointment
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        [self HideActivityIndicator];
        
        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [unable show];
    }
    else
    {
               
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *params = @{
                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"]
                                };
        
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/get_all_user_appointment",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            NSLog(@"JSON--->%@",json);
            if([json objectForKey:@"error"])
            {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
            }
            else if([json objectForKey:@"log"])
            {
                NSLog(@"Log --> User Appointment ==>> %@",[json objectForKey:@"log"]);
                
                AppointmentDemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 80, [UIImage imageNamed:@"Staticapponments_page.png"].size.width,[UIImage imageNamed:@"Staticapponments_page.png"].size.height)];
                AppointmentDemoImageView.image=[UIImage imageNamed:@"Staticapponments_page.png"];
                [AppointmentSubView addSubview:AppointmentDemoImageView];
            }
            else
            {
                
                
            
                appointmentsDictionary = json;
                
                [appointmentIDArrayForDelete removeAllObjects];
                [ArrayForAppointmentName removeAllObjects];
                [ArrayForAppointmentTime removeAllObjects];
                [ArrayForConsultantName removeAllObjects];
                [ArrayForHospital removeAllObjects];
                [ArrayForNotes removeAllObjects];
                [ArrayForProvider removeAllObjects];
                
                [tempArrayForAppointmentID removeAllObjects];
                [tempArrayForAppointmentName removeAllObjects];
                [tempArrayForAppointmentTime removeAllObjects];
                [tempArrayForConsultantName removeAllObjects];
                [tempArrayForHospital removeAllObjects];
                
                [tempArrayForNotes removeAllObjects];
                [tempArrayForProvider removeAllObjects];
                
                
                for (int i = 0; i<12; i++)
                {
                    [appointmentIDArrayForDelete addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmentid"]];
                    [ArrayForAppointmentName addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmentname"]];
                    [ArrayForAppointmentTime addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmenttime"]];
                    [ArrayForConsultantName addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"consultantname"]];
                    [ArrayForHospital addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"hospital"]];
                    [ArrayForNotes addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"notes"]];
                    [ArrayForProvider addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"provider"]];
                }
                
               //  NSLog(@"appointmentIDArrayForDelete is %@",appointmentIDArrayForDelete);
                
               //  NSLog(@"ArrayForAppointmentName is %@",ArrayForAppointmentName);
                
                
                for (int i = 0; i<12; i++)
                {
                    for (int j=0; j<[[appointmentIDArrayForDelete objectAtIndex:i]count]; j++)
                    {
                        [appointmentIDsTag addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                        
                        [ArrayForAppointmentID addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                     //   NSLog(@"ArrayForAppointmentID=%@",ArrayForAppointmentID);
                        
                        [ArrayForAppointmentName addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                        [ArrayForAppointmentTime addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                        [ArrayForConsultantName addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                        [ArrayForHospital addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                        [ArrayForNotes addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                        [ArrayForProvider addObject:[[appointmentIDArrayForDelete objectAtIndex:i] objectAtIndex:j]];
                        
                       
                        
                        
                        [tempArrayForAppointmentID addObject:[ArrayForAppointmentID objectAtIndex:i]];
                        [tempArrayForAppointmentName addObject:[[ArrayForAppointmentName objectAtIndex:i] objectAtIndex:j]];
                        [tempArrayForAppointmentTime addObject:[[ArrayForAppointmentTime objectAtIndex:i] objectAtIndex:j]];
                        [tempArrayForConsultantName addObject:[[ArrayForConsultantName objectAtIndex:i] objectAtIndex:j]];
                        [tempArrayForHospital addObject:[[ArrayForHospital objectAtIndex:i] objectAtIndex:j]];
                        [tempArrayForNotes addObject:[[ArrayForNotes objectAtIndex:i] objectAtIndex:j]];
                        [tempArrayForProvider addObject:[[ArrayForProvider objectAtIndex:i] objectAtIndex:j]];
                        
                        
                        
                        
//                        [tempArrayForAppointmentID addObject:[[ArrayForAppointmentName objectAtIndex:i] objectAtIndex:j]];
//                        [tempArrayForAppointmentName addObject:[[ArrayForAppointmentName objectAtIndex:i] objectAtIndex:j]];
//                        [tempArrayForAppointmentTime addObject:[[ArrayForAppointmentTime objectAtIndex:i] objectAtIndex:j]];
//                        [tempArrayForConsultantName addObject:[[ArrayForConsultantName objectAtIndex:i] objectAtIndex:j]];
//                        [tempArrayForHospital addObject:[[ArrayForHospital objectAtIndex:i] objectAtIndex:j]];
//                        [tempArrayForNotes addObject:[[ArrayForNotes objectAtIndex:i] objectAtIndex:j]];
//                        [tempArrayForProvider addObject:[[ArrayForProvider objectAtIndex:i] objectAtIndex:j]];
                        
                                        
                    }
                }
                
                [ArrayForAppointmentName removeAllObjects];
                [ArrayForAppointmentTime removeAllObjects];
                [ArrayForConsultantName removeAllObjects];
                [ArrayForHospital removeAllObjects];
                [ArrayForNotes removeAllObjects];
                [ArrayForProvider removeAllObjects];
                [ArrayForAppointmentID removeAllObjects];
                
//NSLog(@"tempArrayForAppointmentName is %@",[tempArrayForAppointmentName objectAtIndex:0]);
                
                
                
                [ArrayForAppointmentName addObjectsFromArray:tempArrayForAppointmentName];
                
                
               //  NSLog(@"ArrayForAppointmentName is %@",ArrayForAppointmentName);
                
                 [ArrayForAppointmentTime addObjectsFromArray:tempArrayForAppointmentTime];
                 [ArrayForConsultantName addObjectsFromArray:tempArrayForConsultantName];
                 [ArrayForHospital addObjectsFromArray:tempArrayForHospital];
                 [ArrayForNotes addObjectsFromArray:tempArrayForNotes];
                 [ArrayForProvider addObjectsFromArray:tempArrayForProvider];
                 [ArrayForAppointmentID addObjectsFromArray:tempArrayForAppointmentID];
                
                
               
                // NSLog(@"tempArrayForAppointmentName is %@",ArrayForAppointmentName);
//                NSLog(@"tempArrayForAppointmentTime is %@",tempArrayForAppointmentTime);
//                 NSLog(@"tempArrayForConsultantName is %@",tempArrayForConsultantName);
                
                
                 [self AddAppointmentTableViewFunction];                     // CREATING TABLE
            }
            
            [self HideActivityIndicator];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"Error: %@", error.description);
             [self HideActivityIndicator];
             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
             [unable show];
         }];
        
    }
}


-(void)SyncButtonAction{

}
-(void)HomeButtonActionDown
{
    
    [[soundManager shared] buttonSound];
     BottomNavigationButtonFlag=1;
     [HomeButton setImage:HomeImage forState:UIControlStateNormal];
     [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
     [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
     [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
     [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    
    HomeButton.userInteractionEnabled=FALSE;
    MedicalRecordButton.userInteractionEnabled=TRUE;
    AppointmentButton.userInteractionEnabled=TRUE;
    MapButton.userInteractionEnabled=TRUE;
   

    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(10, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
    }];
    
    [ScrollerView scrollRectToVisible:CGRectMake(0, 0, 320, 518) animated:YES];
}
-(void)MedicalButtonActionDown{
    
    [[soundManager shared] buttonSound];
    BottomNavigationButtonFlag=2;
    HomeButton.userInteractionEnabled=TRUE;
     AppointmentButton.userInteractionEnabled=TRUE;
     MapButton.userInteractionEnabled=TRUE;
     MedicalRecordButton.userInteractionEnabled=FALSE;
    
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
     [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateNormal];
     [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
     [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
        
    }];

   [ScrollerView scrollRectToVisible:CGRectMake(320, 0, 320, 518) animated:YES];
    
}
-(void)AppointmentsButtonDown{
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AddAppointmentClick"];
    
    [[soundManager shared] buttonSound];
    HomeButton.userInteractionEnabled=TRUE;
    MedicalRecordButton.userInteractionEnabled=TRUE;
    MapButton.userInteractionEnabled=TRUE;
    AppointmentButton.userInteractionEnabled=FALSE;

    BottomNavigationButtonFlag=3;
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
     [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
     [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(MedicalRecordButton.frame.origin.x+MedicalRecordButton.frame.size.width+25, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
    }];
    
    [ScrollerView scrollRectToVisible:CGRectMake(640, 0, 320, 518) animated:YES];
    
}
-(void)MapButtonAction
{
    [[soundManager shared] buttonSound];
    BottomNavigationButtonFlag=4;
     MapButton.userInteractionEnabled=FALSE;
    HomeButton.userInteractionEnabled=TRUE;
     MedicalRecordButton.userInteractionEnabled=TRUE;
     AppointmentButton.userInteractionEnabled=TRUE;

    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateNormal];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(AppointmentButton.frame.origin.x+AppointmentButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
    }];
    
    [ScrollerView scrollRectToVisible:CGRectMake(640+320, 0, 320, 518) animated:YES];
    
    
    MKMapView *mapView  = [[MKMapView alloc] initWithFrame: CGRectMake(0, 2, 320, 443)];
    [mapView setShowsUserLocation:true];
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    mapView.delegate=self;
    [MapSubView addSubview:mapView];
    
    MKCoordinateRegion region;
    region.center = mapView.userLocation.coordinate;
    MKCoordinateSpan span;
    span.latitudeDelta  = 20;
    span.longitudeDelta = 20;
    region.span = span;
    [mapView setRegion:region animated:YES];
    
    [self CurrentLocationIdentifier];
}

//------------ Current Location Address-----
-(void)CurrentLocationIdentifier
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    float latitude = locationManager.location.coordinate.latitude;
    float longitude = locationManager.location.coordinate.longitude;
    
    NSLog(@"latitude is %f and long. is %f",latitude,longitude);
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
       float longitudeLabel =  currentLocation.coordinate.longitude;
       float latitudeLabel =  currentLocation.coordinate.latitude;
        NSLog(@"longitudeLabel is %f and latitudeLabel. is %f",longitudeLabel,latitudeLabel);
    }
}

-(void)SliderButtonDownDown
{
    BackGroundBlackView.hidden=NO;
    [[soundManager shared] buttonSound];
    ScrollerView.userInteractionEnabled=FALSE;
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    if(SliderBarViewSatus==5)
    {
        SliderBarViewSatus=1;
        HomeButton.userInteractionEnabled=TRUE;
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(MapButton.frame.origin.x+MapButton.frame.size.width+15, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
        SliderViewBar.frame=CGRectMake(50, 20, 300, self.view.frame.size.height);
        BottomView.frame = CGRectMake(-270, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, self.view.frame.size.width, 50);
        SliderViewBar.hidden=NO;
    }];
    }
    else {
        SliderBarViewSatus=5;
        ScrollerView.userInteractionEnabled=TRUE;
        [UIView animateWithDuration:.3f animations:^{
            if(BottomNavigationButtonFlag==1){
                SelectBarImageView.frame=CGRectMake(10, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
            [HomeButton setImage:HomeImage forState:UIControlStateNormal];
                 HomeButton.userInteractionEnabled=FALSE;}
            if(BottomNavigationButtonFlag==2){
                SelectBarImageView.frame=CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
            [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateNormal];
            MedicalRecordButton.userInteractionEnabled=FALSE;
            }
            if(BottomNavigationButtonFlag==3){
                SelectBarImageView.frame=CGRectMake(MedicalRecordButton.frame.origin.x+MedicalRecordButton.frame.size.width+25, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
            [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateNormal];
             AppointmentButton.userInteractionEnabled=FALSE;}
            if(BottomNavigationButtonFlag==4){
                SelectBarImageView.frame=CGRectMake(AppointmentButton.frame.origin.x+AppointmentButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
             [MapButton setImage:MapImageAfterClick forState:UIControlStateNormal];
             MapButton.userInteractionEnabled=FALSE;
            }
            BackGroundBlackView.hidden=YES;
            BottomView.frame = CGRectMake(0, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, self.view.frame.size.width, 50);
            SliderViewBar.frame=CGRectMake(400, 20, 200, self.view.frame.size.height);
            UserHomeGroundView.frame=CGRectMake(0, 0, self.view.frame.size.width, 518);
        } completion:^(BOOL finished) {
            SliderViewBar.hidden=YES;
        }];

    }
    
}
-(void)HomeButtonAction
{
    
}
-(void)UpcomingViewAction{
    [[soundManager shared] buttonSound];
    [self ShowActivityIndicatorWithTitle:@"Loading..."];
    [self performSelector:@selector(serverCallForUpcommingAppointments) withObject:nil afterDelay:0.1];
}
-(void)RecentViewAction{
    [[soundManager shared] buttonSound];
    [self ShowActivityIndicatorWithTitle:@"Loading..."];
    [self performSelector:@selector(serverCallForRecentAppointments) withObject:nil afterDelay:0.1];
}
-(void)changeImage:(UITapGestureRecognizer*)recognizer
{
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle: nil delegate: self cancelButtonTitle: @"Cancel" destructiveButtonTitle: nil otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    [actionSheet1 showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate  = self;
    
    picker.allowsEditing = YES;
    switch (buttonIndex) {
        case 0:
            
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                
                UIAlertView*  myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                       message:@"Device has no camera"
                                                                      delegate:nil
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles: nil];
                
                [myAlertView show];
                
            }
            else
            {
                
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                
                [self presentViewController:picker animated:YES completion:Nil];
            }
            
            break;
        case 1:
            
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:NULL];
        default:
            break;
    }
}

#pragma mark IMAGE PICKER DELEGATES
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    path= [documentsDirectory stringByAppendingPathComponent:@"userprofile.png" ];  // IT IS THE PATH OF CHOOSEN IMAGE
    
    imageData= UIImagePNGRepresentation([info objectForKey:@"UIImagePickerControllerEditedImage"]);
    
    [imageData writeToFile:path atomically:YES];
    
    // STORING THE PATH OF IMAGE IN NSUserDefault
    
    EditChangeImage.image=[UIImage imageWithContentsOfFile:path];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
-(void)shortCutsAction
{
     [[soundManager shared] buttonSound];
     ShortCutsViewController *ShortCutTable=[[ShortCutsViewController alloc]init];
    [self.navigationController pushViewController:ShortCutTable animated:YES];
}
-(void)EmergencyButtonAction
{
    [[soundManager shared] buttonSound];
    EmergencyViewController *Emergency=[[EmergencyViewController alloc]init];
    [self.navigationController pushViewController:Emergency animated:YES];
}
- (void)ShowActivityIndicatorWithTitle:(NSString *)Title
{
    [SVProgressHUD showWithStatus:Title maskType:SVProgressHUDMaskTypeGradient];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}
- (void)HideActivityIndicator
{
    [SVProgressHUD dismiss];
}

-(void)NewAppointmentButton{
    [[soundManager shared] buttonSound];
    CreateNewAppointmentViewController *CreateNewAppointment=[[CreateNewAppointmentViewController alloc]init];
    [self.navigationController pushViewController:CreateNewAppointment animated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch =[touches anyObject];
    if([touch view] == (UIView *)[self.view viewWithTag:200])
    {
    }
    else{
        if(SliderBarViewSatus==1)
        {
            SliderBarViewSatus=5;
            BackGroundBlackView.hidden=YES;
            ScrollerView.userInteractionEnabled=TRUE;
            [UIView animateWithDuration:.3f animations:^{
                if(BottomNavigationButtonFlag==1){ SelectBarImageView.frame=CGRectMake(10, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
                    [HomeButton setImage:HomeImage forState:UIControlStateNormal];}
                if(BottomNavigationButtonFlag==2){ SelectBarImageView.frame=CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
                    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateNormal];}
                if(BottomNavigationButtonFlag==3){ SelectBarImageView.frame=CGRectMake(MedicalRecordButton.frame.origin.x+MedicalRecordButton.frame.size.width+25, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
                    [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateNormal];}
                if(BottomNavigationButtonFlag==4){ SelectBarImageView.frame=CGRectMake(AppointmentButton.frame.origin.x+AppointmentButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
                    [MapButton setImage:MapImageAfterClick forState:UIControlStateNormal];}
                
                BottomView.frame = CGRectMake(0, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, self.view.frame.size.width, 50);
                SliderViewBar.frame=CGRectMake(400, 20, 200, self.view.frame.size.height);
                UserHomeGroundView.frame=CGRectMake(0, 0, self.view.frame.size.width, 518);
            } completion:^(BOOL finished) {
                SliderViewBar.hidden=YES;
            }];
        }
    }
    
    
    
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)userGuide
{
    LestGuiderHeaderImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"nev_bar_trans.png"].size.width, [UIImage imageNamed:@"nev_bar_trans.png"].size.height)];
    LestGuiderHeaderImageView.image=[UIImage imageNamed:@"nev_bar_trans.png"];
    LestGuiderHeaderImageView.userInteractionEnabled=TRUE;

    LetsGuideLable=[[UILabel alloc]initWithFrame:CGRectMake(90,15,150,20)];
    LetsGuideLable.backgroundColor=[UIColor clearColor];
    LetsGuideLable.text=@"LET US GUIDE YOU";
    LetsGuideLable.textColor=[UIColor whiteColor];
    LetsGuideLable.font=[UIFont fontWithName:@"HelveticaNeueLTCom-Roman" size:15];
    [LestGuiderHeaderImageView addSubview:LetsGuideLable];
    
    lineView=[[UIView alloc]initWithFrame:CGRectMake(90,LetsGuideLable.frame.origin.y+20,135,1)];
    lineView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    lineView.layer.borderWidth = 1.0f;
    [LestGuiderHeaderImageView addSubview:lineView];
    
    CrossButtonClick=[[UIButton alloc]initWithFrame:CGRectMake(LetsGuideLable.frame.size.width+LetsGuideLable.frame.origin.x+50, 13, [UIImage imageNamed:@"CrossImage.png"].size.width, [UIImage imageNamed:@"CrossImage.png"].size.height)];
    [CrossButtonClick setImage:[UIImage imageNamed:@"CrossImage.png"] forState:UIControlStateNormal];
     [CrossButtonClick addTarget:self action:@selector(CrossClickAction) forControlEvents:UIControlEventTouchUpInside];
    [LestGuiderHeaderImageView addSubview:CrossButtonClick];
    [self.view addSubview:LestGuiderHeaderImageView];
    
    FirstImage=[UIImage imageNamed:@"tuorial_medical_records_page.png"];
    secondImage=[UIImage imageNamed:@"tuorial_appoiments_page.png"];
    ThirdImage=[UIImage imageNamed:@"tuorial_geo_location_page.png"];
    FourthImage=[UIImage imageNamed:@"tuorial_emergency_page.png"];
    FifthImage=[UIImage imageNamed:@"tuorial_shortcut_page.png"];
    
    UserGuideScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, LestGuiderHeaderImageView.frame.size.height+LestGuiderHeaderImageView.frame.origin.y, 320, self.view.frame.size.height)];
    UserGuideScrollView.backgroundColor=[UIColor clearColor];
    UserGuideScrollView.pagingEnabled=TRUE;
    UserGuideScrollView.delegate=self;
    UserGuideScrollView.bounces=NO;
    UserGuideScrollView.scrollEnabled=FALSE;
    UserGuideScrollView.showsHorizontalScrollIndicator=NO;
    [UserGuideScrollView setContentSize:CGSizeMake(320*5,FirstImage.size.height)];
    
    FirstFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,FirstImage.size.width, FirstImage.size.height)];
    FirstFrameImageView.image=FirstImage;
    FirstFrameImageView.userInteractionEnabled=TRUE;
    
    NextClickButton=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton addTarget:self action:@selector(SecondFrameNextButton)forControlEvents:UIControlEventTouchUpInside];
    [NextClickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextClickButton.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    NextClickButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NextClickButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NextClickButton setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
    NextClickButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NextClickButton.backgroundColor=[UIColor clearColor];
    [FirstFrameImageView addSubview:NextClickButton];
    [UserGuideScrollView addSubview:FirstFrameImageView];
    
    
    SecondFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(FirstFrameImageView.frame.size.width+FirstFrameImageView.frame.origin.x, 0, secondImage.size.width, secondImage.size.height)];
    SecondFrameImageView.image=secondImage;
    SecondFrameImageView.userInteractionEnabled=TRUE;
    
    NextClickButton2=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton2 addTarget:self action:@selector(ThirdFrameNextButton)forControlEvents:UIControlEventTouchUpInside];
    [NextClickButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextClickButton2.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    NextClickButton2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NextClickButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NextClickButton2 setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
    NextClickButton2.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NextClickButton2.backgroundColor=[UIColor clearColor];
    [SecondFrameImageView addSubview:NextClickButton2];
    [UserGuideScrollView addSubview:SecondFrameImageView];
    
    ThirdFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(SecondFrameImageView.frame.size.width+SecondFrameImageView.frame.origin.x, 0, ThirdImage.size.width, ThirdImage.size.height)];
    ThirdFrameImageView.image=ThirdImage;
    ThirdFrameImageView.userInteractionEnabled=TRUE;
    
    NextClickButton3=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton3 addTarget:self action:@selector(FourthFrameNextButton)forControlEvents:UIControlEventTouchUpInside];
    [NextClickButton3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextClickButton3.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    NextClickButton3.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NextClickButton3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NextClickButton3 setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
    NextClickButton3.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NextClickButton3.backgroundColor=[UIColor clearColor];
    [ThirdFrameImageView addSubview:NextClickButton3];
    [UserGuideScrollView addSubview:ThirdFrameImageView];
    
    FourthFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(ThirdFrameImageView.frame.size.width+ThirdFrameImageView.frame.origin.x, 0, FourthImage.size.width, FourthImage.size.height)];
    FourthFrameImageView.image=FourthImage;
    FourthFrameImageView.userInteractionEnabled=TRUE;

    NextClickButton4=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton4 addTarget:self action:@selector(FifthFrameNextButton)forControlEvents:UIControlEventTouchUpInside];
    [NextClickButton4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextClickButton4.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    NextClickButton4.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NextClickButton4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NextClickButton4 setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
    NextClickButton4.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NextClickButton4.backgroundColor=[UIColor clearColor];
    [FourthFrameImageView addSubview:NextClickButton4];
    [UserGuideScrollView addSubview:FourthFrameImageView];
    
    FifthFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(FourthFrameImageView.frame.size.width+FourthFrameImageView.frame.origin.x,0, FifthImage.size.width, FifthImage.size.height)];
    FifthFrameImageView.image=FifthImage;
    FifthFrameImageView.userInteractionEnabled=TRUE;
    
    NextClickButton5=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton5 addTarget:self action:@selector(LastFrameNextButton)forControlEvents:UIControlEventTouchUpInside];
    [NextClickButton5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextClickButton5.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    NextClickButton5.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NextClickButton5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NextClickButton5 setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
    NextClickButton5.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NextClickButton5.backgroundColor=[UIColor clearColor];
    [FifthFrameImageView addSubview:NextClickButton5];
    
    [UserGuideScrollView addSubview:FifthFrameImageView];
    [self.view addSubview:UserGuideScrollView];
}
-(void)SecondFrameNextButton{
   
    [UserGuideScrollView scrollRectToVisible:CGRectMake(320, 0,FirstImage.size.width, FirstImage.size.height) animated:YES];
}
-(void)ThirdFrameNextButton{
   
    [UserGuideScrollView scrollRectToVisible:CGRectMake(640, 0,FirstImage.size.width, FirstImage.size.height) animated:YES];
}
-(void)FourthFrameNextButton{
    
    [UserGuideScrollView scrollRectToVisible:CGRectMake(640+320, 0,FirstImage.size.width, FirstImage.size.height) animated:YES];
}
-(void)FifthFrameNextButton{
   
    [UserGuideScrollView scrollRectToVisible:CGRectMake(640+320+320, 0,FirstImage.size.width, FirstImage.size.height) animated:YES];
}
-(void)LastFrameNextButton{
    
    [LestGuiderHeaderImageView removeFromSuperview];
    [UserGuideScrollView removeFromSuperview];
}
-(void)CrossClickAction
{
    [UserGuideScrollView removeFromSuperview];
    [LestGuiderHeaderImageView removeFromSuperview];
    [FirstFrameImageView removeFromSuperview];
    [SecondFrameImageView removeFromSuperview];
    [ThirdFrameImageView removeFromSuperview];
    [FourthFrameImageView removeFromSuperview];
    [FifthFrameImageView removeFromSuperview];
}
-(void)CreateNewMedicalReport{
    
    [[soundManager shared]buttonSound];
    MedicalRecordsHomeViewController *CreateAppointment=[[MedicalRecordsHomeViewController alloc]init];
    [self.navigationController pushViewController:CreateAppointment animated:YES];
}
-(void)CreateNewAppointments{
    
    [[soundManager shared]buttonSound];
    CreateNewAppointmentViewController *CreateAppointment=[[CreateNewAppointmentViewController alloc]init];
    [self.navigationController pushViewController:CreateAppointment animated:YES];
}
-(void)AccountScreen{
    
    [[soundManager shared]buttonSound];
    AccountViewController *Account=[[AccountViewController alloc]init];
    [self.navigationController pushViewController:Account animated:YES];
}
-(void)settingsScreen
{
    [[soundManager shared]buttonSound];
    SettingScreenViewController *setingScreen=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:setingScreen animated:YES];
}
-(void)HelpScreen
{
    [[soundManager shared]buttonSound];
    HelpScreenViewController *HelpScreen=[[HelpScreenViewController alloc]init];
    [self.navigationController pushViewController:HelpScreen animated:YES];
}
-(void)ReportScreen
{
    [[soundManager shared]buttonSound];
    ReportViewController *ReportScreen=[[ReportViewController alloc]init];
    [self.navigationController pushViewController:ReportScreen animated:YES];
}
-(void)LegalScreen
{
    [[soundManager shared]buttonSound];
    LegalViewController *LegalScreen=[[LegalViewController alloc]init];
    [self.navigationController pushViewController:LegalScreen animated:YES];
}
-(void)dealloc{
    
    [UserGuideScrollView removeFromSuperview];
    UserGuideScrollView=nil;
    
    [LestGuiderHeaderImageView removeFromSuperview];
    LestGuiderHeaderImageView=nil;
    
    [LetsGuideLable removeFromSuperview];
    LetsGuideLable=nil;
    [CrossButtonClick removeFromSuperview];
    CrossButtonClick=nil;
    
    FirstImage=nil;
    secondImage=nil;
    ThirdImage=nil;
    FourthImage=nil;
    FifthImage=nil;
    
    [FirstFrameImageView removeFromSuperview];
    FirstFrameImageView=nil;
    [SecondFrameImageView removeFromSuperview];
    SecondFrameImageView=nil;
    [ThirdFrameImageView removeFromSuperview];
    ThirdFrameImageView=nil;
    [FourthFrameImageView removeFromSuperview];
    FourthFrameImageView=nil;
    [FifthFrameImageView removeFromSuperview];
    FifthFrameImageView=nil;
    [SelectBarImageView removeFromSuperview];
    SelectBarImageView=nil;
    
    [NextClickButton removeFromSuperview];
    NextClickButton=nil;
    [NextClickButton2 removeFromSuperview];
    NextClickButton2=nil;
    [NextClickButton3 removeFromSuperview];
    NextClickButton3=nil;
    [NextClickButton4 removeFromSuperview];
    NextClickButton4=nil;
    [NextClickButton5 removeFromSuperview];
    NextClickButton5=nil;
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    [MedicalRecordButton removeFromSuperview];
    MedicalRecordButton=nil;
    [AppointmentButton removeFromSuperview];
    AppointmentButton=nil;
    [MapButton removeFromSuperview];
    MapButton=nil;
    [SlidMenuButton removeFromSuperview];
    SlidMenuButton=nil;
    
    [AccountButton removeFromSuperview];
    AccountButton=nil;
    [SettingButton removeFromSuperview];
    SettingButton=nil;
    [HelpButton removeFromSuperview];
    HelpButton=nil;
    [ReportButton removeFromSuperview];
    ReportButton=nil;
    [LegalButton removeFromSuperview];
    LegalButton=nil;
    [copyRightLable removeFromSuperview];
    copyRightLable=nil;
}

#pragma mark -UITableView Datasource and Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [tempappointmentSectionTitles count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger) section
{
    //section text as a label
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont fontWithName:helveticaRegular size:12];
    headerLabel.text = [appointmentSectionTitles objectAtIndex:section];
    headerLabel.backgroundColor = [UIColor grayColor];
    return headerLabel;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = [appointmentSectionTitles objectAtIndex:section];
    NSArray *sectionAppointments = [appointmentsDictionary valueForKey:sectionTitle];
    
    NSLog(@"[sectionAppointments count] ==>%d",[sectionAppointments count]);
    return [sectionAppointments count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
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

        NSString *sectionTitle = [appointmentSectionTitles objectAtIndex:indexPath.section];
        NSArray *sectionAppointments = [appointmentsDictionary valueForKey:sectionTitle];
    
    //NSString *appointmentID     =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmentid"];
    NSString *appointmentname   =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmentname"];
    NSString *appointmenttime   =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmenttime"];
   // NSString *consultantname    =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"consultantname"];
   // NSString *hospital          =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"hospital"];
   // NSString *notes             =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"notes"];
    
    NSString *provider          =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"provider"];
    NSString *appointName =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmenttype"];
    //
    //NSString *appointmentID     =       [tempArrayForAppointmentID objectAtIndex:indexPath.row];
   
    
    
   
    
    
//    NSString *appointmentname   =       [tempArrayForAppointmentName objectAtIndex:indexPath.row];
//    NSString *appointmenttime   =       [tempArrayForAppointmentTime objectAtIndex:indexPath.row];
//    NSString *consultantname    =       [tempArrayForConsultantName objectAtIndex:indexPath.row];
//    NSString *hospital          =       [tempArrayForHospital objectAtIndex:indexPath.row];
//    NSString *notes             =       [tempArrayForNotes objectAtIndex:indexPath.row];
   // NSString *provider          =       [tempArrayForProvider objectAtIndex:indexPath.row];

    
    
     //NSLog(@"appointmentID is %@",appointmentID);
//     NSLog(@"appointmentname is %@",appointmentname);
//     NSLog(@"appointmenttime is %@",appointmenttime);
//     NSLog(@"consultantname is %@",consultantname);
//     NSLog(@"hospital is %@",hospital);
//     NSLog(@"notes is %@",notes);
//     NSLog(@"appointmentIDsTag is %d",appointmentIDsTag.count);

    
    
    UIButton *CellButtonClick;
    CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
   CellButtonClick.tag = [[tempArrayForAppointmentID objectAtIndex:indexPath.row] integerValue];
    CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
  //  CellButtonClick.backgroundColor=[UIColor yellowColor];
   // [CellButtonClick setTitle: appointmentID forState:UIControlStateNormal];
    [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    CellButtonClick.layer.masksToBounds = NO;
    CellButtonClick.exclusiveTouch=YES;
    CellButtonClick.userInteractionEnabled=TRUE;
    [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
    [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
    CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    [CellButtonClick addTarget:self action:@selector(FunctionToFindTag:) forControlEvents:UIControlEventTouchUpInside];
    CellButtonClick.layer.borderWidth = 0.5f;
    
 
    NSLog(@"tempArrayForAppointmentName=%@",[tempArrayForAppointmentName objectAtIndex:indexPath.row]);
    
    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
    AppointmentNameTitleShow.textColor = [UIColor blackColor];
    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
    AppointmentNameTitleShow.text =  appointmentname;
    
    AppointmentNameTitleShow.numberOfLines=0;
    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [AppointmentNameTitleShow sizeToFit];
    [CellButtonClick addSubview:AppointmentNameTitleShow];
    
    
    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
    TypeNameTitleShow.textColor = [UIColor grayColor];
    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text =  appointName;
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
    TypeNameTitleShow.minimumScaleFactor=0.3;
    [CellButtonClick addSubview:TypeNameTitleShow];
    
    CGRect size_label = [TypeNameTitleShow.text boundingRectWithSize:CGSizeMake(320, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
                                                          attributes:@{ NSFontAttributeName : [UIFont fontWithName:helveticaRegular size:12]}
                                                             context:nil];
    
    
    UIView* line=[[UIView alloc]initWithFrame:CGRectMake(size_label.size.width+TypeNameTitleShow.frame.origin.x,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5, 1,12)];
    
    line.layer.borderColor = [UIColor grayColor].CGColor;
    line.layer.borderWidth = 1.0f;
    [CellButtonClick addSubview:line];
    
    
    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(line.frame.size.width+line.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
    
    ProviderNameTitleShow.textColor = [UIColor grayColor];
    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    ProviderNameTitleShow.text =provider;
    [ProviderNameTitleShow sizeToFit];
    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [CellButtonClick addSubview:ProviderNameTitleShow];
    
    
    NSArray *dateSplitArray = [appointmenttime componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    NSString *date4=[dateSplitArray2 objectAtIndex:0];
    NSLog(@"date2=%@",date2);
    NSLog(@"date3=%@",date3);
   
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
    DateLable.font = [UIFont fontWithName:helveticaRegular size:10];
    DateLable.text =[NSString stringWithFormat:@"%@ %@ %@",date3,date2,date4];
    DateLable.numberOfLines=0;
    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
    [DateLable sizeToFit];
    DateLable.frame=CGRectMake(300-DateLable.frame.size.width,10,DateLable.frame.size.width,15);
    [CellButtonClick addSubview:DateLable];
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    NSLog(@"TimeString1=%@",TimeString1);
    
    
    
    UILabel *TimeLable = [[UILabel alloc] init];
    TimeLable.textColor = [UIColor grayColor];
    TimeLable.backgroundColor = [UIColor clearColor];
    TimeLable.textAlignment = NSTextAlignmentLeft;
    TimeLable.font = [UIFont fontWithName:helveticaRegular size:10];
    TimeLable.text =[NSString stringWithFormat:@"%@",TimeString1];
    TimeLable.numberOfLines=0;
    TimeLable.lineBreakMode =NSLineBreakByCharWrapping;
    [TimeLable sizeToFit];
    TimeLable.frame=CGRectMake(300-TimeLable.frame.size.width,DateLable.frame.size.height+DateLable.frame.origin.y+3,TimeLable.frame.size.width,13);
    [CellButtonClick addSubview:TimeLable];
    
    [cell.contentView addSubview:CellButtonClick];
   
    return cell;
  
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set background color of cell here if you don't want default white
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell selected at index path %ld:%ld", (long)indexPath.section, (long)indexPath.row);
    NSLog(@"selected cell index path is %@", [tableView indexPathForSelectedRow]);
    
    if (!tableView.isEditing) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}


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
        NSIndexPath *cellIndexPath = [AddAppointmentTableView indexPathForCell:cell];
        NSLog(@"cellIndexPath=%d",cellIndexPath.row);
        
        
        NSString *sectionTitle = [appointmentSectionTitles objectAtIndex:cellIndexPath.section];
        NSArray *sectionAppointments = [appointmentsDictionary valueForKey:sectionTitle];
        NSString *appointmentID     =       [[sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmentid"];
        
        
       // appointmentIDsTag
        
//        NSString *sectionTitle = [appointmentSectionTitles objectAtIndex:index];
//        NSArray *sectionAppointments = [appointmentsDictionary valueForKey:sectionTitle];
//        
//        NSString *appointmentID     =       [[sectionAppointments objectAtIndex:index] valueForKey:@"appointmentid"];

        //NSLog(@"idToDelete is %@",appointmentID);
        
        
        
       
       // [self DeleteAPICallFunction];
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

#pragma mark DeleteAPICall
-(void) DeleteAPICallFunction
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        [self HideActivityIndicator];
        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [unable show];
    }
    else
    {
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *params = @{ @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"]
                                 };
        
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/get_all_user_appointment",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            NSLog(@"JSON--->%@",json);
            if([json objectForKey:@"error"])
            {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
            }
            else if([json objectForKey:@"log"])
            {
                NSLog(@"Log --> User Appointment ==>> %@",[json objectForKey:@"log"]);
                
                AppointmentDemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 80, [UIImage imageNamed:@"Staticapponments_page.png"].size.width,[UIImage imageNamed:@"Staticapponments_page.png"].size.height)];
                AppointmentDemoImageView.image=[UIImage imageNamed:@"Staticapponments_page.png"];
                [AppointmentSubView addSubview:AppointmentDemoImageView];
            }
            else
            {
                appointmentsDictionary = json;
                appointmentSectionTitles = [NSArray arrayWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
                
                NSLog(@"appointmentSectionTitles -->> %@",appointmentSectionTitles);
                [self AddAppointmentTableViewFunction];                     // CREATING TABLE
            }
            
            [self HideActivityIndicator];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"Error: %@", error.description);
             [self HideActivityIndicator];
             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
             [unable show];
         }];
        
    }

}

#pragma mark Search bar
-(void)AddAppointmentTableViewFunction{
   
    [SearchBar removeFromSuperview];
    SearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(8, 7, 300, 44)];
    SearchBar.delegate = self;
    SearchBar.placeholder = @"Search";
//    
//    for (UIView *subview in SearchBar.subviews)
//    {
//        if ([subview isKindOfClass:NSClassFromString(@"v")])
//        {
//            [subview removeFromSuperview];
//            break;
//        }
//    }
    
    
    [SearchBar setSearchFieldBackgroundImage:
     [UIImage imageNamed:@"Rounded-Rectangle-9.png"]
                                         forState:UIControlStateNormal];
    
    SearchBar.translucent = NO;
    SearchBar.opaque = NO;
    SearchBar.showsCancelButton=YES;
   //SearchBar.backgroundImage=[UIImage imageNamed:@"Sliding_bar.png"];
    SearchBar.backgroundColor=[UIColor clearColor];
    SearchBar.searchBarStyle = UISearchBarStyleMinimal;
   //// SearchBar.backgroundImage = [UIImage imageWithColor:[UIColor redColor] cornerRadius:5.0f];
    SearchBar.barTintColor = [UIColor clearColor];
    SearchBar.showsCancelButton = NO;
    //SearchBar.barStyle = UIBarStyleDefault;
    [AppointmentSubView addSubview:SearchBar];
    
    
    AddAppointmentTableView=[[UITableView alloc]init];
    AddAppointmentTableView.frame=CGRectMake(0, SearchBar.frame.size.height+SearchBar.frame.origin.y+5, self.view.frame.size.width, 390);
    
    [AddAppointmentTableView setDelegate:self];
    AddAppointmentTableView.dataSource=self;
    [AddAppointmentTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [AddAppointmentTableView setSeparatorColor:[UIColor grayColor]];
    [AddAppointmentTableView setSeparatorInset:UIEdgeInsetsZero];
    AddAppointmentTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //CastingJobTableView.backgroundColor=[UIColor colorWithRed:0.8515625 green:0.85546875 blue:0.8671875 alpha:1.0];
    AddAppointmentTableView.backgroundColor=[UIColor whiteColor];
    AddAppointmentTableView.showsVerticalScrollIndicator = NO;
    AddAppointmentTableView.alwaysBounceVertical = NO;
    // [searchTableView setBackgroundColor:[UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0]];
    [AppointmentSubView addSubview:AddAppointmentTableView];
}

- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar {
    //[searchBar setShowsCancelButton: YES animated: YES];
    [SearchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [SearchBar resignFirstResponder];
    SearchBar.showsCancelButton = NO;
    
    
//    tempArrayForAppointmentID = [ArrayForAppointmentID mutableCopy];
//    tempArrayForAppointmentName =[ArrayForAppointmentName mutableCopy];
//    tempArrayForAppointmentTime =[ArrayForAppointmentTime mutableCopy];
//    tempArrayForConsultantName =[ArrayForConsultantName mutableCopy];
//    tempArrayForHospital =[ArrayForHospital mutableCopy];
//    tempArrayForNotes =[ArrayForNotes mutableCopy];
//    tempArrayForProvider =[ArrayForProvider mutableCopy];
    
    
     [AddAppointmentTableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView==AddAppointmentTableView)
    {
        [ SearchBar resignFirstResponder];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar
{
    [self.view endEditing:YES];
}


//-(void)searchBar:(UISearchBar *)searchBar1 textDidChange:(NSString *)searchText
//{
//    NSLog(@"ser=%@",searchText);
//    
//    if ([searchText length]==0)
//    {
////        [tempArrayForAppointmentID removeAllObjects];
////        [tempArrayForAppointmentName removeAllObjects];
////        [tempArrayForAppointmentTime removeAllObjects];
////        [tempArrayForConsultantName removeAllObjects];
////        [tempArrayForHospital removeAllObjects];
////        [tempArrayForNotes removeAllObjects];
////        [tempArrayForProvider removeAllObjects];
//        
//        tempArrayForAppointmentID = [ArrayForAppointmentID mutableCopy];
//        tempArrayForAppointmentName =[ArrayForAppointmentName mutableCopy];
//        tempArrayForAppointmentTime =[ArrayForAppointmentTime mutableCopy];
//        tempArrayForConsultantName =[ArrayForConsultantName mutableCopy];
//        tempArrayForHospital =[ArrayForHospital mutableCopy];
//        tempArrayForNotes =[ArrayForNotes mutableCopy];
//        tempArrayForProvider =[ArrayForProvider mutableCopy];
//        NSLog(@"tempArrayForAppointmentName=%@",tempArrayForAppointmentName);
//    }
//    else
//    {
//        [tempArrayForAppointmentName removeAllObjects];
//        [tempArrayForAppointmentID removeAllObjects];
//        [tempArrayForAppointmentTime removeAllObjects];
//        [tempArrayForConsultantName removeAllObjects];
//        [tempArrayForHospital removeAllObjects];
//        [tempArrayForNotes removeAllObjects];
//        [tempArrayForProvider removeAllObjects];
//    
//
//        NSLog(@"tempArrayForAppointmentName=%@",tempArrayForAppointmentName);
//        
////        int g = 0;
////        NSLog(@"ArrayForAppointmentName=%@",ArrayForAppointmentName);
////        
////        for (NSString *string in ArrayForAppointmentName)
////        {
////            NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
////            if (r.location != NSNotFound)
////            {
////                [tempArrayForAppointmentID addObject:[ArrayForAppointmentID objectAtIndex:g]];
////                [tempArrayForAppointmentName addObject:[ArrayForAppointmentName objectAtIndex:g]];
////                [tempArrayForAppointmentTime addObject:[ArrayForAppointmentTime objectAtIndex:g]];
////                [tempArrayForConsultantName addObject:[ArrayForConsultantName objectAtIndex:g]];
////                [tempArrayForHospital addObject:[ArrayForHospital objectAtIndex:g]];
////                [tempArrayForNotes addObject:[ArrayForNotes objectAtIndex:g]];
////                [tempArrayForProvider addObject:[ArrayForProvider objectAtIndex:g]];
////               
////            }
////            NSLog(@"tempArrayForAppointmentName=%@",tempArrayForAppointmentName);
////            
////            g++;
////        }
//        
//    }
//    
//    NSString *name;
//    
//     NSLog(@"ArrayForAppointmentName=%@",ArrayForAppointmentName);
//        
//        for (int i = 0; i < [ArrayForAppointmentName count] ; i = i+1)
//        {
//            name = [ArrayForAppointmentName objectAtIndex:i];
//            NSLog(@"name=%@",name);
//            
//            if (name.length >= searchText.length)
//            {
//                //firstLetter = [name substringWithRange:NSMakeRange(0, [searchText length])];
//                NSString * string = [ArrayForAppointmentName objectAtIndex:i];
//                NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                
//                
//                if( r.location != NSNotFound)
//                {
//                    // strings are equal except for possibly case
//                    [tempArrayForAppointmentID addObject:[ArrayForAppointmentID objectAtIndex:i]];
//                    [tempArrayForAppointmentName addObject:[ArrayForAppointmentName objectAtIndex:i]];
//                    [tempArrayForAppointmentTime addObject:[ArrayForAppointmentTime objectAtIndex:i]];
//                    [tempArrayForConsultantName addObject:[ArrayForConsultantName objectAtIndex:i]];
//                    [tempArrayForHospital addObject:[ArrayForHospital objectAtIndex:i]];
//                    [tempArrayForNotes addObject:[ArrayForNotes objectAtIndex:i]];
//                    [tempArrayForProvider addObject:[ArrayForProvider objectAtIndex:i]];
//                    
//                }
//                else
//                {
//                   
//                }
//            }
//        }
//    
//    NSLog(@"tempArrayForAppointmentName=%@",tempArrayForAppointmentName);
//    [AddAppointmentTableView reloadData];
//}




//#pragma  mark serverCall Load MoreRows
//- (void)scrollViewDidEndDragging:(UIScrollView *)aScrollView
//                  willDecelerate:(BOOL)decelerate{
//    if([[NSUserDefaults  standardUserDefaults]boolForKey:@"AddAppointmentClick"])
//    {
//        CGPoint offset = aScrollView.contentOffset;
//        CGRect bounds = aScrollView.bounds;
//        CGSize size = aScrollView.contentSize;
//        UIEdgeInsets inset = aScrollView.contentInset;
//        float y = offset.y + bounds.size.height - inset.bottom;
//        float h = size.height;
//        float reload_distance = 10;
//        if(y > h + reload_distance)
//        {
//            NSLog(@"load more rows");
//            NSLog(@"MenuButtonSelect");
//            AddAppointmentTableView.tableFooterView = footerView;
//            
//            [(UIActivityIndicatorView *)[footerView viewWithTag:98989] startAnimating];
//            //[self serverCallLoadMoreRows];
//            [activityView stopAnimating];
//        }
//    }
//    else{
//        
//        }
//    
//    
//}
-(void)serverCallLoadMoreRows

{
    
//    Reachability *reach = [Reachability reachabilityForInternetConnection];
//    NetworkStatus netStatus = [reach currentReachabilityStatus];
//    if (netStatus == NotReachable)
//    {
//        
//        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [unable show];
//    }
//    else
//    {
//        fromIntegerValue++;
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        NSDictionary *params = @{
//                                 @"type":@"search_jobs",
//                                 @"accessToken":[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"user"] valueForKey:@"accessToken"],
//                                 @"filter":@"",
//                                 @"val":@"",
//                                 @"from":[NSString stringWithFormat:@"%d",fromIntegerValue],
//                                 };
//        NSLog(@"Parameter=>%@",params);
//        
//        [manager POST:[NSString stringWithFormat:@"%@",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
//         {
//             NSLog(@"Load more json--%@",json);
//             if([[json objectForKey:@"code"] isEqualToString:@"1"])
//             {
//                 
//                 NSMutableArray *NewArrayCount=[json objectForKey:@"job"];
//                 
//                 NSLog(@"count=%d",NewArrayCount.count);
//                 
//                 NSMutableArray *countIndexValue = [[NSMutableArray alloc] init];
//                 
//                 for (int i = 0; i < NewArrayCount.count; i++)
//                     
//                 {
//                     [countIndexValue addObject:[NSIndexPath indexPathForRow:[listOfTemArrayTitle count]+i inSection:0]];
//                 }
//                 
//                 NSLog(@"listOfTemArrayTitle before=%d",[listOfTemArrayTitle count]);
//                 
//                 
//                 //                 [listOfTemArrayIDs removeAllObjects];
//                 //                 [listOfTemArrayApplied removeAllObjects];
//                 //                 [listOfTemArrayTitle removeAllObjects];
//                 //                 [listOfTemArrayImages removeAllObjects];
//                 //                 [listOfTemArrayDate removeAllObjects];
//                 //                 [listOfTemArrayCountry removeAllObjects];
//                 //                 [listOfTemArrayCity removeAllObjects];
//                 //                 [listOfTemArrayState removeAllObjects];
//                 
//                 
//                 //                 copyOfTemArrayTitle = [[NSMutableArray alloc] init];
//                 //                 copyOfTemArrayImages=[[NSMutableArray alloc]init];
//                 //                 copyOfTemArrayDate=[[NSMutableArray alloc] init];
//                 //                 copyOfTemArrayCountry=[[NSMutableArray alloc]init];
//                 //                 copyOfTemArrayState=[[NSMutableArray alloc]init];
//                 //                 copyOfTemArrayCity=[[NSMutableArray alloc]init];
//                 
//                 
//                 for (NSDictionary *abc in NewArrayCount)
//                 {
//                     [listOfTemArrayIDs addObject:[abc objectForKey:@"job_id"]];
//                     [listOfTemArrayApplied addObject:[abc objectForKey:@"applied"]];
//                     [listOfTemArrayTitle addObject:[abc objectForKey:@"job_title"]];
//                     [listOfTemArrayImages addObject:[abc objectForKey:@"job_icon"]];
//                     [listOfTemArrayDate addObject:[abc objectForKey:@"posted_date"]];
//                     [listOfTemArrayCountry addObject:[abc objectForKey:@"country"]];
//                     [listOfTemArrayCity addObject:[abc objectForKey:@"city"]];
//                     [listOfTemArrayState addObject:[abc objectForKey:@"state"]];
//                     
//                     //                     [copyOfTemArrayTitle addObject:[abc objectForKey:@"job_title"]];
//                     //                     [copyOfTemArrayImages addObject:[abc objectForKey:@"job_icon"]];
//                     //                     [copyOfTemArrayDate addObject:[abc objectForKey:@"posted_date"]];
//                     //                     [copyOfTemArrayCountry addObject:[abc objectForKey:@"country"]];
//                     //                     [copyOfTemArrayCity addObject:[abc objectForKey:@"city"]];
//                     //                     [copyOfTemArrayState addObject:[abc objectForKey:@"state"]];
//                     
//                 }
//                 
//                 NSLog(@"listOfTemArrayTitle=%@",listOfTemArrayTitle);
//                 
//                 [CastingJobTableView beginUpdates];
//                 [CastingJobTableView insertRowsAtIndexPaths:countIndexValue withRowAnimation:UITableViewRowAnimationBottom];
//                 [CastingJobTableView endUpdates];
//                 //[CastingJobTableView reloadData];
//                 NSLog(@"after endUpdates=%@",listOfTemArrayTitle);
//                 [self CancelButtonAction];
//                 
//                 
//             }
//             else
//                 if([[json objectForKey:@"code"] isEqualToString:@"0"])
//                 {
//                     //                     UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                     //                     [myAlertView show];
//                     CastingJobTableView.tableFooterView = footerView;
//                     
//                     [(UIActivityIndicatorView *)[footerView viewWithTag:98989] stopAnimating];
//                     [self CancelButtonAction];
//                     
//                     
//                 }
//             [self HideActivityIndicator];
//         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             NSLog(@"Error: %@", error.description);
//             [self HideActivityIndicator];
//             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//             [unable show];
//         }];
//        
//    }
}

-(void)serverCallForUpcommingAppointments{
    
    
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    
    
    
    if (netStatus == NotReachable)
        
    {
        
        [self HideActivityIndicator];
        
        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [unable show];
        
    }
    
    else
        
    {
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        
        
        NSDictionary *params = @{
                                 
                                 
                                 
                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"],
                                 
                                 @"type":@"1"
                                 
                                 };
        
        
        
        NSLog(@"Parameter=>%@",params);
        
        
        
        
        
        
        
        [manager POST:[NSString stringWithFormat:@"%@/get_upcoming_user_appointment_and_recent_updates",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
         {
             NSLog(@"access_token Json--->%@",json);
             if([json objectForKey:@"log"])
             {
                 UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"log"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                 [myAlertView show];
             }
             else
             {
                [[NSUserDefaults standardUserDefaults] setObject:json forKey:kUpcomingAppointmentData];
                NSLog(@"kUpcomingAppointmentData=%@",[[[NSUserDefaults standardUserDefaults]objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"]);
                [[NSUserDefaults standardUserDefaults] synchronize];
                 
                 UPComingAppointmentViewController *upcomingAction=[[UPComingAppointmentViewController alloc]init];
                [self.navigationController pushViewController:upcomingAction animated:YES];
             }
             
            [self HideActivityIndicator];
            NSLog(@"JSON: %@", json);
        
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
            NSLog(@"Error: %@", error.description);
            [self HideActivityIndicator];
             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [unable show];
        }];
    }
}

-(IBAction)FunctionToFindTag:(id)sender{
    
    NSLog(@"value=%d",[sender tag]);
    rowTappedForDelete = [sender tag];
}

-(void)serverCallForRecentAppointments{
    
    
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    
    
    
    if (netStatus == NotReachable)
        
    {
        
        [self HideActivityIndicator];
        
        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [unable show];
        
    }
    
    else
        
    {
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        
        
        NSDictionary *params = @{
                                 
                                 
                                 
                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"],
                                 
                                 @"type":@"2"
                                 
                                 };
        
        
        
        NSLog(@"Parameter=>%@",params);
        
        
        
        [manager POST:[NSString stringWithFormat:@"%@/get_upcoming_user_appointment_and_recent_updates",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
         
         
         
         {
             
             NSLog(@"access_token Json--->%@",json);
             
             if([json objectForKey:@"log"])
                 
             {
                 
                 
                 
                 UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"log"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                 
                 [myAlertView show];
                 
                 
                 
             }
             
             else
                 
                 
                 
             {
                 
                 [[NSUserDefaults standardUserDefaults] setObject:json forKey:kRecentAppointmentData];
                 
                 NSLog(@"kRecentAppointmentData=%@",[[[NSUserDefaults standardUserDefaults]objectForKey:kRecentAppointmentData] objectForKey:@"kRecentAppointmentData"]);
                 
                 
                 
                 [[NSUserDefaults standardUserDefaults] synchronize];
                 
                 
                 
                 RecentAppointmentViewController *recentAction=[[RecentAppointmentViewController alloc]init];
                 
                 [self.navigationController pushViewController:recentAction animated:YES];
                 
                 
                 
                 
                 
                 
                 
             }
             
             
             
             
             
             
             
             [self HideActivityIndicator];
             
             
             
             NSLog(@"JSON: %@", json);
             
             
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             
             
             NSLog(@"Error: %@", error.description);
             
             
             
             [self HideActivityIndicator];
             
             
             
             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
             
             
             
             [unable show];
             
             
             
         }];
        
        
        
    }
    
}

@end
