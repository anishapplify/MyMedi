//
//  AppointmentListViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/10/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "AppointmentListViewController.h"

@interface AppointmentListViewController ()
{
    UIView *TopBarView;
    UILabel *TopBarLable;
    UIButton *searchButton;
    UIButton *AddAppointmentButton;
    UIButton *CalenderButton;
     UISearchBar *SearchBar;
    
    UIView *AppointmentGroudView;
    UIView *AppointmentTopBarView;
    UILabel *AppointmentTitleLable;
    UIButton *AppointmentSortButton;
    UIButton *CreateNewAppointmentsButton;
    UIButton *AppointmentSearchButton;
    UIView *AppointmentSubView;
    
    UIImageView *AppointmentDemoImageView;
    UITableView *AddAppointmentTableView;
    NSMutableDictionary *appointmentsDictionary;
    NSMutableDictionary *temp_appointmentsDictionary;
    NSMutableArray *temp_sectionAppointments;
    NSMutableArray *appointmentSectionTitles;
    NSMutableArray *temp_appointmentSectionTitles;
    
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
    
    UIView *ViewForSearching;
    UITableView *SearchTableView;
    UIView *tableViewForMainTable;
    UIRefreshControl*   refreshControl;
    
    NSMutableArray *sectionAppointments;
    
    NSString *rowTappedForDelete;
    NSString *rowTappedForShortCuts;
    BOOL isAttachmentAdded;
    UIAlertView * alertviewLogout;
    
    UIView *MedicalSubView;
    UIView *BottomView;
    
    UIButton *HomeButton;
    UIButton *MedicalRecordButton;
    UIButton *AppointmentButton;
    UIButton *MapButton;
    UIButton *SlidMenuButton;
    UIImage *HomeAfterClick;
    UIImage *HomeImage;
    
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
    
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
}

@end

