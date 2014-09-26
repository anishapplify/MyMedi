//
//  GPDetailsViewController.m
//  MyMedi_Version2
//
//  Created by Applify Tech on 19/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "GPDetailsViewController.h"

@interface GPDetailsViewController ()

@end

@implementation GPDetailsViewController
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
    
    
    UITextField *gpNameTextField;
    UITextField *gpAddressTextField;
    UITextField *gpContactTelephoneTextField;
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
    headerLabel.text= @"GP details";
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
            BottomView.frame = CGRectMake(0,440, 320, 49);
            myMediButton.frame  = CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width, [UIImage imageNamed:@"bottommymedi.png"].size.height);
        }
    }

#pragma mark GP Name
    
    UILabel *gpNameLabel = [[UILabel alloc] init];
    gpNameLabel.frame = CGRectMake(10, headerView.frame.size.height+headerView.frame.origin.y, 300, 20);
    gpNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    gpNameLabel.backgroundColor = [UIColor clearColor];
    gpNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    gpNameLabel.textAlignment = NSTextAlignmentLeft;
    gpNameLabel.text= @"GP Name";
    [self.view addSubview:gpNameLabel];
    
    [gpNameTextField removeFromSuperview];
    gpNameTextField=nil;
    gpNameTextField = [[UITextField alloc]init];
    gpNameTextField.frame = CGRectMake(10, gpNameLabel.frame.origin.y+gpNameLabel.frame.size.height+5, 300, 25);
    gpNameTextField.placeholder = @"Enter GP name";
    gpNameTextField.tag = 2;
    gpNameTextField.borderStyle = UITextBorderStyleNone;
    gpNameTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    gpNameTextField.keyboardType = UIKeyboardTypeDefault;
    gpNameTextField.returnKeyType = UIReturnKeyDone;
    gpNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    gpNameTextField.secureTextEntry=false;
    gpNameTextField.delegate = self;
    gpNameTextField.textColor = [UIColor blackColor];
    gpNameTextField.leftViewMode=UITextFieldViewModeAlways;
    gpNameTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    gpNameTextField.adjustsFontSizeToFitWidth = YES;
    gpNameTextField.minimumFontSize = 7.0;
    gpNameTextField.userInteractionEnabled=FALSE;
    gpNameTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [self.view addSubview:gpNameTextField];
    
    UIView *horizontalLineView = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y+58, 320, 0.5)];
    horizontalLineView.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [self.view addSubview:horizontalLineView];
    
    
#pragma mark GP Address
    
    UILabel *gpAddressLabel = [[UILabel alloc] init];
    gpAddressLabel.frame = CGRectMake(10, horizontalLineView.frame.size.height+horizontalLineView.frame.origin.y, 300, 20);
    gpAddressLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    gpAddressLabel.backgroundColor = [UIColor clearColor];
    gpAddressLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    gpAddressLabel.textAlignment = NSTextAlignmentLeft;
    gpAddressLabel.text= @"GP Address";
    [self.view addSubview:gpAddressLabel];
    
    [gpAddressTextField removeFromSuperview];
    gpAddressTextField=nil;
    gpAddressTextField = [[UITextField alloc]init];
    gpAddressTextField.frame = CGRectMake(10, gpAddressLabel.frame.origin.y+gpAddressLabel.frame.size.height+5, 300, 25);
    gpAddressTextField.placeholder = @"Enter GP address";
    gpAddressTextField.tag = 2;
    gpAddressTextField.borderStyle = UITextBorderStyleNone;
    gpAddressTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    gpAddressTextField.keyboardType = UIKeyboardTypeDefault;
    gpAddressTextField.returnKeyType = UIReturnKeyDone;
    gpAddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    gpAddressTextField.secureTextEntry=false;
    gpAddressTextField.delegate = self;
    gpAddressTextField.textColor = [UIColor blackColor];
    gpAddressTextField.leftViewMode=UITextFieldViewModeAlways;
    gpAddressTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    gpAddressTextField.adjustsFontSizeToFitWidth = YES;
    gpAddressTextField.minimumFontSize = 7.0;
    gpAddressTextField.userInteractionEnabled=FALSE;
    gpAddressTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [self.view addSubview:gpAddressTextField];
    
    UIView *horizontalLineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y+ 116, 320, 0.5)];
    horizontalLineView1.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [self.view addSubview:horizontalLineView1];
    
    
