//
//  ChangePasswordViewController.m
//  MyMediApp
//
//  Created by anish on 01/08/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController (){
    UIView *TopBarView;
    
    UITextField *OldPasswordTextField;
    UITextField *NewPassowordTextField;
    UITextField    *ConfirmPasswordTextField;
}

@end

@implementation ChangePasswordViewController

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
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    
   UIButton*BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    
    UILabel *HeadingLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    HeadingLable.text=@"Change Password";
    HeadingLable.font=[UIFont fontWithName:helveticaRegular size:18];
    HeadingLable.textColor=[UIColor blackColor];
    HeadingLable.textAlignment=NSTextAlignmentCenter;
    
    [TopBarView addSubview:HeadingLable];
    
    
    [self.view addSubview:TopBarView];
    
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    
    
    
    
    OldPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+50, 320, 40)];
    
    OldPasswordTextField.delegate = self;
    OldPasswordTextField.textColor=[UIColor blackColor];
    
    OldPasswordTextField.textAlignment = NSTextAlignmentLeft;
    
    OldPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    OldPasswordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    OldPasswordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [OldPasswordTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    OldPasswordTextField.autocapitalizationType = NO;
    
    OldPasswordTextField.returnKeyType=UIReturnKeyNext;
    
    OldPasswordTextField.backgroundColor=[UIColor whiteColor];
    
    OldPasswordTextField.delegate = self;
    
    OldPasswordTextField.secureTextEntry=TRUE;
    
    OldPasswordTextField.leftView = paddingView;
    
    OldPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    OldPasswordTextField.keyboardType=UIKeyboardTypeAlphabet;
    OldPasswordTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    OldPasswordTextField.layer.borderWidth = 0.5f;
    
    [self.view addSubview:OldPasswordTextField];
    
    
    UILabel  *OldPasswordLable=[[UILabel alloc]initWithFrame:CGRectMake(10, -5, 120, 50) ];
    
    OldPasswordLable.text=@"Old Password";
    
    OldPasswordLable.textAlignment=NSTextAlignmentLeft;
    
    OldPasswordLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    OldPasswordLable.textColor=[UIColor blackColor];
    
    [OldPasswordTextField addSubview:OldPasswordLable];
    
    
    
    NewPassowordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, OldPasswordTextField.frame.size.height+OldPasswordTextField.frame.origin.y, 320, 40)];
    
    NewPassowordTextField.delegate = self;
    NewPassowordTextField.textColor=[UIColor blackColor];
    
    NewPassowordTextField.textAlignment = NSTextAlignmentLeft;
    
    NewPassowordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    NewPassowordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    NewPassowordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [NewPassowordTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    NewPassowordTextField.autocapitalizationType = NO;
    
    NewPassowordTextField.returnKeyType=UIReturnKeyNext;
    
    NewPassowordTextField.backgroundColor=[UIColor whiteColor];
    
    NewPassowordTextField.delegate = self;
    
    NewPassowordTextField.secureTextEntry=TRUE;
    NewPassowordTextField.leftView = paddingView1;
    NewPassowordTextField.tag=200;
    NewPassowordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    NewPassowordTextField.keyboardType=UIKeyboardTypeAlphabet  ;
    NewPassowordTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    NewPassowordTextField.layer.borderWidth = 0.5f;
    [self.view addSubview:NewPassowordTextField];
    
    UILabel *NewPasswordLable=[[UILabel alloc]initWithFrame:CGRectMake(10, -5, 120, 50) ];
    
    NewPasswordLable.text=@"New Password";
    
    NewPasswordLable.textAlignment=NSTextAlignmentLeft;
    
    NewPasswordLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    NewPasswordLable.textColor=[UIColor blackColor];
    
    [NewPassowordTextField addSubview:NewPasswordLable];
    
    
    ConfirmPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, NewPassowordTextField.frame.size.height+NewPassowordTextField.frame.origin.y, 320, 40)];
    
    ConfirmPasswordTextField.delegate = self;
    
    ConfirmPasswordTextField.textColor=[UIColor blackColor];
    
    ConfirmPasswordTextField.textAlignment = NSTextAlignmentLeft;
    
    ConfirmPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    ConfirmPasswordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    ConfirmPasswordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [ConfirmPasswordTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    ConfirmPasswordTextField.secureTextEntry=TRUE;
    ConfirmPasswordTextField.autocapitalizationType = NO;
    
    ConfirmPasswordTextField.returnKeyType=UIReturnKeyDone;
    
    ConfirmPasswordTextField.backgroundColor=[UIColor whiteColor];
    
    ConfirmPasswordTextField.delegate = self;
    
    ConfirmPasswordTextField.leftView = paddingView2;
    
    ConfirmPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    ConfirmPasswordTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    ConfirmPasswordTextField.layer.borderWidth = 0.5f;
    ConfirmPasswordTextField.keyboardType=UIKeyboardTypeAlphabet;
    
    [self.view addSubview:ConfirmPasswordTextField];
    
    UILabel *ConfirmPasswordLable=[[UILabel alloc]initWithFrame:CGRectMake(10, -5, 120, 50) ];
    
    ConfirmPasswordLable.text=@"Confirm Password";
    
    ConfirmPasswordLable.textAlignment=NSTextAlignmentLeft;
    
    ConfirmPasswordLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    ConfirmPasswordLable.textColor=[UIColor blackColor];
    
    [ConfirmPasswordTextField addSubview:ConfirmPasswordLable];
}
-(void)BackButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == OldPasswordTextField)
    {
        [NewPassowordTextField becomeFirstResponder];
        return NO;
    }
    
    else
        if (textField == NewPassowordTextField)
        {
            [ConfirmPasswordTextField  becomeFirstResponder];
            return NO;
        }
        else
        {
            [self signInAPICall];
        }
    return YES;
}
-(void)signInAPICall{
    
    
    [self handleEnteredBackground];
    if ([[OldPasswordTextField text] length]==0)
    {
        UIAlertView *blankEmailAllert=[[UIAlertView alloc]initWithTitle:nil  message:@"Please enter an old passowrd." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [blankEmailAllert show];
    }
    else
        if(NewPassowordTextField.text.length<1)
        {
            UIAlertView *blankPassAllert=[[UIAlertView alloc]initWithTitle:nil  message:@"Please enter an new passowrd." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [blankPassAllert show];
        }
        else
            if(ConfirmPasswordTextField.text.length<1)
            {
                UIAlertView *blankPassAllert=[[UIAlertView alloc]initWithTitle:nil  message:@"Please enter an confirm passowrd." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [blankPassAllert show];
            }
            else
                if(NewPassowordTextField.text.length>1)
                {
                    if(![NewPassowordTextField.text isEqualToString:ConfirmPasswordTextField.text])
                    {
                        UIAlertView *blankPassAllert=[[UIAlertView alloc]initWithTitle:nil  message:@"Password does not match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                        [blankPassAllert show];
                        return;
                    }
                    else
                    {
                        
                        [self ShowActivityIndicatorWithTitle:@"Loading..."];
                        [self performSelector:@selector(serverCallForPasswordChange) withObject:nil afterDelay:0.1];
                    }
                    
                }
    
    
}
-(void)serverCallForPasswordChange

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
                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"],
                                 @"oldpassword":OldPasswordTextField.text,
                                 @"newpassword": NewPassowordTextField.text
                                 };
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/update_user_password",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            NSLog(@"Change password JSON--->%@",json);
            if([[json objectForKey:@"log"] isEqualToString:@"Password successfuly updated."])
            {
                [OldPasswordTextField setText:@""];
                [NewPassowordTextField setText:@""];
                [ConfirmPasswordTextField setText:@""];
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"log"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
                
                
            }
//            if([[json objectForKey:@"code"] isEqualToString:@"0"])
//            {
//                [OldPasswordTextField setText:@""];
//                [NewPassowordTextField setText:@""];
//                [ConfirmPasswordTextField setText:@""];
//                
//                
//                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                [myAlertView show];
//                
//                
//            }
            
            [self HideActivityIndicator];
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
-(void)handleEnteredBackground
{
    [OldPasswordTextField resignFirstResponder];
    [NewPassowordTextField resignFirstResponder];
    [ConfirmPasswordTextField resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated{
    [OldPasswordTextField resignFirstResponder];
    [NewPassowordTextField resignFirstResponder];
    [ConfirmPasswordTextField resignFirstResponder];
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
