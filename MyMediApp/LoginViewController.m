//
//  LoginViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 10/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController (){
    
    UIButton*Backbutton;
    UIView *CenterView;
    UIView *BottomView;
    UIButton*NextViewController;
    UIButton *ForgetPasswordButton;
    UIScrollView*LoginScrollView;
    UITextField *UserNameTextField;
    UITextField *PasswordTextField;
    UIView *ForgetPasswordBackGroundView;
    UIView *ForgetPasswordView;
    UITextField*ForgetEmailTextField;
    UIAlertView *AlertViewOK;
    UIView *paddingView;
    UIView *TopBarView;
    UIButton* LoginButton;
    UIButton*ResetPasswordButton;
    UIButton*TechSupportButton;
 
}

@end

@implementation LoginViewController

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:224/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
    
   // self.view.backgroundColor=[UIColor clearColor];
    
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    UIImage * backImg = [UIImage imageNamed:@"Newback_50.png"];
    
    UIButton *HiddenBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    HiddenBackButton.frame = CGRectMake(5,22,backImg.size.width+25, backImg.size.height+10);
    HiddenBackButton.backgroundColor=[UIColor clearColor];
    [HiddenBackButton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:HiddenBackButton];
    
   
    
    Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Backbutton.frame = CGRectMake(5,35,backImg.size.width, backImg.size.height);
    [Backbutton setImage:backImg forState:UIControlStateNormal];
    //[Backbutton setImage:[UIImage imageNamed:@"back_btn_pressed.png"] forState:UIControlStateHighlighted];
    [Backbutton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:Backbutton];
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(270,35,1,25)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView];
    
    
    
    UIImage *SignImage=[UIImage imageNamed:@"SignIn_icon.png"];
    
    UIButton *LoginButtonHidden=[[UIButton alloc]initWithFrame:CGRectMake(265, 30, SignImage.size.width+10, SignImage.size.height)];
    LoginButtonHidden.backgroundColor=[UIColor clearColor];
    [LoginButtonHidden addTarget:self action:@selector(LoginButtonAction)
                forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:LoginButtonHidden];
    
    
    
    LoginButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 25, SignImage.size.width, SignImage.size.height)];
    LoginButton.backgroundColor=[UIColor clearColor];
    [LoginButton setImage:SignImage forState:UIControlStateNormal];
    [LoginButton addTarget:self action:@selector(LoginButtonAction)
          forControlEvents:UIControlEventTouchUpInside];
