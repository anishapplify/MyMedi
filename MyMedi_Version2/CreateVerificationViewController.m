//
//  CreateVerificationViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 07/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "CreateVerificationViewController.h"

@interface CreateVerificationViewController ()
{
    
    UIImageView *StaticImageView;
    UIButton *LogInButton;
    UIButton *ResendInButton;
    UIView *TopBarView;
    UIButton *BackButton;
    UILabel *CreateAccountLable;
    UIView *TopLineView;
    UILabel *ThankYouMessageLable;
    UILabel *DescriptionYouMessageLable;
}

@end

@implementation CreateVerificationViewController

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
    
    [StaticImageView removeFromSuperview];
    StaticImageView=nil;
    StaticImageView=[[UIImageView alloc]init];
    [self.view addSubview:StaticImageView];
    
    
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,64)];
    TopBarView.backgroundColor=[UIColor clearColor];
    TopBarView.userInteractionEnabled=TRUE;
    
    [BackButton removeFromSuperview];
    BackButton=nil;
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(0,15,[UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
    [BackButton setBackgroundImage:[UIImage imageNamed:@"back_Button_image.png"] forState:UIControlStateNormal];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    [CreateAccountLable removeFromSuperview];
    CreateAccountLable=nil;
    CreateAccountLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 23, 150, 30)];
    CreateAccountLable.font=[UIFont fontWithName:helveticaRegular size:20];
    CreateAccountLable.textColor=[UIColor whiteColor];
    CreateAccountLable.textAlignment=NSTextAlignmentCenter;
    CreateAccountLable.text=@"Email verify";
    [TopBarView addSubview:CreateAccountLable];
    
    
    [TopLineView removeFromSuperview];
    TopLineView=nil;
    TopLineView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, self.view.frame.size.width, 1)];
    TopLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    TopLineView.layer.borderWidth = 0.5f;
    TopLineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:TopLineView];

    
    [StaticImageView addSubview:TopBarView];
    
    
    
    [ThankYouMessageLable removeFromSuperview];
    ThankYouMessageLable=nil;
    ThankYouMessageLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 30)];
    ThankYouMessageLable.font=[UIFont fontWithName:helveticaRegular size:15];
    ThankYouMessageLable.textColor=[UIColor whiteColor];
    ThankYouMessageLable.textAlignment=NSTextAlignmentCenter;
    ThankYouMessageLable.backgroundColor=[UIColor clearColor];
    ThankYouMessageLable.text=@"Thank you! Just one more step...";
    [StaticImageView addSubview:ThankYouMessageLable];
    
    [DescriptionYouMessageLable removeFromSuperview];
    DescriptionYouMessageLable=nil;
    DescriptionYouMessageLable=[[UILabel alloc]initWithFrame:CGRectMake(20, ThankYouMessageLable.frame.size.height+ThankYouMessageLable.frame.origin.y+80, 300, 100)];
    DescriptionYouMessageLable.font=[UIFont fontWithName:helveticaRegular size:13];
    DescriptionYouMessageLable.textColor=[UIColor whiteColor];
    DescriptionYouMessageLable.textAlignment=NSTextAlignmentLeft;
    DescriptionYouMessageLable.numberOfLines=2;
    DescriptionYouMessageLable.backgroundColor=[UIColor clearColor];
    DescriptionYouMessageLable.text=@"Check the confirmation link we emailed you to\nactivate your account and start using MyMedi.";
    [StaticImageView addSubview:DescriptionYouMessageLable];

   
    
    //
    
    [LogInButton removeFromSuperview];
    LogInButton=nil;
    
    
    [ResendInButton removeFromSuperview];
    ResendInButton=nil;
    
    LogInButton=[[UIButton alloc]init];
    ResendInButton=[[UIButton alloc]init];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            StaticImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone5.png"].size.height);
            StaticImageView.image=[UIImage imageNamed:@"MainBackGround_iphone5.png"];
            LogInButton.frame = CGRectMake(35, 400, [UIImage imageNamed:@"mymediloginbutton.png"].size.width, [UIImage imageNamed:@"mymediloginbutton.png"].size.height);
            ResendInButton.frame = CGRectMake(60, LogInButton.frame.size.height+LogInButton.frame.origin.y+5, 200, 30);
          
        }
        else
        {
        StaticImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone4.png"].size.height);
        StaticImageView.image=[UIImage imageNamed:@"MainBackGround_iphone4.png"];
        LogInButton.frame = CGRectMake(35, 300, [UIImage imageNamed:@"mymediloginbutton.png"].size.width, [UIImage imageNamed:@"mymediloginbutton.png"].size.height);
        ResendInButton.frame = CGRectMake(60, LogInButton.frame.size.height+LogInButton.frame.origin.y+5, 200, 30);
            
        }
    }
    [LogInButton setBackgroundImage:[UIImage imageNamed:@"mymediloginbutton.png"] forState:UIControlStateNormal];
    [LogInButton addTarget:self action:@selector(LogInButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [LogInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [StaticImageView addSubview:LogInButton];
    
    [ResendInButton addTarget:self action:@selector(ResendButtonAction) forControlEvents:UIControlEventTouchUpInside];
    ResendInButton.backgroundColor=[UIColor clearColor];
    [ResendInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ResendInButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [ResendInButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [ResendInButton setTitle:@"Resend confirmation email." forState:UIControlStateNormal];
    ResendInButton.titleLabel.font = [UIFont fontWithName:@"MuseoSans-500" size: 15];
    [StaticImageView addSubview:ResendInButton];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)ResendButtonAction{
    
}
-(void)BackVeiwController{
    
}
-(void)LogInButtonAction{
    
    [self ShowActivityIndicatorWithTitle:@"Loading..."];
    [self performSelector:@selector(loginVerifyEmailOrNOT) withObject:nil afterDelay:0.1];
    
}
-(void)loginVerifyEmailOrNOT
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
        
        [manager POST:[NSString stringWithFormat:@"%@/get_is_verified_user_status",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
         
         {
             NSLog(@"JSON--->%@",json);
             if([json objectForKey:@"error"])
             {
                 UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                 [myAlertView show];
             }
             else
             {
                 
               HomeScreenViewController *listAppointment=[[HomeScreenViewController alloc]init];
              [self.navigationController pushViewController:listAppointment animated:YES];
                 
                 
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
