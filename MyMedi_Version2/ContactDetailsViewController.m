//
//  ContactDetailsViewController.m
//  MyMedi_Version2
//
//  Created by Applify Tech on 19/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "ContactDetailsViewController.h"

@interface ContactDetailsViewController ()

@end

@implementation ContactDetailsViewController
{
    UIView *headerView;
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *editButton;
    UIView *horizontalLIneView;
    UIView *BottomView;
    UIButton *myMediButton;
    
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
    
    
    UITextField *mobileTextField;
    UITextField *homeTextField;
    UITextField *workTextField;
    UITextField *emailAddressTextField;
}

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [headerView removeFromSuperview];
    headerView = nil;
    headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    headerView.userInteractionEnabled = YES;
    [self.view addSubview:headerView];
    
    [headerLabel removeFromSuperview];
    headerLabel = nil;
    headerLabel = [[UILabel alloc] init];
    headerLabel.font = [UIFont fontWithName:@"Europa-Regular" size:17];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textColor=[UIColor whiteColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.text= @"Contact Details";
    [self.view addSubview:headerLabel];
    
    [backButton removeFromSuperview];
    backButton = nil;
    backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.backgroundColor=[UIColor clearColor];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_Button_image.png"] forState:UIControlStateNormal];
    backButton.exclusiveTouch = YES;
    [backButton addTarget:self action:@selector(BackButtonFunction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    [editButton removeFromSuperview];
    editButton = nil;
    editButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    editButton.backgroundColor=[UIColor clearColor];
    [editButton setBackgroundImage:[UIImage imageNamed:@"profileedit.png"] forState:UIControlStateNormal];
    editButton.exclusiveTouch = YES;
    [editButton addTarget:self action:@selector(editButtonFunction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:editButton];
    
    
    [horizontalLIneView removeFromSuperview];
    horizontalLIneView = nil;
    horizontalLIneView = [[UIView alloc]init];
    horizontalLIneView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:horizontalLIneView];

    
    BottomView=[[UIView alloc]init];
    BottomView.backgroundColor=[UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width,[UIImage imageNamed:@"bottommymedi.png"].size.height)];//bottommymedi_sel.png
    HomeButton.backgroundColor=[UIColor clearColor];//bottommymedi.png
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi.png"] forState:UIControlStateNormal];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateHighlighted];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateSelected];
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    [AppointmentsBottomButton removeFromSuperview];
    AppointmentsBottomButton=nil;
    AppointmentsBottomButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.size.width+HomeButton.frame.origin.x, 0, [UIImage imageNamed:@"appointments.png"].size.width,[UIImage imageNamed:@"appointments.png"].size.height)];//appointments_sel.png
    AppointmentsBottomButton.backgroundColor=[UIColor clearColor];//appointments.png
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateNormal];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateSelected];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateHighlighted];
    [AppointmentsBottomButton addTarget:self action:@selector(AppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:AppointmentsBottomButton];
    
    
    [ProfileButton removeFromSuperview];
    ProfileButton=nil;
    ProfileButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentsBottomButton.frame.size.width+AppointmentsBottomButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomprofile.png"].size.width,[UIImage imageNamed:@"bottomprofile.png"].size.height)];
    ProfileButton.backgroundColor=[UIColor clearColor];//bottomprofile.png  //bottomprofile_sel.png
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateNormal];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile.png"] forState:UIControlStateSelected];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile.png"] forState:UIControlStateHighlighted];
    ProfileButton.userInteractionEnabled=FALSE;
    [ProfileButton addTarget:self action:@selector(ProfileButtonAction) forControlEvents:UIControlEventTouchUpInside];
    ProfileButton.userInteractionEnabled=FALSE;
    [BottomView addSubview:ProfileButton];
    
    
    [ShortCutButton removeFromSuperview];
    ShortCutButton=nil;
    ShortCutButton=[[UIButton alloc]initWithFrame:CGRectMake(ProfileButton.frame.origin.x+ProfileButton.frame.size.width, 0,[UIImage imageNamed:@"bottomshortcut.png"].size.width,[UIImage imageNamed:@"bottomshortcut.png"].size.height)];
    ShortCutButton.backgroundColor=[UIColor clearColor];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut.png"] forState:UIControlStateNormal];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateSelected];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateHighlighted];
    [ShortCutButton addTarget:self action:@selector(ShortCutButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ShortCutButton];
    
    [SettingButton removeFromSuperview];
    SettingButton=nil;
    SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(ShortCutButton.frame.size.width+ShortCutButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomsettings.png"].size.width,[UIImage imageNamed:@"bottomsettings.png"].size.height)];
    SettingButton.backgroundColor=[UIColor clearColor];//bottomsettings.png
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateNormal];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateSelected];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateHighlighted];
    [SettingButton addTarget:self action:@selector(SettingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SettingButton];
    [self.view addSubview:BottomView];

    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            backButton.frame = CGRectMake(0, 20, [UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
            headerLabel.frame = CGRectMake(backButton.frame.size.width+backButton.frame.origin.x, 20, 220, 44);
            editButton.frame = CGRectMake(headerLabel.frame.origin.x+headerLabel.frame.size.width, 20, [UIImage imageNamed:@"profileedit.png"].size.width, [UIImage imageNamed:@"profileedit.png"].size.height);
            
            
            horizontalLIneView.frame = CGRectMake(0, 519, 320, 1);
            BottomView.frame = CGRectMake(0, 520, 320, 49);
            myMediButton.frame  = CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width, [UIImage imageNamed:@"bottommymedi.png"].size.height);
        }
        else
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            backButton.frame = CGRectMake(0, 20, [UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
            headerLabel.frame = CGRectMake(backButton.frame.size.width+backButton.frame.origin.x, 20, 220, 44);
            editButton.frame = CGRectMake(headerLabel.frame.origin.x+headerLabel.frame.size.width, 20, [UIImage imageNamed:@"profileedit.png"].size.width, [UIImage imageNamed:@"profileedit.png"].size.height);
            
            horizontalLIneView.frame = CGRectMake(0, self.view.frame.size.height-50, 320, 1);
            BottomView.frame = CGRectMake(0, 440, 320, 40);
            myMediButton.frame  = CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width, [UIImage imageNamed:@"bottommymedi.png"].size.height);
        }
    }
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
#pragma mark Mobile Tel
    
    UILabel *mobileLabel = [[UILabel alloc] init];
    mobileLabel.frame = CGRectMake(10, headerView.frame.size.height+headerView.frame.origin.y, 300, 20);
    mobileLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    mobileLabel.backgroundColor = [UIColor clearColor];
    mobileLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    mobileLabel.textAlignment = NSTextAlignmentLeft;
    mobileLabel.text= @"Mobile";
    [self.view addSubview:mobileLabel];
    
    [mobileTextField removeFromSuperview];
    mobileTextField=nil;
    mobileTextField = [[UITextField alloc]init];
    mobileTextField.frame = CGRectMake(10, mobileLabel.frame.origin.y+mobileLabel.frame.size.height+5, 300, 25);
    mobileTextField.placeholder = @"Enter number";
    mobileTextField.tag = 2;
    mobileTextField.borderStyle = UITextBorderStyleNone;
    mobileTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    mobileTextField.keyboardType = UIKeyboardTypeDefault;
    mobileTextField.returnKeyType = UIReturnKeyDone;
    mobileTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    mobileTextField.secureTextEntry=false;
    mobileTextField.delegate = self;
    mobileTextField.textColor = [UIColor blackColor];
    mobileTextField.leftViewMode=UITextFieldViewModeAlways;
    mobileTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    mobileTextField.adjustsFontSizeToFitWidth = YES;
    mobileTextField.minimumFontSize = 7.0;
        mobileTextField.userInteractionEnabled=FALSE;
    mobileTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [self.view addSubview:mobileTextField];
    
    UIView *horizontalLineView = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y+58, 320, 0.5)];
    horizontalLineView.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [self.view addSubview:horizontalLineView];
    
    
