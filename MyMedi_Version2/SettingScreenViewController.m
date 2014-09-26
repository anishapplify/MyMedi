//
//  SettingScreenViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/10/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "SettingScreenViewController.h"

@interface SettingScreenViewController ()
{
   
    UIView *TopBarView;
    UIView *BottomView;
    UIScrollView *SettingScrollView;
    
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
    
    UIButton *sycnButton;
    UIButton *EmergencyButton;
    UIButton *AccountButton;
    UIButton *SettingScreen;
    UIButton *HelpButtonScreen;
    UIButton *LegalButton;
    UIButton *LogOutButton;
    UIAlertView *alertviewLogout;
    UIView *horizontalLIneView;
    UILabel *SettingLable;
    
}

@end

@implementation SettingScreenViewController

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
    
    [SettingLable removeFromSuperview];
    SettingLable=nil;
    SettingLable=[[UILabel alloc]initWithFrame:CGRectMake(85, 25, 150, 30)];
    SettingLable.font=[UIFont fontWithName:helveticaRegular size:20];
    SettingLable.textColor=[UIColor whiteColor];
    SettingLable.textAlignment=NSTextAlignmentCenter;
    SettingLable.text=@"Settings";
    [TopBarView addSubview:SettingLable];
    
    
    [LogOutButton removeFromSuperview];
    LogOutButton=nil;
    LogOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    LogOutButton.frame = CGRectMake(244, 20, [UIImage imageNamed:@"menu.png"].size.width+20, [UIImage imageNamed:@"menu.png"].size.height);
    [LogOutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [LogOutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [LogOutButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [LogOutButton addTarget:self action:@selector(LogoutButtonScreen) forControlEvents:UIControlEventTouchUpInside];
    LogOutButton.backgroundColor=[UIColor clearColor];
    LogOutButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 18];
    LogOutButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [TopBarView addSubview:LogOutButton];
    
    
    [self.view addSubview:TopBarView];

   
   
    UIImageView *abc=[[UIImageView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+35, 320, 70)];
    abc.image=[UIImage imageNamed:@"StaticScreen.png"];
    abc.backgroundColor=[UIColor clearColor];
    [self.view addSubview:abc];
    
    
    sycnButton=[[UIButton alloc]init];
    [sycnButton setTitleColor:[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0] forState:UIControlStateNormal];
    [sycnButton setTitle:@"Sync" forState:(UIControlState)UIControlStateNormal];
    sycnButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    sycnButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    sycnButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0);
    [sycnButton addTarget:self action:@selector(SyncButtonScreen) forControlEvents:UIControlEventTouchUpInside];
    sycnButton.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:sycnButton];
    
    
    
    [SettingScrollView removeFromSuperview];
    SettingScrollView=nil;
    SettingScrollView=[[UIScrollView alloc]init];
    SettingScrollView.backgroundColor=[UIColor whiteColor];
    SettingScrollView.showsVerticalScrollIndicator=YES;
    SettingScrollView.userInteractionEnabled=true;
    
    

    [EmergencyButton removeFromSuperview];
    EmergencyButton=nil;
    
    EmergencyButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,[UIImage imageNamed:@"listviewsbutton.png"].size.width ,[UIImage imageNamed:@"listviewsbutton.png"].size.height)];
    
    [EmergencyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [EmergencyButton setTitle:@"Account (Free)" forState:(UIControlState)UIControlStateNormal];
    
    [EmergencyButton setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    EmergencyButton.titleLabel.font = [UIFont fontWithName:@"MuseoSans-300" size: 15];
    
    EmergencyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    EmergencyButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    
    [EmergencyButton addTarget:self action:@selector(SyncButtonScreen) forControlEvents:UIControlEventTouchUpInside];
    //listviewsbutton@2x.png
    EmergencyButton.backgroundColor=[UIColor whiteColor];
    
    [SettingScrollView addSubview:EmergencyButton];

    [AccountButton removeFromSuperview];
    AccountButton=nil;
    
    AccountButton=[[UIButton alloc]initWithFrame:CGRectMake(0, EmergencyButton.frame.size.height+EmergencyButton.frame.origin.y,[UIImage imageNamed:@"listviewsbutton.png"].size.width ,[UIImage imageNamed:@"listviewsbutton.png"].size.height)];
    
    [AccountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [AccountButton setTitle:@"Help" forState:(UIControlState)UIControlStateNormal];
    
    
    [AccountButton setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    AccountButton.titleLabel.font = [UIFont fontWithName:@"MuseoSans-300" size: 15];
    
    AccountButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
       AccountButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    
    [AccountButton addTarget:self action:@selector(SyncButtonScreen) forControlEvents:UIControlEventTouchUpInside];
    
    AccountButton.backgroundColor=[UIColor whiteColor];
    
    [SettingScrollView addSubview:AccountButton];

    
    [SettingScreen removeFromSuperview];
    SettingScreen=nil;
    
    SettingScreen=[[UIButton alloc]initWithFrame:CGRectMake(0, AccountButton.frame.size.height+AccountButton.frame.origin.y,[UIImage imageNamed:@"listviewsbutton.png"].size.width ,[UIImage imageNamed:@"listviewsbutton.png"].size.height)];
    
    
    [SettingScreen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [SettingScreen setTitle:@"Legal & Privacy" forState:(UIControlState)UIControlStateNormal];
    
    [SettingScreen setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    SettingScreen.titleLabel.font = [UIFont fontWithName:@"MuseoSans-300" size: 15];
    SettingScreen.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    SettingScreen.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    SettingScreen.backgroundColor=[UIColor whiteColor];
    
    [SettingScreen addTarget:self action:@selector(SyncButtonScreen) forControlEvents:UIControlEventTouchUpInside];
    
    [SettingScrollView addSubview:SettingScreen];

    
    [HelpButtonScreen removeFromSuperview];
    HelpButtonScreen=nil;
    
    HelpButtonScreen=[[UIButton alloc]initWithFrame:CGRectMake(0, SettingScreen.frame.size.height+SettingScreen.frame.origin.y,320 ,65)];
    
    [HelpButtonScreen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [HelpButtonScreen setTitle:@"App Version 1.0" forState:(UIControlState)UIControlStateNormal];
    
    HelpButtonScreen.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    HelpButtonScreen.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    HelpButtonScreen.titleLabel.font = [UIFont fontWithName:@"MuseoSans-300" size: 15];

    
    
    HelpButtonScreen.backgroundColor=[UIColor whiteColor];
    
    [HelpButtonScreen addTarget:self action:@selector(SyncButtonScreen) forControlEvents:UIControlEventTouchUpInside];
    
    [SettingScrollView addSubview:HelpButtonScreen];

    
    
    [LegalButton removeFromSuperview];
    LegalButton=nil;
    
    LegalButton=[[UIButton alloc]initWithFrame:CGRectMake(0, HelpButtonScreen.frame.size.height+HelpButtonScreen.frame.origin.y,[UIImage imageNamed:@"listviewsbutton.png"].size.width ,[UIImage imageNamed:@"listviewsbutton.png"].size.height)];
    
    [LegalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      LegalButton.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [LegalButton setTitle:@"Feedback" forState:(UIControlState)UIControlStateNormal];
    [LegalButton setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    LegalButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    LegalButton.titleLabel.font = [UIFont fontWithName:@"MuseoSans-300" size: 15];
    
    [LegalButton addTarget:self action:@selector(SyncButtonScreen) forControlEvents:UIControlEventTouchUpInside];
    
    LegalButton.backgroundColor=[UIColor whiteColor];
    
    [SettingScrollView addSubview:LegalButton];
    
   
//    [LogOutButton removeFromSuperview];
//    LogOutButton=nil;
//    
//    LogOutButton=[[UIButton alloc]initWithFrame:CGRectMake(0, LegalButton.frame.size.height+LegalButton.frame.origin.y+0.5,320 ,45)];
//    [LogOutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [LogOutButton setTitle:@"Logout" forState:(UIControlState)UIControlStateNormal];
//    LogOutButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
//    LogOutButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    [LogOutButton addTarget:self action:@selector(LogoutButtonScreen) forControlEvents:UIControlEventTouchUpInside];
//    LogOutButton.backgroundColor=[UIColor whiteColor];
//    [SettingScrollView addSubview:LogOutButton];
    
#pragma mark BottomView
    
    BottomView=[[UIView alloc]init];
    

    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            BottomView.frame=CGRectMake(0, 520, 320, 49);
            sycnButton.frame=CGRectMake(0, 175,320 ,50);
            SettingScrollView.frame=CGRectMake(0, sycnButton.frame.size.height+sycnButton.frame.origin.y+10, self.view.frame.size.width, 283);
            SettingScrollView.contentSize=CGSizeMake(self.view.frame.size.width, 330);
        }
        else
        {
            BottomView.frame=CGRectMake(0, 432, 320, 49);
            sycnButton.frame=CGRectMake(0, 140,320 ,50);
            SettingScrollView.frame=CGRectMake(0, sycnButton.frame.size.height+sycnButton.frame.origin.y+10, self.view.frame.size.width, 230);
            SettingScrollView.contentSize=CGSizeMake(self.view.frame.size.width, 290);
    }
    }
    [self.view addSubview:SettingScrollView];
    
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
             horizontalLIneView.frame = CGRectMake(0, 432, 320, 1);
            
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
    AppointmentsBottomButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.size.width+HomeButton.frame.origin.x, 0, [UIImage imageNamed:@"appointments.png"].size.width,[UIImage imageNamed:@"appointments.png"].size.height)];//appointments_sel.png
    AppointmentsBottomButton.backgroundColor=[UIColor clearColor];//appointments.png
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
    SettingButton.backgroundColor=[UIColor clearColor];//
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings_sel.png"] forState:UIControlStateNormal];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateSelected];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateHighlighted];
    [SettingButton addTarget:self action:@selector(SettingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    SettingButton.userInteractionEnabled=FALSE;
    [BottomView addSubview:SettingButton];
    [self.view addSubview:BottomView];
}
-(void)LogoutButtonScreen{
    alertviewLogout = [[UIAlertView alloc] initWithTitle:@"Log Out" message:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil];
    alertviewLogout.tag=3;
    
    [alertviewLogout show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex==0)
    {
    }
    else
        
        if(buttonIndex ==1)
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"(null)" forKey:kLoginData];
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:kLoginData];
            
            
            NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
            NSString *token = [[NSString alloc] init];
            token = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"device_token"]];
            [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"device_token"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
             MyMediViewController *MainScreen=[[MyMediViewController alloc]init];
            [self.navigationController pushViewController:MainScreen animated:YES];
            
        }
}

-(void)SyncButtonScreen{
    
}
-(void)SettingButtonAction
{
    SettingScreenViewController *settingView=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:settingView animated:NO];
}
-(void)AppointmentButtonAction{
    AppointmentCalenderViewController  *Appointmentslistview=[[AppointmentCalenderViewController alloc]init];
    [self.navigationController pushViewController:Appointmentslistview animated:NO];
}
-(void)ShortCutButtonAction{
    
}
-(void)HomeButtonAction{
    HomeScreenViewController *HomeView=[[HomeScreenViewController alloc]init];
    [self.navigationController pushViewController:HomeView animated:NO];
}
-(void)MedicalButtonAction{
    
    
}
-(void)ProfileButtonAction{
    ProfileViewController *MedialList=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:MedialList animated:NO];
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
