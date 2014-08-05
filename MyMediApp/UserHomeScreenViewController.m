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

    UIImageView *addressStaticImage;
    UIImageView *PhoneStaticImage;
    UIView *BackGroundBlackView;
    UIScrollView *ScrollerView;
    UIView *MedicalSubView;
    UIPageControl *pageControl;
    UIButton *EmergencyButton;
    UIButton *ShortCutButton;
    UILabel *firstNameLable;
    UILabel *lastNameLable;
    UILabel *addressNameLable;
    UILabel *PhoneNumberNameLable;
    UIButton*UpcommingButtonActionArrow;
    UIButton*FirstUpcommingButtonActionArrow;
    UIButton*FirstRecntButtonActionArrow;
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
    UIAlertView * alertviewLogout;
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
    
    UIView *ViewForSearchingofMedicalRecords;
    //medical elements
    UIButton *SortButton;
    UILabel *MedicalTitleLable;
    UIButton *SearchButton;
    UIImageView *DemoImageView;
    UIButton *CreateNewMedicalButton;
    
    
    //appointments elements
    UILabel *AppointmentTitleLable;
    UIView *AppointmentTopBarView;
    UIButton *AppointmentSortButton;
    UIButton *AppointmentSearchButton;
    UIImageView *AppointmentDemoImageView;
    UIButton *CreateNewAppointmentsButton;
    UIButton *FirstRowCellButtonClick;;
    
     UIButton *SecondRowCellButtonClick;;
    
    //Map Elements
    UILabel *MapTitleLable;
    UIView *MapTopBarView;
    int BottomNavigationButtonFlag;
    int SliderBarViewSatus;
    
    UILabel *SizeLable;
    UIView *lineView1;
    UILabel *SyncLable;
    UILabel *SizeBackGroundLable;
    UIScrollView *UserGuideScrollView;
    UIButton *EmergencySliderButton;
    UIButton *SyncButton;
    UIImageView *loginImageView;
    UIImageView *divImageView;
    
    UIView *UpcommingView;
    UIView *RecentView;
    UIView *footerView;

    UIButton *AccountButton;
    UIButton *SettingButton;
    UIButton *HelpButton;
    UIButton *ReportButton;
    UIButton *LegalButton;
    UIButton *LogOutButton;
    UILabel *copyRightLable;
    
    CLLocationManager *locationManager;
    
    UITableView *AddAppointmentTableView;
    UITableView *AddMedicalRerocdsTableView;
    UIView *AppointmentSubView;
    
    UISearchBar *SearchBar;
     UISearchBar *MedicalSearchBar;
    
    UIView *tableViewForMainTableofMedicalRecords;
    NSMutableArray  *dummyArray;
    
    NSMutableDictionary *appointmentsDictionary;
    NSMutableDictionary *medicalrecordsDictionary;
    
    NSMutableArray *appointmentSectionTitles_Medical;
    NSMutableArray *appointmentSectionTitles;
    NSMutableArray *appointmentIDArrayForDelete;
    
    
    
    NSString *rowTappedForDelete;
    BOOL isAttachmentAdded;
    NSMutableArray *sectionAppointments;
    
    NSMutableArray *totalData;
    
    
    NSMutableArray *temp_appointmentSectionTitles;
    NSMutableArray *temp_appointmentSectionTitles_Medical;
    NSMutableDictionary *temp_appointmentsDictionary;
    NSMutableDictionary *MedicalRecordstemp_appointmentsDictionary;
    NSMutableArray *temp_sectionAppointments;
    NSMutableArray *temp_sectionAppointmentsMedicalRecords;
    
    
    UIView *ViewForSearching;
    UITableView *SearchTableView;
    
    
    NSMutableArray *array_AppointmentName;
    
    NSMutableArray *array_AppointmentID;
    
    NSMutableArray *array_AppointmentTime;
    
    NSMutableArray *array_AppointmentType;
    
    NSMutableArray *array_ConsultantName;
    
    NSMutableArray *array_Hospital;
    
    NSMutableArray *array_Notes;
    
    NSMutableArray *array_Provider;
    
    NSMutableArray *array_TimeStamp;
    
    NSMutableArray *array_Attachemtns;
    
    
    
    
    
    NSMutableArray *array_AppointmentNam_Main;
    
    NSMutableArray *array_AppointmentID_Main;
    
    NSMutableArray *array_AppointmentTime_Main;
    
    NSMutableArray *array_AppointmentType_Main;
    
    NSMutableArray *array_ConsultantName_Main;
    
    NSMutableArray *array_Hospital_Main;
    
    NSMutableArray *array_Notes_Main;
    
    NSMutableArray *array_Provider_Main;
    
    NSMutableArray *array_TimeStamp_Main;
    
     NSMutableArray *array_Attachments_Main;
    
    
    
    
    
    NSMutableArray *temp_array_AppointmentName;
    
    NSMutableArray *temp_array_AppointmentID;
    
    NSMutableArray *temp_array_AppointmentTime;
    
    NSMutableArray *temp_array_AppointmentType;
    
    NSMutableArray *temp_array_ConsultantName;
    
    NSMutableArray *temp_array_Hospital;
    
    NSMutableArray *temp_array_Notes;
    
    NSMutableArray *temp_array_Provider;
    
    NSMutableArray *temp_array_TimeStamp;
    
    
     NSMutableArray *temp_array_Attachments;
    
    
    UIView *tableViewForMainTable;
    
    
    
    NSMutableArray *aaray_Medical_Name;
    
    NSMutableArray *temp_aaray_Medical_Name;
    
    NSMutableArray *array_Medical_Type;
    
    NSMutableArray *temp_array_Medical_Type;
    
    NSMutableArray *array_Medical_Provider;
    
    NSMutableArray *temp_array_Medical_Provider;
    
    NSMutableArray *array_Medical_Time;
    
    NSMutableArray *temp_Medical_Time;
    
    UITableView *SearchTableViewForMedicalRecords;
    
    
    NSMutableArray *aaray_Medical_Name_Main;
    
    NSMutableArray *array_Medical_Type_Main;
    
    NSMutableArray *array_Medical_Provider_Main;
    
    NSMutableArray *array_Medical_Time_Main;
    
    NSMutableArray  *array_Medical_HospitalName;
    
    NSMutableArray  *temp_array_Medical_HospitalName;
    
    NSMutableArray  *array_Medical_HospitalName_Main;
    
    
    
    NSMutableArray  *array_Medical_Notes;
    
    NSMutableArray  *temp_array_Medical_Notes;
    
    NSMutableArray  *array_Medical_Notes_Main;
    
    
    
    NSMutableArray  *array_Medical_Consultant;
    
    NSMutableArray  *temp_array_Medical_Consultant;
    
    NSMutableArray  *array_Medical_Consultant_Main;
    
    
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
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isNewMedicalCreatedByUser"] == YES)
    {
        
        [self ShowActivityIndicatorWithTitle:@"Loading..."];
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isNewMedicalCreatedByUser"];
        
        [self APICallForUserMedicalAppointment];       // API CALL FOR USER MEDICAL APPOINTMENTS
        
         [self loginWithAccessToken];
    }
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isNewAppointmentCreatedByUser"] == YES)
    {
        
        [self ShowActivityIndicatorWithTitle:@"Loading..."];
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isNewAppointmentCreatedByUser"];
        
        [self APICallForUserAppointment];       // API CALL FOR USER APPOINTMENTS
        [self loginWithAccessToken];
        
        
        if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isAttachmentAddedByUserinAddAppointment"] == YES)
        {
            [self APICallForUserMedicalAppointment];
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isAttachmentAddedByUserinAddAppointment"];
            NSLog(@"ATTACHMENT WALI API BHI CHALI HAI");
        }
        else
        {
             NSLog(@"ATTACHMENT WALI API NAHI CHALI");
        }
    }
   
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isSortCreatedByUser"] == YES)
    {
             [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isSortCreatedByUser"];
             [self APICallForUserAppointmentSortApi];
    }
   
    else
    {
        NSLog(@"API NOT RUN");
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    totalData = [[NSMutableArray alloc]init];
    dummyArray = [[NSMutableArray alloc]init];
   
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isNewAppointmentCreatedByUser"];
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isAttachmentAddedByUserinAddAppointment"];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isNewMedicalCreatedByUser"];
    [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"isEditAppointmentPressed"];
    [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"isEditMedicalPressed"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"AppointmentIdGetValue"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"MedicalIdGetValue"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    appointmentSectionTitles_Medical = [[NSMutableArray alloc]init];
    appointmentSectionTitles = [[NSMutableArray alloc]init];

   
    temp_appointmentSectionTitles_Medical = [[NSMutableArray alloc]init];
    
    temp_appointmentSectionTitles = [[NSMutableArray alloc]init];
    
    array_AppointmentName = [[NSMutableArray alloc]init];
    
    array_AppointmentID = [[NSMutableArray alloc]init];
    
    array_AppointmentTime = [[NSMutableArray alloc]init];
    
    array_AppointmentType = [[NSMutableArray alloc]init];
    
    array_ConsultantName = [[NSMutableArray alloc]init];
    
    array_Hospital = [[NSMutableArray alloc]init];
    
    array_Notes = [[NSMutableArray alloc]init];
    
    array_Provider = [[NSMutableArray alloc]init];
    
    array_TimeStamp = [[NSMutableArray alloc]init];
    
    array_Attachemtns= [[NSMutableArray alloc]init];
    
    
    
    temp_array_AppointmentName = [[NSMutableArray alloc]init];
    
    temp_array_AppointmentID = [[NSMutableArray alloc]init];
    
    temp_array_AppointmentTime = [[NSMutableArray alloc]init];
    
    temp_array_AppointmentType = [[NSMutableArray alloc]init];
    
    temp_array_ConsultantName = [[NSMutableArray alloc]init];
    
    temp_array_Hospital = [[NSMutableArray alloc]init];
    
    temp_array_Notes = [[NSMutableArray alloc]init];
    
    temp_array_Provider = [[NSMutableArray alloc]init];
    
    temp_array_TimeStamp = [[NSMutableArray alloc]init];
    
    temp_array_Attachments=[[NSMutableArray alloc]init];
    
    array_AppointmentNam_Main = [[NSMutableArray alloc]init];
    
    array_AppointmentID_Main = [[NSMutableArray alloc]init];
    
    array_AppointmentTime_Main = [[NSMutableArray alloc]init];
    
    array_AppointmentType_Main = [[NSMutableArray alloc]init];
    
    array_ConsultantName_Main = [[NSMutableArray alloc]init];
    
    array_Hospital_Main = [[NSMutableArray alloc]init];
    
    array_Notes_Main = [[NSMutableArray alloc]init];
    
    array_Provider_Main = [[NSMutableArray alloc]init];
    
    array_TimeStamp_Main = [[NSMutableArray alloc]init];
    array_Attachments_Main=[[NSMutableArray alloc]init];
    
    
    
    aaray_Medical_Name = [[NSMutableArray alloc]init];
    
    temp_aaray_Medical_Name = [[NSMutableArray alloc]init];
    
    array_Medical_Type = [[NSMutableArray alloc]init];
    
    temp_array_Medical_Type = [[NSMutableArray alloc]init];
    
    array_Medical_Provider = [[NSMutableArray alloc]init];
    
    temp_array_Medical_Provider = [[NSMutableArray alloc]init];
    
    array_Medical_Time = [[NSMutableArray alloc]init];
    
    temp_Medical_Time = [[NSMutableArray alloc]init];
    
    
    array_Medical_HospitalName = [[NSMutableArray alloc]init];
    
    temp_array_Medical_HospitalName = [[NSMutableArray alloc]init];
    
    array_Medical_HospitalName_Main = [[NSMutableArray alloc]init];
    
    
     array_Medical_Notes = [[NSMutableArray alloc]init];
    
     temp_array_Medical_Notes = [[NSMutableArray alloc]init];
    
    
     array_Medical_Notes_Main = [[NSMutableArray alloc]init];
    
    
    array_Medical_Consultant = [[NSMutableArray alloc]init];
    
    
     temp_array_Medical_Consultant = [[NSMutableArray alloc]init];
    
    array_Medical_Consultant_Main = [[NSMutableArray alloc]init];

    
    

    
    aaray_Medical_Name_Main = [[NSMutableArray alloc]init];
    
    array_Medical_Type_Main = [[NSMutableArray alloc]init];
    
    array_Medical_Provider_Main = [[NSMutableArray alloc]init];
    
    array_Medical_Time_Main = [[NSMutableArray alloc]init];
    
    
    
    appointmentsDictionary = [[NSMutableDictionary alloc]init];
    medicalrecordsDictionary=[[NSMutableDictionary alloc]init];
    temp_appointmentsDictionary = [[NSMutableDictionary alloc]init];
    appointmentIDArrayForDelete =[[NSMutableArray alloc]init];
    
    sectionAppointments = [[NSMutableArray alloc]init];
    temp_sectionAppointments = [[NSMutableArray alloc]init];
    temp_sectionAppointmentsMedicalRecords=[[NSMutableArray alloc]init];
  
    
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
   
    ScrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    ScrollerView.backgroundColor=[UIColor clearColor];
    ScrollerView.pagingEnabled=TRUE;
    ScrollerView.delegate=self;
    ScrollerView.bounces=NO;
    ScrollerView.scrollEnabled=FALSE;
    ScrollerView.showsHorizontalScrollIndicator=NO;
    [ScrollerView setContentSize:CGSizeMake(320*5,568-50)];
   
#pragma mark UserHomeGroundView

       UserHomeGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 518)];
       UserHomeGroundView.backgroundColor=[UIColor clearColor];
    
       TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width,255/2+20)];
       TopBarView.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
       TopBarView.userInteractionEnabled=TRUE;
    //[myString isEqual: [NSNull null]];
    

    EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(20, 30, 100, 100)];
    NSString *abc=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"image"];
    NSLog(@"abc=%@",abc);
    if(abc.length<1)
    {
        EditChangeImage.image=[UIImage imageNamed:@"ProfileImage.jpeg"];
    }
    else{
        urlString2 = [[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] valueForKey:@"image"];
        EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
    }
        EditChangeImage.backgroundColor=[UIColor clearColor];
        EditChangeImage.layer.masksToBounds = YES;
        EditChangeImage.layer.borderWidth = 1;
        EditChangeImage.contentMode = UIViewContentModeScaleAspectFill;
        EditChangeImage.layer.borderColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
        EditChangeImage.userInteractionEnabled=YES;
        [[EditChangeImage layer]setCornerRadius:50];
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
    else
    {
    lastNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"lastname"];
    }
    lastNameLable.backgroundColor=[UIColor clearColor];
    lastNameLable.font=[UIFont fontWithName:helveticaRegular size:17];
    lastNameLable.textAlignment=NSTextAlignmentLeft;
    lastNameLable.textColor=[UIColor blackColor];
    [TopBarView addSubview:lastNameLable];
    
    addressStaticImage=[[UIImageView alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.y+10, firstNameLable.frame.size.height+firstNameLable.frame.origin.y+35, [UIImage imageNamed:@"staticaddress.png"].size.width, [UIImage imageNamed:@"staticaddress.png"].size.height)];
    addressStaticImage.image=[UIImage imageNamed:@"staticaddress.png"];
    addressStaticImage.backgroundColor=[UIColor clearColor];
    [TopBarView addSubview:addressStaticImage];
    
    addressNameLable=[[UILabel alloc]initWithFrame:CGRectMake(addressStaticImage.frame.size.width+addressStaticImage.frame.origin.x+5, firstNameLable.frame.size.height+firstNameLable.frame.origin.y+35, 120, 20)];
    if ([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"] isEqualToString:@""]) {
        addressNameLable.text=@"---";
    }
    else
    {
        addressNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"];
    }
    addressNameLable.backgroundColor=[UIColor clearColor];
    addressNameLable.font=[UIFont fontWithName:helveticaRegular size:13];
    addressNameLable.textAlignment=NSTextAlignmentLeft;
    addressNameLable.textColor=[UIColor blackColor];
    [TopBarView addSubview:addressNameLable];
    
    PhoneStaticImage=[[UIImageView alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.y+10, addressNameLable.frame.size.height+addressNameLable.frame.origin.y+5, [UIImage imageNamed:@"staticelephone.png"].size.width, [UIImage imageNamed:@"staticelephone.png"].size.height)];
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

   // NSLog(@"upcomingappointments=%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"]);
   // NSLog(@"count=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]);
   //NSLog(@"upcomingappointments=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]);
   
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]<1)
    {
    
    FirstUpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, UpcommingButtonActionArrow.frame.size.height+UpcommingButtonActionArrow.frame.origin.y, 300, 40)];
    FirstUpcommingButtonActionArrow.backgroundColor=[UIColor whiteColor];
    [FirstUpcommingButtonActionArrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [FirstUpcommingButtonActionArrow setTitle:@"NO APPOINTMENTS CREATED" forState:(UIControlState)UIControlStateNormal];
    FirstUpcommingButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 12];
    [FirstUpcommingButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [FirstUpcommingButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    FirstUpcommingButtonActionArrow.userInteractionEnabled=FALSE;
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
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] count]<1)
    {
        FirstRecntButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, RecentButtonActionArrow.frame.size.height+RecentButtonActionArrow.frame.origin.y, 300, 40)];
        FirstRecntButtonActionArrow.backgroundColor=[UIColor whiteColor];
        [FirstRecntButtonActionArrow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [FirstRecntButtonActionArrow setTitle:@"NO RECENT UPDATES" forState:(UIControlState)UIControlStateNormal];
        FirstRecntButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 12];
        [FirstRecntButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [RecentButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        FirstRecntButtonActionArrow.userInteractionEnabled=FALSE;
        [RecentView addSubview:FirstRecntButtonActionArrow];
    }
    else{
        
        if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] count]==1){
            [self NewRecentUpdateView :0];
        }
        else
        if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] count]>=2)
        {
            [self NewRecentUpdateView :0];
           [self SecondRecentUpdateFunciton :1];
        }
        
    }
    
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
  //   [SortButton addTarget:self action:@selector(MedicalSortButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    SortButton.backgroundColor=[UIColor clearColor];
    [MedicalTopBarView addSubview:SortButton];

    MedicalTitleLable=[[UILabel  alloc]initWithFrame:CGRectMake(80, 30, 150, 20)];
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
    [CreateNewMedicalButton addTarget:self action:@selector(CreateNewMedicalReport) forControlEvents:UIControlEventTouchUpInside];
    [MedicalTopBarView addSubview:CreateNewMedicalButton];
    [MedicalHomeGroundView addSubview:MedicalTopBarView];
    
    MedicalSubView=[[UIView alloc]initWithFrame:CGRectMake(0, MedicalTopBarView.frame.size.height+MedicalTopBarView.frame.origin.y, self.view.frame.size.width, 443)];
    MedicalSubView.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
    MedicalSubView.clipsToBounds = YES;
    
    CALayer *rightBorder1 = [CALayer layer];
    rightBorder1.borderColor = [UIColor blackColor].CGColor;
    rightBorder1.borderWidth = 1;
    rightBorder1.frame = CGRectMake(1, 1, CGRectGetWidth(MedicalSubView.frame),1);
    
    [MedicalSubView.layer addSublayer:rightBorder1];
    [MedicalHomeGroundView addSubview:MedicalSubView];
    [ScrollerView addSubview:MedicalHomeGroundView];
    
