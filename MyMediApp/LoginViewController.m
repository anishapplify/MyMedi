//
//  LoginViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 10/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    UIButton*Backbutton;
    UIView *CenterView;
    UIButton*NextViewController;
    UIButton *ForgetPasswordButton;
    UITextField *UserNameTextField;
    UITextField *PasswordTextField;
    UIView *ForgetPasswordBackGroundView;
    UIView *ForgetPasswordView;
    UITextField*ForgetEmailTextField;
    UIView *paddingView;
    UIView *TopBarView;
    UIButton*ResetPasswordButton;
    UIButton*TechSupportButton;
    UILabel *ForgetPasswordLable;
    UIImageView *CenterLogoImageView;
    UILabel *SignInLable;
    
    UITapGestureRecognizer*tapRecognizer;
    
    NSString *userId;
    NSString *firstName;
    NSString *lastName;
    NSString *Email;
    NSString *Address;
    NSString *Zip;
    NSString *DOB;
    NSString *Height;
    NSString *Weight;
    NSString *PhoneNumber;
    NSString *Gender;
    NSString *image;
    
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
    
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    
    Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Backbutton.frame = CGRectMake(5,22,[UIImage imageNamed:@"backButtonNew.png"].size.width,[UIImage imageNamed:@"backButtonNew.png"].size.height);
    [Backbutton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    //[Backbutton setImage:[UIImage imageNamed:@"back_btn_pressed.png"] forState:UIControlStateHighlighted];
    [Backbutton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:Backbutton];
    
    
    SignInLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 30, 130, 30)];
    SignInLable.text=@"Log In";
    SignInLable.textColor=[UIColor blackColor];
    SignInLable.textAlignment=NSTextAlignmentCenter;
    SignInLable.font=[UIFont fontWithName:helveticaRegular size:18];
    [TopBarView addSubview:SignInLable];
    
    [self.view addSubview:TopBarView];
    
    CenterView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+3,self.view.frame.size.width, 170)];
    CenterView.backgroundColor=[UIColor whiteColor];
    
    CenterLogoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(90, 20, [UIImage imageNamed:@"SingInlogo.png"].size.width, [UIImage imageNamed:@"SingInlogo.png"].size.height)];
    CenterLogoImageView.image=[UIImage imageNamed:@"SingInlogo.png"];
    [CenterView addSubview:CenterLogoImageView];
    [self.view addSubview:CenterView];
    
    
    UserNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, CenterView.frame.size.height+CenterView.frame.origin.y+10, self.view.frame.size.width, 40)];
    UserNameTextField.delegate = self;
    UserNameTextField.placeholder=@"Email*";
    UserNameTextField.textColor=[UIColor blackColor];
    [UserNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    UserNameTextField.textAlignment = NSTextAlignmentCenter;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    UserNameTextField.leftView = paddingView;
    UserNameTextField.leftViewMode = UITextFieldViewModeAlways;
    UserNameTextField.backgroundColor=[UIColor whiteColor];
    UserNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UserNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [UserNameTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
    UserNameTextField.keyboardType = UIKeyboardTypeEmailAddress;
    UserNameTextField.returnKeyType=UIReturnKeyNext;
    UserNameTextField.autocapitalizationType = NO;
    [UserNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:UserNameTextField];
    
    PasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, UserNameTextField.frame.origin.y+UserNameTextField.frame.size.height+3, self.view.frame.size.width, 40)];
    PasswordTextField.delegate = self;
    [PasswordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    PasswordTextField.placeholder= @"Password*";
    PasswordTextField.textColor=[UIColor blackColor];
    PasswordTextField.textAlignment = NSTextAlignmentCenter;
    PasswordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    PasswordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [PasswordTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    PasswordTextField.leftView = paddingView;
    PasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    PasswordTextField.secureTextEntry=true;
    PasswordTextField.backgroundColor=[UIColor whiteColor];
    PasswordTextField.returnKeyType=UIReturnKeyDone;
    PasswordTextField.autocapitalizationType = NO;
    [PasswordTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:PasswordTextField];
    
    ForgetPasswordButton=[[UIButton alloc]initWithFrame:CGRectMake(150, PasswordTextField.frame.size.height+PasswordTextField.frame.origin.y+5, 200, 30)];
    ForgetPasswordButton.backgroundColor=[UIColor clearColor];
    [ForgetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ForgetPasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [ForgetPasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [ForgetPasswordButton setTitle:@"Forgot Password?" forState:UIControlStateNormal];
    ForgetPasswordButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    [ForgetPasswordButton addTarget:self action:@selector(ForgetPasswordPopUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ForgetPasswordButton];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    UIView *BottomAccountView=[[UIView alloc]initWithFrame:CGRectMake(0, 505, self.view.frame.size.width,65)];
    BottomAccountView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    BottomAccountView.userInteractionEnabled=TRUE;
    
    
    UIButton *LogInButton=[[UIButton alloc]initWithFrame:CGRectMake(35, 13, 250, 40)];
    LogInButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
    [LogInButton addTarget:self action:@selector(LoginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [LogInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [LogInButton setTitle:@"Log In" forState:UIControlStateNormal];
    LogInButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    [LogInButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [LogInButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    LogInButton.clipsToBounds = YES;
    LogInButton.layer.cornerRadius = 5;
    [BottomAccountView addSubview:LogInButton];
    
    [self.view addSubview:BottomAccountView];
}
-(void)viewDidAppear:(BOOL)animated{
    // [UserNameTextField becomeFirstResponder];
}
-(void)LoginButtonAction
{
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
            else
            {
                [self scrollViewDidTapped];
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
                                 @"email":UserNameTextField.text,
                                 @"password": PasswordTextField.text,
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
                
                userId = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"userid"]];
                firstName  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"firstname"]];
                lastName  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"lastname"]];
                Email  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"email"]];
                //image  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"image"]];
                image = @"";
                Address  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"address"]];
                Zip  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"zip"]];
                DOB  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"dob"]];
                Height  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"height"]];
                Weight  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"weight"]];
                PhoneNumber  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"phone"]];
                Gender  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"gender"]];
                
                
                //[self createDataBaseFunction];
               // [self InsertIntoDataBase];
                
                VerifyAccountDetailViewController *veri=[[VerifyAccountDetailViewController  alloc]init];
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

