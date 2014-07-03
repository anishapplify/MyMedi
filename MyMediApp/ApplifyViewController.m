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
    
    UIView *TopBarView;
    UIView *lineView;
    
    UIButton*CreateButton;
    UIButton*SignButton;

    UIScrollView *ImageScrollView;
    UIPageControl *pageControl;
    UIImageView *HomeImageView;
    UIImageView *SecondHomeImageView;
    UIImage *HomeImage;
    UIImage *HomeImageSecond;
}

@end

@implementation ApplifyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"height=%f",self.view.frame.size.height);
     NSLog(@"height=%f",self.view.frame.size.width);
    
    self.view.backgroundColor=[UIColor blackColor];
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    CreateButton=[UIButton buttonWithType:UIButtonTypeCustom];
    CreateButton.frame=CGRectMake(135, 35, 110, 30);
    CreateButton.backgroundColor=[UIColor clearColor];
    [CreateButton setTitle:@"CREATE ACCOUNT" forState:UIControlStateNormal];
    [CreateButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [CreateButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    CreateButton.titleLabel.font = [UIFont fontWithName:@"Comfortaa" size: 13];
    [CreateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CreateButton.clipsToBounds = YES;
    [CreateButton addTarget:self action:@selector(createButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:CreateButton];
    
    
    lineView=[[UIView alloc]initWithFrame:CGRectMake(CreateButton.frame.size.width+CreateButton.frame.origin.x+7,40,1,20)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 2.0f;
    [TopBarView addSubview:lineView];
    
    SignButton=[[UIButton alloc]initWithFrame:CGRectMake(CreateButton.frame.origin.x+CreateButton.frame.size.width+9, 35, 60, 30)];
    SignButton.backgroundColor=[UIColor clearColor];
    [SignButton addTarget:self action:@selector(SignInButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [SignButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [SignButton setTitle:@"SIGN IN" forState:UIControlStateNormal];
    SignButton.titleLabel.font = [UIFont fontWithName:@"Comfortaa" size: 13];
    [SignButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [SignButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    SignButton.clipsToBounds = YES;
    [TopBarView addSubview:SignButton];
    [self.view addSubview:TopBarView];
    
    
    HomeImage=[UIImage imageNamed:@"FirstHomeScreenScroll.jpg"];
    HomeImageSecond=[UIImage imageNamed:@"SecondHomeScreen.jpg"];
    
    ImageScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.origin.y+TopBarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    ImageScrollView.backgroundColor=[UIColor clearColor];
    ImageScrollView.pagingEnabled=TRUE;
    ImageScrollView.delegate=self;
    [ImageScrollView setContentSize:CGSizeMake(640, self.view.frame.size.height)];
    ImageScrollView.showsHorizontalScrollIndicator=NO;
    
    HomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, -30, 320, self.view.frame.size.height)];
    HomeImageView.image=HomeImage;
    
    SecondHomeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(HomeImageView.frame.size.width+HomeImageView.frame.origin.x,-30, 320, self.view.frame.size.height)];
    SecondHomeImageView.image=HomeImageSecond;
    [ImageScrollView addSubview:HomeImageView];
    [ImageScrollView addSubview:SecondHomeImageView];
    [self.view addSubview:ImageScrollView];
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(130, 530, 50, 30)];
    pageControl.numberOfPages = 2;
    pageControl.backgroundColor=[UIColor clearColor];
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:pageControl];
    
  //UserHomeScreenViewController  *listAppointment=[[UserHomeScreenViewController alloc]init];
  //[self.navigationController pushViewController:listAppointment animated:YES];
    
}
-(void)startOffline{
    
}
-(void)loginWithAccessToken{
    
    [self ShowActivityIndicatorWithTitle:@"Loading..."];
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        alertview3.tag = 69;
        [alertview3 show];
    }
    else
    {
       
        NSString *post =[NSString stringWithFormat:@"access_token=%@",@""];
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=email_login",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        // NSLog(@"data=%@",data);
        if (data)
        {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            NSLog(@"JSON%@",json);
            if([json valueForKey:@"error"])
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                alertview3.tag = 1;
                [alertview3 show];
            }
            else if([json objectForKey:@"data"])
            {
                NSArray *dataArray = [[NSArray alloc] initWithArray:[json objectForKey:@"data"]];
                NSDictionary *data = [[NSDictionary alloc] initWithDictionary:[dataArray objectAtIndex:0]];
                NSLog(@"%@",data);
                
                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"access_token"] forKey:@"token"];
                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_image"] forKey:@"userImage"];
                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_name"] forKey:@"userName"];
                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_email"] forKey:@"userEmail"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                NSLog(@"user name=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"token"]);
                NSLog(@"userName=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"userName"]);
                NSLog(@"userEmail=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"userEmail"]);
                
               // UserHomeScreenViewController *ListOfAppointment=[[UserHomeScreenViewController alloc]init];
               // [self.navigationController pushViewController:ListOfAppointment animated:YES];
                
                [self HideActivityIndicator];
            }
        }
    }
}
-(void)viewWillAppear:(BOOL)animated{
    
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"access_token"])
    {
        Reachability *reach = [Reachability reachabilityForInternetConnection];
        NetworkStatus netStatus = [reach currentReachabilityStatus];
        if (netStatus == NotReachable)
        {
           // [self startOffline];
        }
        else
        {
           // [self loginWithAccessToken];
        }
    }
    else{
        
        //UserHomeScreenViewController *creat=[[UserHomeScreenViewController alloc]init];
        //[self.navigationController pushViewController:creat animated:YES];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    pageControl.currentPage=page;
}
-(void)createButtonAction{
    
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


@end