#pragma mark AppointmentGroudView
    
    AppointmentGroudView=[[UIView alloc]initWithFrame:CGRectMake(MedicalHomeGroundView.frame.size.width+MedicalHomeGroundView.frame.origin.x, 0, self.view.frame.size.width, 490)];
    AppointmentGroudView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    

    AppointmentTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width,70)];
    AppointmentTopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    AppointmentTopBarView.userInteractionEnabled=TRUE;
    
    AppointmentTitleLable=[[UILabel  alloc]initWithFrame:CGRectMake(60, 30, 200, 30)];
    AppointmentTitleLable.backgroundColor=[UIColor clearColor];
    AppointmentTitleLable.text=@"APPOINTMENT RECORDS";
    AppointmentTitleLable.font=[UIFont fontWithName:helveticaRegular size:15];
    AppointmentTitleLable.textColor=[UIColor blackColor];
    AppointmentTitleLable.textAlignment=NSTextAlignmentCenter;
    [AppointmentTopBarView addSubview:AppointmentTitleLable];
    

    AppointmentSortButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 20,[UIImage imageNamed:@"sort_button.png"].size.width ,[UIImage imageNamed:@"sort_button.png"].size.height)];
   [AppointmentSortButton setImage:[UIImage imageNamed:@"sort_button.png"] forState:UIControlStateNormal];
     AppointmentSortButton.backgroundColor=[UIColor clearColor];
    [AppointmentSortButton addTarget:self action:@selector(AppointmentSortButtonAction) forControlEvents:UIControlEventTouchUpInside];
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
    
    [AppointmentGroudView addSubview:AppointmentSubView];
    [ScrollerView addSubview:AppointmentGroudView];
    
#pragma mark MapGroundView
    
    MapGroundView=[[UIView alloc]initWithFrame:CGRectMake(AppointmentGroudView.frame.size.width+AppointmentGroudView.frame.origin.x, 0, self.view.frame.size.width, 490)];
    MapGroundView.userInteractionEnabled=TRUE;
    MapGroundView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    
    MapTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.frame.size.width,70)];
    MapTopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    MapTitleLable=[[UILabel  alloc]initWithFrame:CGRectMake(105, 25, 100, 30)];
    MapTitleLable.backgroundColor=[UIColor clearColor];
    MapTitleLable.text=@"MAP";
    MapTitleLable.font=[UIFont fontWithName:helveticaRegular size:18];
    MapTitleLable.textColor=[UIColor blackColor];
    MapTitleLable.textAlignment=NSTextAlignmentCenter;
    [MapTopBarView addSubview:MapTitleLable];
    [MapGroundView  addSubview:MapTopBarView];
    
    MapSubView=[[UIView alloc]initWithFrame:CGRectMake(0, MapTopBarView.frame.size.height+MapTopBarView.frame.origin.y, self.view.frame.size.width, 443)];
    MapSubView.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
    
    MapSubView.clipsToBounds = YES;
    CALayer *rightBorder2 = [CALayer layer];
    rightBorder2.borderColor = [UIColor blackColor].CGColor;
    rightBorder2.borderWidth = 1;
    rightBorder2.frame = CGRectMake(1, 1, CGRectGetWidth(MapSubView.frame),1);
    [MapSubView.layer addSublayer:rightBorder2];
    
    [MapGroundView addSubview:MapSubView];
    [ScrollerView addSubview:MapGroundView];
    
#pragma mark SliderViewBar
    
    SliderViewBar=[[UIView alloc]initWithFrame:CGRectMake(MapGroundView.frame.size.width+MapGroundView.frame.origin.x, 0, self.view.frame.size.width,490)];
    SliderViewBar.backgroundColor=[UIColor colorWithRed:245/255.0 green:242/255.0 blue:237/255.0 alpha:1.0];
    SliderViewBar.tag=200;
    SliderViewBar.userInteractionEnabled=TRUE;
    
    EmergencySliderButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SliderViewBar.frame.size.width, 45)];
    [EmergencySliderButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    EmergencySliderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [EmergencySliderButton setTitle:@"EMERGENCY" forState:(UIControlState)UIControlStateNormal];
    EmergencySliderButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 25];
    EmergencySliderButton.titleEdgeInsets = UIEdgeInsetsMake(5, 80, 0, 0);
    EmergencySliderButton.backgroundColor=[UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1.0];
    [EmergencySliderButton addTarget:self action:@selector(EmergencyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [SliderViewBar addSubview:EmergencySliderButton];
    
    SizeBackGroundLable=[[UILabel alloc]initWithFrame:CGRectMake(0, EmergencySliderButton.frame.size.height+EmergencySliderButton.frame.origin.y, 320, 60)];
    SizeBackGroundLable.backgroundColor=[UIColor whiteColor];
    SizeBackGroundLable.textAlignment=NSTextAlignmentLeft;
    SizeBackGroundLable.textColor=[UIColor blackColor];
    SizeBackGroundLable.font=[UIFont fontWithName:helveticaThin size:12];
    
    
    SizeLable=[[UILabel alloc]initWithFrame:CGRectMake(25, 10, 270, 20)];
    SizeLable.backgroundColor=[UIColor clearColor];
    SizeLable.textAlignment=NSTextAlignmentLeft;
    SizeLable.textColor=[UIColor blackColor];
    SizeLable.text=@"Current monthly usage : 20 MB of 60 MB";
    SizeLable.font=[UIFont fontWithName:helveticaThin size:14];
    [SizeBackGroundLable addSubview:SizeLable];
    
    lineView1=[[UIView alloc]initWithFrame:CGRectMake(25,SizeLable.frame.size.height+SizeLable.frame.origin.y,250,1)];
    lineView1.layer.borderColor = [UIColor blackColor].CGColor;
    lineView1.backgroundColor=[UIColor darkGrayColor];
    lineView1.layer.borderWidth = 1.0f;
    [SizeBackGroundLable addSubview:lineView1];
    
    SyncLable=[[UILabel alloc]initWithFrame:CGRectMake(110, lineView1.frame.size.height+lineView1.frame.origin.y+5, 100, 15)];
    SyncLable.backgroundColor=[UIColor clearColor];
    SyncLable.textAlignment=NSTextAlignmentLeft;
    SyncLable.textColor=[UIColor blackColor];
    SyncLable.text=@"Last sync 10/8";
    SyncLable.font=[UIFont fontWithName:helveticaThin size:12];
    [SizeBackGroundLable addSubview:SyncLable];
    [SliderViewBar addSubview:SizeBackGroundLable];
    
    SyncButton=[[UIButton alloc]initWithFrame:CGRectMake(0, SizeBackGroundLable.frame.size.height+SizeBackGroundLable.frame.origin.y,320 ,40)];
    [SyncButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    SyncButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    SyncButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [SyncButton setTitle:@"Sync Now" forState:(UIControlState)UIControlStateNormal];
    SyncButton.titleEdgeInsets = UIEdgeInsetsMake(5, 120, 0, 0);
    SyncButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
    SyncButton.clipsToBounds = YES;
    SyncButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    SyncButton.layer.borderWidth = 0.5f;
    [SliderViewBar addSubview:SyncButton];
    
    loginImageView=[[UIImageView alloc]init];
    [loginImageView setFrame:CGRectMake(0, SyncButton.frame.size.height+SyncButton.frame.origin.y+20, 320,280)];
    [loginImageView setBackgroundColor:[UIColor grayColor]];
    loginImageView.userInteractionEnabled  =TRUE;
    [loginImageView setUserInteractionEnabled:YES];
    [SliderViewBar addSubview:loginImageView];
    
    for(int i=0;i<6;i++)
    {
        divImageView=[[UIImageView alloc]init];
        [divImageView setFrame:CGRectMake(0, 51*i, 320, 1)];
        [divImageView setBackgroundColor:[UIColor blackColor]];
        [divImageView setUserInteractionEnabled:YES];
        [loginImageView addSubview:divImageView];
    }
    
    AccountButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,320 ,50)];
    [AccountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [AccountButton setTitle:@"Account" forState:(UIControlState)UIControlStateNormal];
    AccountButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    AccountButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    AccountButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [AccountButton addTarget:self action:@selector(AccountScreen) forControlEvents:UIControlEventTouchUpInside];
    AccountButton.backgroundColor=[UIColor whiteColor];
    [loginImageView addSubview:AccountButton];
    
    SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(0, AccountButton.frame.size.height+AccountButton.frame.origin.y+1,320 ,45)];
    [SettingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [SettingButton setTitle:@"Settings" forState:(UIControlState)UIControlStateNormal];
    SettingButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    SettingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    SettingButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [SettingButton addTarget:self action:@selector(settingsScreen) forControlEvents:UIControlEventTouchUpInside];
    SettingButton.backgroundColor=[UIColor whiteColor];
    [loginImageView addSubview:SettingButton];
    
    HelpButton=[[UIButton alloc]initWithFrame:CGRectMake(0, SettingButton.frame.size.height+SettingButton.frame.origin.y+1,320 ,45)];
    [HelpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [HelpButton setTitle:@"Help" forState:(UIControlState)UIControlStateNormal];
    HelpButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    HelpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    HelpButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    HelpButton.backgroundColor=[UIColor whiteColor];
    [HelpButton addTarget:self action:@selector(HelpScreen) forControlEvents:UIControlEventTouchUpInside];
    [loginImageView addSubview:HelpButton];
    
    ReportButton=[[UIButton alloc]initWithFrame:CGRectMake(0, HelpButton.frame.size.height+HelpButton.frame.origin.y+1,320 ,45)];
    [ReportButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ReportButton setTitle:@"Legal & Privacy" forState:(UIControlState)UIControlStateNormal];
    ReportButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    ReportButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    ReportButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    ReportButton.backgroundColor=[UIColor whiteColor];
    [ReportButton addTarget:self action:@selector(ReportScreen) forControlEvents:UIControlEventTouchUpInside];
    [loginImageView addSubview:ReportButton];
    
    LegalButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ReportButton.frame.size.height+ReportButton.frame.origin.y+1,320 ,45)];
    [LegalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [LegalButton setTitle:@"Send Feedback" forState:(UIControlState)UIControlStateNormal];
    LegalButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    LegalButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    LegalButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [LegalButton addTarget:self action:@selector(LegalScreen) forControlEvents:UIControlEventTouchUpInside];
    LegalButton.backgroundColor=[UIColor whiteColor];
    [loginImageView addSubview:LegalButton];
    
    LogOutButton=[[UIButton alloc]initWithFrame:CGRectMake(0, LegalButton.frame.size.height+LegalButton.frame.origin.y+1,320 ,45)];
    [LogOutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [LogOutButton setTitle:@"Logout" forState:(UIControlState)UIControlStateNormal];
    LogOutButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    LogOutButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    LogOutButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [LogOutButton addTarget:self action:@selector(LogOutAction) forControlEvents:UIControlEventTouchUpInside];
    LogOutButton.backgroundColor=[UIColor whiteColor];
    [loginImageView addSubview:LogOutButton];
    
    copyRightLable=[[UILabel  alloc]initWithFrame:CGRectMake(230, loginImageView.frame.size.height+loginImageView.frame.origin.y, 80, 20)];
    copyRightLable.backgroundColor=[UIColor clearColor];
    copyRightLable.text=@"Copyright 2014";
    copyRightLable.font=[UIFont fontWithName:helveticaRegular size:10];
    copyRightLable.textColor=[UIColor blackColor];
    copyRightLable.textAlignment=NSTextAlignmentRight;
    [SliderViewBar addSubview:copyRightLable];
    [ScrollerView addSubview:SliderViewBar];
    [self.view addSubview:ScrollerView];
    
 
#pragma mark BottomView

    BottomView=[[UIView alloc]initWithFrame:CGRectMake(0, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, 320, 50)];
    BottomView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    SelectBarImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, [UIImage imageNamed:@"selected_bar.png"].size.width, [UIImage imageNamed:@"selected_bar.png"].size.height)];
    SelectBarImageView.image=[UIImage imageNamed:@"selected_bar.png"];
    [BottomView addSubview:SelectBarImageView];
    HomeImage=[UIImage  imageNamed:@"home_icocn_non_selected.png"];
    HomeAfterClick=[UIImage imageNamed:@"home_iconNav.png"];
    
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
    
    MedicalRecordButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width, 0, MedicalRecordsImageDefault.size.width, MedicalRecordsImageDefault.size.height)];
    MedicalRecordButton.backgroundColor=[UIColor clearColor];
   [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateSelected];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateHighlighted];
    [MedicalRecordButton addTarget:self action:@selector(MedicalButtonActionDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MedicalRecordButton];

    
    AppointmentsImageDefault=[UIImage  imageNamed:@"appoinment_icon.png"];
    AppointmentsImageAfterClick=[UIImage  imageNamed:@"appoinment_selected_icon.png"];
    
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
    
    MapButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentButton.frame.size.width+AppointmentButton.frame.origin.x+5, 0, MapImageDefault.size.width, MapImageDefault.size.height)];
    MapButton.backgroundColor=[UIColor clearColor];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateSelected];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateHighlighted];
    [MapButton addTarget:self action:@selector(MapButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MapButton];
    SliderBarDefault=[UIImage imageNamed:@"side_barNav.png"];
    
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
    
    SliderBarViewSatus=5;
    BottomNavigationButtonFlag=1;
    
    [self HideActivityIndicator];
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"view_tutorial"] integerValue]==0)
    {
        [self userGuide];
    }
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"AddAppointmentClick"];
}
-(void)MedicalSortButtonAction
{
    
    SortScreenViewController *aboutShowViewController = [[SortScreenViewController alloc] init];
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.80];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.navigationController.view cache:NO];
    
    [self.navigationController pushViewController:aboutShowViewController animated:YES];
    [UIView commitAnimations];
    
    //SortScreenViewController *createnewAppointment=[[SortScreenViewController alloc]init];
    //[self.navigationController pushViewController:createnewAppointment animated:YES];
}
-(void)AppointmentSortButtonAction
{
    
    SortScreenViewController *aboutShowViewController = [[SortScreenViewController alloc] init];
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.80];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.navigationController.view cache:NO];
    
    [self.navigationController pushViewController:aboutShowViewController animated:YES];
    [UIView commitAnimations];
    
}
-(void)LogOutAction
{
    alertviewLogout = [[UIAlertView alloc] initWithTitle:@"Log Out" message:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil];
    alertviewLogout.tag=14215;
    
    [alertviewLogout show];
}

