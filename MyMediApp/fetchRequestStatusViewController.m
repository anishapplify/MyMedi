//
//  fetchRequestStatusViewController.m
//  MiniLuxe_ Customer
//
//  Created by Click Labs on 4/7/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//

#import "fetchRequestStatusViewController.h"
#import "Reachability.h"
#import "requestStartedViewController.h"
#import "selectLocationViewController.h"
#import "totalBillViewController.h"
@interface fetchRequestStatusViewController ()

@end

@implementation fetchRequestStatusViewController
{
    requestStartedViewController *technicianReady;
}

@synthesize engageId;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterforeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
}
- (void)viewDidLoad
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterforeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    

    
    backMapImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    backMapImage.image=[UIImage imageNamed:@"Back-Bay-Map-Overlay@2x.png"];
    
    count=0;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            requestingLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 200, 320, 70) ];
            
        }
        else
        {
            requestingLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 140, 320, 70) ];
            
        }
    }
    
    requestingLabel.textAlignment=NSTextAlignmentCenter;
   
    requestingLabel.text=@"Requesting a Jugnoo\nDriver...";
    
    requestingLabel.numberOfLines=2;
    
    requestingLabel.font = [UIFont fontWithName:@"Futura-Medium" size:24];
    
    requestingLabel.textColor=[UIColor whiteColor];
    
    progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    
    progressView.progressTintColor=[UIColor colorWithRed:187.0/255 green:160.0/255 blue:209.0/255 alpha:1.0];
    
    [[progressView layer]setCornerRadius:10.0f];
    
    [[progressView layer]setBorderWidth:2.0f];
    
    [[progressView layer]setMasksToBounds:TRUE];
    
    progressView.clipsToBounds = YES;
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone || UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            [[progressView layer]setFrame:CGRectMake(30, 295, 260, 25)];
            
        }
        else
        {
           [[progressView layer]setFrame:CGRectMake(30, 230, 260, 25)];
            
        }
    }
    
    
    [[progressView layer]setBorderColor:[UIColor whiteColor].CGColor];
    
    progressView.trackTintColor = [UIColor clearColor];
    
    [self.view addSubview:backMapImage];
    
    [backMapImage addSubview:requestingLabel];

    requestTimerForAPI = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(callAfterTenSecond:) userInfo:nil repeats:YES];
  
    requestTimerProgress= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
  
    
    [backMapImage addSubview:progressView];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void) callAfterTenSecond:(NSTimer*)t
{
    [self fetchRequestStatusAPICall];
}
-(void) endCallAfterTenSecond:(NSTimer*)t
{
    [self fetchEndStatusAPICall];
}
-(void) startCallAfterTenSecond:(NSTimer*)t
{
    [self fetchStartStatusAPICall];
}


