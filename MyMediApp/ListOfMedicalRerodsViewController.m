//
//  ListOfMedicalRerodsViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 26/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "ListOfMedicalRerodsViewController.h"

@interface ListOfMedicalRerodsViewController (){
   
    UIButton *CreateNewMedicalButton;
    UIView *TopBarView;
    UIImageView *BackGroundImageView;
    UIButton *SortButton;
    UIButton *SearchButton;
    
    UIImageView *DemoImageView;
    
    UIView *BottomView;
    
    UIImage *HomeImage;
    UIImage *HomeAfterClick;
    UIImage *MedicalRecordsImageDefault;
    UIImage *MedicalRecordsImageAferClick;
    
    UIImage *AppointmentsImageDefault;
    UIImage *AppointmentsImageAfterClick;
    
    UIImage *MapImageDefault;
    UIImage *MapImageAfterClick;
    
    UIImage *SliderBarDefault;
    
    UIButton *HomeButton;
    UIButton *MedicalRecordButton;
    UIButton *AppointmentButton;
    UIButton *MapButton;
    UIButton *SlidMenuButton;
    
    UIImage *selectBarImage;
    UIImageView *SelectBarImageView;
}

@end

@implementation ListOfMedicalRerodsViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:224/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    
    SortButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 25,50 ,30)];
    [SortButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SortButton addTarget:self action:@selector(SortButtonAction)
         forControlEvents:UIControlEventTouchUpInside];
    [SortButton addTarget:self action:@selector(SortActionNormal) forControlEvents:UIControlEventTouchDown];
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
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(SortButton.frame.size.width+SortButton.frame.origin.x+10,25,1,30)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView];
    
    UIImage  *SearchButtonImage=[UIImage imageNamed:@"search_icon.png"];
    SearchButton=[[UIButton alloc]initWithFrame:CGRectMake(SortButton.frame.size.width+SortButton.frame.origin.y+5, 30,SearchButtonImage.size.width ,SearchButtonImage.size.height)];
    SearchButton.backgroundColor=[UIColor clearColor];
    [SearchButton setImage:SearchButtonImage forState:UIControlStateNormal];
    [TopBarView addSubview:SearchButton];
    
    
    
    UIView *lineView1=[[UIView alloc]initWithFrame:CGRectMake(265,25,1,30)];
    lineView1.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView1.backgroundColor=[UIColor darkGrayColor];
    lineView1.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView1];
    
    
    UIImage *CreateNewAppintmentImage=[UIImage imageNamed:@"CreateNewAppointment.png"];

    UIButton *LoginButtonHidden=[[UIButton alloc]initWithFrame:CGRectMake(265, 20, CreateNewAppintmentImage.size.width+10, CreateNewAppintmentImage.size.height+20)];
    LoginButtonHidden.backgroundColor=[UIColor clearColor];
    [LoginButtonHidden addTarget:self action:@selector(CreateNewMedicalReport)
                forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:LoginButtonHidden];
    
    
    CreateNewMedicalButton=[[UIButton alloc]initWithFrame:CGRectMake(275, 25,CreateNewAppintmentImage.size.width ,CreateNewAppintmentImage.size.height)];
    CreateNewMedicalButton.backgroundColor=[UIColor clearColor];
    [CreateNewMedicalButton setImage:CreateNewAppintmentImage forState:UIControlStateNormal];
    //[CreateNewMedicalButton addTarget:self action:@selector(CreateNewMedicalReport) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:CreateNewMedicalButton];
    
    [self.view addSubview:TopBarView];
    

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
     [self.view addSubview:BackGroundImageView];
    
    BottomView=[[UIView alloc]initWithFrame:CGRectMake(0, BackGroundImageView.frame.size.height+BackGroundImageView.frame.origin.y, self.view.frame.size.width, 50)];
    BottomView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    
    
    
    HomeImage=[UIImage  imageNamed:@"home_iconNav.png"];
    HomeAfterClick=[UIImage imageNamed:@"home_icocn_non_selected.png"];
    
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(25, 10, HomeImage.size.width,HomeImage.size.height)];
    HomeButton.backgroundColor=[UIColor clearColor];
    [HomeButton setImage:HomeImage forState:UIControlStateNormal];
    [HomeButton setImage:HomeAfterClick forState:UIControlStateSelected];
    [HomeButton setImage:HomeAfterClick forState:UIControlStateHighlighted];
    [HomeButton addTarget:self action:@selector(HomeButtonActionDown) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    selectBarImage=[UIImage imageNamed:@"selected_bar.png"];
    SelectBarImageView=[[UIImageView alloc]initWithFrame:CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+25, 0, selectBarImage.size.width, selectBarImage.size.height)];
    SelectBarImageView.image=selectBarImage;
    [BottomView addSubview:SelectBarImageView];
    
  MedicalRecordsImageDefault=[UIImage imageNamed:@"medical_records.png"];
  MedicalRecordsImageAferClick=[UIImage imageNamed:@"medical_records_selected.png"];
    
  MedicalRecordButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+25, 10, MedicalRecordsImageDefault.size.width, MedicalRecordsImageDefault.size.height)];
    MedicalRecordButton.backgroundColor=[UIColor clearColor];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateSelected];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateHighlighted];
    MedicalRecordButton.userInteractionEnabled=FALSE;
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
    [AppointmentButton addTarget:self action:@selector(AppointmentsButtonDown) forControlEvents:UIControlEventTouchDown];
    [BottomView addSubview:AppointmentButton];
    
    
  MapImageDefault=[UIImage imageNamed:@"location_iconNav.png"];
  MapImageAfterClick=[UIImage imageNamed:@"location_icon_selected.png"];
    
  MapButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentButton.frame.size.width+AppointmentButton.frame.origin.x+25, 10, MapImageDefault.size.width, MapImageDefault.size.height)];
    MapButton.backgroundColor=[UIColor clearColor];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateSelected];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateHighlighted];
    //[MapButton addTarget:self action:@selector(MapButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MapButton];
    
   SliderBarDefault=[UIImage imageNamed:@"side_barNav.png"];

    SlidMenuButton=[[UIButton alloc]initWithFrame:CGRectMake(MapButton.frame.size.width+MapButton.frame.origin.x+25, 10, SliderBarDefault.size.width, SliderBarDefault.size.height)];
    SlidMenuButton.backgroundColor=[UIColor clearColor];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [SlidMenuButton addTarget:self action:@selector(SlidMenuButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SlidMenuButton];
    [self.view addSubview:BottomView];
   
    [self HideActivityIndicator];
}
-(void)MedicalButtonActionDown{
    
    [[soundManager shared] buttonSound];
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageAferClick forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+25, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];
    
    //[self ShowActivityIndicatorWithTitle:@"Loading..."];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.3]];
    ListOfMedicalRerodsViewController *MedicalRecords=[[ListOfMedicalRerodsViewController alloc]init];
    [self.navigationController pushViewController:MedicalRecords animated:YES];
    
}
-(void)AppointmentsButtonDown{
    [[soundManager shared] buttonSound];
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageAfterClick forState:UIControlStateNormal];
    [MapButton setImage:MapImageDefault forState:UIControlStateNormal];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(MedicalRecordButton.frame.origin.x+MedicalRecordButton.frame.size.width+25, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];
    //[self ShowActivityIndicatorWithTitle:@"Loading..."];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.3]];
    AllAppointmentsListViewController *CreateAppointment=[[AllAppointmentsListViewController alloc]init];
    [self.navigationController pushViewController:CreateAppointment animated:YES];
    
}