#pragma Mark First Update Tap Button Click View
-(void)NewUpdateView :(int)indexRow
{

    FirstRowCellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    FirstRowCellButtonClick.frame = CGRectMake(0, UpcommingButtonActionArrow.frame.size.height+UpcommingButtonActionArrow.frame.origin.y, 300.5, 50);
    FirstRowCellButtonClick.backgroundColor=[UIColor clearColor];
    [FirstRowCellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    FirstRowCellButtonClick.layer.masksToBounds = NO;
    FirstRowCellButtonClick.exclusiveTouch=YES;
    [FirstRowCellButtonClick addTarget:self action:@selector(firstUpdateRowData) forControlEvents:UIControlEventTouchUpInside];
    [FirstRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
    [FirstRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
    
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
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
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
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [FirstRowCellButtonClick addSubview:ProviderNameTitleShow];
    
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
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
    [UpcommingView addSubview:FirstRowCellButtonClick];
}
-(void)firstUpdateRowData

{
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditAppointmentPressed"];
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"TapFlagVriable"];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:0] forKeyPath:kAppointmentmentNameString];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"consultantname"] objectAtIndex:0] forKeyPath:kAppointmentmentNameConsultantString];
    
    NSArray *dateSplitArray = [[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:0] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    NSString *date4=[dateSplitArray2 objectAtIndex:0];
    
    NSLog(@"date2=%@",date2);
    NSLog(@"date3=%@",date3);
    NSLog(@"date4=%@",date4);
    
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
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kAppointmentmentNameDate];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"hospital"] objectAtIndex:0] forKeyPath:kAppointmentmentNameHospital];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:0] forKeyPath:kAppointmentmentNameTypeName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:0] forKeyPath:kAppointmentmentNameProviderName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"notes"] objectAtIndex:0] forKeyPath:kAppointmentmentNotes];
    
     //[[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"attachment"] objectAtIndex:k] forKeyPath:kAppointmentmentAttachmentString];
    
    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
    [self.navigationController pushViewController:createnewAppointment animated:YES];
}
#pragma Mark Second Update Tap Button Click View
-(void)SecondUpdateFunciton:(int)indexRow
{
    
    SecondRowCellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    SecondRowCellButtonClick.frame = CGRectMake(0, FirstRowCellButtonClick.frame.size.height+FirstRowCellButtonClick.frame.origin.y, 300.5, 50);
    SecondRowCellButtonClick.backgroundColor=[UIColor clearColor];
    [SecondRowCellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    SecondRowCellButtonClick.layer.masksToBounds = NO;
    SecondRowCellButtonClick.exclusiveTouch=YES;
    [SecondRowCellButtonClick addTarget:self action:@selector(SecondUpdateRowData) forControlEvents:UIControlEventTouchUpInside];
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
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
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
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [SecondRowCellButtonClick addSubview:ProviderNameTitleShow];
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
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
    DateLable.font = [UIFont fontWithName:helveticaRegular size:10];
    DateLable.text =[NSString stringWithFormat:@"%@ %@ %@",date3,date2,date4];
    DateLable.numberOfLines=0;
    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
    [DateLable sizeToFit];
    DateLable.frame=CGRectMake(290-DateLable.frame.size.width,10,DateLable.frame.size.width,15);
    [SecondRowCellButtonClick addSubview:DateLable];
    
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    
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
    [UpcommingView addSubview:SecondRowCellButtonClick];
}
-(void)SecondUpdateRowData{
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditAppointmentPressed"];
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"TapFlagVriable"];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:1] forKeyPath:kAppointmentmentNameString];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"consultantname"] objectAtIndex:1] forKeyPath:kAppointmentmentNameConsultantString];
    
    NSArray *dateSplitArray = [[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:1] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    NSString *date4=[dateSplitArray2 objectAtIndex:0];
    
    NSLog(@"date2=%@",date2);
    NSLog(@"date3=%@",date3);
    NSLog(@"date4=%@",date4);
    
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
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kAppointmentmentNameDate];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"hospital"] objectAtIndex:1] forKeyPath:kAppointmentmentNameHospital];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:1] forKeyPath:kAppointmentmentNameTypeName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:1] forKeyPath:kAppointmentmentNameProviderName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] valueForKey:@"notes"] objectAtIndex:1] forKeyPath:kAppointmentmentNotes];
    
    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
    [self.navigationController pushViewController:createnewAppointment animated:YES];
}
#pragma Mark First Recent Tap Button Click View
-(void)NewRecentUpdateView :(int)indexRow
{
    
    FirstRowCellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    FirstRowCellButtonClick.frame = CGRectMake(0, UpcommingButtonActionArrow.frame.size.height+UpcommingButtonActionArrow.frame.origin.y, 300.5, 50);
    
    FirstRowCellButtonClick.backgroundColor=[UIColor clearColor];
    [FirstRowCellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    FirstRowCellButtonClick.layer.masksToBounds = NO;
    FirstRowCellButtonClick.exclusiveTouch=YES;
    [FirstRowCellButtonClick addTarget:self action:@selector(firstRecentRowData) forControlEvents:UIControlEventTouchUpInside];
    [FirstRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
    [FirstRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
    
    
    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
    AppointmentNameTitleShow.textColor = [UIColor blackColor];
    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
    AppointmentNameTitleShow.numberOfLines=0;
    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [AppointmentNameTitleShow sizeToFit];
    [FirstRowCellButtonClick addSubview:AppointmentNameTitleShow];
    
    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
    TypeNameTitleShow.textColor = [UIColor grayColor];
    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
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
    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"provider"] objectAtIndex:indexRow];
    
    [ProviderNameTitleShow sizeToFit];
    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [FirstRowCellButtonClick addSubview:ProviderNameTitleShow];
    
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
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
    DateLable.font = [UIFont fontWithName:helveticaRegular size:10];
    DateLable.text =[NSString stringWithFormat:@"%@ %@ %@",date3,date2,date4];
    DateLable.numberOfLines=0;
    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
    [DateLable sizeToFit];
    DateLable.frame=CGRectMake(290-DateLable.frame.size.width,10,DateLable.frame.size.width,15);
    [FirstRowCellButtonClick addSubview:DateLable];
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
  
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
    [RecentView addSubview:FirstRowCellButtonClick];
}
-(void)firstRecentRowData
{
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditAppointmentPressed"];
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"TapFlagVriable"];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmentname"] objectAtIndex:0] forKeyPath:kAppointmentmentNameString];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"consultantname"] objectAtIndex:0] forKeyPath:kAppointmentmentNameConsultantString];

    
    NSArray *dateSplitArray = [[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttime"] objectAtIndex:0] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    NSString *date4=[dateSplitArray2 objectAtIndex:0];
    
    NSLog(@"date2=%@",date2);
    NSLog(@"date3=%@",date3);
    NSLog(@"date4=%@",date4);
    
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
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kAppointmentmentNameDate];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"hospital"] objectAtIndex:0] forKeyPath:kAppointmentmentNameHospital];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttype"] objectAtIndex:0] forKeyPath:kAppointmentmentNameTypeName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"provider"] objectAtIndex:0] forKeyPath:kAppointmentmentNameProviderName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"notes"] objectAtIndex:0] forKeyPath:kAppointmentmentNotes];
    
    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
    [self.navigationController pushViewController:createnewAppointment animated:YES];
    
}
#pragma Mark Second Recent Tap Button Click View
-(void)SecondRecentUpdateFunciton:(int)indexRow
{
    
    SecondRowCellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    SecondRowCellButtonClick.frame = CGRectMake(0, FirstRowCellButtonClick.frame.size.height+FirstRowCellButtonClick.frame.origin.y, 300.5, 50);
    SecondRowCellButtonClick.backgroundColor=[UIColor clearColor];
    [SecondRowCellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    SecondRowCellButtonClick.layer.masksToBounds = NO;
    SecondRowCellButtonClick.exclusiveTouch=YES;
    [SecondRowCellButtonClick addTarget:self action:@selector(SecondRecentRowData) forControlEvents:UIControlEventTouchUpInside];
    [SecondRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
    [SecondRowCellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
    
    
    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
    AppointmentNameTitleShow.textColor = [UIColor blackColor];
    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmentname"] objectAtIndex:indexRow];
    AppointmentNameTitleShow.numberOfLines=0;
    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [AppointmentNameTitleShow sizeToFit];
    [SecondRowCellButtonClick addSubview:AppointmentNameTitleShow];
    
    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
    TypeNameTitleShow.textColor = [UIColor grayColor];
    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttype"] objectAtIndex:indexRow];
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
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
    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"provider"] objectAtIndex:indexRow];
    [ProviderNameTitleShow sizeToFit];
    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [SecondRowCellButtonClick addSubview:ProviderNameTitleShow];
    
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttime"] objectAtIndex:indexRow] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
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
    DateLable.font = [UIFont fontWithName:helveticaRegular size:10];
    DateLable.text =[NSString stringWithFormat:@"%@ %@ %@",date3,date2,date4];
    DateLable.numberOfLines=0;
    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
    [DateLable sizeToFit];
    DateLable.frame=CGRectMake(290-DateLable.frame.size.width,10,DateLable.frame.size.width,15);
    [SecondRowCellButtonClick addSubview:DateLable];
    
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    
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
    [RecentView addSubview:SecondRowCellButtonClick];
    
}

-(void)SecondRecentRowData

{
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditAppointmentPressed"];
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"TapFlagVriable"];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmentname"] objectAtIndex:1] forKeyPath:kAppointmentmentNameString];
    

    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"consultantname"] objectAtIndex:1] forKeyPath:kAppointmentmentNameConsultantString];
    
    NSArray *dateSplitArray = [[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttime"] objectAtIndex:1] componentsSeparatedByString:@"T"];
    
    
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    NSString *date4=[dateSplitArray2 objectAtIndex:0];
    
    NSLog(@"date2=%@",date2);
    NSLog(@"date3=%@",date3);
    NSLog(@"date4=%@",date4);
    
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
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kAppointmentmentNameDate];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"hospital"] objectAtIndex:1] forKeyPath:kAppointmentmentNameHospital];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttype"] objectAtIndex:1] forKeyPath:kAppointmentmentNameTypeName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"provider"] objectAtIndex:1] forKeyPath:kAppointmentmentNameProviderName];
    
    [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] valueForKey:@"notes"] objectAtIndex:1] forKeyPath:kAppointmentmentNotes];
    
    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
    [self.navigationController pushViewController:createnewAppointment animated:YES];
}
-(void)SyncButtonAction{

}
-(void)HomeButtonActionDown
{
    
    
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
       SlidMenuButton.userInteractionEnabled=TRUE;
   

    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(10, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
    }];
    
    [ScrollerView scrollRectToVisible:CGRectMake(0, 0, 320, 518) animated:YES];
}
-(void)MedicalButtonActionDown{
    
    tableViewForMainTable.hidden=NO;
    ViewForSearchingofMedicalRecords.hidden=YES;
    
    
    BottomNavigationButtonFlag=2;
    HomeButton.userInteractionEnabled=TRUE;
     AppointmentButton.userInteractionEnabled=TRUE;
     MapButton.userInteractionEnabled=TRUE;
     MedicalRecordButton.userInteractionEnabled=FALSE;
       SlidMenuButton.userInteractionEnabled=TRUE;
    
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
    
    
    tableViewForMainTableofMedicalRecords.hidden=NO;
    
    ViewForSearchingofMedicalRecords.hidden=YES;
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AddAppointmentClick"];
    HomeButton.userInteractionEnabled=TRUE;
    MedicalRecordButton.userInteractionEnabled=TRUE;
    MapButton.userInteractionEnabled=TRUE;
    AppointmentButton.userInteractionEnabled=FALSE;
       SlidMenuButton.userInteractionEnabled=TRUE;

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
    BottomNavigationButtonFlag=4;
     MapButton.userInteractionEnabled=FALSE;
    HomeButton.userInteractionEnabled=TRUE;
     MedicalRecordButton.userInteractionEnabled=TRUE;
     AppointmentButton.userInteractionEnabled=TRUE;
    SlidMenuButton.userInteractionEnabled=TRUE;
    
    
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
    
    MapButton.userInteractionEnabled=TRUE;
    HomeButton.userInteractionEnabled=TRUE;
    MedicalRecordButton.userInteractionEnabled=TRUE;
    AppointmentButton.userInteractionEnabled=TRUE;
    SlidMenuButton.userInteractionEnabled=FALSE;
  
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
    }];
    }
    else {
        SliderBarViewSatus=5;
        [UIView animateWithDuration:.3f animations:^{
              SelectBarImageView.frame=CGRectMake(MapButton.frame.origin.x+MapButton.frame.size.width+15, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
    
        } completion:^(BOOL finished) {
        }];

    }
     [ScrollerView scrollRectToVisible:CGRectMake(640+320+320, 0, 320, 518) animated:YES];
}
-(void)HomeButtonAction
{
    
}
-(void)UpcomingViewAction{
    
    [self ShowActivityIndicatorWithTitle:@"Loading..."];
    [self performSelector:@selector(serverCallForUpcommingAppointments) withObject:nil afterDelay:0.1];
}
-(void)RecentViewAction{
    
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
     ShortCutsViewController *ShortCutTable=[[ShortCutsViewController alloc]init];
    [self.navigationController pushViewController:ShortCutTable animated:YES];
}
-(void)EmergencyButtonAction
{
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
   
    CreateNewAppointmentViewController *CreateNewAppointment=[[CreateNewAppointmentViewController alloc]init];
    [self.navigationController pushViewController:CreateNewAppointment animated:YES];
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch* touch =[touches anyObject];
//    if([touch view] == (UIView *)[self.view viewWithTag:200])
//    {
//    }
//    else{
//        if(SliderBarViewSatus==1)
//        {
//            SliderBarViewSatus=5;
//            BackGroundBlackView.hidden=YES;
//            ScrollerView.userInteractionEnabled=TRUE;
//            [UIView animateWithDuration:.3f animations:^{
//                if(BottomNavigationButtonFlag==1){ SelectBarImageView.frame=CGRectMake(10, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
//                    [HomeButton setImage:HomeImage forState:UIControlStateNormal];}
//                if(BottomNavigationButtonFlag==2){ SelectBarImageView.frame=CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
//                    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateNormal];}
//                if(BottomNavigationButtonFlag==3){ SelectBarImageView.frame=CGRectMake(MedicalRecordButton.frame.origin.x+MedicalRecordButton.frame.size.width+25, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
//                    [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateNormal];}
//                if(BottomNavigationButtonFlag==4){ SelectBarImageView.frame=CGRectMake(AppointmentButton.frame.origin.x+AppointmentButton.frame.size.width+13, 0, [UIImage imageNamed:@"selected_bar.png"].size.width,[UIImage imageNamed:@"selected_bar.png"].size.height);
//                    [MapButton setImage:MapImageAfterClick forState:UIControlStateNormal];}
//                
//                BottomView.frame = CGRectMake(0, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, self.view.frame.size.width, 50);
//                SliderViewBar.frame=CGRectMake(400, 20, 200, self.view.frame.size.height);
//                UserHomeGroundView.frame=CGRectMake(0, 0, self.view.frame.size.width, 518);
//            } completion:^(BOOL finished) {
//                
//                
//            }];
//        }
//    }
//    
//    
//    
//   
//}
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
    
     [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"isEditMedicalPressed"];
    MedicalRecordsHomeViewController *CreateAppointment=[[MedicalRecordsHomeViewController alloc]init];
    [self.navigationController pushViewController:CreateAppointment animated:YES];
}
-(void)CreateNewAppointments{
    
    [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"isEditAppointmentPressed"];
    CreateNewAppointmentViewController *CreateAppointment=[[CreateNewAppointmentViewController alloc]init];
    [self.navigationController pushViewController:CreateAppointment animated:YES];
}
-(void)AccountScreen{
    
  
    AccountViewController *Account=[[AccountViewController alloc]init];
    [self.navigationController pushViewController:Account animated:YES];
}
-(void)settingsScreen
{
  
    SettingScreenViewController *setingScreen=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:setingScreen animated:YES];
}
-(void)HelpScreen
{
  
    HelpScreenViewController *HelpScreen=[[HelpScreenViewController alloc]init];
    [self.navigationController pushViewController:HelpScreen animated:YES];
}
-(void)ReportScreen
{
  
    ReportViewController *ReportScreen=[[ReportViewController alloc]init];
    [self.navigationController pushViewController:ReportScreen animated:YES];
}
-(void)LegalScreen
{
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
    if(tableView.tag==56700)
    {
        return [temp_appointmentSectionTitles_Medical count];
    }
    else if((tableView.tag == 4949) || (tableView.tag == 9876))
    {
         return 1;
    }
    else{
      return [temp_appointmentSectionTitles count];
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(tableView.tag==56700)
    {
        return 15;
    }
    else if((tableView.tag == 4949) || (tableView.tag == 9876))
    {
       return 0;
    }
    else
    {
        return 15;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger) section
{
    if(tableView.tag==56700)
    {
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15)];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.font = [UIFont fontWithName:helveticaRegular size:10];
        headerLabel.text = [temp_appointmentSectionTitles_Medical objectAtIndex:section];
        headerLabel.backgroundColor = [UIColor grayColor];
        return headerLabel;
    }
    else if((tableView.tag == 4949) || (tableView.tag == 9876))
    {
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel=nil;
        return headerLabel;
    }
    else{
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15)];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.font = [UIFont fontWithName:helveticaRegular size:10];
        headerLabel.text = [temp_appointmentSectionTitles objectAtIndex:section];
        headerLabel.backgroundColor = [UIColor grayColor];
        return headerLabel;
    }
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag==56700)
    {
        NSString *sectionTitle = [temp_appointmentSectionTitles_Medical objectAtIndex:section];
        temp_sectionAppointmentsMedicalRecords = [[MedicalRecordstemp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        sectionAppointments = [[MedicalRecordstemp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        return [temp_sectionAppointmentsMedicalRecords count];
    }
    else if(tableView.tag == 4949)
    {
        return  [temp_array_AppointmentName count];
    }
    else if (tableView.tag == 9876)
    {
        return  [temp_aaray_Medical_Name count];
    }

    else{
        NSString *sectionTitle = [temp_appointmentSectionTitles objectAtIndex:section];
        temp_sectionAppointments = [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        sectionAppointments = [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        return [temp_sectionAppointments count];
    }
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

    
    if(tableView.tag==56700)
    {
        NSString *sectionTitle = [temp_appointmentSectionTitles_Medical objectAtIndex:indexPath.section];
        NSLog(@"section Title is %@",sectionTitle);
        temp_sectionAppointmentsMedicalRecords = [[MedicalRecordstemp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        
        NSString *appointmentname   =           [[temp_sectionAppointmentsMedicalRecords objectAtIndex:indexPath.row] valueForKey:@"medicalname"];
        NSString *appointmenttime   =           [[temp_sectionAppointmentsMedicalRecords objectAtIndex:indexPath.row] valueForKey:@"medicaltime"];
        NSString *provider          =           [[temp_sectionAppointmentsMedicalRecords objectAtIndex:indexPath.row] valueForKey:@"provider"];
        NSString *appointType       =           [[temp_sectionAppointmentsMedicalRecords objectAtIndex:indexPath.row] valueForKey:@"medicaltype"];
        NSString *AppointmentId=                [[temp_sectionAppointmentsMedicalRecords objectAtIndex:indexPath.row] valueForKey:@"medicalid"];
        
        
        UIButton *CellButtonClick;
        CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
        CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
        [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        CellButtonClick.layer.masksToBounds = NO;
        CellButtonClick.exclusiveTouch=YES;
        CellButtonClick.tag=[AppointmentId integerValue];
        CellButtonClick.userInteractionEnabled=TRUE;
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
        CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        CellButtonClick.layer.borderWidth = 0.5f;
        [CellButtonClick addTarget:self action:@selector(setIdMedicalFromServer:) forControlEvents:UIControlEventTouchUpInside];
        //setIdMedicalFromServer
        //setIdFromServer
        
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
        TypeNameTitleShow.text =  appointType;
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

}
    else if (tableView.tag == 4949)
        
    {
        
        UIButton *CellButtonClick;
        
        CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
        
        [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        CellButtonClick.layer.masksToBounds = NO;
        
        CellButtonClick.exclusiveTouch=YES;
        
        CellButtonClick.userInteractionEnabled=TRUE;
        
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
        
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
        
        CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
         [CellButtonClick addTarget:self action:@selector(setIdJaaliViewFromServer:) forControlEvents:UIControlEventTouchUpInside];
        CellButtonClick.layer.borderWidth = 0.5f;
        
        
        
        UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
        
        AppointmentNameTitleShow.textColor = [UIColor blackColor];
        
        AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
        
        AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
        
        AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
        
        AppointmentNameTitleShow.text =  [temp_array_AppointmentName objectAtIndex:indexPath.row];
        
        AppointmentNameTitleShow.numberOfLines=0;
        
        AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
        
        [AppointmentNameTitleShow sizeToFit];
        
        [CellButtonClick addSubview:AppointmentNameTitleShow];
        
        
        
        AppointmentNameTitleShow.numberOfLines=0;
        
        AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
        
        [AppointmentNameTitleShow sizeToFit];
        
        [CellButtonClick addSubview:AppointmentNameTitleShow];
        
        
        
        
        
        UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
        
        TypeNameTitleShow.textColor = [UIColor grayColor];
        
        TypeNameTitleShow.backgroundColor = [UIColor clearColor];
        
        TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
        
        TypeNameTitleShow.text =  [temp_array_AppointmentType objectAtIndex:indexPath.row];
        
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
        
        ProviderNameTitleShow.text = [temp_array_Provider objectAtIndex:indexPath.row];
        
        [ProviderNameTitleShow sizeToFit];
        
        ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
        
        ProviderNameTitleShow.minimumScaleFactor=0.3;
        
        [CellButtonClick addSubview:ProviderNameTitleShow];
        
        
        
        
        
        NSArray *dateSplitArray = [[temp_array_TimeStamp objectAtIndex:indexPath.row ] componentsSeparatedByString:@"T"];
        
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
        
        
    }
    
    else if (tableView.tag == 9876)
        
    {
        
        
        
        UIButton *CellButtonClick;
        
        
        
        CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        
        CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
        
        
        
        [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        
        
        CellButtonClick.layer.masksToBounds = NO;
        
        
        
        CellButtonClick.exclusiveTouch=YES;
        
        
        
        CellButtonClick.userInteractionEnabled=TRUE;
        
        
        
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
        
        
        
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
        
        
        
        CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        
        [CellButtonClick addTarget:self action:@selector(setIdJaaliViewFromServerofMedicalRecords:) forControlEvents:UIControlEventTouchUpInside];
        
        CellButtonClick.layer.borderWidth = 0.5f;
        
        
    
        UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
        
        
        
        AppointmentNameTitleShow.textColor = [UIColor blackColor];
        
        
        
        AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
        
        
        
        AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
        
        
        
        AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
        
        
        
        AppointmentNameTitleShow.text =  [temp_aaray_Medical_Name objectAtIndex:indexPath.row];
        
        
        
        AppointmentNameTitleShow.numberOfLines=0;
        
        
        
        AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
        
        
        
        [AppointmentNameTitleShow sizeToFit];
        
        
        
        [CellButtonClick addSubview:AppointmentNameTitleShow];
        
        
        
        
        
        
        
        AppointmentNameTitleShow.numberOfLines=0;
        
        
        
        AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
        
        
        
        [AppointmentNameTitleShow sizeToFit];
        
        
        
        [CellButtonClick addSubview:AppointmentNameTitleShow];
        
        
        
        
        
        
        
        
        
        
        
        UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
        
        
        
        TypeNameTitleShow.textColor = [UIColor grayColor];
        
        
        
        TypeNameTitleShow.backgroundColor = [UIColor clearColor];
        
        
        
        TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
        
        
        
        TypeNameTitleShow.text =  [temp_array_Medical_Type objectAtIndex:indexPath.row];
        
        
        
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
        
        
        
        ProviderNameTitleShow.text = [temp_array_Medical_Provider objectAtIndex:indexPath.row];
        
        
        
        [ProviderNameTitleShow sizeToFit];
        
        
        
        ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
        
        
        
        ProviderNameTitleShow.minimumScaleFactor=0.3;
        
        
        
        [CellButtonClick addSubview:ProviderNameTitleShow];
        
        
        
        
        
        
        
        
        
        NSArray *dateSplitArray = [[temp_Medical_Time objectAtIndex:indexPath.row ] componentsSeparatedByString:@"T"];
        
        
        
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
        
        
        
        
        
    }
    else {
        
        
        NSString *sectionTitle = [temp_appointmentSectionTitles objectAtIndex:indexPath.section];
        temp_sectionAppointments = [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        
        NSString *appointmentname   =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmentname"];
        NSString *appointmenttime   =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmenttime"];
        NSString *provider          =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"provider"];
        NSString *appointType       =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmenttype"];
        NSString *AppointmentId=                [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmentid"];
        
        
        UIButton *CellButtonClick;
        CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
        CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
        [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        CellButtonClick.layer.masksToBounds = NO;
        CellButtonClick.exclusiveTouch=YES;
        CellButtonClick.tag=[AppointmentId integerValue];
        CellButtonClick.userInteractionEnabled=TRUE;
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"cart_product_info.png"] forState:UIControlStateNormal];
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
        CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        CellButtonClick.layer.borderWidth = 0.5f;
        [CellButtonClick addTarget:self action:@selector(setIdFromServer:) forControlEvents:UIControlEventTouchUpInside];
        
        
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
        TypeNameTitleShow.text =  appointType;
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

    }
   
    return cell;
  
}
-(void)tableView:(UITableView *)tableView didselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    
   
    
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
    
    NSLog(@"BottomNavigationButtonFlag=%d",BottomNavigationButtonFlag);
    
    if(BottomNavigationButtonFlag==2)
    {
        
        if (index == 0)
        {
            NSIndexPath *cellIndexPath = [AddMedicalRerocdsTableView indexPathForCell:cell];
            NSLog(@"cellIndexPath=%d",cellIndexPath.row);
            NSLog(@"MedicalRecordstemp_appointmentsDictionary=%@",MedicalRecordstemp_appointmentsDictionary);
            
            NSLog(@"temp_sectionAppointments=%@",temp_sectionAppointmentsMedicalRecords);
            
            NSString *sectionTitle          =       [temp_appointmentSectionTitles_Medical objectAtIndex:cellIndexPath.section];
            temp_sectionAppointmentsMedicalRecords        =       [[MedicalRecordstemp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
          
            NSString *appointmentID         =       [[temp_sectionAppointmentsMedicalRecords objectAtIndex:cellIndexPath.row] valueForKey:@"medicalid"];
            
            
            NSLog(@"medicalid %@",appointmentID);
            NSLog(@"medicalid %@",temp_sectionAppointmentsMedicalRecords );
            
            
            NSLog(@"[sectionAppointments count] ==>%d",[temp_sectionAppointmentsMedicalRecords count]);
            
            rowTappedForDelete = appointmentID ;
            
           
            
            
            alertviewLogout = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Are you sure you want to delete?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil];
            alertviewLogout.tag=3;
            
            [alertviewLogout show];
//
       }

    }
    
    else
    {
        if (index == 0)
        {
            NSIndexPath *cellIndexPath = [AddAppointmentTableView indexPathForCell:cell];
            NSLog(@"cellIndexPath=%d",cellIndexPath.row);
            
            
            NSLog(@"temp_sectionAppointments=%@",temp_sectionAppointments);
            NSString *sectionTitle          =       [temp_appointmentSectionTitles objectAtIndex:cellIndexPath.section];
            temp_sectionAppointments        =       [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
            NSString *appointmentID         =       [[temp_sectionAppointments objectAtIndex:cellIndexPath.row] valueForKey:@"appointmentid"];
            
            NSLog(@"appointmentID to delete is %@",appointmentID);
            NSLog(@"Section Appointment is %@",temp_sectionAppointments );
            
            NSString *attachment         =       [[temp_sectionAppointments objectAtIndex:cellIndexPath.row] valueForKey:@"attachment"];
            NSLog(@" attachment is %d",[attachment length]);
    
            isAttachmentAdded = NO;
            if ([attachment length] > 0)
            {
                isAttachmentAdded = YES;
                NSLog(@"Oye hoye attachment hai aapke paas toh");
                
            }

            
            
            NSLog(@"[sectionAppointments count] ==>%d",[temp_sectionAppointments count]);
            
            rowTappedForDelete = appointmentID ;
            
            alertviewLogout = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Are you sure you want to delete?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil];
            alertviewLogout.tag=4;
            
            [alertviewLogout show];

        
        
    }
    
    }
}
#pragma mark Alert view delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(alertView.tag==3)
    {
        
        if(buttonIndex ==1)
        {
            [self DeleteMedicalCallFunction : rowTappedForDelete];
        }
    }
    
    else
        if(alertView.tag==4)
        {
            if(buttonIndex ==1)
            {
                [self DeleteAPICallFunction : rowTappedForDelete];
                
                if (isAttachmentAdded == YES)
                {
                    [self APICallForUserMedicalAppointment];       // API CALL FOR USER MEDICAL APPOINTMENTS
                    [self loginWithAccessToken];

                }
                
                
            }

            
        }
        else if(alertView.tag==14215)
        {
            if(buttonIndex ==1)
            {
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kLoginData];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kLoginData];
                
                NSLog(@"kLoginData=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kLoginData]);
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kEmergencyDetails];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kEmergencyDetails];

                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kUpcomingAppointmentData];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kUpcomingAppointmentData];

                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kRecentAppointmentData];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kRecentAppointmentData];
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentData];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentData];
                
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentmentNameString];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentmentNameString];
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentmentNameConsultantString];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentmentNameConsultantString];
                
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentmentNameDate];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentmentNameDate];
                
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentmentNameHospital];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentmentNameHospital];
                
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentmentNameTypeName];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentmentNameTypeName];
                
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentmentNameProviderName];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentmentNameProviderName];
                
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kAppointmentmentNotes];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kAppointmentmentNotes];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kMedicalRecordeNameString];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kMedicalRecordeNameString];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kMedicalRecordeNameConsultantString];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kMedicalRecordeNameConsultantString];
                

                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kMedicalRecordeNameDate];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kMedicalRecordeNameDate];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kMedicalRecordeNameHospital];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kMedicalRecordeNameHospital];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kMedicalRecordeNameTypeName];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kMedicalRecordeNameTypeName];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kMedicalRecordeNameProviderName];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kMedicalRecordeNameProviderName];
                
                
                [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kMedicalRecordsNotes];
                [[NSUserDefaults standardUserDefaults]removeObjectForKey:kMedicalRecordsNotes];
                