//    LoginButton.titleEdgeInsets = UIEdgeInsetsMake(5, 100, 0, 0);
//    LoginButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
//    LoginButton.layer.borderWidth = 1.0f;
//    LoginButton.layer.cornerRadius = 3;
    [TopBarView addSubview:LoginButton];
    
    
    UILabel *SignInLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 30, 130, 30)];
    SignInLable.text=@"Sign In";
    SignInLable.textColor=[UIColor whiteColor];
    SignInLable.textAlignment=NSTextAlignmentCenter;
    SignInLable.font=[UIFont fontWithName:@"Comfortaa-Bold" size:15];
    [TopBarView addSubview:SignInLable];
    
    
    
    [self.view addSubview:TopBarView];
    
    CenterView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y,self.view.frame.size.width, 190)];
    CenterView.backgroundColor=[UIColor whiteColor];
    
    UIImage *LogoImage=[UIImage imageNamed:@"SingInlogo.png"];
    UIImageView *CenterLogoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(90, 20, LogoImage.size.width, LogoImage.size.height)];
    CenterLogoImageView.image=LogoImage;
    [CenterView addSubview:CenterLogoImageView];
    
    [self.view addSubview:CenterView];
    
    
    BottomView=[[UIView alloc]initWithFrame:CGRectMake(0, CenterView.frame.size.height+CenterView.frame.origin.y,self.view.frame.size.width, 335)];
    BottomView.backgroundColor=[UIColor colorWithRed:161/255.0 green:207/255.0 blue:223/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;

    
    LoginScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width,150)];
    LoginScrollView.backgroundColor=[UIColor clearColor];
    LoginScrollView.contentSize=CGSizeMake(BottomView.frame.size.width, 150);
    

    
    UserNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 20, 240, 35)];
    UserNameTextField.delegate = self;
    UserNameTextField.tag=100;
    UserNameTextField.placeholder = @"Email*";
     [UserNameTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [UserNameTextField setBackground:[UIImage imageNamed:@"after_click_input_white.png"]];
    UserNameTextField.textColor=[UIColor whiteColor];
    [UserNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    UserNameTextField.textAlignment = NSTextAlignmentCenter;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    UserNameTextField.leftView = paddingView;
    UserNameTextField.leftViewMode = UITextFieldViewModeAlways;
    UserNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UserNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [UserNameTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    UserNameTextField.autocapitalizationType = NO;
    UserNameTextField.keyboardType = UIKeyboardTypeEmailAddress;
    UserNameTextField.returnKeyType=UIReturnKeyNext;
    [UserNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [LoginScrollView addSubview:UserNameTextField];
    
    PasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, UserNameTextField.frame.origin.y+UserNameTextField.frame.size.height+15, 240, 35)];
    PasswordTextField.delegate = self;
    PasswordTextField.tag=101;
    [PasswordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    PasswordTextField.placeholder = @"Password*";
    [PasswordTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    PasswordTextField.textColor=[UIColor whiteColor];
    [PasswordTextField setBackground:[UIImage imageNamed:@"after_click_input_white.png"]];
    PasswordTextField.textAlignment = NSTextAlignmentCenter;
    PasswordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    PasswordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [PasswordTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    PasswordTextField.leftView = paddingView;
    PasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    PasswordTextField.autocapitalizationType = NO;
    PasswordTextField.secureTextEntry=true;
    PasswordTextField.returnKeyType=UIReturnKeyDone;
    [PasswordTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [LoginScrollView addSubview:PasswordTextField];

    
    ForgetPasswordButton=[[UIButton alloc]initWithFrame:CGRectMake(60, PasswordTextField.frame.size.height+PasswordTextField.frame.origin.y+150, 200, 30)];
    ForgetPasswordButton.backgroundColor=[UIColor clearColor];
    [ForgetPasswordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ForgetPasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [ForgetPasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [ForgetPasswordButton setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    ForgetPasswordButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 12];
    [ForgetPasswordButton addTarget:self action:@selector(ForgetPasswordPopUp) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ForgetPasswordButton];
    
//    UIView *lineForgotView=[[UIView alloc]initWithFrame:CGRectMake(110,ForgetPasswordButton.frame.origin.y+ForgetPasswordButton.frame.size.height-5,90,1)];
//    lineForgotView.layer.borderColor = [UIColor whiteColor].CGColor;
//    lineForgotView.layer.borderWidth = 1.0f;
//    [BottomView addSubview:lineForgotView];
    

    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];

    [BottomView addSubview:LoginScrollView];
    [self.view addSubview:BottomView];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [UserNameTextField becomeFirstResponder];
}
- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(50, 50)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField.tag==100){ UserNameTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==101){ PasswordTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
     if(textField.tag==102){ ForgetEmailTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    
    
   
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(textField.tag==100){ UserNameTextField.background = [UIImage imageNamed:@"after_click_input_white.png"];}
    if(textField.tag==101){ PasswordTextField.background = [UIImage imageNamed:@"after_click_input_white.png"];}
    if(textField.tag==102){ ForgetEmailTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    return YES;
}
-(void)LoginButtonAction{
    
    
     [[soundManager shared] buttonSound];
    if(UserNameTextField.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        [UserNameTextField resignFirstResponder];
        [PasswordTextField resignFirstResponder];
    }
    else
        if (PasswordTextField.text.length<1)
        {
     
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        
        [UserNameTextField resignFirstResponder];
        [PasswordTextField resignFirstResponder];
        
    }
    else
    {
        if (![self validateEmail:UserNameTextField.text])
        {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            alert = nil;
            [self scrollViewDidTapped];
        }
        else{
            
            [self scrollViewDidTapped];
            
            VerifyAccountDetailViewController*Verify=[[VerifyAccountDetailViewController alloc]init];
            [self.navigationController pushViewController:Verify animated:YES];
            
        }
        
        
//        NSURL *url = [NSURL URLWithString:@"http://mymedi-20171.onmodulus.net/login/anish/anish"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        
//        [NSURLConnection sendAsynchronousRequest:request
//                                           queue:[NSOperationQueue mainQueue]
//                               completionHandler:^(NSURLResponse *response,
//                                                   NSData *data, NSError *connectionError)
//        
//         {
//             if (data.length > 0 && connectionError == nil)
//             {
//                 NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
//                                                                          options:0
//                                                                            error:NULL];
//                 //self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
//                 //self.greetingContent.text = [greeting objectForKey:@"content"];
//                 
//                 NSLog(@"greeting=%@",greeting);
//             }
//         }];
//
//       NSLog(@"greeting=%@",greeting);
        
       
        
//        NSString *post =[NSString stringWithFormat:@"access_token=%@",@"a775fc6c52e5c2950779b0fec2fad9a1"];
//        NSLog(@"post %@",post);
//        
//        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
//        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",kBaseUrl]]];
//        NSLog(@"request=%@",request);
//        
//        [request setHTTPMethod:@"POST"];
//        
//        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        
//        [request setHTTPBody:postData];
//        
//        NSError *error1 = nil;
//        
//        NSURLResponse *response = nil;
//        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
//        // NSLog(@"data=%@",data);
//        if (data)
//        {
//            
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
//            NSLog(@"JSON%@",json);
//            
//            if([json valueForKey:@"error"])
//                
//            {
//                
//                UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
//                alertview3.tag = 1;
//                [alertview3 show];
//                
//                
//            }
//            
//            else if([json objectForKey:@"categories"])
//            {
//                NSArray *dataArray = [[NSArray alloc] initWithArray:[json objectForKey:@"data"]];
//                NSDictionary *data = [[NSDictionary alloc] initWithDictionary:[dataArray objectAtIndex:0]];
//                NSLog(@"%@",data);
//                
//                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"access_token"] forKey:@"token"];
//                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_image"] forKey:@"userImage"];
//                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_name"] forKey:@"userName"];
//                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"dob"] forKey:@"dateOfBirth"];
//                [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"phone_no"] forKey:@"mobileNo"];
//                [[NSUserDefaults standardUserDefaults] setInteger:20 forKey:@"defaultTip"];
//                [[NSUserDefaults standardUserDefaults] synchronize];
//                
//                
//                [self HideActivityIndicator];
//            }
//        }
        
        
        
       
    }
    
}

-(void)ForgetPasswordPopUp{
   
    [[soundManager shared] buttonSound];
    ForgetPasswordBackGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    ForgetPasswordBackGroundView.backgroundColor=[UIColor blackColor];
    ForgetPasswordBackGroundView.alpha=0.8;
    [self.view addSubview:ForgetPasswordBackGroundView];
    
    
    ForgetPasswordView=[[UIView alloc]initWithFrame:CGRectMake(60, 200, 200, 150)];
    ForgetPasswordView.backgroundColor=[UIColor whiteColor];
    
    UILabel *ForgetPasswordLable=[[UILabel alloc]initWithFrame:CGRectMake(25, 0, 150, 40)];
    ForgetPasswordLable.text=@"Forgot Password?";
    [ForgetPasswordLable setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Roman" size:15]];
    ForgetPasswordLable.textAlignment=NSTextAlignmentCenter;
    ForgetPasswordLable.backgroundColor=[UIColor clearColor];
    ForgetPasswordLable.textColor=[UIColor blackColor];
    [ForgetPasswordView addSubview:ForgetPasswordLable];
    
    ForgetEmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, ForgetPasswordLable.frame.size.height+ForgetPasswordLable.frame.origin.y+10, 286-120, 20)];
    ForgetEmailTextField.delegate = self;
    ForgetEmailTextField.tag=102;
    ForgetEmailTextField.placeholder = @"Email *";
    ForgetEmailTextField.textColor=[UIColor blackColor];
    [ForgetEmailTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    ForgetEmailTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    ForgetEmailTextField.leftView = paddingView;
    ForgetEmailTextField.leftViewMode = UITextFieldViewModeAlways;
    ForgetEmailTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    ForgetEmailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [ForgetEmailTextField setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    ForgetEmailTextField.autocapitalizationType = NO;
    ForgetEmailTextField.returnKeyType=UIReturnKeyNext;
    [ForgetEmailTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [ForgetPasswordView addSubview:ForgetEmailTextField];
    

    
//    LoginButton.backgroundColor=[UIColor clearColor];
//    [LoginButton setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0] forState:UIControlStateNormal];
//    [LoginButton addTarget:self action:@selector(LoginButtonAction)
//          forControlEvents:UIControlEventTouchUpInside];
//    
//    [LoginButton addTarget:self action:@selector(LoginButtonActionNormal) forControlEvents:UIControlEventTouchDown];
//    LoginButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    LoginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [LoginButton setTitle:@"Sign in" forState:(UIControlState)UIControlStateNormal];
//    LoginButton.titleEdgeInsets = UIEdgeInsetsMake(5, 100, 0, 0);
//    LoginButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
//    LoginButton.layer.borderWidth = 1.0f;
//    LoginButton.layer.cornerRadius = 3;
    
    
    
    ResetPasswordButton=[[UIButton alloc]initWithFrame:CGRectMake(15, ForgetEmailTextField.frame.size.height+ForgetEmailTextField.frame.origin.y+10,286-120 ,20)];
    ResetPasswordButton.backgroundColor=[UIColor clearColor];
    [ResetPasswordButton setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0] forState:UIControlStateNormal];
    [ResetPasswordButton setTitle:@"Submit" forState:UIControlStateNormal];
    ResetPasswordButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [ResetPasswordButton addTarget:self action:@selector(ForgetPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    [ResetPasswordButton addTarget:self action:@selector(ResetButtonActionNormal) forControlEvents:UIControlEventTouchDown];
    ResetPasswordButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
     ResetPasswordButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0);
    ResetPasswordButton.layer.borderWidth = 1.0f;
    ResetPasswordButton.layer.cornerRadius = 3;
    [ForgetPasswordView addSubview:ResetPasswordButton];
    
    
    TechSupportButton=[[UIButton alloc]initWithFrame:CGRectMake(15, ResetPasswordButton.frame.size.height+ResetPasswordButton.frame.origin.y+10,286-120 ,20)];
     [TechSupportButton setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0] forState:UIControlStateNormal];
    [TechSupportButton setTitle:@"Tech Support" forState:UIControlStateNormal];
    TechSupportButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [TechSupportButton addTarget:self action:@selector(TechSupportAction) forControlEvents:UIControlEventTouchUpInside];
     [TechSupportButton addTarget:self action:@selector(TechButtonActionNormal) forControlEvents:UIControlEventTouchDown];
    TechSupportButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    TechSupportButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 0);
    TechSupportButton.layer.borderWidth = 1.0f;
    TechSupportButton.layer.cornerRadius = 3;
    [ForgetPasswordView addSubview:TechSupportButton];
    [self.view addSubview:ForgetPasswordView];
}
-(void)ResetButtonActionNormal{
    ResetPasswordButton.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    [ResetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [ResetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}
-(void)TechButtonActionNormal{
 
    TechSupportButton.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    [TechSupportButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [TechSupportButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == UserNameTextField)
    {
        [PasswordTextField becomeFirstResponder];
        return NO;
    }
        else
            {
                [textField resignFirstResponder];
            }
    return YES;
}

-(void)LoginButtonActionNormal{
    NSLog(@"press");
    LoginButton.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    [LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
}

-(void)ForgetPasswordAction

{
    
     ResetPasswordButton.backgroundColor=[UIColor whiteColor];
    
   
    [[soundManager shared] buttonSound];
    if(ForgetEmailTextField.text.length<1){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        [ForgetEmailTextField resignFirstResponder];
    }
    else
        if (![self validateEmail:ForgetEmailTextField.text])
        {  UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                      [alert show];
                    alert = nil;
             [ForgetEmailTextField resignFirstResponder];
                }
        else{
            AlertViewOK=[[UIAlertView alloc]initWithTitle:nil message:@"Check your email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [AlertViewOK show];
            AlertViewOK.tag=1;
            AlertViewOK.delegate=self;
            [ForgetEmailTextField resignFirstResponder];
        }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==1)
    {
        [ForgetPasswordBackGroundView removeFromSuperview];
        [ForgetPasswordView removeFromSuperview];
    }
}
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
-(void)TechSupportAction{
    TechSupportButton.backgroundColor=[UIColor whiteColor];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [ForgetPasswordBackGroundView removeFromSuperview];
    [ForgetPasswordView removeFromSuperview];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    // register for keyboard notifications
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow)
     
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
}
- (void)viewWillDisappear:(BOOL)animated

{
    
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
}
-(void)keyboardWillShow
{
    // Animate the current view out of the way
    CGFloat heightofKeyboard = 80;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [LoginScrollView setContentInset:insets];
    [LoginScrollView setScrollIndicatorInsets:insets];
    
}
-(void)scrollViewDidTapped
{
    [UserNameTextField resignFirstResponder];
    [PasswordTextField resignFirstResponder];
    // [passwordtextField resignFirstResponder];
}
-(void)keyboardWillHide
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [LoginScrollView setContentInset:insets];
    [LoginScrollView setScrollIndicatorInsets:insets];
    
}
-(IBAction)textFieldDoneEditing:(id)sender{
    
}
-(void)nextviewController{
    
}
-(void)BackVeiwController{
     [[soundManager shared] buttonSound];
    [self.navigationController popViewControllerAnimated:YES];
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