#pragma mark Home Tel
    
    UILabel *homeLabel = [[UILabel alloc] init];
    homeLabel.frame = CGRectMake(10, horizontalLineView.frame.size.height+horizontalLineView.frame.origin.y, 300, 20);
    homeLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    homeLabel.backgroundColor = [UIColor clearColor];
    homeLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    homeLabel.textAlignment = NSTextAlignmentLeft;
    homeLabel.text= @"Home";
    [self.view addSubview:homeLabel];
    
    [homeTextField removeFromSuperview];
    homeTextField=nil;
    homeTextField = [[UITextField alloc]init];
    homeTextField.frame = CGRectMake(10, homeLabel.frame.origin.y+homeLabel.frame.size.height+5, 300, 25);
    homeTextField.placeholder = @"Enter number";
    homeTextField.tag = 2;
    homeTextField.borderStyle = UITextBorderStyleNone;
    homeTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    homeTextField.keyboardType = UIKeyboardTypeDefault;
    homeTextField.returnKeyType = UIReturnKeyDone;
    homeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    homeTextField.secureTextEntry=false;
    homeTextField.delegate = self;
    homeTextField.textColor = [UIColor blackColor];
    homeTextField.leftViewMode=UITextFieldViewModeAlways;
    homeTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    homeTextField.adjustsFontSizeToFitWidth = YES;
    homeTextField.minimumFontSize = 7.0;
    homeTextField.userInteractionEnabled=FALSE;
    homeTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [self.view addSubview:homeTextField];
    
    UIView *horizontalLineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y+ 116, 320, 0.5)];
    horizontalLineView1.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [self.view addSubview:horizontalLineView1];

    
