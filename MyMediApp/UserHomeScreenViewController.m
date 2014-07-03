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
    UIScrollView *ScrollerView;
    UIPageControl *pageControl;
    AsyncImageView *EditChangeImage;
    NSString *urlString2;
    UIButton *HomeButton;
    UIButton *MedicalRecordButton;
    UIButton *AppointmentButton;
    UIButton *MapButton;
    UIButton *SlidMenuButton;
    UIView *TopBarView;
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
    UIImage *selectBarImage;
    
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
     UIImageView *BackGroundImageView;
    
    
    //appointments elements
    UIView *AppointmentTopBarView;
    UIButton *AppointmentSortButton;
    UIButton *AppointmentSearchButton;
    UIImageView *AppointmentDemoImageView;
    UIButton *CreateNewAppointmentsButton;
    UIImageView *AppointmentBackGroundImageView;
    
    
    //Map Elements
    UIView *MapTopBarView;

    int BottomNavigationButtonFlag;
    int SliderBarViewSatus;
    
    
    UIScrollView *UserGuideScrollView;
    
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

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
   
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
    
    
       TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,120)];
       TopBarView.backgroundColor=[UIColor whiteColor];
       TopBarView.userInteractionEnabled=TRUE;
    
        EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(20, 30, 80, 80)];
        urlString2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"image_url"];
        EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
        EditChangeImage.image=[UIImage imageNamed:@"ProfileImage.jpeg"];
        EditChangeImage.backgroundColor=[UIColor clearColor];
        EditChangeImage.layer.masksToBounds = YES;
        EditChangeImage.layer.borderWidth = 1;
        EditChangeImage.layer.borderColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
        EditChangeImage.userInteractionEnabled=YES;
        [[EditChangeImage layer]setCornerRadius:25];
    
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(changeImage:)];
        [tap setNumberOfTouchesRequired:1];
        [EditChangeImage addGestureRecognizer:tap];
        [TopBarView addSubview:EditChangeImage];
    
        UILabel *NameLable=[[UILabel alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+20, 45, 120, 20)];
        NameLable.text=@"Paul Buckley";
        NameLable.backgroundColor=[UIColor clearColor];
        NameLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:17];
        NameLable.textAlignment=NSTextAlignmentLeft;
        NameLable.textColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    
    
        UIView*lineView=[[UIView alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+20,NameLable.frame.origin.y+25,110,1)];
        lineView.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
        lineView.layer.borderWidth = 1.0f;
        [TopBarView addSubview:lineView];
    
    
        UILabel *SubTitleLable=[[UILabel alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+20, lineView.frame.size.height+lineView.frame.origin.y+5, 120, 20)];
        SubTitleLable.text=@"229 Victoria Park Rd London United Kingdom";
        SubTitleLable.backgroundColor=[UIColor clearColor];
         SubTitleLable.font=[UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:11];
        SubTitleLable.numberOfLines=2;
        [SubTitleLable sizeToFit];
        SubTitleLable.textColor=[UIColor colorWithRed:35/255.0 green:39/255.0 blue:40/255.0 alpha:1.0];
        SubTitleLable.textAlignment=NSTextAlignmentLeft;
        [TopBarView  addSubview:SubTitleLable];
        [TopBarView  addSubview:NameLable];
        [UserHomeGroundView addSubview:TopBarView];
    
        CenterView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, self.view.frame.size.width, 398)];
        CenterView.backgroundColor=[UIColor colorWithRed:161/255.0 green:207/255.0 blue:223/255.0 alpha:1.0];
    
        UIImage *EmergencyImage=[UIImage imageNamed:@"emergency.png"];
        UIButton *EmergencyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        EmergencyButton.frame = CGRectMake(0, 2, EmergencyImage.size.width, EmergencyImage.size.height);
        [EmergencyButton setImage:EmergencyImage forState:UIControlStateNormal];
        [EmergencyButton addTarget:self action:@selector(EmergencyButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [CenterView addSubview:EmergencyButton];
    
    
        UIImage *ShortCutImage=[UIImage imageNamed:@"shortcut.png"];
        UIButton *ShortCutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        ShortCutButton.frame = CGRectMake(EmergencyButton.frame.size.width+EmergencyButton.frame.origin.x+1, 2, ShortCutImage.size.width+2, ShortCutImage.size.height);
        [ShortCutButton setImage:ShortCutImage forState:UIControlStateNormal];
        [ShortCutButton setTitleColor:[UIColor clearColor] forState:(UIControlStateNormal)];
        [ShortCutButton addTarget:self action:@selector(shortCutsAction) forControlEvents:UIControlEventTouchUpInside];
        [CenterView addSubview:ShortCutButton];
    
        UIView *UpcommingView=[[UIView alloc]initWithFrame:CGRectMake(10, ShortCutButton.frame.size.height+ShortCutButton.frame.origin.y+20, 300, 121)];
        UpcommingView.backgroundColor=[UIColor grayColor];
        UpcommingView.userInteractionEnabled=TRUE;
    
        UIButton*UpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
        UpcommingButtonActionArrow.backgroundColor=[UIColor blackColor];
        [UpcommingButtonActionArrow addTarget:self action:@selector(UpcomingViewAction) forControlEvents:UIControlEventTouchUpInside];
        [UpcommingButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UpcommingButtonActionArrow.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
        UpcommingButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
        UpcommingButtonActionArrow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [UpcommingButtonActionArrow setTitle:@"UPCOMING APPOINTMENTS" forState:(UIControlState)UIControlStateNormal];
        [UpcommingButtonActionArrow setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [UpcommingButtonActionArrow setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        UpcommingButtonActionArrow.titleEdgeInsets = UIEdgeInsetsMake(5, 20, 0, 0);
    
        UIImage *arrow=[UIImage imageNamed:@"nextArrow.png"];
    
        UIButton*UpcommingButtonActionArrowNext=[[UIButton alloc]initWithFrame:CGRectMake(270, 0, arrow.size.width, arrow.size.height)];
        [UpcommingButtonActionArrowNext setImage:arrow forState:UIControlStateNormal];
        UpcommingButtonActionArrowNext.backgroundColor=[UIColor clearColor];
        [UpcommingButtonActionArrowNext addTarget:self action:@selector(UpcomingViewAction) forControlEvents:UIControlEventTouchUpInside];
        [UpcommingButtonActionArrow addSubview:UpcommingButtonActionArrowNext];
    
    
        UIButton*FirstUpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, UpcommingButtonActionArrow.frame.size.height+UpcommingButtonActionArrow.frame.origin.y, 300, 40)];
        FirstUpcommingButtonActionArrow.backgroundColor=[UIColor whiteColor];
        [FirstUpcommingButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
        [UpcommingView addSubview:FirstUpcommingButtonActionArrow];
    
        UIButton*SecondViewUpcommingButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, FirstUpcommingButtonActionArrow.frame.size.height+FirstUpcommingButtonActionArrow.frame.origin.y+1, 300, 40)];
        SecondViewUpcommingButtonActionArrow.backgroundColor=[UIColor whiteColor];
         [SecondViewUpcommingButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
        [UpcommingView addSubview:SecondViewUpcommingButtonActionArrow];
        [UpcommingView addSubview:UpcommingButtonActionArrow];
        [CenterView addSubview:UpcommingView];
    
    
        UIView *RecentView=[[UIView alloc]initWithFrame:CGRectMake(10, UpcommingView.frame.size.height+UpcommingView.frame.origin.y+20, 300, 160)];
        RecentView.backgroundColor=[UIColor grayColor];
    
        UIButton*RecentButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
        RecentButtonActionArrow.backgroundColor=[UIColor blackColor];
        [RecentButtonActionArrow addTarget:self action:@selector(RecentViewAction) forControlEvents:UIControlEventTouchUpInside];
        RecentButtonActionArrow.backgroundColor=[UIColor blackColor];
        [RecentButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        RecentButtonActionArrow.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
        RecentButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
        RecentButtonActionArrow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [RecentButtonActionArrow setTitle:@"RECENT UPDATES" forState:(UIControlState)UIControlStateNormal];
        [RecentButtonActionArrow setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [RecentButtonActionArrow setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        RecentButtonActionArrow.titleEdgeInsets = UIEdgeInsetsMake(5, 20, 0, 0);

    
        UIButton*RecentButtonActionArrowNext=[[UIButton alloc]initWithFrame:CGRectMake(270, 0, arrow.size.width, arrow.size.height)];
        [RecentButtonActionArrowNext setImage:arrow forState:UIControlStateNormal];
         RecentButtonActionArrowNext.backgroundColor=[UIColor clearColor];
         [RecentButtonActionArrowNext addTarget:self action:@selector(UpcomingViewAction) forControlEvents:UIControlEventTouchUpInside];
        [RecentButtonActionArrow addSubview:RecentButtonActionArrowNext];
    
        UIButton*FirstRecntButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, RecentButtonActionArrow.frame.size.height+RecentButtonActionArrow.frame.origin.y, 300, 40)];
        FirstRecntButtonActionArrow.backgroundColor=[UIColor whiteColor];
        [FirstRecntButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
       [RecentView addSubview:FirstRecntButtonActionArrow];
    
        UIButton*SecondViewRecentButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, FirstRecntButtonActionArrow.frame.size.height+FirstRecntButtonActionArrow.frame.origin.y+1, 300, 40)];
        SecondViewRecentButtonActionArrow.backgroundColor=[UIColor whiteColor];
         [SecondViewRecentButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
        [RecentView addSubview:SecondViewRecentButtonActionArrow];
    
        UIButton*ThirdRecentButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(0, SecondViewRecentButtonActionArrow.frame.size.height+SecondViewRecentButtonActionArrow.frame.origin.y+1, 300, 40)];
        ThirdRecentButtonActionArrow.backgroundColor=[UIColor whiteColor];
         [ThirdRecentButtonActionArrow setBackgroundImage:[UIImage imageNamed:@"sample_text.png"] forState:UIControlStateNormal];
        [RecentView addSubview:ThirdRecentButtonActionArrow];
        [RecentView addSubview:RecentButtonActionArrow];
    
        [CenterView addSubview:RecentView];
        [UserHomeGroundView addSubview:CenterView];
        [ScrollerView addSubview:UserHomeGroundView];
    
    
    #pragma mark MedicalHomeGroundView
    
     MedicalHomeGroundView=[[UIView alloc]initWithFrame:CGRectMake(UserHomeGroundView.frame.size.width+UserHomeGroundView.frame.origin.x, 0, self.view.frame.size.width, 518)];
     MedicalHomeGroundView.backgroundColor=[UIColor clearColor];
    
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,50)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;

    SortButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 15,50 ,30)];
    [SortButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   // [SortButton addTarget:self action:@selector(SortButtonAction)
    //     forControlEvents:UIControlEventTouchUpInside];
    //[SortButton addTarget:self action:@selector(SortActionNormal) forControlEvents:UIControlEventTouchDown];
    SortButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size: 12];
    SortButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [SortButton setTitle:@"Sort" forState:(UIControlState)UIControlStateNormal];
    SortButton.titleEdgeInsets = UIEdgeInsetsMake(0, 13, 0, 0);
    SortButton.backgroundColor=[UIColor clearColor];
    SortButton.layer.borderColor = [UIColor whiteColor].CGColor;
    SortButton.layer.borderWidth = 1.0f;
    SortButton.layer.cornerRadius = 3;
    SortButton.clipsToBounds = YES;
    [TopBarView addSubview:SortButton];
    
    UIView *lineViewMedical=[[UIView alloc]initWithFrame:CGRectMake(SortButton.frame.size.width+SortButton.frame.origin.x+10,15,1,30)];
    lineViewMedical.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineViewMedical.backgroundColor=[UIColor darkGrayColor];
    lineViewMedical.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineViewMedical];
    
    UIImage  *SearchButtonImage=[UIImage imageNamed:@"search_icon.png"];
    SearchButton=[[UIButton alloc]initWithFrame:CGRectMake(SortButton.frame.size.width+SortButton.frame.origin.y+15, 15,SearchButtonImage.size.width ,SearchButtonImage.size.height)];
    SearchButton.backgroundColor=[UIColor clearColor];
    [SearchButton setImage:SearchButtonImage forState:UIControlStateNormal];
    [TopBarView addSubview:SearchButton];
    

    UIView *lineView1=[[UIView alloc]initWithFrame:CGRectMake(265,15,1,30)];
    lineView1.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView1.backgroundColor=[UIColor darkGrayColor];
    lineView1.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView1];
    
    
    UIImage *CreateNewAppintmentImage=[UIImage imageNamed:@"CreateNewAppointment.png"];
    UIButton *LoginButtonHidden=[[UIButton alloc]initWithFrame:CGRectMake(265, 15, CreateNewAppintmentImage.size.width+10, CreateNewAppintmentImage.size.height+20)];
    LoginButtonHidden.backgroundColor=[UIColor clearColor];
    //[LoginButtonHidden addTarget:self action:@selector(CreateNewMedicalReport)
            //    forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:LoginButtonHidden];
    
    CreateNewMedicalButton=[[UIButton alloc]initWithFrame:CGRectMake(275, 15,CreateNewAppintmentImage.size.width ,CreateNewAppintmentImage.size.height)];
    CreateNewMedicalButton.backgroundColor=[UIColor clearColor];
    [CreateNewMedicalButton setImage:CreateNewAppintmentImage forState:UIControlStateNormal];
    //[CreateNewMedicalButton addTarget:self action:@selector(CreateNewMedicalReport) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:CreateNewMedicalButton];
    [MedicalHomeGroundView addSubview:TopBarView];
    
    
    UIImage *BackGroundImage=[UIImage imageNamed:@"Back_pattern.png"];
    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, 300, 428)];
    BackGroundImageView.backgroundColor=[UIColor clearColor];
    BackGroundImageView.image=BackGroundImage;
    BackGroundImageView.userInteractionEnabled=TRUE;
    
    [self setMaskTo:BackGroundImageView byRoundingCorners:UIRectCornerTopLeft];
    
    UIImage *DemoImage=[UIImage imageNamed:@"medecal_records_tuts.png"];
    DemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 50, DemoImage.size.width, DemoImage.size.height)];
    DemoImageView.image=DemoImage;
    [BackGroundImageView addSubview:DemoImageView];
    [MedicalHomeGroundView addSubview:BackGroundImageView];
    [ScrollerView addSubview:MedicalHomeGroundView];
    
    
    #pragma mark AppointmentGroudView
    
    AppointmentGroudView=[[UIView alloc]initWithFrame:CGRectMake(MedicalHomeGroundView.frame.size.width+MedicalHomeGroundView.frame.origin.x, 0, self.view.frame.size.width, 518)];
    AppointmentTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,50)];
    AppointmentTopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    AppointmentTopBarView.userInteractionEnabled=TRUE;
    
    AppointmentSortButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 15,50 ,30)];
    [AppointmentSortButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   // [SortButton addTarget:self action:@selector(SortButtonAction)
    //     forControlEvents:UIControlEventTouchUpInside];
   // [SortButton addTarget:self action:@selector(SortActionNormal) forControlEvents:UIControlEventTouchDown];
    AppointmentSortButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size: 12];
    AppointmentSortButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [AppointmentSortButton setTitle:@"Sort" forState:(UIControlState)UIControlStateNormal];
    AppointmentSortButton.titleEdgeInsets = UIEdgeInsetsMake(0, 13, 0, 0);
    AppointmentSortButton.backgroundColor=[UIColor clearColor];
    AppointmentSortButton.layer.borderColor = [UIColor whiteColor].CGColor;
    AppointmentSortButton.layer.borderWidth = 1.0f;
    AppointmentSortButton.layer.cornerRadius = 3;
    AppointmentSortButton.clipsToBounds = YES;
    [AppointmentTopBarView addSubview:AppointmentSortButton];
    
    UIView *lineView2=[[UIView alloc]initWithFrame:CGRectMake(AppointmentSortButton.frame.size.width+AppointmentSortButton.frame.origin.x+10,15,1,30)];
    lineView2.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView2.backgroundColor=[UIColor darkGrayColor];
    lineView2.layer.borderWidth = 1.0f;
    [AppointmentTopBarView addSubview:lineView2];
    
    AppointmentSearchButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentSortButton.frame.size.width+AppointmentSortButton.frame.origin.y+15, 15,SearchButtonImage.size.width ,SearchButtonImage.size.height)];
    AppointmentSearchButton.backgroundColor=[UIColor clearColor];
    [AppointmentSearchButton setImage:SearchButtonImage forState:UIControlStateNormal];
    [AppointmentTopBarView addSubview:AppointmentSearchButton];
    
    
    UIButton *LoginButtonHiddenAppointment=[[UIButton alloc]initWithFrame:CGRectMake(265, 20, CreateNewAppintmentImage.size.width+10, CreateNewAppintmentImage.size.height+20)];
    LoginButtonHiddenAppointment.backgroundColor=[UIColor clearColor];
    //[LoginButtonHiddenAppointment addTarget:self action:@selector(CreateNewAppointments)
              //  forControlEvents:UIControlEventTouchUpInside];
    [AppointmentTopBarView addSubview:LoginButtonHidden];
    
    
    CreateNewAppointmentsButton=[[UIButton alloc]initWithFrame:CGRectMake(275, 15,CreateNewAppintmentImage.size.width ,CreateNewAppintmentImage.size.height)];
    CreateNewAppointmentsButton.backgroundColor=[UIColor clearColor];
    [CreateNewAppointmentsButton setImage:CreateNewAppintmentImage forState:UIControlStateNormal];
    //  [CreateNewAppointmentsButton addTarget:self action:@selector(CreateNewAppointments) forControlEvents:UIControlEventTouchUpInside];
    [AppointmentTopBarView addSubview:CreateNewAppointmentsButton];
    
    
    UIView *lineView3=[[UIView alloc]initWithFrame:CGRectMake(265,15,1,30)];
    lineView3.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView3.backgroundColor=[UIColor darkGrayColor];
    lineView3.layer.borderWidth = 1.0f;
    [AppointmentTopBarView addSubview:lineView3];
    [AppointmentGroudView addSubview:AppointmentTopBarView];
    

    AppointmentBackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, AppointmentTopBarView.frame.size.height+AppointmentTopBarView.frame.origin.y+20, 300, 440)];
    AppointmentBackGroundImageView.backgroundColor=[UIColor clearColor];
    AppointmentBackGroundImageView.image=BackGroundImage;
    AppointmentBackGroundImageView.userInteractionEnabled=TRUE;
    UIImage *DemoImageAppointment=[UIImage imageNamed:@"Staticapponments_page.png"];
   
    AppointmentDemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(25, 50, DemoImageAppointment.size.width, DemoImageAppointment.size.height)];
    AppointmentDemoImageView.image=DemoImageAppointment;
    [AppointmentBackGroundImageView addSubview:AppointmentDemoImageView];
    [AppointmentGroudView addSubview:AppointmentBackGroundImageView];
    AppointmentGroudView.backgroundColor=[UIColor clearColor];
    [ScrollerView addSubview:AppointmentGroudView];
    
    
    
    #pragma mark MapGroundView
    
    
    MapGroundView=[[UIView alloc]initWithFrame:CGRectMake(AppointmentGroudView.frame.size.width+AppointmentGroudView.frame.origin.x, 0, self.view.frame.size.width, 518)];
    MapTopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,50)];
    MapTopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    
    UILabel *test=[[UILabel  alloc]initWithFrame:CGRectMake(110, 20, 100, 20)];
    test.backgroundColor=[UIColor clearColor];
    test.text=@"Map";
    test.font=[UIFont fontWithName:@"Comfortaa-Bold" size:15];
    test.textColor=[UIColor whiteColor];
    test.textAlignment=NSTextAlignmentCenter;
    [MapTopBarView addSubview:test];
    MapTopBarView.userInteractionEnabled=TRUE;
    [MapGroundView  addSubview:MapTopBarView];
    MapGroundView.backgroundColor=[UIColor clearColor];
    [ScrollerView addSubview:MapGroundView];
    [self.view addSubview:ScrollerView];

    #pragma mark BottomView

    BottomView=[[UIView alloc]initWithFrame:CGRectMake(0, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, self.view.frame.size.width, 50)];
    BottomView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    selectBarImage=[UIImage imageNamed:@"selected_bar.png"];
    SelectBarImageView=[[UIImageView alloc]initWithFrame:CGRectMake(23, 0, selectBarImage.size.width, selectBarImage.size.height)];
    SelectBarImageView.image=selectBarImage;
    [BottomView addSubview:SelectBarImageView];

    
    HomeImage=[UIImage  imageNamed:@"home_iconNav.png"];
    HomeAfterClick=[UIImage imageNamed:@"home_icocn_non_selected.png"];
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(25, 10, HomeImage.size.width,HomeImage.size.height)];
    HomeButton.backgroundColor=[UIColor clearColor];
    [HomeButton setImage:HomeImage forState:UIControlStateNormal];
    [HomeButton setImage:HomeAfterClick forState:UIControlStateSelected];
    [HomeButton setImage:HomeAfterClick forState:UIControlStateHighlighted];