#pragma mark DataBase
-(void) createDataBaseFunction
{
    sqlite3 *MyMediDB;
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = dirPaths[0];
    NSString *databasePath =  [docsDir stringByAppendingPathComponent:@"MyMedi.db"];
    NSLog(@"path of database file is => %@",databasePath);
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &MyMediDB) == SQLITE_OK)
    {
        char *errMsg;
        const char *sql_stmt =
        "CREATE TABLE IF NOT EXISTS UserInformationTable (UserID INTEGER , FirstName TEXT, LastName TEXT, Email TEXT, Image TEXT, Address TEXT, Zip TEXT, DOB TEXT, Height TEXT, Weight TEXT, PhoneNumber TEXT, Gender TEXT)";
        
        const char *sql_stmt1 =
        "CREATE TABLE IF NOT EXISTS AppointmentTable (AppointmentID INTEGER , AppointmentName TEXT, ConsultantName TEXT, AppointmentTime TEXT, Hospital TEXT, AppointmentType TEXT, Provider TEXT, Notes TEXT, UserID TEXT)";
        
        const char *sql_stmt2 =
        "CREATE TABLE IF NOT EXISTS EmergencyTable (UserID TEXT, ContactNumber TEXT, BloodGroup TEXT, ContactName TEXT, ContactAddress TEXT, Allergies TEXT, CriticalProblems TEXT)";
        
        if ( (sqlite3_exec(MyMediDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) || (sqlite3_exec(MyMediDB, sql_stmt1, NULL, NULL, &errMsg) != SQLITE_OK) || (sqlite3_exec(MyMediDB, sql_stmt2, NULL, NULL, &errMsg) != SQLITE_OK))
        {
            NSLog( @"Failed to create table");
        }
        else
        {
            NSLog(@" TABLES created successfully");
        }
    }
    else
    {
        NSLog(@"Failed to open/create database");
    }
    
    sqlite3_close(MyMediDB);
}

//-(void) InsertIntoDataBase
//{
//    
//    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docsDir = dirPaths[0];
//    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"MyMedi.db"]];
//    sqlite3 *MyMediDB;
//    sqlite3_stmt *statement;
//    const char *dbpath = [databasePath UTF8String];
//    if (sqlite3_open(dbpath, &MyMediDB) == SQLITE_OK)
//    {
//        NSString *insertStatement = [NSString stringWithFormat: @"INSERT INTO UserInformationTable(UserID, FirstName, LastName, Email, Image, Address, Zip, DOB, Height, Weight, PhoneNumber, Gender) VALUES ('%@', '%@' , '%@' , '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@' )",userId, firstName, lastName, Email, image, Address, Zip, DOB, Height, Weight, PhoneNumber, Gender ];
//        NSLog(@"insertStatement=%@",insertStatement);
//        const char *insert_stmt = [insertStatement UTF8String];
//        sqlite3_prepare_v2(MyMediDB, insert_stmt,-1, &statement, NULL);
//        if (sqlite3_step(statement) == SQLITE_DONE)
//        {
//            NSLog(@"Insertion Successful");
//        }
//        else
//        {
//            NSLog(@"Insertion Failure: %s",sqlite3_errmsg(MyMediDB));
//        }
//    }
//    sqlite3_close(MyMediDB);
//}


