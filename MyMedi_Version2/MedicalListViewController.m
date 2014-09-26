//
//  MedicalListViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/10/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "MedicalListViewController.h"

@interface MedicalListViewController (){
    UIView *TopBarView;
    UILabel *TopBarLable;
    UIButton *searchButton;
    UIButton *MenuButton;
    UISearchBar *SearchBar;
    
    UIView *BottomView;
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
    
     UIView *moreButtonview;
    UIButton *AppointmentButton;
    UIButton *MedicalRecordButton;
    UIButton *MedicalViewListRecordButton;
    UIView *moreButtonBlackview;
    UIView *horizontalLIneView;
    
    
}

@end

@implementation MedicalListViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:241/255.0 green:245/255.0 blue:246/255.0 alpha:1.0];
    
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
    TopBarLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 30, 120, 25)];
    TopBarLable.text=@"Medical Record";
    TopBarLable.backgroundColor=[UIColor clearColor];
    TopBarLable.font=[UIFont fontWithName:@"Europa-Regular" size:17];
    TopBarLable.textAlignment=NSTextAlignmentCenter;
    TopBarLable.textColor=[UIColor whiteColor];
    [TopBarView addSubview:TopBarLable];
    
    
    [MenuButton removeFromSuperview];
    MenuButton=nil;
    MenuButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 15,[UIImage imageNamed:@"menu.png"].size.width ,[UIImage imageNamed:@"menu.png"].size.height)];
    MenuButton.backgroundColor=[UIColor clearColor];
    [MenuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [MenuButton addTarget:self action:@selector(morebuttoninformation:) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:MenuButton];
    [self.view addSubview:TopBarView];
    
    
    [BottomView removeFromSuperview];
    BottomView=nil;
    BottomView=[[UIView alloc]init];
    
    
    [horizontalLIneView removeFromSuperview];
    horizontalLIneView = nil;
    horizontalLIneView = [[UIView alloc]init];
    horizontalLIneView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:horizontalLIneView];
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            BottomView.frame=CGRectMake(0, 520, 320, 49);
             horizontalLIneView.frame = CGRectMake(0, 519, 320, 1);
        }
        else
        {
            BottomView.frame=CGRectMake(0, 432, 320, 49);
             horizontalLIneView.frame = CGRectMake(0, 431, 320, 1);
            
        }
    }
    BottomView.backgroundColor=[UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width,[UIImage imageNamed:@"bottommymedi.png"].size.height)];//bottommymedi_sel.png
    HomeButton.backgroundColor=[UIColor clearColor];//bottommymedi.png
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateNormal];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi.png"] forState:UIControlStateHighlighted];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi.png"] forState:UIControlStateSelected];
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    HomeButton.userInteractionEnabled=false;
    [BottomView addSubview:HomeButton];
    
    [AppointmentsBottomButton removeFromSuperview];
    AppointmentsBottomButton=nil;
    AppointmentsBottomButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.size.width+HomeButton.frame.origin.x, 0, [UIImage imageNamed:@"appointments.png"].size.width,[UIImage imageNamed:@"appointments.png"].size.height)];
    AppointmentsBottomButton.backgroundColor=[UIColor clearColor];//appointments.png //appointments_sel.png
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateNormal];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateSelected];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateHighlighted];
    [AppointmentsBottomButton addTarget:self action:@selector(AppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
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
-(IBAction)morebuttoninformation:(UIButton*)sender
{
    if (sender.selected==NO)
    {
        
        sender.selected=YES;
        [moreButtonview removeFromSuperview];
        moreButtonview=nil;
        moreButtonview=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+moreButtonview.frame.origin.y, self.view.frame.size.width,183)];
        moreButtonview.backgroundColor=[UIColor yellowColor];
        
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
        MedicalViewListRecordButton.frame = CGRectMake(0, MedicalRecordButton.frame.size.height+MedicalRecordButton.frame.origin.y, [UIImage imageNamed:@"viewaalactivity.png"].size.width, [UIImage imageNamed:@"viewaalactivity.png"].size.height);
        MedicalViewListRecordButton .backgroundColor=[UIColor clearColor];
        [MedicalViewListRecordButton setBackgroundImage:[UIImage imageNamed:@"viewaalactivity.png"] forState:UIControlStateNormal];
        [MedicalViewListRecordButton addTarget:self action:@selector(viewrecentallactivity) forControlEvents:UIControlEventTouchUpInside];
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
-(void)viewrecentallactivity
{    
    HomeScreenViewController *homescreen=[[HomeScreenViewController alloc]init];
    [self.navigationController pushViewController:homescreen animated:YES];
}
-(void)AddNewAppointmentButtonAction
{
    AddAppointmentViewController *AddNewAppointments=[[AddAppointmentViewController alloc]init];
    [self.navigationController pushViewController:AddNewAppointments animated:YES];
}
-(void)AddNewMedicalRecordsButtonAction
{
    AddAppointmentViewController *AddNewMedicalrecords=[[AddAppointmentViewController alloc]init];
    [self.navigationController pushViewController:AddNewMedicalrecords animated:YES];
}

-(void)HomeButtonAction{
    HomeScreenViewController *HomeScreenView=[[HomeScreenViewController  alloc]init];
    [self.navigationController pushViewController:HomeScreenView animated:NO];
}
-(void)AppointmentButtonAction
{
    AppointmentCalenderViewController *AddNewAppointments=[[AppointmentCalenderViewController alloc]init];
    [self.navigationController pushViewController:AddNewAppointments animated:YES];
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
    }
    else{
        [SearchBar removeFromSuperview];
        SearchBar=nil;
        sender.selected=NO;
    }
    
    
}
-(void)CalenderButtonAction{
    AppointmentCalenderViewController *CalenderView=[[AppointmentCalenderViewController alloc]init];
    [self.navigationController pushViewController:CalenderView animated:NO];

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
-(void)AddMedicalRecordButtonAction{
    AddMedicalRecordViewController *AddMedicalRecord=[[AddMedicalRecordViewController alloc]init];
    [self.navigationController pushViewController:AddMedicalRecord animated:YES];
    
}
-(void)BackButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
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