#pragma mark GP Contact Telephone
    
    UILabel *gpContactTelephoneLabel = [[UILabel alloc] init];
    gpContactTelephoneLabel.frame = CGRectMake(10, horizontalLineView1.frame.size.height+horizontalLineView1.frame.origin.y, 300, 20);
    gpContactTelephoneLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    gpContactTelephoneLabel.backgroundColor = [UIColor clearColor];
    gpContactTelephoneLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    gpContactTelephoneLabel.textAlignment = NSTextAlignmentLeft;
    gpContactTelephoneLabel.text= @"GP Contact Number";
    [self.view addSubview:gpContactTelephoneLabel];
    
    [gpContactTelephoneTextField removeFromSuperview];
    gpContactTelephoneTextField=nil;
    gpContactTelephoneTextField = [[UITextField alloc]init];
    gpContactTelephoneTextField.frame = CGRectMake(10, gpContactTelephoneLabel.frame.origin.y+gpContactTelephoneLabel.frame.size.height+5, 300, 25);
    gpContactTelephoneTextField.placeholder = @"Enter work number";
    gpContactTelephoneTextField.tag = 55;
    gpContactTelephoneTextField.borderStyle = UITextBorderStyleNone;
    gpContactTelephoneTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    gpContactTelephoneTextField.keyboardType = UIKeyboardTypeDefault;
    gpContactTelephoneTextField.returnKeyType = UIReturnKeyDone;
    gpContactTelephoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    gpContactTelephoneTextField.secureTextEntry=false;
    gpContactTelephoneTextField.delegate = self;
    gpContactTelephoneTextField.textColor = [UIColor blackColor];
    gpContactTelephoneTextField.leftViewMode=UITextFieldViewModeAlways;
    gpContactTelephoneTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    gpContactTelephoneTextField.adjustsFontSizeToFitWidth = YES;
    gpContactTelephoneTextField.minimumFontSize = 7.0;
    gpContactTelephoneTextField.userInteractionEnabled=FALSE;
    gpContactTelephoneTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [self.view addSubview:gpContactTelephoneTextField];
    
    UIView *horizontalLineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y+ 174, 320, 0.5)];
    horizontalLineView2.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [self.view addSubview:horizontalLineView2];
    
    
    
#pragma mark  GP Email
    
    UILabel *emailAddressLabel = [[UILabel alloc] init];
    emailAddressLabel.frame = CGRectMake(10, horizontalLineView2.frame.size.height+horizontalLineView2.frame.origin.y, 300, 20);
    emailAddressLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    emailAddressLabel.backgroundColor = [UIColor clearColor];
    emailAddressLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    emailAddressLabel.textAlignment = NSTextAlignmentLeft;
    emailAddressLabel.text= @"GP Email";
    [self.view addSubview:emailAddressLabel];
    
    [emailAddressTextField removeFromSuperview];
    emailAddressTextField=nil;
    emailAddressTextField = [[UITextField alloc]init];
    emailAddressTextField.frame = CGRectMake(10, emailAddressLabel.frame.origin.y+emailAddressLabel.frame.size.height+5, 300, 25);
    emailAddressTextField.placeholder = @"Enter GP email";
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
-(void)ShortCutButtonAction
{
    
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
    gpNameTextField.userInteractionEnabled=TRUE;
     gpAddressTextField.userInteractionEnabled=TRUE;
    gpContactTelephoneTextField.userInteractionEnabled=TRUE;
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