#pragma mark Work Tel
    
    UILabel *workLabel = [[UILabel alloc] init];
    workLabel.frame = CGRectMake(10, horizontalLineView1.frame.size.height+horizontalLineView1.frame.origin.y, 300, 20);
    workLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    workLabel.backgroundColor = [UIColor clearColor];
    workLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    workLabel.textAlignment = NSTextAlignmentLeft;
    workLabel.text= @"Work";
    [self.view addSubview:workLabel];
    
    [workTextField removeFromSuperview];
    workTextField=nil;
    workTextField = [[UITextField alloc]init];
    workTextField.frame = CGRectMake(10, workLabel.frame.origin.y+workLabel.frame.size.height+5, 300, 25);
    workTextField.placeholder = @"Enter number";
    workTextField.tag = 55;
    workTextField.borderStyle = UITextBorderStyleNone;
    workTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    workTextField.keyboardType = UIKeyboardTypeDefault;
    workTextField.returnKeyType = UIReturnKeyDone;
    workTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    workTextField.secureTextEntry=false;
    workTextField.delegate = self;
    workTextField.textColor = [UIColor blackColor];
    workTextField.leftViewMode=UITextFieldViewModeAlways;
    workTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    workTextField.adjustsFontSizeToFitWidth = YES;
    workTextField.minimumFontSize = 7.0;
    workTextField.userInteractionEnabled=FALSE;
    workTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [self.view addSubview:workTextField];
    
    UIView *horizontalLineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y+ 174, 320, 0.5)];
    horizontalLineView2.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [self.view addSubview:horizontalLineView2];
    
    
    
#pragma mark Email Address
    
    UILabel *emailAddressLabel = [[UILabel alloc] init];
    emailAddressLabel.frame = CGRectMake(10, horizontalLineView2.frame.size.height+horizontalLineView2.frame.origin.y, 300, 20);
    emailAddressLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    emailAddressLabel.backgroundColor = [UIColor clearColor];
    emailAddressLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    emailAddressLabel.textAlignment = NSTextAlignmentLeft;
    emailAddressLabel.text= @"Email";
    [self.view addSubview:emailAddressLabel];
    
    [emailAddressTextField removeFromSuperview];
    emailAddressTextField=nil;
    emailAddressTextField = [[UITextField alloc]init];
    emailAddressTextField.frame = CGRectMake(10, emailAddressLabel.frame.origin.y+emailAddressLabel.frame.size.height+5, 300, 25);
    emailAddressTextField.placeholder = @"Enter email address";
    emailAddressTextField.tag = 505;
    emailAddressTextField.borderStyle = UITextBorderStyleNone;
    emailAddressTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    emailAddressTextField.keyboardType = UIKeyboardTypeDefault;
    emailAddressTextField.returnKeyType = UIReturnKeyDone;
    emailAddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    emailAddressTextField.secureTextEntry=false;
    emailAddressTextField.delegate = self;
    emailAddressTextField.textColor = [UIColor blackColor];
    emailAddressTextField.leftViewMode=UITextFieldViewModeAlways;
    emailAddressTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    emailAddressTextField.adjustsFontSizeToFitWidth = YES;
    emailAddressTextField.minimumFontSize = 7.0;
    emailAddressTextField.userInteractionEnabled=FALSE;
    emailAddressTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [self.view addSubview:emailAddressTextField];
    
    UIView *horizontalLineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y+ 232, 320, 0.5)];
    horizontalLineView3.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [self.view addSubview:horizontalLineView3];
    
}
-(void)scrollViewDidTapped{
    
}
-(void)ShortCutButtonAction{
    
}

-(void)SettingButtonAction{
    
    SettingScreenViewController *home = [[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:home animated:NO];
}
-(void)HomeButtonAction{
    HomeScreenViewController *home = [[HomeScreenViewController alloc]init];
    [self.navigationController pushViewController:home animated:NO];
}
-(void)AppointmentButtonAction{
    
    AppointmentCalenderViewController *home = [[AppointmentCalenderViewController alloc]init];
    [self.navigationController pushViewController:home animated:NO];
    
}

-(void)ProfileButtonAction{
    
}

#pragma mark BackButtonFunction
-(void) BackButtonFunction
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark editButtonFunction
-(void) editButtonFunction
{
    mobileTextField.userInteractionEnabled=TRUE;
    homeTextField.userInteractionEnabled=TRUE;
    workTextField.userInteractionEnabled=TRUE;
    emailAddressTextField.userInteractionEnabled=TRUE;
}

#pragma mark myMediButtonFunction
-(void)myMediButtonFunction
{
    NSLog(@"myMediButtonFunction called");
}

#pragma mark TextField Delegate
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}



@end
