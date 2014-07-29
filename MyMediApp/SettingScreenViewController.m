//
//  SettingScreenViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 24/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "SettingScreenViewController.h"

@interface SettingScreenViewController ()
{
    UIView *TopBarView;
    UIButton *LogOutButto;
    UIImageView *BackGroundImageView;
    UIButton *BackButton;
    UILabel *SettingLable;
    
    UIButton *AccountType;
    UIButton *GoPremiumButton;
    UIButton *GeneralButton;
    UIButton *SecurityButton;
    UIButton *PrivacySettingButton;
    UIButton *NotificationButton;
     UIAlertView *alertviewLogout;
    
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
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
   
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    

    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    [self.view addSubview:TopBarView];
    
//    LogOutButto=[[UIButton alloc]initWithFrame:CGRectMake(270, 25, [UIImage imageNamed:@"logout_button.png"].size.width, [UIImage imageNamed:@"logout_button.png"].size.height)];
//    LogOutButto.backgroundColor=[UIColor clearColor];
//    [LogOutButto setImage:[UIImage imageNamed:@"logout_button.png"] forState:UIControlStateNormal];
//    [LogOutButto addTarget:self action:@selector(LogOutAction) forControlEvents:UIControlEventTouchUpInside];
//    [TopBarView addSubview:LogOutButto];
    
    SettingLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    SettingLable.text=@"Settings";
    SettingLable.font=[UIFont fontWithName:helveticaRegular size:18];
    SettingLable.textColor=[UIColor blackColor];
    SettingLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:SettingLable];
    [self.view addSubview:TopBarView];
    
    