- (void)fetchRequestStatusAPICall
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    
    if (netStatus == NotReachable)
    {
        [requestTimerProgress invalidate];
        requestTimerProgress=nil;
        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        alertview3.tag = 109;
        [alertview3 show];
        
        
    }
    else
    {
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@&engage_id=%d",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"],engageId];
        [[NSUserDefaults standardUserDefaults] setInteger:engageId forKey:@"engageId"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=fetch_request_status",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        
        if (data)
        {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
            if([json valueForKey:@"error"])
                
            {
                //                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                //                [alertview3 show];
                
            }
            
            else if([json objectForKey:@"log"])
            {
                
                if ([[json objectForKey:@"flag"] integerValue]==1)
                {
                    NSLog(@"Request accepted");
                    NSLog(@"%@",json);
                    
                    [requestTimerProgress invalidate];
                    requestTimerProgress= nil;
                    [requestTimerForAPI invalidate];
                    requestTimerForAPI = nil;
                    [requestTimerForAPI1 invalidate];
                    requestTimerForAPI1 = nil;
                    [RepeatRequestTimer invalidate];
                    RepeatRequestTimer = nil;
                    technicianReady=[[requestStartedViewController alloc]init];
                    technicianReady.technicianNameServer=[json objectForKey:@"driver_name"];
                    technicianReady.technicianImageServer=[json objectForKey:@"driver_image"];
                   technicianReady.technicianRatingServer=[[json objectForKey:@"rating"] integerValue];
                    
                    UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"Your Driver is coming. Please wait for sometime." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                    
                    [alertview3 show];
                  [self.navigationController pushViewController:technicianReady animated:YES];


                  
                }
                
                else if ([[json objectForKey:@"flag"] integerValue]==2)
                {
                    NSLog(@"%@",[json objectForKey:@"flag"]);
                }
                else
                {
                    NSLog(@"%@",[json objectForKey:@"log"]);
                    //etaTime=[json objectForKey:@"eta"];
                    NSLog(@"%@",[json objectForKey:@"flag"]);
                    
                }
                
            }
            
            else
            {
                //NULL Json
                //                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
                //                alertview3.tag = 70;
                //                [alertview3 show];
                
                
            }
            
            
            
        }
        else
        {
            //NULL Json
            //            UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"Something went wrong" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
            //            alertview3.tag = 71;
            //            [alertview3 show];
            
            
        }
        
    }
    
}
-(void)fetchEndStatusAPICall
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        //        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        //        alertview3.tag = 69;
        //        [alertview3 show];
        [requestTimerForAPI1 invalidate];
        requestTimerForAPI1=nil;
        
        requestTimerForAPI1 = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                             selector: @selector(endCallAfterTenSecond:) userInfo: nil repeats: YES];
        
    }
    else
    {
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@&engage_id=%ld",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"],(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"engageId"]];
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=fetch_end_status",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        
        if (data)
        {
            
            
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
          
            
            if([json valueForKey:@"error"])
                
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                
                [alertview3 show];
                
            }
            else
            {
                if ([[json objectForKey:@"flag"] integerValue]==0)
                {
                    [requestTimerForAPI1 invalidate];
                    requestTimerForAPI1=nil;
                    [requestTimerForAPI invalidate];
                    requestTimerForAPI=nil;
                    [requestTimerProgress invalidate];
                    requestTimerProgress=nil;
                    [RepeatRequestTimer invalidate];
                    RepeatRequestTimer = nil;
                  
                    count=0;
                   
                    [[NSNotificationCenter defaultCenter]removeObserver:self];
                    [[NSUserDefaults standardUserDefaults] setFloat:[[json objectForKey:@"amount"] floatValue] forKey:@"amount"];
                    [[NSUserDefaults standardUserDefaults] setFloat:[[json objectForKey:@"distance"] floatValue] forKey:@"totalDistance"];
                    [[NSUserDefaults standardUserDefaults]synchronize];
                    
                    totalBillViewController *totalBill=[[totalBillViewController alloc]init];
                    [self.navigationController pushViewController:totalBill animated:YES];
                    
                }
                else
                {
                    NSLog(@"%@",[json objectForKey:@"log"]);
                    
                }
                
            }
        }
        
        else
        {
            
            [requestTimerForAPI1 invalidate];
            requestTimerForAPI1=nil;
            requestTimerForAPI1 = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                                 selector: @selector(endCallAfterTenSecond:) userInfo: nil repeats: YES];
            
        }
        
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if((alertView.tag ==109) )
    {
        if(buttonIndex == 1)
        {
            requestTimerProgress= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
             requestTimerForAPI = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(callAfterTenSecond:) userInfo:nil repeats:YES];

        }
    }
    
    else
    {
        
    }
}

- (void)updateUI:(NSTimer *)timer
{
   count++;
    
    if (count <=20)
    {
        [progressView setProgress: (float)count/20 animated:YES];
    }
    else
    {
        [requestTimerProgress invalidate];
        requestTimerProgress= nil;
        [requestTimerForAPI invalidate];
        requestTimerForAPI = nil;
        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No Driver is free at the moment. Please wait for some time or request again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertview3 show];
        selectLocationViewController * selectLocationPage=[[selectLocationViewController alloc]init];
        [self.navigationController pushViewController:selectLocationPage animated:YES];
    }
}
-(void)pushNotificationReceived
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"pushNotificationFlag"] integerValue]==1 )
    {
        totalBillViewController *totalBillView = [[totalBillViewController alloc] init];
        NSMutableArray *allControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        
        if(allControllers.count>0){
            
            for(int i=0;i<allControllers.count;i++){
                
                id objj = [allControllers objectAtIndex:i];
                
                if([objj isKindOfClass:[totalBillView class]]){
                    
                    [allControllers removeObjectAtIndex:i];
                    
                    break;
                    
                }
                
            }}
        
        [self.navigationController setViewControllers:allControllers animated:NO];
       
      
        [requestTimerProgress invalidate];
        requestTimerProgress= nil;
        [requestTimerForAPI invalidate];
        requestTimerForAPI = nil;
        [requestTimerForAPI1 invalidate];
        requestTimerForAPI1 = nil;
        [RepeatRequestTimer invalidate];
        RepeatRequestTimer = nil;
        [self.navigationController pushViewController:totalBillView animated:NO];
    }
    else
    {
        requestStartedViewController *requestStartedView = [[requestStartedViewController alloc] init];
        NSMutableArray *allControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
        
        if(allControllers.count>0){
            
            for(int i=0;i<allControllers.count;i++){
                
                id objj = [allControllers objectAtIndex:i];
                
                if([objj isKindOfClass:[requestStartedView class]]){
                    
                    [allControllers removeObjectAtIndex:i];
                    
                    break;
                    
                }
                
            }}
        
        [self.navigationController setViewControllers:allControllers animated:NO];
        [requestTimerProgress invalidate];
        requestTimerProgress= nil;
        [requestTimerForAPI invalidate];
        requestTimerForAPI = nil;
        [requestTimerForAPI1 invalidate];
        requestTimerForAPI1 = nil;
        [RepeatRequestTimer invalidate];
        RepeatRequestTimer = nil;
        [self.navigationController pushViewController:requestStartedView animated:NO];
    }
}

