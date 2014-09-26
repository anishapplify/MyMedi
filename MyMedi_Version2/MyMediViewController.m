//
//  MyMediViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/5/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "MyMediViewController.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.2;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.1;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 90;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

@interface MyMediViewController ()
{

    UIImageView *SplashImageView;
    UIImageView *logoImageView;

    UIButton*SignButton;
    UITextField *EmailTextField ;
    UITextField *PasswordTextFeild;
    
    UIView *EmaillineView;
    UIView *PhoneLineView;

    CGFloat animatedDistance;
    UILabel *EmailAnimationLable;
    UILabel *PasswordAnimationLable;
    UILabel *AlreadySignUpLable;
    UIButton *CreateAccountButton;
    UIButton *ForgetPasswordButton;
}
@end
@implementation MyMediViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] valueForKey:@"accesstoken"])
    {
        [SplashImageView removeFromSuperview];
        SplashImageView=nil;
        SplashImageView=[[UIImageView alloc]init];
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            if ([[UIScreen mainScreen] bounds].size.height==568)
            {
                SplashImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone5.png"].size.height);
                SplashImageView.image=[UIImage imageNamed:@"MainBackGround_iphone5.png"];
            }
            else
            {
                SplashImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone4.png"].size.height);
                SplashImageView.image=[UIImage imageNamed:@"MainBackGround_iphone4.png"];
            }
        }
        [self.view addSubview:SplashImageView];
        
        [self performSelector:@selector(loginVerifyEmailOrNOT) withObject:nil afterDelay:0.1];
    //EmergencyContactViewController *HomeScreenView=[[EmergencyContactViewController  alloc]init];
   // [self.navigationController pushViewController:HomeScreenView animated:YES];
        
    }
    else
    {
        [self SignUpScreenFunction];
        
    }
}
-(void)SignUpScreenFunction
{
    [SplashImageView removeFromSuperview];
    SplashImageView=nil;
    SplashImageView=[[UIImageView alloc]init];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            SplashImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone5.png"].size.height);
            SplashImageView.image=[UIImage imageNamed:@"MainBackGround_iphone5.png"];
        }
        else
        {
            SplashImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone4.png"].size.height);
            SplashImageView.image=[UIImage imageNamed:@"MainBackGround_iphone4.png"];
        }
    }
    [self.view addSubview:SplashImageView];
    
    [logoImageView removeFromSuperview];
    logoImageView=nil;
    logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(110, 70, [UIImage imageNamed:@"logo.png"].size.width, [UIImage imageNamed:@"logo.png"].size.height)];
    logoImageView.backgroundColor=[UIColor clearColor];
    logoImageView.image=[UIImage imageNamed:@"logo.png"];
    [self.view addSubview:logoImageView];
    
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 45)];
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 45)];
    
    [EmailTextField removeFromSuperview];
    EmailTextField=nil;
    EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, logoImageView.frame.size.height+logoImageView.frame.origin.y+50, [UIImage imageNamed:@"mymediloginbutton.png"].size.width-50, 45)];
    EmailTextField.backgroundColor=[UIColor clearColor];
    EmailTextField.font=[UIFont fontWithName:@"MuseoSans-300" size:17];
    EmailTextField.textColor=[UIColor whiteColor];
    EmailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    EmailTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    EmailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    EmailTextField.returnKeyType = UIReturnKeyNext;
    EmailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmailTextField.delegate = self;
    EmailTextField.tag=100;
    EmailTextField.leftView = paddingView;
    EmailTextField.leftViewMode = UITextFieldViewModeAlways;
    
    EmailAnimationLable=[[UILabel alloc]initWithFrame:CGRectMake(35, logoImageView.frame.size.height+logoImageView.frame.origin.y+55, 50, 30)];
    EmailAnimationLable.text=@"Email";
    EmailAnimationLable.textAlignment=NSTextAlignmentLeft;
    EmailAnimationLable.textColor=[UIColor whiteColor];
    EmailAnimationLable.backgroundColor=[UIColor clearColor];
    [EmailAnimationLable setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    [self.view addSubview:EmailAnimationLable];
    [self.view addSubview:EmailTextField];
    
    [EmaillineView removeFromSuperview];
    EmaillineView=nil;
    EmaillineView=[[UIView alloc]initWithFrame:CGRectMake(25, EmailTextField.frame.size.height+EmailTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width, 1)];
    EmaillineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    EmaillineView.layer.borderWidth = 0.5f;
    EmaillineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:EmaillineView];
    
    [PasswordTextFeild removeFromSuperview];
    PasswordTextFeild=nil;
    PasswordTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(25, EmailTextField.frame.size.height+EmailTextField.frame.origin.y+20, [UIImage imageNamed:@"mymediloginbutton.png"].size.width-60, 45)];
    PasswordTextFeild.backgroundColor=[UIColor clearColor];
    PasswordTextFeild.font=[UIFont fontWithName:@"MuseoSans-300" size:17];
    PasswordTextFeild.secureTextEntry=TRUE;
    PasswordTextFeild.textColor=[UIColor whiteColor];
    PasswordTextFeild.autocorrectionType = UITextAutocorrectionTypeNo;
    PasswordTextFeild.autocapitalizationType = UITextAutocapitalizationTypeNone;
    PasswordTextFeild.keyboardType = UIKeyboardTypeDefault;
    PasswordTextFeild.returnKeyType = UIReturnKeyDone;
    PasswordTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    PasswordTextFeild.delegate = self;
    PasswordTextFeild.tag=101;
    PasswordTextFeild.leftView = paddingView1;
    PasswordTextFeild.leftViewMode = UITextFieldViewModeAlways;
    PasswordTextFeild.layer.masksToBounds = NO;
    
    PasswordAnimationLable=[[UILabel alloc]initWithFrame:CGRectMake(35, EmailTextField.frame.size.height+EmailTextField.frame.origin.y+25, 80, 30)];
    PasswordAnimationLable.text=@"Password";
    PasswordAnimationLable.textAlignment=NSTextAlignmentLeft;
    PasswordAnimationLable.textColor=[UIColor whiteColor];
    PasswordAnimationLable.backgroundColor=[UIColor clearColor];
    [PasswordAnimationLable setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    
    [self.view addSubview:PasswordAnimationLable];
    [self.view addSubview:PasswordTextFeild];
    
    [PhoneLineView removeFromSuperview];
    PhoneLineView=nil;
    PhoneLineView=[[UIView alloc]initWithFrame:CGRectMake(25, PasswordTextFeild.frame.size.height+PasswordTextFeild.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width, 1)];
    PhoneLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    PhoneLineView.layer.borderWidth = 0.5f;
    PhoneLineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:PhoneLineView];
    
    [SignButton removeFromSuperview];
    SignButton=nil;
    SignButton=[[UIButton alloc]initWithFrame:CGRectMake(25, PasswordTextFeild.frame.size.height+PasswordTextFeild.frame.origin.y+20, [UIImage imageNamed:@"mymediloginbutton.png"].size.width, [UIImage imageNamed:@"mymediloginbutton.png"].size.height)];
    [SignButton addTarget:self action:@selector(LoginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [SignButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [SignButton setBackgroundImage:[UIImage imageNamed:@"mymediloginbutton.png"] forState:UIControlStateNormal];
    SignButton.exclusiveTouch=YES;
    [self.view addSubview:SignButton];
    
    [ForgetPasswordButton removeFromSuperview];
    ForgetPasswordButton=nil;
    
    ForgetPasswordButton=[[UIButton alloc]initWithFrame:CGRectMake(50, SignButton.frame.size.height+SignButton.frame.origin.y+5, 200, 30)];
    ForgetPasswordButton.backgroundColor=[UIColor clearColor];
    [ForgetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ForgetPasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [ForgetPasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [ForgetPasswordButton setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    ForgetPasswordButton.titleLabel.font = [UIFont fontWithName:@"MuseoSans-500" size: 15];
    //[ForgetPasswordButton addTarget:self action:@selector(ForgetPasswordPopUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ForgetPasswordButton];
    
    
    AlreadySignUpLable=[[UILabel alloc]init];
    AlreadySignUpLable.text=@"Don't have an account?";
    AlreadySignUpLable.textAlignment=NSTextAlignmentCenter;
    AlreadySignUpLable.textColor=[UIColor whiteColor];
    AlreadySignUpLable.backgroundColor=[UIColor clearColor];
    [AlreadySignUpLable setFont:[UIFont fontWithName:@"MuseoSans-300" size:14]];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            AlreadySignUpLable.frame=CGRectMake(70, SignButton.frame.size.height+SignButton.frame.origin.y+120, 165, 20);
        }
        else
        {
               AlreadySignUpLable.frame=CGRectMake(70, SignButton.frame.size.height+SignButton.frame.origin.y+43, 165, 20);
        }
    }

    
    [self.view addSubview:AlreadySignUpLable];
    
    
    CreateAccountButton=[UIButton buttonWithType:UIButtonTypeCustom];
    CreateAccountButton.frame=CGRectMake(120, AlreadySignUpLable.frame.size.height+AlreadySignUpLable.frame.origin.y, 70, 25);
    CreateAccountButton.backgroundColor=[UIColor clearColor];
    [CreateAccountButton setTitle:@"Sign up" forState:UIControlStateNormal];
    [CreateAccountButton addTarget:self action:@selector(CreateAccountButtonAction) forControlEvents:UIControlEventTouchUpInside];
    CreateAccountButton.titleLabel.font=[UIFont fontWithName:@"MuseoSans-500" size:15];
    [self.view addSubview:CreateAccountButton];
}
#pragma mark- slide Keyboard up
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =[[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown)
        
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField.tag==100){
        if(EmailTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                EmailAnimationLable.frame=CGRectMake(240, logoImageView.frame.size.height+logoImageView.frame.origin.y+55, 50, 30);
                EmailAnimationLable.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                EmailAnimationLable.textColor=[UIColor lightGrayColor];
            }];
        }
    }
    if(textField.tag==101){
        
        if(PasswordTextFeild.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                PasswordAnimationLable.frame=CGRectMake(220, EmailTextField.frame.size.height+EmailTextField.frame.origin.y+25, 80, 30);
                PasswordAnimationLable.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                PasswordAnimationLable.textColor=[UIColor lightGrayColor];
            }];
        }
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if(textField.tag==100){
        if(EmailTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                EmailAnimationLable.frame=CGRectMake(35, logoImageView.frame.size.height+logoImageView.frame.origin.y+55, 50, 30);
                EmailAnimationLable.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                EmailAnimationLable.textColor=[UIColor whiteColor];
            }];
        }
    }
    if(textField.tag==101){
        
        if(PasswordTextFeild.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                PasswordAnimationLable.frame=CGRectMake(35, EmailTextField.frame.size.height+EmailTextField.frame.origin.y+25, 80, 30);
                PasswordAnimationLable.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                PasswordAnimationLable.textColor=[UIColor whiteColor];
            }];
        }
    }

    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == EmailTextField)
    {
        [PasswordTextFeild becomeFirstResponder];
        return NO;
    }
    else {
        [self LoginButtonAction];
    }
    return YES;
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
                 [[NSUserDefaults standardUserDefaults] synchronize];
                 
                
              HomeScreenViewController *HomeScreenView=[[HomeScreenViewController  alloc]init];
                 [self.navigationController pushViewController:HomeScreenView animated:YES];

              // AddAppointmentViewController *HomeScreenView=[[AddAppointmentViewController  alloc]init];
               //[self.navigationController pushViewController:HomeScreenView animated:YES];

                 
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
-(void)CreateAccountButtonAction
{
    
    CreateAccountViewController *CreateAccount=[[CreateAccountViewController alloc]init];
    [self.navigationController pushViewController:CreateAccount animated:YES];
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
                 [self SignUpScreenFunction];
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
-(void)LoginButtonAction
{
    [EmailTextField resignFirstResponder];
    [PasswordTextFeild resignFirstResponder];
    if(EmailTextField.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        
    }
    else
        if (PasswordTextFeild.text.length<1)
        {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            alert = nil;
            
            [EmailTextField resignFirstResponder];
            [PasswordTextFeild resignFirstResponder];
            
        }
        else
        {
            if (![self validateEmail:EmailTextField.text])
            {
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                alert = nil;
                
            }
            else
            {
                
                [self ShowActivityIndicatorWithTitle:@"Loading..."];
                [self performSelector:@selector(serverCallForLoginData) withObject:nil afterDelay:0.1];
            }
        }
    
}
-(void)serverCallForLoginData
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
                                 @"email":EmailTextField.text,
                                 @"password":PasswordTextFeild.text,
                                 @"login":@"1"
                                 
                                 };
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/register_or_login_through_email",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            NSLog(@"JSON--->%@",json);
            if([json objectForKey:@"error"])
            {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
            }
            else
            {
                [[NSUserDefaults standardUserDefaults] setObject:json forKey:kLoginData];
                NSLog(@"login data=%@",[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData]valueForKey:@"firstname"]);
                [[NSUserDefaults standardUserDefaults] synchronize];
             
                HomeScreenViewController *veri=[[HomeScreenViewController  alloc]init];
                [self.navigationController pushViewController:veri animated:YES];
            }
            
            [self HideActivityIndicator];
            NSLog(@"JSON: %@", json);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             NSLog(@"Error: %@", error.description);
             [self HideActivityIndicator];
             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
             [unable show];
         }];
        
    }
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [EmailTextField resignFirstResponder];
    [PasswordTextFeild resignFirstResponder];
}
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}


@end