//
              
                NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
                NSString *token = [[NSString alloc] init];
                token = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"device_token"]];
                [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
                [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"device_token"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                
                ApplifyViewController *MainScreen=[[ApplifyViewController alloc]init];
                [self.navigationController pushViewController:MainScreen animated:YES];
                
            }
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
-(void) DeleteMedicalCallFunction :(NSString*)deleteTag
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
        NSDictionary *params = @{ @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"],
                                  @"medicalid":deleteTag
                                 };
        NSLog(@"Parameter=>%@",params);
        [self ShowActivityIndicatorWithTitle:@"Loading..."];
        [manager POST:[NSString stringWithFormat:@"%@/delete_user_medical",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            NSLog(@"JSON--->%@",json);
            if([json objectForKey:@"error"])
            {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
            }
            else if([json objectForKey:@"log"])
            {
                NSLog(@"Log --> User Appointment ==>> %@",[json objectForKey:@"log"]);
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"log"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
                
                [self APICallForUserMedicalAppointment];
//                [AddAppointmentTableView reloadData];

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

#pragma mark DeleteAPICall
-(void) DeleteAPICallFunction :(NSString*)deleteTag
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
        NSDictionary *params = @{ @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"],
                                  @"appointmentid":deleteTag
                                  };
        NSLog(@"Parameter=>%@",params);
        [self ShowActivityIndicatorWithTitle:@"Loading..."];
        [manager POST:[NSString stringWithFormat:@"%@/delete_user_appointment",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            NSLog(@"JSON--->%@",json);
            if([json objectForKey:@"error"])
            {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
            }
            else if([json objectForKey:@"log"])
            {
                NSLog(@"Log --> User Appointment ==>> %@",[json objectForKey:@"log"]);
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"log"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
                
                [self APICallForUserAppointment];
                //                [AddAppointmentTableView reloadData];
                
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

#pragma mark Search bar AddMedicalAppointmentsTableViewFunction
-(void)AddMedicalAppointmentsTableViewFunction{
    
    
    
    [MedicalSearchBar removeFromSuperview];
    
    MedicalSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(8, 7, 300, 44)];
    
    MedicalSearchBar.delegate = self;
    
    MedicalSearchBar.placeholder = @"Search";
    
    
    
    [MedicalSearchBar setSearchFieldBackgroundImage:
     
     [UIImage imageNamed:@"Rounded-Rectangle-9.png"] forState:UIControlStateNormal];
    
    
    
    MedicalSearchBar.translucent = NO;
    
    MedicalSearchBar.opaque = NO;
    
    MedicalSearchBar.showsCancelButton=NO;
    
    MedicalSearchBar.tag = 777;
    
    
    
    MedicalSearchBar.backgroundColor=[UIColor clearColor];
    
    MedicalSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    MedicalSearchBar.barTintColor = [UIColor clearColor];
    
    [MedicalSubView addSubview:MedicalSearchBar];
    
    
    tableViewForMainTableofMedicalRecords = [[UIView alloc]init];
    
    tableViewForMainTableofMedicalRecords.frame = CGRectMake(0, 60, self.view.frame.size.width, 390);
    
    [MedicalSubView addSubview:tableViewForMainTableofMedicalRecords];
    
    
    [AddMedicalRerocdsTableView removeFromSuperview];
    
    AddMedicalRerocdsTableView = nil;
    
    AddMedicalRerocdsTableView=[[UITableView alloc]init];
    
    AddMedicalRerocdsTableView.frame=CGRectMake(0, 0, self.view.frame.size.width, 385);
    
    AddMedicalRerocdsTableView.tag=56700;
    
    [AddMedicalRerocdsTableView setDelegate:self];
    
    AddMedicalRerocdsTableView.dataSource=self;
    
    [AddMedicalRerocdsTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    [AddMedicalRerocdsTableView setSeparatorColor:[UIColor grayColor]];
    
    [AddMedicalRerocdsTableView setSeparatorInset:UIEdgeInsetsZero];
    
    AddMedicalRerocdsTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    //CastingJobTableView.backgroundColor=[UIColor colorWithRed:0.8515625 green:0.85546875 blue:0.8671875 alpha:1.0];
    
    AddMedicalRerocdsTableView.backgroundColor=[UIColor whiteColor];
    
    AddMedicalRerocdsTableView.showsVerticalScrollIndicator = NO;
    
    AddMedicalRerocdsTableView.alwaysBounceVertical = NO;
    
    // [searchTableView setBackgroundColor:[UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0]];
    
    [tableViewForMainTableofMedicalRecords addSubview:AddMedicalRerocdsTableView];
    
    
    
}
#pragma mark Search bar AddAppointmentTableViewFunction
//-(void)AddAppointmentTableViewFunction
//{
//    
//    [SearchBar removeFromSuperview];
//    SearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(8, 7, 300, 44)];
//    SearchBar.delegate = self;
//    SearchBar.placeholder = @"Search";
//    
//    
//    [SearchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"Rounded-Rectangle-9.png"]
//                                    forState:UIControlStateNormal];
//    
//    SearchBar.translucent = NO;
//    SearchBar.opaque = NO;
//    SearchBar.showsCancelButton=YES;
//    SearchBar.backgroundColor=[UIColor clearColor];
//    SearchBar.searchBarStyle = UISearchBarStyleMinimal;
//    SearchBar.barTintColor = [UIColor clearColor];
//    SearchBar.showsCancelButton = NO;
//    [AppointmentSubView addSubview:SearchBar];
//    
//    
//    [AddAppointmentTableView removeFromSuperview];
//    AddAppointmentTableView = nil;
//    AddAppointmentTableView=[[UITableView alloc]init];
//    AddAppointmentTableView.frame=CGRectMake(0, SearchBar.frame.size.height+SearchBar.frame.origin.y+5, self.view.frame.size.width, 390);
//    
//    [AddAppointmentTableView setDelegate:self];
//    AddAppointmentTableView.dataSource=self;
//    [AddAppointmentTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
//    [AddAppointmentTableView setSeparatorColor:[UIColor grayColor]];
//    [AddAppointmentTableView setSeparatorInset:UIEdgeInsetsZero];
//    AddAppointmentTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    //CastingJobTableView.backgroundColor=[UIColor colorWithRed:0.8515625 green:0.85546875 blue:0.8671875 alpha:1.0];
//    AddAppointmentTableView.backgroundColor=[UIColor whiteColor];
//    AddAppointmentTableView.showsVerticalScrollIndicator = NO;
//    AddAppointmentTableView.alwaysBounceVertical = NO;
//    // [searchTableView setBackgroundColor:[UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0]];
//    [AppointmentSubView addSubview:AddAppointmentTableView];
//}
#pragma mark Search bar

-(void)AddAppointmentTableViewFunction{
    
    
    
    [SearchBar removeFromSuperview];
    
    SearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(8, 57, 300, 44)];
    SearchBar.tag=12345;
    SearchBar.delegate = self;
    
    SearchBar.placeholder = @"Search";
    
    
    
    [SearchBar setSearchFieldBackgroundImage:
     
     [UIImage imageNamed:@"Rounded-Rectangle-9.png"]
     
                                    forState:UIControlStateNormal];
    
    
    
    SearchBar.translucent = NO;
    
    SearchBar.opaque = NO;
    
    SearchBar.showsCancelButton=YES;
    
    SearchBar.backgroundColor=[UIColor clearColor];
    
    SearchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    SearchBar.barTintColor = [UIColor clearColor];
    
    SearchBar.showsCancelButton = NO;
    
    [AppointmentGroudView addSubview:SearchBar];
    
    
    
    tableViewForMainTable = [[UIView alloc]init];
    
    tableViewForMainTable.frame = CGRectMake(0, 60, self.view.frame.size.width, 390);
    
    [AppointmentSubView addSubview:tableViewForMainTable];
    
    
    
    
    
    [AddAppointmentTableView removeFromSuperview];
    
    AddAppointmentTableView = nil;
    
    AddAppointmentTableView=[[UITableView alloc]init];
    
    AddAppointmentTableView.frame=CGRectMake(0, 0, self.view.frame.size.width, 385);
    
    AddAppointmentTableView.tag = 5050;
    
    
    
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
    
    [tableViewForMainTable addSubview:AddAppointmentTableView];
    
    
    
    
    
    
    
}
//- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar
//
//{
//    if(searchBar.tag==12345){
//        [SearchBar setShowsCancelButton:YES animated:YES];
//        
//        
//        tableViewForMainTable.hidden = YES;
//        
//        [self searchViewForTable];
//    }
//    else{
//         [MedicalSearchBar setShowsCancelButton:YES animated:YES];
//    }
//    
//    
//    
//    
//    
//}



//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//
//{
//    if(searchBar.tag==12345){
//        [SearchBar resignFirstResponder];
//        
//        SearchBar.showsCancelButton = NO;
//        
//        
//        tableViewForMainTable.hidden = NO;
//        
//        ViewForSearching.hidden = YES;
//    }
//    else {
//        [MedicalSearchBar resignFirstResponder];
//        
//        MedicalSearchBar.showsCancelButton = NO;
//    }
//  
//    
//   
//    
//    
//   
//    
//    
//    
//    //[AddAppointmentTableView reloadData];
//    
//}



//-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//
//{
//    
//    [searchBar resignFirstResponder];
//    
//}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    [ SearchBar resignFirstResponder];
    [MedicalSearchBar resignFirstResponder];
    
}



- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar

{
    
    [self.view endEditing:YES];
    
}



//-(void)searchBar:(UISearchBar *)searchBar1 textDidChange:(NSString *)searchText
//
//{
//    if(searchBar1.tag==12345){
//        if ([searchText length]==0)
//            
//        {
//            
//            tableViewForMainTable.hidden = NO;
//            
//            ViewForSearching.hidden = YES;
//            
//            
//            
//            temp_array_AppointmentName =[array_AppointmentNam_Main mutableCopy];
//            
//            temp_array_AppointmentID = [array_AppointmentID_Main mutableCopy];
//            
//            temp_array_AppointmentTime = [array_AppointmentTime_Main mutableCopy];
//            
//            temp_array_AppointmentType = [array_AppointmentType_Main mutableCopy];
//            
//            temp_array_ConsultantName = [array_ConsultantName_Main mutableCopy];
//            
//            temp_array_Hospital = [array_Hospital_Main mutableCopy];
//            
//            temp_array_Notes = [array_Notes_Main mutableCopy];
//            
//            temp_array_Provider = [array_Provider_Main mutableCopy];
//            
//            temp_array_TimeStamp = [array_TimeStamp_Main mutableCopy];
//            
//            temp_array_Attachments= [array_Attachments_Main mutableCopy];
//            
//        }
//        
//        else
//            
//        {
//            
//            tableViewForMainTable.hidden = YES;
//            
//            [self searchViewForTable];
//            
//            
//            
//            [temp_array_AppointmentName removeAllObjects];
//            
//            [temp_array_AppointmentID removeAllObjects];
//            
//            [temp_array_AppointmentTime removeAllObjects];
//            
//            [temp_array_AppointmentType removeAllObjects];
//            
//            [temp_array_ConsultantName removeAllObjects];
//            
//            [temp_array_Hospital removeAllObjects];
//            
//            [temp_array_Notes removeAllObjects];
//            
//            [temp_array_Provider removeAllObjects];
//            
//            [temp_array_TimeStamp removeAllObjects];
//            [temp_array_Attachments removeAllObjects];
//            
//            
//            int g = 0;
//            
//            
////            NSDictionary * book = NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
////                                                        array_AppointmentType_Main, @"appointmentType", array_AppointmentNam_Main, @"appointmentName", nil];
////            [array_AppointmentNam_Main addObject:book];
//            
//            
//            NSLog(@"array_AppointmentName is %@",array_AppointmentNam_Main);
//            
//            for (NSString *string in array_AppointmentNam_Main)
//                
//            {
//                
//                NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                
//                if (r.location != NSNotFound)
//                    
//                {
//                    
//                    [temp_array_AppointmentName addObject:[array_AppointmentNam_Main objectAtIndex:g]];
//                    
//                    [temp_array_AppointmentID addObject:[array_AppointmentID_Main objectAtIndex:g]];
//                    
//                    [temp_array_AppointmentTime addObject:[array_AppointmentTime_Main objectAtIndex:g]];
//                    
//                    [temp_array_AppointmentType addObject:[array_AppointmentType_Main objectAtIndex:g]];
//                    
//                    [temp_array_ConsultantName addObject:[array_ConsultantName_Main objectAtIndex:g]];
//                    
//                    [temp_array_Hospital addObject:[array_Hospital_Main objectAtIndex:g]];
//                    
//                    [temp_array_Notes addObject:[array_Notes_Main objectAtIndex:g]];
//                    
//                    [temp_array_Provider addObject:[array_Provider_Main objectAtIndex:g]];
//                    
//                    [temp_array_TimeStamp addObject:[array_TimeStamp_Main objectAtIndex:g]];
//                    
//                     [temp_array_Attachments addObject:[array_Attachments_Main objectAtIndex:g]];
//                    
//                    
//                    
//                }
//                
//                g++;
//                
//            }
//            
//        }
//        
//        [SearchTableView reloadData];
//    }
//    else{
//        
//    }
//
//    
//}



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
-(IBAction)setIdFromServer:(id)sender{
    
    
    NSLog(@"appointmentsDictionary=%@",appointmentsDictionary);
    [[NSUserDefaults standardUserDefaults] setInteger:[sender tag]forKey:@"AppointmentIdGetValue"];
    NSLog(@"AppointmentIdGetValue=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"AppointmentIdGetValue"]);
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditAppointmentPressed"];
    
[[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"TapFlagVriable"];

    NSArray *keys= [appointmentsDictionary allKeys];
    for (NSString *keysV in keys)
    {
        NSLog(@"Keys are %@", keysV);
        
        NSLog(@"vlaue=%d",[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"appointmentid"] count]);
        
        if([[[appointmentsDictionary valueForKey:keysV] valueForKey:@"appointmentid"] count]<1){
            
        }
        else
        {
            for (int k=0; k<[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"appointmentid"] count]; k++) {
                
               NSLog(@"vlaue=%@",appointmentsDictionary);
                if([[[[[appointmentsDictionary valueForKey: keysV] valueForKey:@"appointmentid"] objectAtIndex:k] stringValue] isEqualToString:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"AppointmentIdGetValue"]]])
                {
                    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"appointmentname"] objectAtIndex:k] forKeyPath:kAppointmentmentNameString];
                    
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"consultantname"] objectAtIndex:k] forKeyPath:kAppointmentmentNameConsultantString];
                    
                   
                    
                    NSArray *dateSplitArray = [[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"appointmenttime"] objectAtIndex:k] componentsSeparatedByString:@"T"];
                    NSString *date=[dateSplitArray objectAtIndex:0];
                    NSString *dateTime=[dateSplitArray objectAtIndex:1];
                    
                    
                    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
                    NSString *date2=[dateSplitArray2 objectAtIndex:1];
                    NSString *date3=[dateSplitArray2 objectAtIndex:2];
                    NSString *date4=[dateSplitArray2 objectAtIndex:0];
                    
                    NSLog(@"date2=%@",date2);
                    NSLog(@"date3=%@",date3);
                    NSLog(@"date4=%@",date4);
                    
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
                    
                    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
                    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
                    
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kAppointmentmentNameDate];
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"hospital"] objectAtIndex:k] forKeyPath:kAppointmentmentNameHospital];
                    
                     [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"appointmenttype"] objectAtIndex:k] forKeyPath:kAppointmentmentNameTypeName];
                    
                     [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"provider"] objectAtIndex:k] forKeyPath:kAppointmentmentNameProviderName];
                    
                     [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"notes"] objectAtIndex:k] forKeyPath:kAppointmentmentNotes];
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"attachment"] objectAtIndex:k] forKeyPath:kAppointmentmentAttachmentString];
                    
                    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
                    [self.navigationController pushViewController:createnewAppointment animated:YES];
                    //
                    //
                    
                }
            }
            
        }

    }

   
}