-(void)enterforeground
{
  
   //[self performSelector:@selector(foregr) withObject:nil afterDelay:4.0];
    [self foregr];
    
}
-(void)foregr
{
    
//    if([[NSUserDefaults standardUserDefaults] integerForKey:@"isPushNotification"]==1)
//    {
//        UIAlertView *token=[[UIAlertView alloc]initWithTitle:@"isPushNotification" message:[NSString stringWithFormat:@"%ld",(long)[[NSUserDefaults  standardUserDefaults] integerForKey:@"isPushNotification"]]  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [token show];
//        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushNotificationReceived) name:@"pushNotification" object:nil];
//    }
//   else
//    {
        [requestTimerProgress invalidate];
        requestTimerProgress= nil;
        [requestTimerForAPI invalidate];
        requestTimerForAPI = nil;
        [requestTimerForAPI1 invalidate];
        requestTimerForAPI1 = nil;
    [RepeatRequestTimer invalidate];
    RepeatRequestTimer = nil;
    
        requestTimerProgress= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
        requestTimerForAPI = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(callAfterTenSecond:) userInfo:nil repeats:YES];
    RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 2 target: self
                                                        selector: @selector(startCallAfterTenSecond:) userInfo: nil repeats: YES];
        requestTimerForAPI1 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(endCallAfterTenSecond:) userInfo:nil repeats:YES];
    
    //}
}

-(void)enterBackground
{
    [requestTimerProgress invalidate];
    requestTimerProgress= nil;
    [requestTimerForAPI invalidate];
    requestTimerForAPI = nil;
    [requestTimerForAPI1 invalidate];
    requestTimerForAPI1 = nil;
    [RepeatRequestTimer invalidate];
    RepeatRequestTimer = nil;

}
-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
   // [[NSNotificationCenter defaultCenter]removeObserver:UIApplicationDidEnterBackgroundNotification];
    [requestTimerProgress invalidate];
    requestTimerProgress= nil;
    [requestTimerForAPI invalidate];
    requestTimerForAPI = nil;
    [requestTimerForAPI1 invalidate];
    requestTimerForAPI1 = nil;
    [RepeatRequestTimer invalidate];
    RepeatRequestTimer = nil;

}


-(void)fetchStartStatusAPICall
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        //        UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
        //        alertview3.tag = 69;
        //        [alertview3 show];
        [RepeatRequestTimer invalidate];
        RepeatRequestTimer=nil;
        
        
        RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                            selector: @selector(startCallAfterTenSecond:) userInfo: nil repeats: YES];
        
        
    }
    else
    {
        
        NSString *post =[NSString stringWithFormat:@"access_token=%@&engage_id=%ld",[[NSUserDefaults standardUserDefaults] objectForKey:@"token"],(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"engageId"]];  //@"device_token"
        
        NSLog(@"post %@",post);
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
        
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=fetch_start_status",kBaseUrl]]];
        
        [request setHTTPMethod:@"POST"];
        
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        [request setHTTPBody:postData];
        
        NSError *error1 = nil;
        
        NSURLResponse *response = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
        
        if (data)
        {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            
            NSLog(@"JSON%@",json);
            
            if([json valueForKey:@"error"])
                
            {
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
                
                [alertview3 show];
                
            }
            
            else if([json objectForKey:@"cancel_error"])
            {
                
                NSLog(@"%@",json);
                
                [RepeatRequestTimer invalidate];
                RepeatRequestTimer=nil;
                
                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json objectForKey:@"cancel_error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                alertview3.tag=232;
                
                [alertview3 show];
                
            }
            else
            {
                if ([[json objectForKey:@"flag"] integerValue]==1)
                {
                    [requestTimerProgress invalidate];
                    requestTimerProgress= nil;
                    [requestTimerForAPI invalidate];
                    requestTimerForAPI = nil;
                    [requestTimerForAPI1 invalidate];
                    requestTimerForAPI1 = nil;
                    [RepeatRequestTimer invalidate];
                    RepeatRequestTimer = nil;
                    requestStartedViewController *request=[[requestStartedViewController alloc]init];
                    [self.navigationController pushViewController:request animated:YES];
                    
                }
                else
                {
                    NSLog(@"%@",[json objectForKey:@"log"]);
                }
                
            }
        }
        
        else
        {
            
            [RepeatRequestTimer invalidate];
            RepeatRequestTimer=nil;
            
            
            RepeatRequestTimer = [NSTimer scheduledTimerWithTimeInterval: 10.0 target: self
                                                                selector: @selector(startCallAfterTenSecond:) userInfo: nil repeats: YES];
            
        }
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