-(void)ForgetPasswordPopUp
{
    ForgetPasswordBackGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    ForgetPasswordBackGroundView.backgroundColor=[UIColor blackColor];
    ForgetPasswordBackGroundView.alpha=0.8;
    [self.view addSubview:ForgetPasswordBackGroundView];
    
    ForgetPasswordView=[[UIView alloc]initWithFrame:CGRectMake(60, 150, 200, 250)];
    ForgetPasswordView.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    ForgetPasswordView.tag=500;
    
    ForgetPasswordLable=[[UILabel alloc]initWithFrame:CGRectMake(25, 5, 150, 40)];
    ForgetPasswordLable.text=@"Forgot Password?";
    [ForgetPasswordLable setFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Roman" size:15]];
    ForgetPasswordLable.textAlignment=NSTextAlignmentCenter;
    ForgetPasswordLable.backgroundColor=[UIColor clearColor];
    ForgetPasswordLable.textColor=[UIColor blackColor];
    [ForgetPasswordView addSubview:ForgetPasswordLable];
    
    ForgetEmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, ForgetPasswordLable.frame.size.height+ForgetPasswordLable.frame.origin.y+10, 286-120, 40)];
    ForgetEmailTextField.delegate = self;
    ForgetEmailTextField.placeholder = @"Email *";
    ForgetEmailTextField.textColor=[UIColor blackColor];
    ForgetEmailTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    ForgetEmailTextField.leftView = paddingView;
    ForgetEmailTextField.leftViewMode = UITextFieldViewModeAlways;
    [ForgetEmailTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    ForgetEmailTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    ForgetEmailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [ForgetEmailTextField setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    ForgetEmailTextField.autocapitalizationType = NO;
    ForgetEmailTextField.returnKeyType=UIReturnKeyNext;
    ForgetEmailTextField.keyboardType=UIKeyboardTypeEmailAddress;
    ForgetEmailTextField.backgroundColor=[UIColor whiteColor];
    [ForgetEmailTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [ForgetPasswordView addSubview:ForgetEmailTextField];
    
    ResetPasswordButton=[[UIButton alloc]initWithFrame:CGRectMake(15, ForgetEmailTextField.frame.size.height+ForgetEmailTextField.frame.origin.y+25,286-120 ,40)];
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
    
    
    TechSupportButton=[[UIButton alloc]initWithFrame:CGRectMake(15, ResetPasswordButton.frame.size.height+ResetPasswordButton.frame.origin.y+10,286-120 ,40)];
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
-(void)ResetButtonActionNormal
{
    ResetPasswordButton.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    [ResetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [ResetPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}
-(void)TechButtonActionNormal
{
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
        [self LoginButtonAction];
        
    }
    return YES;
}
-(void)ForgetPasswordAction
{
    ResetPasswordButton.backgroundColor=[UIColor whiteColor];
    if(ForgetEmailTextField.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        [ForgetEmailTextField resignFirstResponder];
    }
    else
        if (![self validateEmail:ForgetEmailTextField.text])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            alert = nil;
            [ForgetEmailTextField resignFirstResponder];
        }
        else
        {
            [ForgetEmailTextField resignFirstResponder];
           // [self ShowActivityIndicatorWithTitle:@"Loading..."];
            //[self performSelector:@selector(serverCallForForgotPassword) withObject:nil afterDelay:0.1];
        }
    
}
-(void)serverCallForForgotPassword

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
                                 };
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/forgot_password",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
        {
            NSLog(@"Forgot Email JSON--->%@",json);
            if([[json objectForKey:@"log"] isEqualToString:@"Password is sent to your email."])
            {
                [ForgetEmailTextField setText:@""];
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"log"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
                
                
            }
            
            [self HideActivityIndicator];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error.description);
            [self HideActivityIndicator];
            UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [unable show];
        }];
        
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
    
    UITouch* touch =[touches anyObject];
    if([touch view] == (UIView *)[self.view viewWithTag:500])
    {
    }
    else{
        [ForgetPasswordBackGroundView removeFromSuperview];
        [ForgetPasswordView removeFromSuperview];
    }
}