//    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, [UIImage imageNamed:@"Back_pattern.png"].size.width, [UIImage imageNamed:@"Back_pattern.png"].size.height)];
//    BackGroundImageView.backgroundColor=[UIColor clearColor];
//    BackGroundImageView.image=[UIImage imageNamed:@"Back_pattern.png"];
//    BackGroundImageView.userInteractionEnabled=TRUE;
//
//    
//    AccountType=[[UIButton alloc]initWithFrame:CGRectMake(0, SettingLable.frame.size.height+SettingLable.frame.origin.y+127, 300, 40)];
//    [AccountType addTarget:self action:@selector(AccountTypeAction)
//          forControlEvents:UIControlEventTouchUpInside];
//    [AccountType setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    AccountType.backgroundColor=[UIColor colorWithRed:161/255.0 green:207/255.0 blue:223/255.0 alpha:1.0];
//    AccountType.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    AccountType.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [AccountType setTitle:@"Account Type" forState:(UIControlState)UIControlStateNormal];
//    AccountType.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    [BackGroundImageView addSubview:AccountType];
//    
//    
//    GoPremiumButton=[[UIButton alloc]initWithFrame:CGRectMake(0, AccountType.frame.size.height+AccountType.frame.origin.y, 300, 40)];
//    [GoPremiumButton addTarget:self action:@selector(GoPremimuAction)
//          forControlEvents:UIControlEventTouchUpInside];
//    [GoPremiumButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    GoPremiumButton.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
//    GoPremiumButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    GoPremiumButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [GoPremiumButton setTitle:@"Go Premimum" forState:(UIControlState)UIControlStateNormal];
//    GoPremiumButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    [BackGroundImageView addSubview:GoPremiumButton];
//
//    
//    GeneralButton=[[UIButton alloc]initWithFrame:CGRectMake(0, GoPremiumButton.frame.size.height+GoPremiumButton.frame.origin.y+50, 300, 40)];
//    [GeneralButton addTarget:self action:@selector(GeneralAction)
//              forControlEvents:UIControlEventTouchUpInside];
//    [GeneralButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    GeneralButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:174/255.0 blue:216/255.0 alpha:1.0];
//    GeneralButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    GeneralButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [GeneralButton setTitle:@"General" forState:(UIControlState)UIControlStateNormal];
//    GeneralButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    [BackGroundImageView addSubview:GeneralButton];
//    
//    SecurityButton=[[UIButton alloc]initWithFrame:CGRectMake(0, GeneralButton.frame.size.height+GeneralButton.frame.origin.y, 300, 40)];
//    [SecurityButton addTarget:self action:@selector(SecurityAction)forControlEvents:UIControlEventTouchUpInside];
//    [SecurityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    SecurityButton.backgroundColor=[UIColor colorWithRed:20/255.0 green:161/255.0 blue:211/255.0 alpha:1.0];
//    SecurityButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    SecurityButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [SecurityButton setTitle:@"Security" forState:(UIControlState)UIControlStateNormal];
//    SecurityButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    [BackGroundImageView addSubview:SecurityButton];
//    
//    
//    PrivacySettingButton=[[UIButton alloc]initWithFrame:CGRectMake(0, SecurityButton.frame.size.height+SecurityButton.frame.origin.y, 300, 40)];
//    [PrivacySettingButton addTarget:self action:@selector(PrivacyAction)forControlEvents:UIControlEventTouchUpInside];
//    [PrivacySettingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    PrivacySettingButton.backgroundColor=[UIColor colorWithRed:2/255.0 green:145/255.0 blue:195/255.0 alpha:1.0];
//    PrivacySettingButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    PrivacySettingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [PrivacySettingButton setTitle:@"Privacy Setting" forState:(UIControlState)UIControlStateNormal];
//    PrivacySettingButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    [BackGroundImageView addSubview:PrivacySettingButton];
//    
//    NotificationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, PrivacySettingButton.frame.size.height+PrivacySettingButton.frame.origin.y, 300, 40)];
//    [NotificationButton addTarget:self action:@selector(NotificationAction)forControlEvents:UIControlEventTouchUpInside];
//    [NotificationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    NotificationButton.backgroundColor=[UIColor colorWithRed:20/255.0 green:161/255.0 blue:211/255.0 alpha:1.0];
//    NotificationButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    NotificationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [NotificationButton setTitle:@"Notification" forState:(UIControlState)UIControlStateNormal];
//    NotificationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    [BackGroundImageView addSubview:NotificationButton];
//    [self.view addSubview:BackGroundImageView];
}
-(void)LogOutAction{
    
    
    
    
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
                
                
                ApplifyViewController *MainScreen=[[ApplifyViewController alloc]init];
                [self.navigationController pushViewController:MainScreen animated:YES];

            }
}


-(void)AccountTypeAction{
    [[soundManager shared]buttonSound];
}
-(void)BackButtonAction{
    [[soundManager shared]buttonSound];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)GoPremimuAction{
    [[soundManager shared]buttonSound];
}
-(void)GeneralAction{
    [[soundManager shared]buttonSound];
}
-(void)SecurityAction{
    [[soundManager shared]buttonSound];
}
-(void)PrivacyAction{
    [[soundManager shared]buttonSound];
}
-(void)NotificationAction{
    [[soundManager shared]buttonSound];
//    UIButton *abc=[[UIButton alloc]initWithFrame:CGRectMake(20, 50, 40, 40)];
//    abc.backgroundColor=[UIColor clearColor];
//    [abc setTitle:@"checking" forState:UIControlStateNormal];
//    [abc setTitle:@"not checking" forState:UIControlStateHighlighted];
//    [abc setTitle:@"going on" forState:UIControlStateSelected];
//    [self.view addSubview: abc];


    UIImageView *TestingImage=[[UIImageView alloc]initWithFrame:CGRectMake(20, 40, 40, 40)];
    TestingImage.backgroundColor=[UIColor clearColor];
    [self.view addSubview:TestingImage];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    
    TopBarView=nil;
    [TopBarView removeFromSuperview];
    BackButton=nil;
    [BackButton removeFromSuperview];
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