-(IBAction)setIdMedicalFromServer:(id)sender{
    
    
    NSLog(@"medicalrecordsDictionary=%@",medicalrecordsDictionary);
    [[NSUserDefaults standardUserDefaults] setInteger:[sender tag]forKey:@"MedicalIdGetValue"];
    NSLog(@"AppointmentIdGetValue=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"MedicalIdGetValue"]);
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditMedicalPressed"];
    
   [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"TapFlagVriable"];
    
    NSArray *keys= [medicalrecordsDictionary allKeys];
    for (NSString *keysV in keys)
    {
        NSLog(@"Keys are %@", keysV);
        
        NSLog(@"vlaue=%d",[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"medicalid"] count]);
        
        if([[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"medicalid"] count]<1){
            
        }
        else
        {
            for (int k=0; k<[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"medicalid"] count]; k++) {
                
                NSLog(@"vlaue=%@",medicalrecordsDictionary);
                if([[[[[medicalrecordsDictionary valueForKey: keysV] valueForKey:@"medicalid"] objectAtIndex:k] stringValue] isEqualToString:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"MedicalIdGetValue"]]])
                {
                    
                    
                      [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"medicalname"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameString];
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"consultantname"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameConsultantString];
                    
                    
                    
                    NSArray *dateSplitArray = [[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"medicaltime"] objectAtIndex:k] componentsSeparatedByString:@"T"];
                    NSString *date=[dateSplitArray objectAtIndex:0];
                    NSString *dateTime=[dateSplitArray objectAtIndex:1];
                    
                    
                    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
                    NSString *date2=[dateSplitArray2 objectAtIndex:1];
                    NSString *date3=[dateSplitArray2 objectAtIndex:2];
                    NSString *date4=[dateSplitArray2 objectAtIndex:0];
                    
                    NSLog(@"date2=%@",date2);
                    NSLog(@"date3=%@",date3);
                    NSLog(@"date4=%@",date4);
                    
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
                    
                    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
                    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
                    
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kMedicalRecordeNameDate];
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"hospital"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameHospital];
                    
                  
                     [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"medicaltype"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameTypeName];
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"provider"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameProviderName];
                    
                     [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"notes"] objectAtIndex:k] forKeyPath:kMedicalRecordsNotes];
                    
                    
                    
                    
                    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
                    [self.navigationController pushViewController:createnewAppointment animated:YES];
                    //
                    //
                    
                }
            }
            
        }
        
    }

    
}

- (NSArray *)allKeysForObject:(id)anObject
{
return anObject;
}


#pragma mark APICallForUserMedicalAppointment API