-(void)MapButtonAction
{
    [[soundManager shared] buttonSound];
    
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateNormal];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(AppointmentButton.frame.origin.x+AppointmentButton.frame.size.width+25, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];
    
    //[self ShowActivityIndicatorWithTitle:@"Loading..."];


}
-(void)SlidMenuButtonAction{
    
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
-(void)HomeButtonActionDown{
    
    [[soundManager shared] buttonSound];
    
    [HomeButton setImage:HomeAfterClick forState:UIControlStateNormal];
    [MedicalRecordButton setImage:MedicalRecordsImageDefault forState:UIControlStateNormal];
    [AppointmentButton setImage:AppointmentsImageDefault forState:UIControlStateNormal];
    [MapButton setImage:MapImageAfterClick forState:UIControlStateNormal];
    [SlidMenuButton setImage:SliderBarDefault forState:UIControlStateNormal];
    [UIView animateWithDuration:.3f animations:^{
        SelectBarImageView.frame=CGRectMake(20, 0, selectBarImage.size.width,selectBarImage.size.height);
    }];

    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.3]];
    UserHomeScreenViewController *UserHome=[UserHomeScreenViewController alloc];
    [self.navigationController pushViewController:UserHome animated:YES];

}
-(void)SortButtonAction{
    SortButton.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
}
-(void)SortActionNormal{
    SortButton.backgroundColor=[UIColor whiteColor];
    [SortButton setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0] forState:UIControlStateSelected];
    [SortButton setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0] forState:UIControlStateHighlighted];
}
-(void)CreateNewMedicalReport{
    
    [[soundManager shared]buttonSound];
    MedicalRecordsHomeViewController *CreateAppointment=[[MedicalRecordsHomeViewController alloc]init];
    [self.navigationController pushViewController:CreateAppointment animated:YES];
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