@implementation AppointmentListViewController

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
    sectionAppointments = [[NSMutableArray alloc]init];
    
   [self ShowActivityIndicatorWithTitle:@"Loading..."];
   [self APICallForUserAppointment];
    
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    [searchButton removeFromSuperview];
    searchButton=nil;
    searchButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"search.png"].size.width ,[UIImage imageNamed:@"search.png"].size.height)];
    searchButton.backgroundColor=[UIColor clearColor];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchbuttonaction:) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:searchButton];
    
    
    [TopBarLable removeFromSuperview];
    TopBarLable=nil;
    TopBarLable=[[UILabel alloc]initWithFrame:CGRectMake(110, 30, 100, 25)];
    TopBarLable.text=@"Appointment";
    TopBarLable.backgroundColor=[UIColor clearColor];
    TopBarLable.font=[UIFont fontWithName:@"Europa-Regular" size:17];
    TopBarLable.textAlignment=NSTextAlignmentCenter;
    TopBarLable.textColor=[UIColor whiteColor];
    [TopBarView addSubview:TopBarLable];
    
    
    [CalenderButton removeFromSuperview];
    CalenderButton=nil;
    CalenderButton=[[UIButton alloc]initWithFrame:CGRectMake(TopBarLable.frame.size.width+TopBarLable.frame.origin.x+13, 20,[UIImage imageNamed:@"calendarButton.png"].size.width ,[UIImage imageNamed:@"calendarButton.png"].size.height)];
    CalenderButton.backgroundColor=[UIColor clearColor];
    [CalenderButton setBackgroundImage:[UIImage imageNamed:@"calendarButton.png"] forState:UIControlStateNormal];
    [CalenderButton addTarget:self action:@selector(CalenderButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:CalenderButton];
    
    
    [AddAppointmentButton removeFromSuperview];
    AddAppointmentButton=nil;
    AddAppointmentButton=[[UIButton alloc]initWithFrame:CGRectMake(CalenderButton.frame.size.width+CalenderButton.frame.origin.x, 20,[UIImage imageNamed:@"plusButton.png"].size.width ,[UIImage imageNamed:@"plusButton.png"].size.height)];
    AddAppointmentButton.backgroundColor=[UIColor clearColor];
   [AddAppointmentButton setBackgroundImage:[UIImage imageNamed:@"plusButton.png"] forState:UIControlStateNormal];
    [AddAppointmentButton addTarget:self action:@selector(AddAppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:AddAppointmentButton];
    [self.view addSubview:TopBarView];
    
    AppointmentGroudView=[[UIView alloc]init];
    AppointmentGroudView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:AppointmentGroudView];
    
    
    BottomView=[[UIView alloc]init];
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            BottomView.frame=CGRectMake(0, 520, 320, 49);
        }
        else
        {
            BottomView.frame=CGRectMake(0, 432, 320, 49);
          
        }
    }
    BottomView.backgroundColor=[UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width,[UIImage imageNamed:@"bottommymedi.png"].size.height)];//bottommymedi_sel.png
    HomeButton.backgroundColor=[UIColor clearColor];//bottommymedi.png
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi.png"] forState:UIControlStateNormal];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateHighlighted];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateSelected];
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    [AppointmentsBottomButton removeFromSuperview];
    AppointmentsBottomButton=nil;
    AppointmentsBottomButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.size.width+HomeButton.frame.origin.x, 0, [UIImage imageNamed:@"appointments.png"].size.width,[UIImage imageNamed:@"appointments.png"].size.height)];
    AppointmentsBottomButton.backgroundColor=[UIColor clearColor];//appointments.png
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateNormal];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateSelected];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateHighlighted];
    [AppointmentsBottomButton addTarget:self action:@selector(AppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    AppointmentsBottomButton.userInteractionEnabled=FALSE;
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
-(void)HomeButtonAction{
    HomeScreenViewController *HomeScreenView=[[HomeScreenViewController  alloc]init];
    [self.navigationController pushViewController:HomeScreenView animated:NO];
}
-(void)AppointmentButtonAction
{
    
}
-(void)ProfileButtonAction{
    ProfileViewController *MedialList=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:MedialList animated:NO];
}
-(void)ShortCutButtonAction{
    
}
-(void)SettingButtonAction{
    SettingScreenViewController *SettingScreenView=[[SettingScreenViewController  alloc]init];
    [self.navigationController pushViewController:SettingScreenView animated:NO];

}
-(IBAction)searchbuttonaction:(UIButton*)sender
{
    if (sender.selected==NO)
    {
        
    sender.selected=YES;
    
    [SearchBar removeFromSuperview];
        SearchBar=nil;
    SearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, 320, 50)];
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
    [TopBarView addSubview:SearchBar];
    
    AppointmentGroudView.frame=CGRectMake(0, 70+50, self.view.frame.size.width, 518-50);
    }
    else{
        [SearchBar removeFromSuperview];
        SearchBar=nil;
         AppointmentGroudView.frame=CGRectMake(0, 70, self.view.frame.size.width, 518);
         sender.selected=NO;
    }
    
    
}
#pragma mark -UITableView Datasource and Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView.tag==5050)
    {
        return [temp_appointmentSectionTitles count];
    }
    else
    {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(tableView.tag==5050)
    {
        return 30;
    }
    else
    {
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger) section
{
    if(tableView.tag==5050)
    {
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        headerLabel.textAlignment = NSTextAlignmentLeft;
        headerLabel.font = [UIFont fontWithName:helveticaRegular size:15];
        headerLabel.text =[NSString stringWithFormat:@"    %@",[temp_appointmentSectionTitles objectAtIndex:section]];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor=[UIColor colorWithRed:32/255.0 green:202/255.0 blue:168/255.0 alpha:1.0];
        return headerLabel;
    }
    else{
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel=nil;
        return headerLabel;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag==5050)
    {
        NSString *sectionTitle = [temp_appointmentSectionTitles objectAtIndex:section];
        temp_sectionAppointments = [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        sectionAppointments = [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        return [temp_sectionAppointments count];
    }
    else
    {
        return  [temp_array_AppointmentName count];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height;;
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
        UIButton *CellButtonClick = (UIButton*)[cell.contentView viewWithTag:1111];
        [CellButtonClick removeFromSuperview];
        CellButtonClick = nil;
    }
    
    
    if(tableView.tag==5050)
    {
        NSString *sectionTitle = [temp_appointmentSectionTitles objectAtIndex:indexPath.section];
        temp_sectionAppointments = [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        
        NSString *appointmentname   =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmentname"];
        NSString *appointmenttime   =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmenttime"];
        NSString *provider          =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"provider"];
        NSString *appointType       =           [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmenttype"];
        NSString *AppointmentId=                [[temp_sectionAppointments objectAtIndex:indexPath.row] valueForKey:@"appointmentid"];
        
        
     
       
        UIButton *CellButtonClick;
        CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
        CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,[UIImage imageNamed:@"ButtonBackGroundImage.png"].size.height);
        CellButtonClick.backgroundColor=[UIColor clearColor];
        [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        CellButtonClick.layer.masksToBounds = NO;
        CellButtonClick.exclusiveTouch=YES;
         CellButtonClick.tag=1111;
        [CellButtonClick setTitle:[NSString stringWithFormat:@"%@",AppointmentId] forState:UIControlStateNormal];
        [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"ButtonBackGroundImage.png"] forState:UIControlStateNormal];
        [CellButtonClick addTarget:self action:@selector(setIdFromServer:) forControlEvents:UIControlEventTouchUpInside];
        CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        CellButtonClick.layer.borderWidth = 0.5f;

    
        
        UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,15,220,10)];
        AppointmentNameTitleShow.textColor = [UIColor blackColor];
        AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
        AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
        AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
        AppointmentNameTitleShow.text =appointmentname;
        AppointmentNameTitleShow.numberOfLines=0;
        AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
        [AppointmentNameTitleShow sizeToFit];
        [CellButtonClick addSubview:AppointmentNameTitleShow];

        //appointType
        
        UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(70,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
        TypeNameTitleShow.textColor = [UIColor grayColor];
        TypeNameTitleShow.backgroundColor = [UIColor clearColor];
        TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
        TypeNameTitleShow.text = appointType;
        [TypeNameTitleShow sizeToFit];
        TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
        TypeNameTitleShow.minimumScaleFactor=0.3;
        [CellButtonClick addSubview:TypeNameTitleShow];
        
        
        UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(TypeNameTitleShow.frame.size.width+TypeNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
        ProviderNameTitleShow.textColor = [UIColor grayColor];
        ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
        ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
        ProviderNameTitleShow.text = provider;
        
        [ProviderNameTitleShow sizeToFit];
        ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
        ProviderNameTitleShow.minimumScaleFactor=0.3;
        [CellButtonClick addSubview:ProviderNameTitleShow];
        
       
        
        NSArray *dateSplitArray=[appointmenttime componentsSeparatedByString:@"T"];
        NSString *date=[dateSplitArray objectAtIndex:0];
        NSString *time=[dateSplitArray objectAtIndex:1];
        NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
        NSString *date2=[dateSplitArray2 objectAtIndex:1];
        NSString *date3=[dateSplitArray2 objectAtIndex:2];
        NSString *date4=[dateSplitArray2 objectAtIndex:0];
        
         NSArray *timeSplitArray=[time componentsSeparatedByString:@"."];
        NSString *FinalTime=[timeSplitArray objectAtIndex:0];
        NSLog(@"final=%@",FinalTime);
        
        
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
        
        
        UILabel *TimeLable = [[UILabel alloc] init];
        TimeLable.textColor = [UIColor darkGrayColor];
        TimeLable.backgroundColor = [UIColor clearColor];
        TimeLable.textAlignment = NSTextAlignmentLeft;
        TimeLable.textColor=[UIColor blackColor];
        TimeLable.font = [UIFont fontWithName:helveticaRegular size:9];
        TimeLable.text =[NSString stringWithFormat:@"%@",FinalTime];
        TimeLable.numberOfLines=0;
        TimeLable.lineBreakMode =NSLineBreakByCharWrapping;
        [TimeLable sizeToFit];
        TimeLable.frame=CGRectMake(250,25,50,15);
        [CellButtonClick addSubview:TimeLable];
        
        
        [cell.contentView addSubview:CellButtonClick];
        
    
    }
    else
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
    
    
    return cell;
    
}
-(IBAction)setIdFromServer:(UIButton*)sender{
    
    [SearchBar resignFirstResponder];

    [[NSUserDefaults standardUserDefaults] setInteger:[sender.titleLabel.text integerValue]forKey:@"AppointmentIdGetValue"];
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
                    
                     EditListViewController *createnewAppointment=[[EditListViewController alloc]init];
                    [self.navigationController pushViewController:createnewAppointment animated:YES];
                    
                    
                }
            }
            
        }
        
    }
    
    
}
-(IBAction)setIdJaaliViewFromServer:(id)sender{
    
    [SearchBar resignFirstResponder];
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
    
    
    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Attachments objectAtIndex:[sender tag]] forKey:kAppointmentmentAttachmentString];
    NSLog(@"kAppointmentmentAttachmentString=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentAttachmentString]);
    
    
    //    [[NSUserDefaults standardUserDefaults] setValue:[temp_array_Provider objectAtIndex:[sender tag]] forKey:kAppointmentmentNameProviderName];
    //
    //    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"notes"] objectAtIndex:k] forKeyPath:kAppointmentmentNotes];
    //
    //    [[NSUserDefaults standardUserDefaults]setValue:[[[appointmentsDictionary valueForKey:keysV] valueForKey:@"attachment"] objectAtIndex:k] forKeyPath:kAppointmentmentAttachmentString];
    
    
    EditListViewController *createnewAppointment=[[EditListViewController alloc]init];
    [self.navigationController pushViewController:createnewAppointment animated:YES];
    
    
    //  [[NSUserDefaults standardUserDefaults] setValue:[temp_array_ConsultantName objectAtIndex:[sender tag]] forKey:kAppointmentmentNameConsultantString];
    
    
    // NSString *value
    NSLog(@"kAppointmentmentNameHospital=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameHospital]);
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
- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    // allow just one cell's utility button to be open at once
    return YES;
}
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
        
        NSIndexPath *cellIndexPath = [AddAppointmentTableView indexPathForCell:cell];
        NSLog(@"cellIndexPath=%d",cellIndexPath.row);
        
        
        NSLog(@"temp_sectionAppointments=%@",temp_sectionAppointments);
        NSString *sectionTitle          =       [temp_appointmentSectionTitles objectAtIndex:cellIndexPath.section];
        temp_sectionAppointments        =       [[temp_appointmentsDictionary valueForKey:sectionTitle] mutableCopy];
        NSString *appointmentID         =       [[temp_sectionAppointments objectAtIndex:cellIndexPath.row] valueForKey:@"appointmentid"];
        
        
        
        rowTappedForShortCuts=appointmentID;
        
        NSLog(@"rowTappedForShortCuts %@",rowTappedForShortCuts);
        
        alertviewLogout = [[UIAlertView alloc] initWithTitle:@"Shortcuts" message:@"Are you sure you want to create Shortcut?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil];
        alertviewLogout.tag=524234234;
        
        [alertviewLogout show];
        
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
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
#pragma mark Alert view delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==4)
    {
        if(buttonIndex ==1)
        {
            [self DeleteAPICallFunction : rowTappedForDelete];
            
            if (isAttachmentAdded == YES)
            {
                //                    [self APICallForUserMedicalAppointment];       // API CALL FOR USER MEDICAL APPOINTMENTS
                //                    [self loginWithAccessToken];
                
                
            }
            
        }
    }
    if(alertView.tag==524234234)
    {
        if(buttonIndex ==1)
        {
            [self ShortcutsAPICallFunction : rowTappedForShortCuts];
        }
        
        
    }
}

#pragma mark DeleteAPICall
-(void) ShortcutsAPICallFunction :(NSString*)shortcutsTag
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
                                  @"id":shortcutsTag,
                                  @"shortcuttype":@"1"
                                  };
        NSLog(@"Parameter=>%@",params);
        [self ShowActivityIndicatorWithTitle:@"Loading..."];
        [manager POST:[NSString stringWithFormat:@"%@/create_user_shortcuts",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            NSLog(@"Create_user_shortcuts JSON--->%@",json);
            if([json objectForKey:@"error"])
            {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
            }
            else
            {
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[json  objectForKey:@"log"] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
                
                // [self APICallForUserAppointment];
                [AddAppointmentTableView reloadData];
                
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
            else if ([[json objectForKey:@"log"]isEqualToString:@"No apointment yet!"])
            {
                [AppointmentDemoImageView removeFromSuperview];
                AppointmentGroudView.frame=CGRectMake(0, 70, self.view.frame.size.width, 518);
                AppointmentDemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 40, [UIImage imageNamed:@"Staticapponments_page.png"].size.width,[UIImage imageNamed:@"Staticapponments_page.png"].size.height)];
                
                AppointmentDemoImageView.image=[UIImage imageNamed:@"Staticapponments_page.png"];
                [AppointmentGroudView addSubview:AppointmentDemoImageView];
                [SearchBar removeFromSuperview];
                [AddAppointmentTableView removeFromSuperview];
                AddAppointmentTableView=nil;
                SearchBar=nil;
            }
            else
            {
                [AppointmentDemoImageView removeFromSuperview];
                AppointmentGroudView.frame=CGRectMake(0, 70, self.view.frame.size.width, 518);
                
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
                    [array_Attachemtns  addObject:   [[json objectForKey:[appointmentSectionTitles objectAtIndex:i]]valueForKey:@"attachment"]];
                }
                NSLog(@"array_Attachemtns is %@",array_Attachemtns);
                
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
                    
                    for (int j=0; j<[[array_Attachemtns objectAtIndex:i]count]; j++)
                    {
                        [temp_array_Attachments addObject:[[array_Attachemtns objectAtIndex:i] objectAtIndex:j]];
                        [array_Attachments_Main addObject:[[array_Attachemtns objectAtIndex:i] objectAtIndex:j]];
                    }
                }
                [ViewForSearching removeFromSuperview];
                ViewForSearching = nil;
                ViewForSearching = [[UIView alloc]init];
                ViewForSearching.frame = CGRectMake(0, 0, self.view.frame.size.width, 390);
                ViewForSearching.backgroundColor=[UIColor clearColor];
                ViewForSearching.hidden = YES;
                [AppointmentGroudView addSubview:ViewForSearching];
                
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
-(void)AddAppointmentTableViewFunction
{
    [AddAppointmentTableView removeFromSuperview];
    AddAppointmentTableView = nil;
    AddAppointmentTableView=[[UITableView alloc]init];
    AddAppointmentTableView.frame=CGRectMake(0, 0, self.view.frame.size.width, 450);
    AddAppointmentTableView.tag = 5050;
    [AddAppointmentTableView setDelegate:self];
    AddAppointmentTableView.dataSource=self;
    AddAppointmentTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    AddAppointmentTableView.backgroundColor=[UIColor clearColor];
    AddAppointmentTableView.showsVerticalScrollIndicator = NO;
    AddAppointmentTableView.alwaysBounceVertical = NO;
    [AppointmentGroudView addSubview:AddAppointmentTableView];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [searchBar resignFirstResponder];
    
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar
{
    [self.view endEditing:YES];
}
- (void) searchBarTextDidBeginEditing: (UISearchBar*) searchBar
{
   
        [SearchBar setShowsCancelButton:YES animated:YES];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{

    
        [SearchBar resignFirstResponder];
    
        SearchBar.showsCancelButton = NO;
    
    
}
-(void)CalenderButtonAction{
    AppointmentCalenderViewController *CalenderView=[[AppointmentCalenderViewController alloc]init];
    [self.navigationController pushViewController:CalenderView animated:NO];
}
-(void)AddAppointmentButtonAction{
    AddAppointmentViewController *AddAppointment=[[AddAppointmentViewController alloc]init];
    [self.navigationController pushViewController:AddAppointment animated:YES];

}
-(void)BackButtonAction
{
   NSArray *viewContrlls=[[self navigationController] viewControllers];
    for( int i=0;i<[ viewContrlls count];i++)
    {
        id obj=[viewContrlls objectAtIndex:i];
        if([obj isKindOfClass:[HomeScreenViewController class]])
        {
            [[self navigationController] popToViewController:obj animated:YES];
            return;
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
