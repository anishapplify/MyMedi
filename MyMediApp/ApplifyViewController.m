//
//  ApplifyViewController.m
//  MyMediApp
//
//  Created by Guest User on 09/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "ApplifyViewController.h"
@interface ApplifyViewController ()
{
    UIView *lineView;
    UIButton*CreateButton;
    UIButton*SignButton;

    UIScrollView *ImageScrollView;
    UIPageControl *pageControl;
    
    UIImageView *FirstHomeImageView;
    UIImageView *SecondHomeImageView;
    UIImageView *ThirdHomeImageView;
    UIView *BottomHomeView;
    UIImageView *SplashImageView;
}

@end

@implementation ApplifyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];

    if([[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] valueForKey:@"accesstoken"])
    {
        
        SplashImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, [UIImage imageNamed:@"SplashScreen.png"].size.height)];
        SplashImageView.image=[UIImage imageNamed:@"SplashScreen.png"];
        [self.view addSubview:SplashImageView];
        
        
        
     //SortScreenViewController  *veri=[[SortScreenViewController  alloc]init];
     // [self.navigationController pushViewController:veri animated:YES];
        
      // CreateNewAppointmentViewController *veri=[[CreateNewAppointmentViewController  alloc]init];
      //[self.navigationController pushViewController:veri animated:YES];
        
        
     [self performSelector:@selector(loginVerifyEmailOrNOT) withObject:nil afterDelay:0.1];
    }
    else
    {
        ImageScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 480)];
        ImageScrollView.backgroundColor=[UIColor clearColor];
        ImageScrollView.pagingEnabled=TRUE;
        ImageScrollView.delegate=self;
        [ImageScrollView setContentSize:CGSizeMake(960, 460)];
        ImageScrollView.showsHorizontalScrollIndicator=NO;
        ImageScrollView.showsVerticalScrollIndicator=NO;
        
        FirstHomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320,480)];
        FirstHomeImageView.image=[UIImage imageNamed:@"home_mymedi.jpg"];
        [ImageScrollView addSubview:FirstHomeImageView];
        
        SecondHomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(FirstHomeImageView.frame.size.width+FirstHomeImageView.frame.origin.x,0, 320, 480)];
        SecondHomeImageView.image=[UIImage imageNamed:@"cloud.jpg"];
        [ImageScrollView addSubview:SecondHomeImageView];
        
        ThirdHomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(SecondHomeImageView.frame.size.width+SecondHomeImageView.frame.origin.x,0, 320, 480)];
        ThirdHomeImageView.image=[UIImage imageNamed:@"secure.jpg"];
        [ImageScrollView addSubview:ThirdHomeImageView];
        [self.view addSubview:ImageScrollView];
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(130, 460, 50, 30)];
        pageControl.numberOfPages = 3;
        pageControl.backgroundColor=[UIColor clearColor];
        pageControl.pageIndicatorTintColor = [UIColor blackColor];
        pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        [self.view addSubview:pageControl];
        
        BottomHomeView=[[UIView alloc]initWithFrame:CGRectMake(0, 505, self.view.frame.size.width,65)];
        BottomHomeView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
        BottomHomeView.userInteractionEnabled=TRUE;
        
        SignButton=[[UIButton alloc]initWithFrame:CGRectMake(17, 13, 140, 40)];
        SignButton.backgroundColor=[UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1.0];
        [SignButton addTarget:self action:@selector(SignInButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [SignButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [SignButton setTitle:@"Log In" forState:UIControlStateNormal];
        SignButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
        [SignButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [SignButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        SignButton.clipsToBounds = YES;
        SignButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        SignButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        SignButton.layer.cornerRadius = 5;
        [BottomHomeView addSubview:SignButton];

        CreateButton=[UIButton buttonWithType:UIButtonTypeCustom];
        CreateButton.frame=CGRectMake(SignButton.frame.size.width+SignButton.frame.origin.x+5, 13, 140, 40);
        CreateButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
        [CreateButton setTitle:@"Sign Up" forState:UIControlStateNormal];
         [CreateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [CreateButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [CreateButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        CreateButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
        CreateButton.clipsToBounds = YES;
        CreateButton.layer.cornerRadius=5;
        CreateButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        CreateButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [CreateButton addTarget:self action:@selector(createButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [BottomHomeView addSubview:CreateButton];
        [self.view addSubview:BottomHomeView];
        
    }
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
                     NSLog(@"login data=%@",[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData]valueForKey:@"user"]);
                    [[NSUserDefaults standardUserDefaults] synchronize];
            
                    UserHomeScreenViewController *veri=[[UserHomeScreenViewController  alloc]init];
                    [self.navigationController pushViewController:veri animated:YES];
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
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    pageControl.currentPage=page;
}
-(void)createButtonAction
{
     [[soundManager shared] buttonSound];
     CreateAccountViewController *CreateAccount=[[CreateAccountViewController alloc]init];
    [self.navigationController pushViewController:CreateAccount animated:YES];
}
-(void)SignInButtonAction{
    [[soundManager shared] buttonSound];
    LoginViewController *LoginViewControllerPass=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:LoginViewControllerPass animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(void)dealloc
{
    
    [BottomHomeView removeFromSuperview];
    [lineView removeFromSuperview];
    
    [CreateButton removeFromSuperview];
    [SignButton removeFromSuperview];
    
    [ImageScrollView removeFromSuperview];
    [pageControl removeFromSuperview];
    [FirstHomeImageView removeFromSuperview];
    [SecondHomeImageView removeFromSuperview];
    [ThirdHomeImageView removeFromSuperview];
    
    BottomHomeView=nil;
    lineView=nil;
    CreateButton=nil;
    SignButton=nil;
    ImageScrollView=nil;
    pageControl=nil;
    FirstHomeImageView=nil;
    SecondHomeImageView=nil;
    ThirdHomeImageView=nil;
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
             if([[json objectForKey:@"error"] isEqualToString:@"Registeration is not confirmed. Please check your email for confirmation."])
             {
                 [SplashImageView removeFromSuperview];
                 
                 ImageScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 480)];
                 ImageScrollView.backgroundColor=[UIColor clearColor];
                 ImageScrollView.pagingEnabled=TRUE;
                 ImageScrollView.delegate=self;
                 [ImageScrollView setContentSize:CGSizeMake(960, 460)];
                 ImageScrollView.showsHorizontalScrollIndicator=NO;
                 ImageScrollView.showsVerticalScrollIndicator=NO;
                 
                 FirstHomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320,480)];
                 FirstHomeImageView.image=[UIImage imageNamed:@"home_mymedi.jpg"];
                 [ImageScrollView addSubview:FirstHomeImageView];
                 
                 SecondHomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(FirstHomeImageView.frame.size.width+FirstHomeImageView.frame.origin.x,0, 320, 480)];
                 SecondHomeImageView.image=[UIImage imageNamed:@"cloud.jpg"];
                 [ImageScrollView addSubview:SecondHomeImageView];
                 
                 ThirdHomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(SecondHomeImageView.frame.size.width+SecondHomeImageView.frame.origin.x,0, 320, 480)];
                 ThirdHomeImageView.image=[UIImage imageNamed:@"secure.jpg"];
                 [ImageScrollView addSubview:ThirdHomeImageView];
                 [self.view addSubview:ImageScrollView];
                 
                 pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(130, 460, 50, 30)];
                 pageControl.numberOfPages = 3;
                 pageControl.backgroundColor=[UIColor clearColor];
                 pageControl.pageIndicatorTintColor = [UIColor blackColor];
                 pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
                 [self.view addSubview:pageControl];
                 
                 BottomHomeView=[[UIView alloc]initWithFrame:CGRectMake(0, 505, self.view.frame.size.width,65)];
                 BottomHomeView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
                 BottomHomeView.userInteractionEnabled=TRUE;
                 
                 SignButton=[[UIButton alloc]initWithFrame:CGRectMake(17, 13, 140, 40)];
                 SignButton.backgroundColor=[UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1.0];
                 [SignButton addTarget:self action:@selector(SignInButtonAction) forControlEvents:UIControlEventTouchUpInside];
                 [SignButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                 [SignButton setTitle:@"Log In" forState:UIControlStateNormal];
                 SignButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
                 [SignButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
                 [SignButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
                 SignButton.clipsToBounds = YES;
                 SignButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                 SignButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                 SignButton.layer.cornerRadius = 5;
                 [BottomHomeView addSubview:SignButton];
                 
                 CreateButton=[UIButton buttonWithType:UIButtonTypeCustom];
                 CreateButton.frame=CGRectMake(SignButton.frame.size.width+SignButton.frame.origin.x+5, 13, 140, 40);
                 CreateButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
                 [CreateButton setTitle:@"Sign Up" forState:UIControlStateNormal];
                 [CreateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                 [CreateButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
                 [CreateButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
                 CreateButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
                 CreateButton.clipsToBounds = YES;
                 CreateButton.layer.cornerRadius=5;
                 CreateButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                 CreateButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
                 [CreateButton addTarget:self action:@selector(createButtonAction) forControlEvents:UIControlEventTouchUpInside];
                 [BottomHomeView addSubview:CreateButton];
                 [self.view addSubview:BottomHomeView];
             }
             else
             {
                 
                   [self performSelector:@selector(loginWithAccessToken) withObject:nil afterDelay:0.1];
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
