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
    self.view.backgroundColor=[UIColor colorWithRed:224/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
   
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
     UIImage * backImg = [UIImage imageNamed:@"back_mymediNew.png"];
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 35,backImg.size.width ,backImg.size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setImage:backImg forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    [self.view addSubview:TopBarView];
    
    
    
    LogOutButto=[[UIButton alloc]initWithFrame:CGRectMake(260, 35, 50, 25)];
    LogOutButto.backgroundColor=[UIColor clearColor];
    [LogOutButto setTitle:@"Logout" forState:UIControlStateNormal];
     LogOutButto.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [LogOutButto addTarget:self action:@selector(LogOutAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:LogOutButto];
    
    SettingLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 30, 150, 30)];
    SettingLable.text=@"Setting";
    SettingLable.font=[UIFont fontWithName:@"Comfortaa-Bold" size:15];
    SettingLable.textColor=[UIColor whiteColor];
    SettingLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:SettingLable];
    [self.view addSubview:TopBarView];
    
    
    UIImage *BackGroundImage=[UIImage imageNamed:@"Back_pattern.png"];
    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, BackGroundImage.size.width, BackGroundImage.size.height)];
    BackGroundImageView.backgroundColor=[UIColor clearColor];
    BackGroundImageView.image=BackGroundImage;
    BackGroundImageView.userInteractionEnabled=TRUE;


    
    AccountType=[[UIButton alloc]initWithFrame:CGRectMake(0, SettingLable.frame.size.height+SettingLable.frame.origin.y+127, 300, 40)];
    [AccountType addTarget:self action:@selector(AccountTypeAction)
          forControlEvents:UIControlEventTouchUpInside];
    [AccountType setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    AccountType.backgroundColor=[UIColor colorWithRed:161/255.0 green:207/255.0 blue:223/255.0 alpha:1.0];
    AccountType.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    AccountType.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [AccountType setTitle:@"Account Type" forState:(UIControlState)UIControlStateNormal];
    AccountType.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:AccountType];
    
    
    GoPremiumButton=[[UIButton alloc]initWithFrame:CGRectMake(0, AccountType.frame.size.height+AccountType.frame.origin.y, 300, 40)];
    [GoPremiumButton addTarget:self action:@selector(GoPremimuAction)
          forControlEvents:UIControlEventTouchUpInside];
    [GoPremiumButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    GoPremiumButton.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
    GoPremiumButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    GoPremiumButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [GoPremiumButton setTitle:@"Go Premimum" forState:(UIControlState)UIControlStateNormal];
    GoPremiumButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:GoPremiumButton];

    
    GeneralButton=[[UIButton alloc]initWithFrame:CGRectMake(0, GoPremiumButton.frame.size.height+GoPremiumButton.frame.origin.y+50, 300, 40)];
    [GeneralButton addTarget:self action:@selector(GeneralAction)
              forControlEvents:UIControlEventTouchUpInside];
    [GeneralButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 GeneralButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:174/255.0 blue:216/255.0 alpha:1.0];
    GeneralButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    GeneralButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [GeneralButton setTitle:@"General" forState:(UIControlState)UIControlStateNormal];
    GeneralButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:GeneralButton];
    
    SecurityButton=[[UIButton alloc]initWithFrame:CGRectMake(0, GeneralButton.frame.size.height+GeneralButton.frame.origin.y, 300, 40)];
    [SecurityButton addTarget:self action:@selector(SecurityAction)
            forControlEvents:UIControlEventTouchUpInside];
    [SecurityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      SecurityButton.backgroundColor=[UIColor colorWithRed:20/255.0 green:161/255.0 blue:211/255.0 alpha:1.0];
    SecurityButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    SecurityButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [SecurityButton setTitle:@"Security" forState:(UIControlState)UIControlStateNormal];
    SecurityButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:SecurityButton];
    
    
    PrivacySettingButton=[[UIButton alloc]initWithFrame:CGRectMake(0, SecurityButton.frame.size.height+SecurityButton.frame.origin.y, 300, 40)];
    [PrivacySettingButton addTarget:self action:@selector(PrivacyAction)
             forControlEvents:UIControlEventTouchUpInside];
    [PrivacySettingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    PrivacySettingButton.backgroundColor=[UIColor colorWithRed:2/255.0 green:145/255.0 blue:195/255.0 alpha:1.0];
    PrivacySettingButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    PrivacySettingButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [PrivacySettingButton setTitle:@"Privacy Setting" forState:(UIControlState)UIControlStateNormal];
    PrivacySettingButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:PrivacySettingButton];
    
    NotificationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, PrivacySettingButton.frame.size.height+PrivacySettingButton.frame.origin.y, 300, 40)];
    [NotificationButton addTarget:self action:@selector(NotificationAction)
                   forControlEvents:UIControlEventTouchUpInside];
    [NotificationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      NotificationButton.backgroundColor=[UIColor colorWithRed:20/255.0 green:161/255.0 blue:211/255.0 alpha:1.0];
    NotificationButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    NotificationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NotificationButton setTitle:@"Notification" forState:(UIControlState)UIControlStateNormal];
    NotificationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:NotificationButton];

    [self.view addSubview:BackGroundImageView];
}
-(void)LogOutAction{
    
    [[soundManager shared]buttonSound];
    ApplifyViewController *MainScreen=[[ApplifyViewController alloc]init];
    [self.navigationController pushViewController:MainScreen animated:YES];
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