-(void)APICallForUserMedicalAppointment

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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        NSLog(@"APICallForUserMedicalAppointment >>>>Parameter=>%@",params);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        [manager POST:[NSString stringWithFormat:@"%@/get_all_user_medical",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            
            
            
            
            
            
            
            NSLog(@"APICallForUserMedicalAppointment >>>>JSON--->%d",[[json objectForKey:@"data"] count]);
            
            
            
            
            
            
            
            if([json objectForKey:@"error"])
                
                
                
                
                
                
                
            {
                
                
                
                
                
                
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                
                
                
                
                
                
                [myAlertView show];
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
            else
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                if ([[json objectForKey:@"log"]isEqualToString:@"No medical yet!"])
                    
                    
                    
                    
                    
                    
                    
                {
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"Log --> User Appointment ==>> %@",[json objectForKey:@"log"]);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    DemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 80, [UIImage imageNamed:@"medecal_records_tuts.png"].size.width, [UIImage imageNamed:@"medecal_records_tuts.png"].size.height)];
                    
                    
                    
                    
                    
                    
                    
                    DemoImageView.image=[UIImage imageNamed:@"medecal_records_tuts.png"];
                    
                    
                    
                    
                    
                    
                    
                    [MedicalSubView addSubview:DemoImageView];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    [AddMedicalRerocdsTableView removeFromSuperview];
                    
                    
                    
                    
                    
                    
                    
                    AddMedicalRerocdsTableView=nil;
                    
                    
                    
                    
                    
                    
                    
                    MedicalSearchBar=nil;
                    
                    
                    
                    
                    
                    
                    
                }
            
            
            
            
            
            
            
                else
                    
                    
                    
                    
                    
                    
                    
                {
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"JSON FOR MEDICAL RECORD ==> %@",json);
                    
                    
                    
                    
                    
                    
                    
                    medicalrecordsDictionary = nil;
                    
                    
                    
                    
                    
                    
                    
                    MedicalRecordstemp_appointmentsDictionary = nil;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    medicalrecordsDictionary = [[NSMutableDictionary alloc]init];
                    
                    
                    
                    
                    
                    
                    
                    MedicalRecordstemp_appointmentsDictionary = [[NSMutableDictionary alloc]init];
                    
                    
                    
                    
                    
                    
                    
                    medicalrecordsDictionary = json;
                    
                    
                    
                    
                    
                    
                    
                    MedicalRecordstemp_appointmentsDictionary = [json mutableCopy];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    NSArray *monthArray = [MedicalRecordstemp_appointmentsDictionary allKeys];
                    
                    
                    
                    NSLog(@"monthArray is %@",monthArray);
                    
                    
                    
                    NSMutableArray *monthMutableArray = [[NSMutableArray alloc]initWithArray:monthArray];
                    
                    
                    
                    NSMutableArray *jaaduArray = [[NSMutableArray alloc]init];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    for (int i=0; i<[[MedicalRecordstemp_appointmentsDictionary allKeys]count]; i++)
                        
                        
                        
                    {
                        
                        
                        
                        if ([[MedicalRecordstemp_appointmentsDictionary objectForKey:[monthMutableArray objectAtIndex:i]]count] > 0)
                            
                            
                            
                        {
                            
                            
                            
                            [jaaduArray addObject:[monthMutableArray objectAtIndex:i]];
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"jaaduArray is %@",jaaduArray);
                    
                    
                    
                    [appointmentSectionTitles_Medical removeAllObjects];
                    
                    [temp_appointmentSectionTitles_Medical removeAllObjects];
                    
                    appointmentSectionTitles_Medical = jaaduArray;
                    
                    temp_appointmentSectionTitles_Medical = jaaduArray;
                    
                    NSLog(@"appointmentSectionTitles is %@",temp_appointmentSectionTitles_Medical);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    // *******************************************************************************//
                    
                    
                    
                    // SORTING ACCORDING TO CURRENT MONTH
                    
                    
                    
                    NSMutableArray *myArray = [[NSMutableArray alloc]initWithArray:temp_appointmentSectionTitles_Medical];
                    
                    [temp_appointmentSectionTitles_Medical removeAllObjects];
                    
                    
                    
                    NSString *startMonthName;
                    
                    NSString *temp;
                    
                    NSMutableArray *arrayNumber2 = [[NSMutableArray alloc]init];
                    
                    NSMutableArray *arrayNumber1 = [[NSMutableArray alloc]init];
                    
                    NSMutableDictionary *monthsDictionary = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"1",@"January",@"2",@"February",@"3",@"March",@"4",@"April",@"5",@"May",@"6",@"June",@"7",@"July",@"8",@"August",@"9",@"September",@"10",@"October",@"11",@"November",@"12",@"December", nil];
                    
                    
                    
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    
                    [dateFormatter setDateFormat:@"MMMM"];
                    
                    NSString *monthName = [dateFormatter stringFromDate:[NSDate date]];
                    
                    NSString *monthNumber = [monthsDictionary objectForKey:monthName];
                    
                    
                    
                    for (int i=0; i<[myArray count]; i++)
                        
                    {
                        
                        if ([monthNumber integerValue] > [[monthsDictionary objectForKey:[myArray objectAtIndex:i]]integerValue])
                            
                        {
                            
                            [arrayNumber2 addObject:[myArray objectAtIndex:i]];
                            
                        }
                        
                        else if ([monthNumber integerValue] < [[monthsDictionary objectForKey:[myArray objectAtIndex:i]]integerValue])
                            
                        {
                            
                            [arrayNumber1 addObject:[myArray objectAtIndex:i]];
                            
                        }
                        
                        else if ([monthNumber integerValue] == [[monthsDictionary objectForKey:[myArray objectAtIndex:i]]integerValue])
                            
                        {
                            
                            startMonthName = [myArray objectAtIndex:i];
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    if (arrayNumber1.count > 0)
                        
                    {
                        
                        for (int i = 0; i< [arrayNumber1 count]-1; i++)
                            
                        {
                            
                            for (int j = 1; j<[arrayNumber1 count]; j++)
                                
                            {
                                
                                if ([[monthsDictionary objectForKey:[arrayNumber1 objectAtIndex:i]]integerValue] > [[monthsDictionary objectForKey:[arrayNumber1 objectAtIndex:j]]integerValue])
                                    
                                {
                                    
                                    temp = [arrayNumber1 objectAtIndex:i];
                                    
                                    [arrayNumber1 replaceObjectAtIndex:i withObject:[arrayNumber1 objectAtIndex:j]];
                                    
                                    [arrayNumber1 replaceObjectAtIndex:j withObject:temp];
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    
                    if (arrayNumber2.count > 0)
                        
                    {
                        
                        for (int i = 0; i< [arrayNumber2 count]-1; i++)
                            
                        {
                            
                            for (int j = 1; j<[arrayNumber2 count]; j++)
                                
                            {
                                
                                if ([[monthsDictionary objectForKey:[arrayNumber2 objectAtIndex:i]]integerValue] > [[monthsDictionary objectForKey:[arrayNumber2 objectAtIndex:j]]integerValue])
                                    
                                {
                                    
                                    temp = [arrayNumber2 objectAtIndex:i];
                                    
                                    [arrayNumber2 replaceObjectAtIndex:i withObject:[arrayNumber2 objectAtIndex:j]];
                                    
                                    [arrayNumber2 replaceObjectAtIndex:j withObject:temp];
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    if (![startMonthName length]==0)
                        
                    {
                        
                        [temp_appointmentSectionTitles_Medical insertObject:startMonthName atIndex:0];
                        
                    }
                    
                    
                    
                    [temp_appointmentSectionTitles_Medical addObjectsFromArray:arrayNumber1];
                    
                    [temp_appointmentSectionTitles_Medical addObjectsFromArray:arrayNumber2];
                    
                    
                    
                    
                    
                    
                    
                    // *******************************************************************************//
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"All Keys of APpointments is %@",[medicalrecordsDictionary allKeys]);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    for (int i = 0; i<[appointmentSectionTitles_Medical count]; i++)
                        
                        
                        
                    {
                        
                        
                        
                        [totalData addObject:   [[json objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"medicalname"]];
                        
                        
                        
                    }
                    
                    
                    
                    NSLog(@"total Data is %@",totalData);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    for (int i = 0; i<[appointmentSectionTitles_Medical count]; i++)
                        
                        
                        
                        
                        
                        
                        
                    {
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[totalData objectAtIndex:i]count]; j++)
                            
                            
                            
                            
                            
                            
                            
                        {
                            
                            
                            
                            
                            
                            
                            
                            [dummyArray addObject:[[totalData objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"dummy array is %@",dummyArray);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    [aaray_Medical_Name removeAllObjects];
                    
                    
                    
                    [array_Medical_Type removeAllObjects];
                    
                    
                    
                    [array_Medical_Provider removeAllObjects];
                    
                    
                    
                    [array_Medical_Time removeAllObjects];
                    
                    
                    
                    [array_Medical_HospitalName removeAllObjects];
                    
                    
                    
                    [array_Medical_Notes removeAllObjects];
                    
                    
                    
                    
                    
                    [array_Medical_Consultant removeAllObjects];
                    
                    
                    
                    
                    
                    
                    
                    [temp_Medical_Time removeAllObjects];
                    
                    
                    
                    [temp_aaray_Medical_Name removeAllObjects];
                    
                    
                    
                    [temp_array_Medical_Type removeAllObjects];
                    
                    
                    
                    [temp_array_Medical_Provider removeAllObjects];
                    
                    
                    
                    
                    
                    [temp_array_Medical_Notes removeAllObjects];
                    
                    
                    
                    
                    
                    [temp_array_Medical_Consultant removeAllObjects];
                    
                    
                    
                    
                    
                    [aaray_Medical_Name_Main removeAllObjects];
                    
                    
                    
                    [array_Medical_Type_Main removeAllObjects];
                    
                    
                    
                    [array_Medical_Provider_Main removeAllObjects];
                    
                    
                    
                    [array_Medical_Time_Main removeAllObjects];
                    
                    
                    
                    [array_Medical_Notes_Main removeAllObjects];
                    
                    
                    
                    [array_Medical_Consultant_Main removeAllObjects];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    for (int i = 0; i<[appointmentSectionTitles_Medical count]; i++)
                        
                        
                        
                    {
                        
                        
                        
                        [aaray_Medical_Name addObject:   [[json  objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"medicalname"]];
                        
                        
                        
                        [array_Medical_Type addObject:   [[json objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"medicaltype"]];
                        
                        
                        
                        [array_Medical_Provider addObject:   [[json objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"provider"]];
                        
                        
                        
                        [array_Medical_Time addObject:   [[json objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"timestamp"]];
                        
                        
                        
                        [array_Medical_HospitalName addObject:   [[json objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"hospital"]];
                        
                        
                        
                        [array_Medical_Notes addObject:   [[json objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"notes"]];
                        
                        
                        
                        
                        
                        [array_Medical_Consultant addObject:   [[json objectForKey:[appointmentSectionTitles_Medical objectAtIndex:i]]valueForKey:@"consultantname"]];
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"Appopintment Section Count is %d", [appointmentSectionTitles_Medical count]);
                    
                    
                    
                    NSLog(@"aaray_Medical_Name is %@",aaray_Medical_Name);
                    
                    
                    
                    
                    
                    
                    
                    for (int i = 0; i<[appointmentSectionTitles_Medical count]; i++)
                        
                        
                        
                        
                        
                        
                        
                    {
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[aaray_Medical_Name objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_aaray_Medical_Name addObject:[[aaray_Medical_Name objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [aaray_Medical_Name_Main addObject:[[aaray_Medical_Name objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_Medical_Type objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Medical_Type addObject:[[array_Medical_Type objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Medical_Type_Main addObject:[[array_Medical_Type objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_Medical_Time objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_Medical_Time addObject:[[array_Medical_Time objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Medical_Time_Main addObject:[[array_Medical_Time objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_Medical_Provider objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Medical_Provider addObject:[[array_Medical_Provider objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Medical_Provider_Main addObject:[[array_Medical_Provider objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_Medical_HospitalName objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Medical_HospitalName addObject:[[array_Medical_HospitalName objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Medical_HospitalName_Main addObject:[[array_Medical_HospitalName objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_Medical_Notes objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Medical_Notes addObject:[[array_Medical_Notes objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Medical_Notes_Main addObject:[[array_Medical_Notes objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_Medical_Consultant objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Medical_Consultant addObject:[[array_Medical_Consultant objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Medical_Consultant_Main addObject:[[array_Medical_Consultant objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"temp_aaray_Medical_Name is %@",temp_aaray_Medical_Name);
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"temp_array_Medical_Type %@",temp_array_Medical_Type);
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"temp_Medical_Time is %@",temp_Medical_Time);
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"temp_array_Medical_Type is %@",temp_array_Medical_Provider);
                    
                    
                    
                    
                    
                    
                    
                    // VIEW FOR SEARCH TABLE
                    
                    
                    
                    
                    
                    [ViewForSearchingofMedicalRecords removeFromSuperview];
                    
                    
                    
                    
                    
                    
                    
                    ViewForSearchingofMedicalRecords = nil;
                    
                    
                    
                    
                    
                    
                    
                    ViewForSearchingofMedicalRecords = [[UIView alloc]init];
                    
                    
                    
                    
                    
                    
                    
                    ViewForSearchingofMedicalRecords.frame = CGRectMake(0, 60, self.view.frame.size.width, 390);
                    
                    
                    
                    
                    
                    
                    
                    ViewForSearchingofMedicalRecords.backgroundColor=[UIColor yellowColor];
                    
                    
                    
                    
                    
                    
                    
                    ViewForSearchingofMedicalRecords.hidden = YES;
                    
                    
                    
                    
                    
                    
                    
                    [MedicalSubView addSubview:ViewForSearchingofMedicalRecords];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords = [[UITableView alloc]init];
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.frame=CGRectMake(0, 0, self.view.frame.size.width, 385);
                    
                    
                    
                    
                    
                    
                    
                    [SearchTableViewForMedicalRecords setDelegate:self];
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.dataSource=self;
                    
                    
                    
                    
                    
                    
                    
                    [SearchTableViewForMedicalRecords setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
                    
                    
                    
                    
                    
                    
                    
                    [SearchTableViewForMedicalRecords setSeparatorColor:[UIColor redColor]];
                    
                    
                    
                    
                    
                    
                    
                    [SearchTableViewForMedicalRecords setSeparatorInset:UIEdgeInsetsZero];
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.separatorStyle=UITableViewCellSeparatorStyleNone;
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.backgroundColor=[UIColor whiteColor];
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.showsVerticalScrollIndicator = NO;
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.hidden = NO;
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.alwaysBounceVertical = NO;
                    
                    
                    
                    
                    
                    
                    
                    SearchTableViewForMedicalRecords.tag = 9876;
                    
                    
                    
                    
                    
                    
                    
                    [ViewForSearchingofMedicalRecords addSubview:SearchTableViewForMedicalRecords];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    [self AddMedicalAppointmentsTableViewFunction];
                    
                    
                    
                    
                    
                    
                    
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



//-(void)APICallForUserMedicalAppointment
//
//{
//    
//    Reachability *reach = [Reachability reachabilityForInternetConnection];
//    
//    NetworkStatus netStatus = [reach currentReachabilityStatus];
//    
//    if (netStatus == NotReachable)
//        
//    {
//        
//        [self HideActivityIndicator];
//        
//        
//        
//        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        
//        [unable show];
//        
//    }
//    
//    else
//        
//    {
//        
//        
//        
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        
//        NSDictionary *params = @{
//                                 
//                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"]
//                                 
//                                 };
//        
//        
//        
//        NSLog(@"APICallForUserMedicalAppointment >>>>Parameter=>%@",params);
//        
//        
//        
//        [manager POST:[NSString stringWithFormat:@"%@/get_all_user_medical",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
//            
//            NSLog(@"APICallForUserMedicalAppointment >>>>JSON--->%@",json);
//            
//            if([json objectForKey:@"error"])
//                
//            {
//                
//                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                
//                [myAlertView show];
//                
//            }
//            
//            else
//                
//                
//                
//                if ([[json objectForKey:@"log"]isEqualToString:@"No medical yet!"])
//                    
//                {
//                    
//                    NSLog(@"Log --> User Appointment ==>> %@",[json objectForKey:@"log"]);
//                    
//                    
//                    
//                    DemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 80, [UIImage imageNamed:@"medecal_records_tuts.png"].size.width, [UIImage imageNamed:@"medecal_records_tuts.png"].size.height)];
//                    
//                    DemoImageView.image=[UIImage imageNamed:@"medecal_records_tuts.png"];
//                    
//                    [MedicalSubView addSubview:DemoImageView];
//                    
//                    
//                    
//                    [AddMedicalRerocdsTableView removeFromSuperview];
//                    
//                    AddMedicalRerocdsTableView=nil;
//                    
//                    MedicalSearchBar=nil;
//                    
//                }
//            
//                else
//                    
//                {
//                    
//                    
//                    
//                    medicalrecordsDictionary = nil;
//                    
//                    MedicalRecordstemp_appointmentsDictionary = nil;
//                    
//                    
//                    
//                    medicalrecordsDictionary = [[NSMutableDictionary alloc]init];
//                    
//                    MedicalRecordstemp_appointmentsDictionary = [[NSMutableDictionary alloc]init];
//                    
//                    medicalrecordsDictionary = json;
//                    
//                    MedicalRecordstemp_appointmentsDictionary = [json mutableCopy];
//                    
//                    
//                    
//                    
//                    NSArray *monthArray = [MedicalRecordstemp_appointmentsDictionary allKeys];
//                    NSMutableArray *monthMutableArray = [[NSMutableArray alloc]initWithArray:monthArray];
//                    NSMutableArray *jaaduArray = [[NSMutableArray alloc]init];
//                    
//                    
//                    for (int i=0; i<[[MedicalRecordstemp_appointmentsDictionary allKeys]count]; i++)
//                    {
//                        if ([[MedicalRecordstemp_appointmentsDictionary objectForKey:[monthMutableArray objectAtIndex:i]]count] > 0)
//                        {
//                            [jaaduArray addObject:[monthMutableArray objectAtIndex:i]];
//                        }
//                    }
//                    
//                    NSLog(@"jaaduArray is %@",jaaduArray);
//                    
//                    
//                    [appointmentSectionTitles removeAllObjects];
//                    [temp_appointmentSectionTitles removeAllObjects];
//                    
//                    appointmentSectionTitles = jaaduArray;
//                    temp_appointmentSectionTitles = jaaduArray;
//                    
//                    NSLog(@"appointmentSectionTitles is %@",temp_appointmentSectionTitles);
//                    
//                    
//                    
//                    
//                    //  [totalData removeAllObjects];
//                    
//                    // [dummyArray removeAllObjects];
//                    
//                    NSLog(@"All Keys of APpointments is %@",[medicalrecordsDictionary allKeys]);
//                    
//                    
//                    
//                    
//                    
//                    for (int i = 0; i<[appointmentSectionTitles count]; i++)
//                        
//                    {
//                        
//                        [totalData addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"medicalname"]];
//                        
//                        
//                        
//                    }
//                    
//                    NSLog(@"total Data is %@",totalData);
//                    
//                    
//                    
//                    
//                    
//                    
//                    
//                    for (int i = 0; i<[appointmentSectionTitles count]; i++)
//                        
//                    {
//                        
//                        for (int j=0; j<[[totalData objectAtIndex:i]count]; j++)
//                            
//                        {
//                            
//                            [dummyArray addObject:[[totalData objectAtIndex:i] objectAtIndex:j]];
//                            
//                        }
//                        
//                    }
//                    
//                    
//                    
//                    NSLog(@"dummy array is %@",dummyArray);
//                    
//                    
//                    
//                    [self AddMedicalAppointmentsTableViewFunction];
//                    
//                }
//            
//            
//            
//            [self HideActivityIndicator];
//            
//            
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
//         
//         {
//             
//             NSLog(@"Error: %@", error.description);
//             
//             [self HideActivityIndicator];
//             
//             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//             
//             [unable show];
//             
//         }];
//        
//        
//        
//    }
//    
//}


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
            
            NSLog(@"get_all_user_appointment JSON--->%@",json);
            
            if([json objectForKey:@"error"])
                
            {
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [myAlertView show];
                
            }
            
            else
                
                
                
                if ([[json objectForKey:@"log"]isEqualToString:@"No apointment yet!"])
                    
                {
                    
                    NSLog(@"Log --> User Appointment ==>> %@",[json objectForKey:@"log"]);
                    
                    
                    
                    AppointmentDemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 80, [UIImage imageNamed:@"Staticapponments_page.png"].size.width,[UIImage imageNamed:@"Staticapponments_page.png"].size.height)];
                    
                    AppointmentDemoImageView.image=[UIImage imageNamed:@"Staticapponments_page.png"];
                    
                    [AppointmentSubView addSubview:AppointmentDemoImageView];
                    
                    [SearchBar removeFromSuperview];
                    
                    [AddAppointmentTableView removeFromSuperview];
                    
                    AddAppointmentTableView=nil;
                    
                    SearchBar=nil;
                    
                }
            
                else
                    
                {
                    
                    
                    
                    appointmentsDictionary = nil;
                    
                    temp_appointmentsDictionary = nil;
                    
                    
                    
                    appointmentsDictionary = [[NSMutableDictionary alloc]init];
                    
                    temp_appointmentsDictionary = [[NSMutableDictionary alloc]init];
                    
                    appointmentsDictionary = json;
                    
                    temp_appointmentsDictionary = [json  mutableCopy];
                    
                    
                    
                    
                    
                    temp_sectionAppointments = nil;
                    
                    appointmentSectionTitles = nil;
                    
                    temp_sectionAppointments = [[NSMutableArray alloc]init];
                    
                    appointmentSectionTitles = [[NSMutableArray alloc]init];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    NSArray *monthArray = [appointmentsDictionary allKeys];
                    
                    NSMutableArray *monthMutableArray = [[NSMutableArray alloc]initWithArray:monthArray];
                    
                    NSMutableArray *jaaduArray = [[NSMutableArray alloc]init];
                    
                    
                    
                    
                    
                    for (int i=0; i<[[appointmentsDictionary allKeys]count]; i++)
                        
                    {
                        
                        if ([[appointmentsDictionary objectForKey:[monthMutableArray objectAtIndex:i]]count] > 0)
                            
                        {
                            
                            [jaaduArray addObject:[monthMutableArray objectAtIndex:i]];
                            
                        }
                        
                    }
                    
                    
                    
                    NSLog(@"jaaduArray is %@",jaaduArray);
                    
                    
                    
                    [appointmentSectionTitles removeAllObjects];
                    
                    [temp_appointmentSectionTitles removeAllObjects];
                    
                    
                    
                    appointmentSectionTitles = jaaduArray;
                    
                    temp_appointmentSectionTitles = jaaduArray;
                    
                    
                    
                    
                    
                    
                    
                    // *******************************************************************************//
                    
                    
                    
                    NSMutableArray *myArray = [[NSMutableArray alloc]initWithArray:temp_appointmentSectionTitles];
                    
                    [temp_appointmentSectionTitles removeAllObjects];
                    
                    
                    
                    NSString *startMonthName;
                    
                    NSString *temp;
                    
                    NSMutableArray *arrayNumber2 = [[NSMutableArray alloc]init];
                    
                    NSMutableArray *arrayNumber1 = [[NSMutableArray alloc]init];
                    
                    NSMutableDictionary *monthsDictionary = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"1",@"January",@"2",@"February",@"3",@"March",@"4",@"April",@"5",@"May",@"6",@"June",@"7",@"July",@"8",@"August",@"9",@"September",@"10",@"October",@"11",@"November",@"12",@"December", nil];
                    
                    
                    
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    
                    [dateFormatter setDateFormat:@"MMMM"];
                    
                    NSString *monthName = [dateFormatter stringFromDate:[NSDate date]];
                    
                    NSString *monthNumber = [monthsDictionary objectForKey:monthName];
                    
                    
                    
                    for (int i=0; i<[myArray count]; i++)
                        
                    {
                        
                        if ([monthNumber integerValue] > [[monthsDictionary objectForKey:[myArray objectAtIndex:i]]integerValue])
                            
                        {
                            
                            [arrayNumber2 addObject:[myArray objectAtIndex:i]];
                            
                        }
                        
                        else if ([monthNumber integerValue] < [[monthsDictionary objectForKey:[myArray objectAtIndex:i]]integerValue])
                            
                        {
                            
                            [arrayNumber1 addObject:[myArray objectAtIndex:i]];
                            
                        }
                        
                        else if ([monthNumber integerValue] == [[monthsDictionary objectForKey:[myArray objectAtIndex:i]]integerValue])
                            
                        {
                            
                            startMonthName = [myArray objectAtIndex:i];
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    if (arrayNumber1.count > 0)
                        
                    {
                        
                        for (int i = 0; i< [arrayNumber1 count]-1; i++)
                            
                        {
                            
                            for (int j = 1; j<[arrayNumber1 count]; j++)
                                
                            {
                                
                                if ([[monthsDictionary objectForKey:[arrayNumber1 objectAtIndex:i]]integerValue] > [[monthsDictionary objectForKey:[arrayNumber1 objectAtIndex:j]]integerValue])
                                    
                                {
                                    
                                    temp = [arrayNumber1 objectAtIndex:i];
                                    
                                    [arrayNumber1 replaceObjectAtIndex:i withObject:[arrayNumber1 objectAtIndex:j]];
                                    
                                    [arrayNumber1 replaceObjectAtIndex:j withObject:temp];
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    
                    if (arrayNumber2.count > 0)
                        
                    {
                        
                        for (int i = 0; i< [arrayNumber2 count]-1; i++)
                            
                        {
                            
                            for (int j = 1; j<[arrayNumber2 count]; j++)
                                
                            {
                                
                                if ([[monthsDictionary objectForKey:[arrayNumber2 objectAtIndex:i]]integerValue] > [[monthsDictionary objectForKey:[arrayNumber2 objectAtIndex:j]]integerValue])
                                    
                                {
                                    
                                    temp = [arrayNumber2 objectAtIndex:i];
                                    
                                    [arrayNumber2 replaceObjectAtIndex:i withObject:[arrayNumber2 objectAtIndex:j]];
                                    
                                    [arrayNumber2 replaceObjectAtIndex:j withObject:temp];
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    NSLog(@"arrayNumber2 is %@",arrayNumber2);
                    
                    
                    
                    
                    
                    if (![startMonthName length]==0)
                        
                    {
                        
                        [temp_appointmentSectionTitles insertObject:startMonthName atIndex:0];
                        
                    }
                    
                    
                    
                    [temp_appointmentSectionTitles addObjectsFromArray:arrayNumber1];
                    
                    [temp_appointmentSectionTitles addObjectsFromArray:arrayNumber2];
                    
                    
                    
                    NSLog(@"temp_appointmentSectionTitles final is %@",temp_appointmentSectionTitles);
                    
                    
                    
                    // *******************************************************************************//
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    [array_AppointmentName removeAllObjects];
                    
                    
                    
                    [array_AppointmentID removeAllObjects];
                    
                    
                    
                    [array_AppointmentTime removeAllObjects];
                    
                    
                    
                    [array_AppointmentType removeAllObjects];
                    
                    
                    
                    [array_ConsultantName removeAllObjects];
                    
                    
                    
                    [array_Hospital removeAllObjects];
                    
                    
                    
                    [array_Notes removeAllObjects];
                    
                    
                    
                    [array_Provider removeAllObjects];
                    
                    
                    
                    [array_TimeStamp removeAllObjects];
                    
                    
                    
                    
                    
                    
                    
                    [temp_array_AppointmentName removeAllObjects];
                    
                    
                    
                    [temp_array_AppointmentID removeAllObjects];
                    
                    
                    
                    [temp_array_AppointmentTime removeAllObjects];
                    
                    
                    
                    [temp_array_AppointmentType removeAllObjects];
                    
                    
                    
                    [temp_array_ConsultantName removeAllObjects];
                    
                    
                    
                    [temp_array_Hospital removeAllObjects];
                    
                    
                    
                    [temp_array_Notes removeAllObjects];
                    
                    
                    
                    [temp_array_Provider removeAllObjects];
                    
                    
                    
                    [temp_array_TimeStamp removeAllObjects];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    [array_AppointmentNam_Main removeAllObjects];
                    
                    
                    
                    [array_AppointmentID_Main removeAllObjects];
                    
                    
                    
                    [array_AppointmentTime_Main removeAllObjects];
                    
                    
                    
                    [array_AppointmentType_Main removeAllObjects];
                    
                    
                    
                    [array_ConsultantName_Main removeAllObjects];
                    
                    
                    
                    [array_Hospital_Main removeAllObjects];
                    
                    
                    
                    [array_Notes_Main removeAllObjects];
                    
                    
                    
                    [array_Provider_Main removeAllObjects];
                    
                    
                    
                    [array_TimeStamp_Main removeAllObjects];
                    
                    
                    
                    [array_Attachments_Main removeAllObjects];
                    
                    
                    
                    
                    
                    for (int i = 0; i<[appointmentSectionTitles count]; i++)
                        
                        
                        
                    {
                        
                        
                        
                        [array_AppointmentName addObject:   [[json  objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmentname"]];
                        
                        
                        
                        [array_AppointmentID addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmentid"]];
                        
                        
                        
                        [array_AppointmentTime addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmenttime"]];
                        
                        
                        
                        [array_AppointmentType addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmenttype"]];
                        
                        
                        
                        [array_ConsultantName addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"consultantname"]];
                        
                        
                        
                        [array_Hospital  addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"hospital"]];
                        
                        
                        
                        [array_Notes   addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"notes"]];
                        
                        
                        
                        [array_Provider  addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"provider"]];
                        
                        
                        
                        [array_TimeStamp  addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"timestamp"]];
                        
                        
                        
                        //[array_Attachemtns  addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"timestamp"]];
                        
                        
                        
                    }
                    
                    
                    
                    for (int i = 0; i<[appointmentSectionTitles count]; i++)
                        
                        
                        
                    {
                        
                        
                        
                        for (int j=0; j<[[array_AppointmentName objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_AppointmentName addObject:[[array_AppointmentName objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_AppointmentNam_Main addObject:[[array_AppointmentName objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_AppointmentID objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_AppointmentID addObject:[[array_AppointmentID objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_AppointmentID_Main addObject:[[array_AppointmentID objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_AppointmentTime objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_AppointmentTime addObject:[[array_AppointmentTime objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_AppointmentTime_Main addObject:[[array_AppointmentTime objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_AppointmentType objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_AppointmentType addObject:[[array_AppointmentType objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_AppointmentType_Main addObject:[[array_AppointmentType objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_ConsultantName objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_ConsultantName addObject:[[array_ConsultantName objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_ConsultantName_Main addObject:[[array_ConsultantName objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_Hospital objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Hospital addObject:[[array_Hospital objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Hospital_Main addObject:[[array_Hospital objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_Notes objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Notes addObject:[[array_Notes objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Notes_Main addObject:[[array_Notes objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_Provider objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_Provider addObject:[[array_Provider objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_Provider_Main addObject:[[array_Provider objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        for (int j=0; j<[[array_TimeStamp objectAtIndex:i]count]; j++)
                            
                            
                            
                        {
                            
                            
                            
                            [temp_array_TimeStamp addObject:[[array_TimeStamp objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                            [array_TimeStamp_Main addObject:[[array_TimeStamp objectAtIndex:i] objectAtIndex:j]];
                            
                            
                            
                        }
                        
                        
                        
                        //                        for (int j=0; j<[[array_Attachemtns objectAtIndex:i]count]; j++)
                        
                        //                            
                        
                        //                        {
                        
                        //                            
                        
                        //                            [temp_array_Attachments addObject:[[array_Attachemtns objectAtIndex:i] objectAtIndex:j]];
                        
                        //                            
                        
                        //                            [array_Attachments_Main addObject:[[array_Attachemtns objectAtIndex:i] objectAtIndex:j]];
                        
                        //                            
                        
                        //                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    NSLog(@"temp_array_AppointmentName is %@",array_AppointmentNam_Main);
                    
                    
                    
                    NSLog(@"temp_array_AppointmentID %@",array_AppointmentID_Main);
                    
                    
                    
                    NSLog(@"temp_array_AppointmentTime is %@",array_AppointmentTime_Main);
                    
                    
                    
                    NSLog(@"temp_array_AppointmentType is %@",array_AppointmentType_Main);
                    
                    
                    
                    NSLog(@"temp_array_ConsultantName is %@",array_ConsultantName_Main);
                    
                    
                    
                    NSLog(@"temp_array_Hospital is %@",array_Hospital_Main);
                    
                    
                    
                    NSLog(@"temp_array_Notes is %@",array_Notes_Main);
                    
                    
                    
                    NSLog(@"temp_array_Provider is %@",array_Provider_Main);
                    
                    
                    
                    NSLog(@"temp_array_TimeStamp is %@",array_TimeStamp_Main);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    // VIEW FOR SEARCH TABLE
                    
                    
                    
                    
                    
                    
                    
                    [ViewForSearching removeFromSuperview];
                    
                    
                    
                    ViewForSearching = nil;
                    
                    
                    
                    ViewForSearching = [[UIView alloc]init];
                    
                    
                    
                    ViewForSearching.frame = CGRectMake(0, 60, self.view.frame.size.width, 390);
                    
                    
                    
                    ViewForSearching.backgroundColor=[UIColor yellowColor];
                    
                    
                    
                    ViewForSearching.hidden = YES;
                    
                    
                    
                    [AppointmentSubView addSubview:ViewForSearching];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    SearchTableView = [[UITableView alloc]init];
                    
                    
                    
                    SearchTableView.frame=CGRectMake(0, 0, self.view.frame.size.width, 385);
                    
                    
                    
                    [SearchTableView setDelegate:self];
                    
                    
                    
                    SearchTableView.dataSource=self;
                    
                    
                    
                    [SearchTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
                    
                    
                    
                    [SearchTableView setSeparatorColor:[UIColor redColor]];
                    
                    
                    
                    [SearchTableView setSeparatorInset:UIEdgeInsetsZero];
                    
                    
                    
                    SearchTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
                    
                    
                    
                    SearchTableView.backgroundColor=[UIColor whiteColor];
                    
                    
                    
                    SearchTableView.showsVerticalScrollIndicator = NO;
                    
                    
                    
                    SearchTableView.hidden = NO;
                    
                    
                    
                    SearchTableView.alwaysBounceVertical = NO;
                    
                    
                    
                    SearchTableView.tag = 4949;
                    
                    
                    
                    [ViewForSearching addSubview:SearchTableView];
                    
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

#pragma mark SEARCH TABLE

-(void) searchViewForTable

{
    
    ViewForSearching.hidden=NO;
    
    
    
}
-(IBAction)setIdJaaliViewFromServerofMedicalRecords:(id)sender
{
    
    NSLog(@"medicalrecordsDictionary=%@",medicalrecordsDictionary);
    [[NSUserDefaults standardUserDefaults] setInteger:[sender tag]forKey:@"MedicalIdGetValue"];
    NSLog(@"AppointmentIdGetValue=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"MedicalIdGetValue"]);
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditMedicalPressed"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"TapFlagVriable"];
    
   [[NSUserDefaults standardUserDefaults] setValue:[temp_aaray_Medical_Name objectAtIndex:[sender tag]] forKey:kMedicalRecordeNameString];
    
//                    [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"medicalname"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameString];
    
                   // [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"consultantname"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameConsultantString];
                    
    
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Medical_Consultant objectAtIndex:[sender tag]] forKey:kMedicalRecordeNameConsultantString];
    
                    
                    NSArray *dateSplitArray = [[temp_Medical_Time objectAtIndex:[sender tag]] componentsSeparatedByString:@"T"];
                    NSString *date=[dateSplitArray objectAtIndex:0];
                    NSString *dateTime=[dateSplitArray objectAtIndex:1];
                    
                    
                    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
                    NSString *date2=[dateSplitArray2 objectAtIndex:1];
                    NSString *date3=[dateSplitArray2 objectAtIndex:2];
                    NSString *date4=[dateSplitArray2 objectAtIndex:0];
                    
                    NSLog(@"date2=%@",date2);
                    NSLog(@"date3=%@",date3);
                    NSLog(@"date4=%@",date4);
                    
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
                    
                    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
                    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
                    
                    
                    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kMedicalRecordeNameDate];
                    
            //[[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"hospital"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameHospital];
    
    
     [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Medical_HospitalName objectAtIndex:[sender tag]] forKey:kMedicalRecordeNameHospital];
    
      [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Medical_Type objectAtIndex:[sender tag]] forKey:kMedicalRecordeNameTypeName];
    
    
     [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Medical_Provider objectAtIndex:[sender tag]] forKey:kMedicalRecordeNameProviderName];
    
    
     [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Medical_Notes objectAtIndex:[sender tag]] forKey:kMedicalRecordsNotes];
    
                    
                  //  [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"provider"] objectAtIndex:k] forKeyPath:kMedicalRecordeNameProviderName];
                    
                 //   [[NSUserDefaults standardUserDefaults]setValue:[[[medicalrecordsDictionary valueForKey:keysV] valueForKey:@"notes"] objectAtIndex:k] forKeyPath:kMedicalRecordsNotes];
                    
                    
                    
                    
                    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
                    [self.navigationController pushViewController:createnewAppointment animated:YES];
    

    
}
-(IBAction)setIdJaaliViewFromServer:(id)sender{
    

    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"TapFlagVriable"];
    [[NSUserDefaults standardUserDefaults] setInteger:[sender tag]forKey:@"AppointmentIdGetValue"];
    NSLog(@"AppointmentIdGetValue=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"AppointmentIdGetValue"]);
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditAppointmentPressed"];
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_AppointmentName objectAtIndex:[sender tag]] forKey:kAppointmentmentNameString];
    
    
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_ConsultantName objectAtIndex:[sender tag]] forKey:kAppointmentmentNameConsultantString];
    
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Hospital objectAtIndex:[sender tag]] forKey:kAppointmentmentNameHospital];
    
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_AppointmentType objectAtIndex:[sender tag]] forKey:kAppointmentmentNameTypeName];
    
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Provider objectAtIndex:[sender tag]] forKey:kAppointmentmentNameProviderName];
    
    
    
    NSArray *dateSplitArray = [[temp_array_AppointmentTime objectAtIndex:[sender tag]] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    NSString *date4=[dateSplitArray2 objectAtIndex:0];
    
    NSLog(@"date2=%@",date2);
    NSLog(@"date3=%@",date3);
    NSLog(@"date4=%@",date4);
    
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
    
    NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
    
    
     [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Provider objectAtIndex:[sender tag]] forKey:kAppointmentmentNameProviderName];
    
    
    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kAppointmentmentNameDate];
    
    
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Notes objectAtIndex:[sender tag]] forKey:kAppointmentmentNotes];
    
    
    
    
//    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Provider objectAtIndex:[sender tag]] forKey:kAppointmentmentNameProviderName];
//    
//    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"notes"] objectAtIndex:k] forKeyPath:kAppointmentmentNotes];
//    
//    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"attachment"] objectAtIndex:k] forKeyPath:kAppointmentmentAttachmentString];
    
    
    EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
    [self.navigationController pushViewController:createnewAppointment animated:YES];
    
    
  //  [[NSUserDefaults standardUserDefaults] setValue:[temp_array_ConsultantName objectAtIndex:[sender tag]] forKey:kAppointmentmentNameConsultantString];
    
    
       // NSString *value
        NSLog(@"kAppointmentmentNameHospital=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameHospital]);
}
-(void)loginWithAccessToken
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
        
        [manager POST:[NSString stringWithFormat:@"%@/login_through_accesstoken",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
         
         {
             NSLog(@"JSON--->%@",json);
             if([json objectForKey:@"error"])
             {
                 UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                 [myAlertView show];
             }
             else
             {
                 
                 [[NSUserDefaults standardUserDefaults] setObject:json forKey:kLoginData];
                 [[NSUserDefaults standardUserDefaults] synchronize];
                 
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]==1)
    {
                     [self NewUpdateView :0];
                 }
                 else
                 if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"upcomingappointments"] count]>=2)
                 {
                     [self NewUpdateView :0];
                     [self SecondUpdateFunciton :1];
                 }
                 
                 
                 if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] count]==1){
                     [self NewRecentUpdateView :0];
                 }
                 else
                     if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"recentupdates"] count]>=2)
                     {
                         [self NewRecentUpdateView :0];
                         [self SecondRecentUpdateFunciton :1];
                     }
                 
                 
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

- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar



{
    
    if(searchBar.tag==12345)
        
    {
        
        [SearchBar setShowsCancelButton:YES animated:YES];
        
        
        
        
        
        tableViewForMainTable.hidden = YES;
        
        [self searchViewForTable];
        
    }
    
    else if (searchBar.tag == 777)
        
    {
        
        [MedicalSearchBar setShowsCancelButton:YES animated:YES];
        
        tableViewForMainTableofMedicalRecords.hidden = YES;
        
        [self searchViewForMedicalTable];
        
    }
    
    else
        
    {
        
        [MedicalSearchBar setShowsCancelButton:YES animated:YES];
        
    }
    
    
    
    
    
    
    
}
-(void) searchViewForMedicalTable
{
    ViewForSearchingofMedicalRecords.hidden = NO;
    
}





- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar



{
    
    if(searchBar.tag==12345)
        
    {
        
        [SearchBar resignFirstResponder];
        
        SearchBar.showsCancelButton = NO;
        
        tableViewForMainTable.hidden = NO;
        
        ViewForSearching.hidden = YES;
        
    }
    
    else if (searchBar.tag == 777)
        
    {
        
        [MedicalSearchBar resignFirstResponder];
        
        MedicalSearchBar.showsCancelButton = NO;
        
        tableViewForMainTableofMedicalRecords.hidden = NO;
        
        ViewForSearchingofMedicalRecords.hidden = YES;
        
    }
    
    else
        
    {
        
        [MedicalSearchBar resignFirstResponder];
        
        MedicalSearchBar.showsCancelButton = NO;
        
    }
    
}







-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar

{
    
    [searchBar resignFirstResponder];
    
}








-(void)searchBar:(UISearchBar *)searchBar1 textDidChange:(NSString *)searchText



{
    
    if(searchBar1.tag==12345)
        
    {
        
        if ([searchText length]==0)
            
            
            
        {
            
            
            
            tableViewForMainTable.hidden = NO;
            
            
            
            ViewForSearching.hidden = YES;
            
            
            
            temp_array_AppointmentName =[array_AppointmentNam_Main mutableCopy];
            
            
            
            temp_array_AppointmentID = [array_AppointmentID_Main mutableCopy];
            
            
            
            temp_array_AppointmentTime = [array_AppointmentTime_Main mutableCopy];
            
            
            
            temp_array_AppointmentType = [array_AppointmentType_Main mutableCopy];
            
            
            
            temp_array_ConsultantName = [array_ConsultantName_Main mutableCopy];
            
            
            
            temp_array_Hospital = [array_Hospital_Main mutableCopy];
            
            
            
            temp_array_Notes = [array_Notes_Main mutableCopy];
            
            
            
            temp_array_Provider = [array_Provider_Main mutableCopy];
            
            
            
            temp_array_TimeStamp = [array_TimeStamp_Main mutableCopy];
            
            
            
        }
    
        else
            
        {
            
            
            tableViewForMainTable.hidden = YES;
    
            [self searchViewForTable];
            
            
            
            
            
            [temp_array_AppointmentName removeAllObjects];
            
            
            
            [temp_array_AppointmentID removeAllObjects];
            
            
            
            [temp_array_AppointmentTime removeAllObjects];
            
            
            
            [temp_array_AppointmentType removeAllObjects];
            
            
            
            [temp_array_ConsultantName removeAllObjects];
            
            
            
            [temp_array_Hospital removeAllObjects];
            
            
            
            [temp_array_Notes removeAllObjects];
            
            
            
            [temp_array_Provider removeAllObjects];
            
            
            
            [temp_array_TimeStamp removeAllObjects];
            
            
            
            int g = 0;
            
            for (int i=0; i< array_AppointmentNam_Main.count;i++)
                
            {
                
                NSRange appointmentNameRange = [[array_AppointmentNam_Main objectAtIndex:i] rangeOfString:searchText options:NSCaseInsensitiveSearch];
                
                NSRange appointmentTypeRange = [[array_AppointmentType_Main objectAtIndex:i] rangeOfString:searchText options:NSCaseInsensitiveSearch];
                
                NSRange ProviderRange = [[array_Provider_Main objectAtIndex:i] rangeOfString:searchText options:NSCaseInsensitiveSearch];
                
                if (appointmentNameRange.location != NSNotFound ||  appointmentTypeRange.location != NSNotFound ||  ProviderRange.location != NSNotFound )
                    
                {
                    
                    [temp_array_AppointmentName addObject:[array_AppointmentNam_Main objectAtIndex:g]];
                    
                    [temp_array_AppointmentID addObject:[array_AppointmentID_Main objectAtIndex:g]];
                    
                    [temp_array_AppointmentTime addObject:[array_AppointmentTime_Main objectAtIndex:g]];
                    
                    [temp_array_AppointmentType addObject:[array_AppointmentType_Main objectAtIndex:g]];
                    
                    [temp_array_ConsultantName addObject:[array_ConsultantName_Main objectAtIndex:g]];
                    
                    [temp_array_Hospital addObject:[array_Hospital_Main objectAtIndex:g]];
                    
                    [temp_array_Notes addObject:[array_Notes_Main objectAtIndex:g]];
                    
                    [temp_array_Provider addObject:[array_Provider_Main objectAtIndex:g]];
                    
                    [temp_array_TimeStamp addObject:[array_TimeStamp_Main objectAtIndex:g]];
                    
                }
                
                g++;
                
            }
        }
        
        [SearchTableView reloadData];
        
    }
    
    
    
    else if (searchBar1.tag == 777)
        
    {
        
        if ([searchText length]==0)
            
            
            
        {
            
            tableViewForMainTableofMedicalRecords.hidden = NO;
            
            ViewForSearchingofMedicalRecords.hidden = YES;
            
            
            
            temp_Medical_Time =[array_Medical_Time_Main mutableCopy];
            
            temp_aaray_Medical_Name = [aaray_Medical_Name_Main mutableCopy];
            
            temp_array_Medical_Type = [array_Medical_Type_Main mutableCopy];
            
            temp_array_Medical_Provider = [array_Medical_Provider_Main mutableCopy];
            
           temp_array_Medical_HospitalName= [array_Medical_HospitalName_Main mutableCopy];
            
          
            
            
            
            
            
        }
        
        else
            
        {
            
            tableViewForMainTableofMedicalRecords.hidden = YES;
            
            
            
            [self searchViewForMedicalTable];
            
            
            
            
            
            
            
            [temp_Medical_Time removeAllObjects];
            
            [temp_aaray_Medical_Name removeAllObjects];
            
            [temp_array_Medical_Type removeAllObjects];
            
            [temp_array_Medical_Provider removeAllObjects];
            
            [temp_array_Medical_HospitalName removeAllObjects];
            
            [temp_array_Medical_Notes removeAllObjects];
            
            [temp_array_Medical_Consultant removeAllObjects];
            
            
            int g = 0;
            
            
            
            
            
            
            
            NSLog(@"array_AppointmentName is %@",aaray_Medical_Name_Main);
            
            
            
            for (NSString *string in aaray_Medical_Name_Main)
                
            {
                
                
                
                NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
                
                
                
                if (r.location != NSNotFound)
                    
                {
                    
                    
                    
                    [temp_Medical_Time addObject:[array_AppointmentTime_Main objectAtIndex:g]];
                    
                    [temp_aaray_Medical_Name addObject:[aaray_Medical_Name_Main objectAtIndex:g]];
                    
                    [temp_array_Medical_Type addObject:[array_Medical_Type_Main objectAtIndex:g]];
                    
                    [temp_array_Medical_Provider addObject:[array_Medical_Provider_Main objectAtIndex:g]];
                    
                    [temp_array_Medical_HospitalName addObject:[array_Medical_HospitalName_Main objectAtIndex:g]];
                    
                    
                    [temp_array_Medical_Notes addObject:[array_Medical_Notes_Main objectAtIndex:g]];
                    
                    
                    [temp_array_Medical_Consultant addObject:[array_Medical_Consultant_Main objectAtIndex:g]];
                    
                    
                    
                    
                  

                   
                }
                
                g++;
                
            }
            
            
            
        }
        
        
        [SearchTableViewForMedicalRecords reloadData];
    }
    
    
    
    
    
    else
        
    {
        
        
        
    }
    
    
}
#pragma mark UserAppointment API
-(void)APICallForUserAppointmentSortApi
{
   
                    appointmentsDictionary = nil;
                    temp_appointmentsDictionary = nil;
                    
                    appointmentsDictionary = [[NSMutableDictionary alloc]init];
                    temp_appointmentsDictionary = [[NSMutableDictionary alloc]init];
                    appointmentsDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow];
                    temp_appointmentsDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow]  mutableCopy];
                    
                    
                    temp_sectionAppointments = nil;
                    appointmentSectionTitles = nil;
                    temp_sectionAppointments = [[NSMutableArray alloc]init];
                    appointmentSectionTitles = [[NSMutableArray alloc]init];
                    
                    
                    
                    
                    

                    
                    NSArray *monthArray = [appointmentsDictionary allKeys];
                    NSMutableArray *monthMutableArray = [[NSMutableArray alloc]initWithArray:monthArray];
                    NSMutableArray *jaaduArray = [[NSMutableArray alloc]init];
                    
                    
                    for (int i=0; i<[[appointmentsDictionary allKeys]count]; i++)
                    {
                        if ([[appointmentsDictionary objectForKey:[monthMutableArray objectAtIndex:i]]count] > 0)
                        {
                            [jaaduArray addObject:[monthMutableArray objectAtIndex:i]];
                        }
                    }
                    
                    NSLog(@"jaaduArray is %@",jaaduArray);
                    
                    
                    [appointmentSectionTitles removeAllObjects];
                    [temp_appointmentSectionTitles removeAllObjects];
                    
                    appointmentSectionTitles = jaaduArray;
                    temp_appointmentSectionTitles = jaaduArray;
                    
                    NSLog(@"appointmentSectionTitles is %@",temp_appointmentSectionTitles);
                    
                    [array_AppointmentName removeAllObjects];
                    
                    [array_AppointmentID removeAllObjects];
                    
                    [array_AppointmentTime removeAllObjects];
                    
                    [array_AppointmentType removeAllObjects];
                    
                    [array_ConsultantName removeAllObjects];
                    
                    [array_Hospital removeAllObjects];
                    
                    [array_Notes removeAllObjects];
                    
                    [array_Provider removeAllObjects];
                    
                    [array_TimeStamp removeAllObjects];
                    
                    
                    
                    [temp_array_AppointmentName removeAllObjects];
                    
                    [temp_array_AppointmentID removeAllObjects];
                    
                    [temp_array_AppointmentTime removeAllObjects];
                    
                    [temp_array_AppointmentType removeAllObjects];
                    
                    [temp_array_ConsultantName removeAllObjects];
                    
                    [temp_array_Hospital removeAllObjects];
                    
                    [temp_array_Notes removeAllObjects];
                    
                    [temp_array_Provider removeAllObjects];
                    
                    [temp_array_TimeStamp removeAllObjects];
                    
                    
                    
                    
                    
                    [array_AppointmentNam_Main removeAllObjects];
                    
                    [array_AppointmentID_Main removeAllObjects];
                    
                    [array_AppointmentTime_Main removeAllObjects];
                    
                    [array_AppointmentType_Main removeAllObjects];
                    
                    [array_ConsultantName_Main removeAllObjects];
                    
                    [array_Hospital_Main removeAllObjects];
                    
                    [array_Notes_Main removeAllObjects];
                    
                    [array_Provider_Main removeAllObjects];
                    
                    [array_TimeStamp_Main removeAllObjects];
                    
                    [array_Attachments_Main removeAllObjects];
                    
                    
                    for (int i = 0; i<[appointmentSectionTitles count]; i++)
                        
                    {
                        
                        [array_AppointmentName addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow]  objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmentname"]];
                        
                        [array_AppointmentID addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmentid"]];
                        
                        [array_AppointmentTime addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmenttime"]];
                        
                        [array_AppointmentType addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"appointmenttype"]];
                        
                        [array_ConsultantName addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"consultantname"]];
                        
                        [array_Hospital  addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"hospital"]];
                        
                        [array_Notes   addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"notes"]];
                        
                        [array_Provider  addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"provider"]];
                        
                        [array_TimeStamp  addObject:   [[[[NSUserDefaults standardUserDefaults] objectForKey:kSortDataShow] objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"timestamp"]];
                        
                        //[array_Attachemtns  addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"timestamp"]];
                        
                    }
                    
                    for (int i = 0; i<[appointmentSectionTitles count]; i++)
                        
                    {
                        
                        for (int j=0; j<[[array_AppointmentName objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_AppointmentName addObject:[[array_AppointmentName objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_AppointmentNam_Main addObject:[[array_AppointmentName objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_AppointmentID objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_AppointmentID addObject:[[array_AppointmentID objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_AppointmentID_Main addObject:[[array_AppointmentID objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_AppointmentTime objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_AppointmentTime addObject:[[array_AppointmentTime objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_AppointmentTime_Main addObject:[[array_AppointmentTime objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_AppointmentType objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_AppointmentType addObject:[[array_AppointmentType objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_AppointmentType_Main addObject:[[array_AppointmentType objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_ConsultantName objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_ConsultantName addObject:[[array_ConsultantName objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_ConsultantName_Main addObject:[[array_ConsultantName objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_Hospital objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_Hospital addObject:[[array_Hospital objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_Hospital_Main addObject:[[array_Hospital objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_Notes objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_Notes addObject:[[array_Notes objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_Notes_Main addObject:[[array_Notes objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_Provider objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_Provider addObject:[[array_Provider objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_Provider_Main addObject:[[array_Provider objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        
                        
                        for (int j=0; j<[[array_TimeStamp objectAtIndex:i]count]; j++)
                            
                        {
                            
                            [temp_array_TimeStamp addObject:[[array_TimeStamp objectAtIndex:i] objectAtIndex:j]];
                            
                            [array_TimeStamp_Main addObject:[[array_TimeStamp objectAtIndex:i] objectAtIndex:j]];
                            
                        }
                        
                        //                        for (int j=0; j<[[array_Attachemtns objectAtIndex:i]count]; j++)
                        //
                        //                        {
                        //
                        //                            [temp_array_Attachments addObject:[[array_Attachemtns objectAtIndex:i] objectAtIndex:j]];
                        //
                        //                            [array_Attachments_Main addObject:[[array_Attachemtns objectAtIndex:i] objectAtIndex:j]];
                        //
                        //                        }
                        
                        
                        
                    }
                    
                    
                    
                    NSLog(@"temp_array_AppointmentName is %@",array_AppointmentNam_Main);
                    
                    NSLog(@"temp_array_AppointmentID %@",array_AppointmentID_Main);
                    
                    NSLog(@"temp_array_AppointmentTime is %@",array_AppointmentTime_Main);
                    
                    NSLog(@"temp_array_AppointmentType is %@",array_AppointmentType_Main);
                    
                    NSLog(@"temp_array_ConsultantName is %@",array_ConsultantName_Main);
                    
                    NSLog(@"temp_array_Hospital is %@",array_Hospital_Main);
                    
                    NSLog(@"temp_array_Notes is %@",array_Notes_Main);
                    
                    NSLog(@"temp_array_Provider is %@",array_Provider_Main);
                    
                    NSLog(@"temp_array_TimeStamp is %@",array_TimeStamp_Main);
                    
                    
                    
                    
                    
                    
                    
                    // VIEW FOR SEARCH TABLE
                    
                    
                    
                    [ViewForSearching removeFromSuperview];
                    
                    ViewForSearching = nil;
                    
                    ViewForSearching = [[UIView alloc]init];
                    
                    ViewForSearching.frame = CGRectMake(0, 60, self.view.frame.size.width, 390);
                    
                    ViewForSearching.backgroundColor=[UIColor yellowColor];
                    
                    ViewForSearching.hidden = YES;
                    
                    [AppointmentSubView addSubview:ViewForSearching];
                    
                    
                    
                    
                    
                    SearchTableView = [[UITableView alloc]init];
                    
                    SearchTableView.frame=CGRectMake(0, 0, self.view.frame.size.width, 385);
                    
                    [SearchTableView setDelegate:self];
                    
                    SearchTableView.dataSource=self;
                    
                    [SearchTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
                    
                    [SearchTableView setSeparatorColor:[UIColor redColor]];
                    
                    [SearchTableView setSeparatorInset:UIEdgeInsetsZero];
                    
                    SearchTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
                    
                    SearchTableView.backgroundColor=[UIColor whiteColor];
                    
                    SearchTableView.showsVerticalScrollIndicator = NO;
                    
                    SearchTableView.hidden = NO;
                    
                    SearchTableView.alwaysBounceVertical = NO;
                    
                    SearchTableView.tag = 4949;
                    
                    [ViewForSearching addSubview:SearchTableView];
                    [self AddAppointmentTableViewFunction];
    [self HideActivityIndicator];
    // CREATING TABLE
}


@end