//    HomeButton.enabled=NO;
    HomeButton.userInteractionEnabled=FALSE;
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [HomeButton addTarget:self action:@selector(HomeButtonActionDown) forControlEvents:UIControlEventTouchDown];
    [BottomView addSubview:HomeButton];
    
    MedicalRecordsImageDefault=[UIImage imageNamed:@"medical_records.png"];
    MedicalRecordsImageAferClick=[UIImage imageNamed:@"medical_records_selected.png"];
    
    MedicalRecordButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+25, 10, MedicalRecordsImageDefault.size.width, MedicalRecordsImageDefault.size.height)];
    MedicalRecordButton.backgroundColor=[UIColor clearColor];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateSelected];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateHighlighted];
    [MedicalRecordButton addTarget:self action:@selector(MedicalButtonActionDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MedicalRecordButton];

    AppointmentsImageDefault=[UIImage  imageNamed:@"appoinment_icon.png"];
    AppointmentsImageAfterClick=[UIImage  imageNamed:@"appoinment_selected_icon.png"];
    
    
    AppointmentButton=[[UIButton alloc]initWithFrame:CGRectMake(MedicalRecordButton.frame.size.width+MedicalRecordButton.frame.origin.x+25, 10, AppointmentsImageDefault.size.width, AppointmentsImageDefault.size.height)];
    AppointmentButton.backgroundColor=[UIColor clearColor];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateSelected];
    [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateHighlighted];
    //[AppointmentButton addTarget:self action:@selector(AppointmentsButtonAction) forControlEvents:UIControlEventTouchUpInside];
     [AppointmentButton addTarget:self action:@selector(AppointmentsButtonDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:AppointmentButton];

    
    MapImageDefault=[UIImage imageNamed:@"location_iconNav.png"];
    MapImageAfterClick=[UIImage imageNamed:@"location_icon_selected.png"];
    
    MapButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentButton.frame.size.width+AppointmentButton.frame.origin.x+25, 10, MapImageDefault.size.width, MapImageDefault.size.height)];
    MapButton.backgroundColor=[UIColor clearColor];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateSelected];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateHighlighted];
   [MapButton addTarget:self action:@selector(MapButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MapButton];

    
    SliderBarDefault=[UIImage imageNamed:@"side_barNav.png"];
    SlidMenuButton=[[UIButton alloc]initWithFrame:CGRectMake(MapButton.frame.size.width+MapButton.frame.origin.x+25, 10, SliderBarDefault.size.width, SliderBarDefault.size.height)];
    SlidMenuButton.backgroundColor=[UIColor clearColor];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [SlidMenuButton addTarget:self action:@selector(SlidMenuButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [SlidMenuButton addTarget:self action:@selector(SliderButtonDownDown) forControlEvents:UIControlEventTouchDown];
    [BottomView addSubview:SlidMenuButton];
    
    [self.view addSubview:BottomView];
    
    SliderViewBar=[[UIView alloc]initWithFrame:CGRectMake(400, 20, 300,self.view.frame.size.height)];
    SliderViewBar.backgroundColor=[UIColor grayColor];
    SliderViewBar.tag=200;
    SliderViewBar.userInteractionEnabled=TRUE;
    
   UIButton *EmergencySliderButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 60, SliderViewBar.frame.size.width, 50)];
    [EmergencySliderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   // [EmergencySliderButton addTarget:self action:@selector(SubmitButtonAction)
       //    forControlEvents:UIControlEventTouchUpInside];
    EmergencySliderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [EmergencySliderButton setTitle:@"EMERGENCY" forState:(UIControlState)UIControlStateNormal];
    EmergencySliderButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    EmergencySliderButton.titleEdgeInsets = UIEdgeInsetsMake(5, 75, 0, 0);
    EmergencySliderButton.backgroundColor=[UIColor blackColor];
    [SliderViewBar addSubview:EmergencySliderButton];
    
    UIButton *SyncButton=[[UIButton alloc]initWithFrame:CGRectMake(5, EmergencySliderButton.frame.size.height+EmergencySliderButton.frame.origin.y+100,260 ,40)];
    
    [SyncButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SyncButton addTarget:self action:@selector(SyncButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    SyncButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    SyncButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [SyncButton setTitle:@"Sync Now" forState:(UIControlState)UIControlStateNormal];
    SyncButton.titleEdgeInsets = UIEdgeInsetsMake(5, 90, 0, 0);
    SyncButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:52/255.0 blue:50/255.0 alpha:1.0];
   // SyncButton.layer.borderColor = [UIColor whiteColor].CGColor;
   // SyncButton.layer.borderWidth = 1.0f;
   // SyncButton.layer.cornerRadius = 3;
    SyncButton.clipsToBounds = YES;
    [SliderViewBar addSubview:SyncButton];
    
    
    
    UIImageView *loginImageView=[[UIImageView alloc]init];
    
    [loginImageView setFrame:CGRectMake(0, SyncButton.frame.size.height+SyncButton.frame.origin.y+20, 270, 250)];
    
    [loginImageView setBackgroundColor:[UIColor grayColor]];
    
    loginImageView.userInteractionEnabled  =TRUE;
    [loginImageView setUserInteractionEnabled:YES];
    
    [SliderViewBar addSubview:loginImageView];
    
    
    
    for(int i=0;i<6;i++)
        
    {
        
        UIImageView *divImageView=[[UIImageView alloc]init];
        
        [divImageView setFrame:CGRectMake(0, 50*i, 270, 1)];
        
        [divImageView setBackgroundColor:[UIColor colorWithRed:231.0/255 green:231.0/255 blue:231.0/255 alpha:1.0]];
        
        [divImageView setUserInteractionEnabled:YES];
        
        [loginImageView addSubview:divImageView];
        
        
        
    }
    
    
    
    UIButton *AccountButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,270 ,50)];
    
    [AccountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [AccountButton addTarget:self action:@selector(SyncButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    AccountButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    AccountButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [AccountButton setTitle:@"Account" forState:(UIControlState)UIControlStateNormal];
    AccountButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    AccountButton.backgroundColor=[UIColor clearColor];
    [loginImageView addSubview:AccountButton];

   
    UIButton *SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(0, AccountButton.frame.size.height+AccountButton.frame.origin.y+1,270 ,50)];
    [SettingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SettingButton addTarget:self action:@selector(SyncButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    SettingButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    SettingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [SettingButton setTitle:@"Setting" forState:(UIControlState)UIControlStateNormal];
    SettingButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [SettingButton addTarget:self action:@selector(settingsScreen) forControlEvents:UIControlEventTouchUpInside];
    SettingButton.backgroundColor=[UIColor clearColor];
    [loginImageView addSubview:SettingButton];

   
    UIButton *HelpButton=[[UIButton alloc]initWithFrame:CGRectMake(0, SettingButton.frame.size.height+SettingButton.frame.origin.y+1,270 ,50)];
    
    [HelpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [HelpButton addTarget:self action:@selector(SyncButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    HelpButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    HelpButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [HelpButton setTitle:@"Help" forState:(UIControlState)UIControlStateNormal];
    HelpButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    HelpButton.backgroundColor=[UIColor clearColor];
    [loginImageView addSubview:HelpButton];

    UIButton *ReportButton=[[UIButton alloc]initWithFrame:CGRectMake(0, HelpButton.frame.size.height+HelpButton.frame.origin.y+1,270 ,50)];
    
    [ReportButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ReportButton addTarget:self action:@selector(SyncButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    ReportButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    ReportButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [ReportButton setTitle:@"Report" forState:(UIControlState)UIControlStateNormal];
    ReportButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    ReportButton.backgroundColor=[UIColor clearColor];
    [loginImageView addSubview:ReportButton];

    
    
    UIButton *LegalButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ReportButton.frame.size.height+ReportButton.frame.origin.y+1,270 ,50)];
    [LegalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [LegalButton addTarget:self action:@selector(SyncButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    LegalButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    LegalButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [LegalButton setTitle:@"Legal" forState:(UIControlState)UIControlStateNormal];
    LegalButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    LegalButton.backgroundColor=[UIColor clearColor];
    [loginImageView addSubview:LegalButton];
    
    
    UILabel *copyRightLable=[[UILabel  alloc]initWithFrame:CGRectMake(170, loginImageView.frame.size.height+loginImageView.frame.origin.y+5, 80, 20)];
    copyRightLable.backgroundColor=[UIColor clearColor];
    copyRightLable.text=@"Copyright 2014";
    copyRightLable.font=[UIFont fontWithName:@"Comfortaa" size:10];
    copyRightLable.textColor=[UIColor whiteColor];
    copyRightLable.textAlignment=NSTextAlignmentCenter;
    [SliderViewBar addSubview:copyRightLable];
    
    [self.view addSubview:SliderViewBar];
    
    SliderViewBar.hidden=YES;
    SliderBarViewSatus=5;
     [self userGuide];
    
//    if([[NSUserDefaults standardUserDefaults]boolForKey:@"FirstTimeUser"]){
//
//        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"FirstTimeUser"];
//    }
   
}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//   
//    //[ScrollerView setContentOffset:CGPointMake(620, 568-50)];
//    CGFloat pageWidth = scrollView.frame.size.width;
//    float fractionalPage = scrollView.contentOffset.x / pageWidth;
//    NSLog(@"x=%f",pageWidth);
//    NSInteger page = lround(fractionalPage);
//    pageControl.currentPage=page;
//}
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
    
    
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(20, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];
    
    [ScrollerView scrollRectToVisible:CGRectMake(0, 0, 320, 518) animated:YES];
}
-(void)MedicalButtonActionDown{
    
    [[soundManager shared] buttonSound];
    BottomNavigationButtonFlag=2;
    
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
     [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateNormal];
     [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
     [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    
    HomeButton.userInteractionEnabled=TRUE;
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+23, 0, selectBarImage.size.width,selectBarImage.size.height);
        
    }];

   [ScrollerView scrollRectToVisible:CGRectMake(320, 0, 320, 518) animated:YES];
    
}
-(void)AppointmentsButtonDown{
    
     [[soundManager shared] buttonSound];
     HomeButton.userInteractionEnabled=TRUE;
    BottomNavigationButtonFlag=3;
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
     [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
     [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(MedicalRecordButton.frame.origin.x+MedicalRecordButton.frame.size.width+23, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];
    
    [ScrollerView scrollRectToVisible:CGRectMake(640, 0, 320, 518) animated:YES];
    
}
-(void)MapButtonAction
{
    [[soundManager shared] buttonSound];
    BottomNavigationButtonFlag=4;
    HomeButton.userInteractionEnabled=TRUE;
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateNormal];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(AppointmentButton.frame.origin.x+AppointmentButton.frame.size.width+23, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];
    
    [ScrollerView scrollRectToVisible:CGRectMake(640+320, 0, 320, 518) animated:YES];
}
-(void)SliderButtonDownDown{
     [[soundManager shared] buttonSound];
    
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(MapButton.frame.origin.x+MapButton.frame.size.width+25, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];
}
-(void)SlidMenuButtonAction{
    
    if(SliderBarViewSatus==5){
        SliderBarViewSatus=1;
        HomeButton.userInteractionEnabled=TRUE;
        [UIView animateWithDuration:.3f animations:^{
            SliderViewBar.frame=CGRectMake(50, 20, 300, self.view.frame.size.height);
            BottomView.frame = CGRectMake(-250, UserHomeGroundView.frame.size.height+UserHomeGroundView.frame.origin.y, self.view.frame.size.width, 50);
            SliderViewBar.hidden=NO;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    else{
        SliderBarViewSatus=5;
        [UIView animateWithDuration:.3f animations:^{
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
-(void)AppointmentsButtonAction
{
    
    [[soundManager shared] buttonSound];
   // [self ShowActivityIndicatorWithTitle:@"Loading..."];
    AllAppointmentsListViewController *CreateAppointment=[[AllAppointmentsListViewController alloc]init];
    [self.navigationController pushViewController:CreateAppointment animated:YES];
    
}

-(void)UpcomingViewAction{
    
    [[soundManager shared] buttonSound];
    UPComingAppointmentViewController *upcomingAction=[[UPComingAppointmentViewController alloc]init];
    [self.navigationController pushViewController:upcomingAction animated:YES];
}
-(void)RecentViewAction{
    
    [[soundManager shared] buttonSound];
    RecentAppointmentViewController *recentAction=[[RecentAppointmentViewController alloc]init];
    [self.navigationController pushViewController:recentAction animated:YES];
}

-(void)changeImage:(UITapGestureRecognizer*)recognizer
{
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle: nil
                                                              delegate: self
                                                     cancelButtonTitle: @"Cancel"
                                                destructiveButtonTitle: nil
                                                     otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    [actionSheet1 showInView:self.view];
    
    
    NSLog(@"changeImage");
    
    //    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //
    //    picker.delegate  = self;
    //
    //    picker.allowsEditing = YES;
    
    
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
    
    path= [documentsDirectory stringByAppendingPathComponent:@"clicklabs.png" ];  // IT IS THE PATH OF CHOOSEN IMAGE
    
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
//    if((UITouch *)[self.view viewWithTag:100]){
//        
//    }
//    
//    
//    SliderBarViewSatus=0;
//    [UIView animateWithDuration:.5f animations:^{
//        
//        BottomView.frame = CGRectMake(0, 528, self.view.frame.size.width, 40);
//        SliderViewBar.frame=CGRectMake(400, TopBarView.frame.size.height+TopBarView.frame.origin.y, 200, self.view.frame.size.height);
//    } completion:^(BOOL finished) {
//        SliderViewBar.hidden=YES;
//    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)userGuide
{
    
    UIImage *HeaderImgae=[UIImage imageNamed:@"nev_bar_trans.png"];
    
    LestGuiderHeaderImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 10, HeaderImgae.size.width, HeaderImgae.size.height)];
    LestGuiderHeaderImageView.image=HeaderImgae;
    LestGuiderHeaderImageView.userInteractionEnabled=TRUE;

    LetsGuideLable=[[UILabel alloc]initWithFrame:CGRectMake(90,15,150,20)];
    LetsGuideLable.backgroundColor=[UIColor clearColor];
    LetsGuideLable.text=@"LET US GUIDE YOU";
    LetsGuideLable.textColor=[UIColor whiteColor];
    LetsGuideLable.font=[UIFont fontWithName:@"HelveticaNeueLTCom-Roman" size:15];
    [LestGuiderHeaderImageView addSubview:LetsGuideLable];
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(90,LetsGuideLable.frame.origin.y+20,135,1)];
    lineView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    lineView.layer.borderWidth = 1.0f;
    [LestGuiderHeaderImageView addSubview:lineView];
    
    
    UIImage *CrossImage=[UIImage imageNamed:@"CrossImage.png"];
    
    CrossButtonClick=[[UIButton alloc]initWithFrame:CGRectMake(LetsGuideLable.frame.size.width+LetsGuideLable.frame.origin.x+50, 13, CrossImage.size.width, CrossImage.size.height)];
    [CrossButtonClick setImage:CrossImage forState:UIControlStateNormal];
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
    
    FirstFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,FirstImage.size.width, FirstImage.size.height-10)];
    FirstFrameImageView.image=FirstImage;
    FirstFrameImageView.userInteractionEnabled=TRUE;
    
    UIButton *NextClickButton=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton addTarget:self action:@selector(SecondFrameNextButton)
                  forControlEvents:UIControlEventTouchUpInside];
        [NextClickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        NextClickButton.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
        NextClickButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
        NextClickButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [NextClickButton setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
        NextClickButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        NextClickButton.backgroundColor=[UIColor clearColor];
        [FirstFrameImageView addSubview:NextClickButton];
    
    [UserGuideScrollView addSubview:FirstFrameImageView];
    SecondFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(FirstFrameImageView.frame.size.width+FirstFrameImageView.frame.origin.x, 0, secondImage.size.width, secondImage.size.height-10)];
    SecondFrameImageView.image=secondImage;
    SecondFrameImageView.userInteractionEnabled=TRUE;
    
    UIButton *NextClickButton2=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton2 addTarget:self action:@selector(ThirdFrameNextButton)
              forControlEvents:UIControlEventTouchUpInside];
    [NextClickButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextClickButton2.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    NextClickButton2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NextClickButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NextClickButton2 setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
    NextClickButton2.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NextClickButton2.backgroundColor=[UIColor clearColor];
    [SecondFrameImageView addSubview:NextClickButton2];
    [UserGuideScrollView addSubview:SecondFrameImageView];
    
    ThirdFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(SecondFrameImageView.frame.size.width+SecondFrameImageView.frame.origin.x, 0, ThirdImage.size.width, ThirdImage.size.height-10)];
    ThirdFrameImageView.image=ThirdImage;
    ThirdFrameImageView.userInteractionEnabled=TRUE;
    
    UIButton *NextClickButton3=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton3 addTarget:self action:@selector(FourthFrameNextButton)
               forControlEvents:UIControlEventTouchUpInside];
    [NextClickButton3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextClickButton3.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    NextClickButton3.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NextClickButton3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NextClickButton3 setTitle:@"Next" forState:(UIControlState)UIControlStateNormal];
    NextClickButton3.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NextClickButton3.backgroundColor=[UIColor clearColor];
    [ThirdFrameImageView addSubview:NextClickButton3];

    [UserGuideScrollView addSubview:ThirdFrameImageView];
    
     FourthFrameImageView=[[UIImageView alloc]initWithFrame:CGRectMake(ThirdFrameImageView.frame.size.width+ThirdFrameImageView.frame.origin.x, 0, FourthImage.size.width, FourthImage.size.height-10)];
    FourthFrameImageView.image=FourthImage;
    FourthFrameImageView.userInteractionEnabled=TRUE;
    
    
    UIButton *NextClickButton4=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton4 addTarget:self action:@selector(FifthFrameNextButton)
               forControlEvents:UIControlEventTouchUpInside];
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
    
    UIButton *NextClickButton5=[[UIButton alloc]initWithFrame:CGRectMake(240, 400, 80, 40)];
    [NextClickButton5 addTarget:self action:@selector(LastFrameNextButton)
               forControlEvents:UIControlEventTouchUpInside];
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
- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(25, 25)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
}
-(void)settingsScreen
{
    SettingScreenViewController *setingScreen=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:setingScreen animated:YES];
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


//UIBezierPath *ShortCutButtonShape = [UIBezierPath bezierPathWithRoundedRect:ShortCutButton.bounds
//                                                          byRoundingCorners:UIRectCornerAllCorners
//                                                                cornerRadii:CGSizeMake(9.0,9.0)];
//CAShapeLayer *ShortCutshapeLayer = [CAShapeLayer layer];
//ShortCutshapeLayer.frame = ShortCutButtonShape.bounds;
//ShortCutshapeLayer.path = ShortCutButtonShape.CGPath;
//ShortCutshapeLayer.fillColor = [UIColor clearColor].CGColor;
//ShortCutshapeLayer.strokeColor = [UIColor blackColor].CGColor;
//ShortCutshapeLayer.lineWidth = 1;
//[ShortCutButton.layer addSublayer:ShortCutshapeLayer];

@end