-(IBAction)textFieldDoneEditing:(id)sender{
}
-(void)nextviewController{
    
}
-(void)BackVeiwController
{
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
-(void)dealloc{
    [Backbutton removeFromSuperview];
    Backbutton=nil;
    [CenterView removeFromSuperview];
    CenterView=nil;
    [NextViewController removeFromSuperview];
    NextViewController=nil;
    [ForgetPasswordButton removeFromSuperview];
    ForgetPasswordButton=nil;
    [UserNameTextField removeFromSuperview];
    UserNameTextField=nil;
    [PasswordTextField removeFromSuperview];
    PasswordTextField=nil;
    [ForgetPasswordBackGroundView removeFromSuperview];
    ForgetPasswordBackGroundView=nil;
    [ForgetPasswordView removeFromSuperview];
    ForgetPasswordView=nil;
    [ForgetEmailTextField removeFromSuperview];
    ForgetEmailTextField=nil;
    [paddingView removeFromSuperview];
    paddingView=nil;
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    [ResetPasswordButton removeFromSuperview];
    ResetPasswordButton=nil;
    [TechSupportButton removeFromSuperview];
    TechSupportButton=nil;
    [ForgetPasswordLable removeFromSuperview];
    ForgetPasswordLable=nil;
    [CenterLogoImageView removeFromSuperview];
    CenterLogoImageView=nil;
    [SignInLable removeFromSuperview];
    SignInLable=nil;
    tapRecognizer=nil;
}
-(void)scrollViewDidTapped{
    [PasswordTextField resignFirstResponder];
    [UserNameTextField resignFirstResponder];
}

//-(void)TestingStart
//{
//    
//    Reachability *reach = [Reachability reachabilityForInternetConnection];
//    NetworkStatus netStatus = [reach currentReachabilityStatus];
//    if (netStatus == NotReachable)
//    {
//        [self HideActivityIndicator];
//        
//        UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [unable show];
//    }
//    else
//    {
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        NSDictionary *params = @{
//                                 @"from_email":@"prashantkumat@applify.guru",
//                                 @"to_email": @"applify@applify.guru",
//                                 };
//        NSLog(@"Parameter=>%@",params);
//        
//        [manager POST:[NSString stringWithFormat:@"http://teamhood.applifytech.com/index.php/chat_conversion"] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
//            NSLog(@"JSON--->%@",json);
//            if([json objectForKey:@"error"])
//            {
//                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                [myAlertView show];
//            }
//            else
//            {
//                
//                
//                [[NSUserDefaults standardUserDefaults] setObject:json forKey:kLoginData];
//                
//                NSLog(@"count=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"response"] count]);
//                for (int k=0; k<[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"response"] count]; k++) {
//                    
//                    
//                    NSLog(@"message_status>>>>>>>>>>=%@",[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData]objectForKey:@"response"] objectAtIndex:k] objectForKey:@"to_email_user_id"]);
//                }
//                
//                [[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData]objectForKey:@"response"] objectAtIndex:0] valueForKey:@"massage"];
//                
//                [[NSUserDefaults standardUserDefaults] synchronize];
//                
//                
//                
//                
////                userId = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"userid"]];
////                firstName  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"firstname"]];
////                lastName  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"lastname"]];
////                Email  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"email"]];
////                //image  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"image"]];
////                image = @"";
////                Address  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"address"]];
////                Zip  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"zip"]];
////                DOB  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"dob"]];
////                Height  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"height"]];
////                Weight  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"weight"]];
////                PhoneNumber  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"phone"]];
////                Gender  = [NSString stringWithFormat:@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"gender"]];
////                
////                
////                [self createDataBaseFunction];
////                [self InsertIntoDataBase];
//                
//                VerifyAccountDetailViewController *veri=[[VerifyAccountDetailViewController  alloc]init];
//                [self.navigationController pushViewController:veri animated:YES];
//            }
//            
//            [self HideActivityIndicator];
//            NSLog(@"JSON: %@", json);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error)
//         {
//             NSLog(@"Error: %@", error.description);
//             [self HideActivityIndicator];
//             UIAlertView *unable=[[UIAlertView alloc]initWithTitle:nil  message:@"Unable to connect with server." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//             [unable show];
//         }];
//        
//    }
//}

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
