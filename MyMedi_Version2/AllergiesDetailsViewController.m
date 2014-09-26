//
//  AllergiesDetailsViewController.m
//  MyMedi_Version2
//
//  Created by anish on 25/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "AllergiesDetailsViewController.h"

@interface AllergiesDetailsViewController (){
    UIView *headerView;
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *editButton;
    UIView *horizontalLIneView;
    UIView *BottomView;
    UIButton *myMediButton;
    UIScrollView *personalDetailsScroll;
    
    UILabel *firstNameLabel;
    UITextField *firstNameTextField;
    
    UILabel *lastNameLabel;
    UITextField *lastNameTextField;
    
    UILabel *DOBLabel;
    UITextField  *dobTextField;
    UIDatePicker *datePicker;
    
    UILabel *GenderLabel;
    UITextField  *GenderTextField;
    UIPickerView *chooseServicePicker;
    NSMutableArray *GenderPickerViewArray;
    
    UILabel *maritalStatusLabel;
    UITextField  *maritalStatusTextField;
    UIPickerView *chooseMaritalStatusGroupPicker;
    NSMutableArray *maritalStatusArray;
    
    UILabel *bloodGroup;
    UITextField  *bloodGroupTextField;
    UIPickerView *chooseBloodGroupPicker;
    NSMutableArray *bloodGroupArray;
    
    UILabel *nhsNumber;
    UITextField *nhsNumberTextField;
    
    UILabel *heightLabel;
    UITextField  *heightTextField;
    
    UILabel *weightLabel;
    UITextField  *weightTextField;
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
    UIView *paddingView;
    CGFloat animatedDistance;
}

@end

@implementation AllergiesDetailsViewController

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
    headerLabel.text= @"Allergies";
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
    
    
    [personalDetailsScroll removeFromSuperview];
    personalDetailsScroll = nil;
    personalDetailsScroll=[[UIScrollView alloc]init];
    personalDetailsScroll.backgroundColor=[UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    personalDetailsScroll.delegate=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    personalDetailsScroll.bounces = NO;
    personalDetailsScroll.showsHorizontalScrollIndicator=NO;
    personalDetailsScroll.showsVerticalScrollIndicator=NO;
    [personalDetailsScroll setContentSize:CGSizeMake(320, 545)];
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    [self.view addSubview:personalDetailsScroll];
    
#pragma mark FIRST NAME
    
    [firstNameLabel removeFromSuperview];
    firstNameLabel = nil;
    firstNameLabel = [[UILabel alloc] init];
    firstNameLabel.frame = CGRectMake(0, 0, 320, 20);
    firstNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:12];
    firstNameLabel.backgroundColor = [UIColor whiteColor];
    firstNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    firstNameLabel.textAlignment = NSTextAlignmentLeft;
    firstNameLabel.text= @"   Allergy Details";
    [personalDetailsScroll addSubview:firstNameLabel];
    
    [firstNameTextField removeFromSuperview];
    firstNameTextField = nil;
    firstNameTextField = [[UITextField alloc]init];
    firstNameTextField.frame = CGRectMake(0, 20, 320, 40);
    firstNameTextField.placeholder = @"Enter details";
    firstNameTextField.tag = 2;
    firstNameTextField.borderStyle = UITextBorderStyleNone;
    firstNameTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    firstNameTextField.keyboardType = UIKeyboardTypeDefault;
    firstNameTextField.returnKeyType = UIReturnKeyDone;
    firstNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    firstNameTextField.secureTextEntry=false;
    firstNameTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    firstNameTextField.leftView = paddingView;
    firstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    firstNameTextField.textColor = [UIColor blackColor];
    firstNameTextField.userInteractionEnabled=FALSE;
    // firstNameTextField.leftViewMode=UITextFieldViewModeAlways;
    firstNameTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    firstNameTextField.adjustsFontSizeToFitWidth = YES;
    firstNameTextField.minimumFontSize = 7.0;
    firstNameTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:firstNameTextField];
    
    
    
#pragma mark LAST NAME
    
    [lastNameLabel removeFromSuperview];
    lastNameLabel = nil;
    lastNameLabel = [[UILabel alloc] init];
    lastNameLabel.frame = CGRectMake(0, firstNameTextField.frame.size.height+firstNameTextField.frame.origin.y+1, 320, 20);
    lastNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:12];
    lastNameLabel.backgroundColor = [UIColor whiteColor];
    lastNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    lastNameLabel.textAlignment = NSTextAlignmentLeft;
    lastNameLabel.text= @"   Allergy Name";
    [personalDetailsScroll addSubview:lastNameLabel];
    
    [lastNameTextField removeFromSuperview];
    lastNameTextField = nil;
    lastNameTextField = [[UITextField alloc]init];
    lastNameTextField.frame = CGRectMake(0, lastNameLabel.frame.origin.y+lastNameLabel.frame.size.height, 320, 40);
    lastNameTextField.placeholder = @"Allergy Name";
    lastNameTextField.tag = 2;
    lastNameTextField.borderStyle = UITextBorderStyleNone;
    lastNameTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    lastNameTextField.keyboardType = UIKeyboardTypeDefault;
    lastNameTextField.returnKeyType = UIReturnKeyDone;
    lastNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    lastNameTextField.secureTextEntry=false;
    lastNameTextField.delegate = self;
    lastNameTextField.textColor = [UIColor blackColor];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    lastNameTextField.leftView = paddingView;
    lastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    lastNameTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    lastNameTextField.adjustsFontSizeToFitWidth = YES;
        lastNameTextField.userInteractionEnabled=FALSE;
    lastNameTextField.minimumFontSize = 7.0;
    lastNameTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:lastNameTextField];
    
    
    
#pragma mark DOB
    
    [DOBLabel removeFromSuperview];
    DOBLabel = nil;
    DOBLabel = [[UILabel alloc] init];
    DOBLabel.frame = CGRectMake(0, lastNameTextField.frame.size.height+lastNameTextField.frame.origin.y+1, 320, 20);
    DOBLabel.font = [UIFont fontWithName:@"Europa-Regular" size:12];
    DOBLabel.backgroundColor = [UIColor whiteColor];
    DOBLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    DOBLabel.textAlignment = NSTextAlignmentLeft;
    DOBLabel.text= @"   Allergy Notes";
    [personalDetailsScroll addSubview:DOBLabel];
    
    
    [dobTextField removeFromSuperview];
    dobTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, DOBLabel.frame.size.height+DOBLabel.frame.origin.y, 320, 40)];
    dobTextField.delegate = self;
    dobTextField.tag=1080;
    dobTextField.textColor=[UIColor blackColor];
    dobTextField.textAlignment = NSTextAlignmentLeft;
    [dobTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    dobTextField.leftViewMode = UITextFieldViewModeAlways;
    dobTextField.placeholder = @"Allergy Notes";
    dobTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    dobTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [dobTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    dobTextField.returnKeyType=UIReturnKeyDone;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    dobTextField.leftView = paddingView;
    dobTextField.keyboardType = UIKeyboardTypeDecimalPad;
    dobTextField.leftViewMode = UITextFieldViewModeAlways;
    dobTextField.backgroundColor=[UIColor whiteColor];
    dobTextField.autocapitalizationType = NO;
       dobTextField.userInteractionEnabled=FALSE;
    [dobTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [personalDetailsScroll addSubview:dobTextField];
    
    
    
#pragma mark Gender
    [GenderLabel removeFromSuperview];
    GenderLabel = nil;
    GenderLabel = [[UILabel alloc] init];
    GenderLabel.frame = CGRectMake(0, dobTextField.frame.size.height+dobTextField.frame.origin.y+1, 320, 20);
    GenderLabel.font = [UIFont fontWithName:@"Europa-Regular" size:12];
    GenderLabel.backgroundColor = [UIColor whiteColor];
    GenderLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    GenderLabel.textAlignment = NSTextAlignmentLeft;
    GenderLabel.text= @"   Allergy Attachments";
    [personalDetailsScroll addSubview:GenderLabel];
    
    
    [GenderTextField removeFromSuperview];
    GenderTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, GenderLabel.frame.size.height+GenderLabel.frame.origin.y, 320, 40)];
    GenderTextField.delegate = self;
    GenderTextField.tag=108;
    GenderTextField.textColor=[UIColor blackColor];
    GenderTextField.textAlignment = NSTextAlignmentLeft;
    [GenderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    GenderTextField.placeholder = @"Allergy Attachments";
    GenderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [GenderTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    GenderTextField.returnKeyType=UIReturnKeyDone;
    GenderTextField.keyboardType = UIKeyboardTypeEmailAddress;
    GenderTextField.backgroundColor=[UIColor whiteColor];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    GenderTextField.leftView = paddingView;
    GenderTextField.leftViewMode = UITextFieldViewModeAlways;
    GenderTextField.autocapitalizationType = NO;
         GenderTextField.userInteractionEnabled=FALSE;
    [GenderTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [personalDetailsScroll addSubview:GenderTextField];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            backButton.frame = CGRectMake(0, 20, [UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
            headerLabel.frame = CGRectMake(backButton.frame.size.width+backButton.frame.origin.x, 20, 220, 44);
            editButton.frame = CGRectMake(headerLabel.frame.origin.x+headerLabel.frame.size.width, 20, [UIImage imageNamed:@"profileedit.png"].size.width, [UIImage imageNamed:@"profileedit.png"].size.height);
            
            
            horizontalLIneView.frame = CGRectMake(0, 519, 320, 1);
            BottomView.frame=CGRectMake(0, 520, 320, 49);
            myMediButton.frame  = CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width, [UIImage imageNamed:@"bottommymedi.png"].size.height);
            
            personalDetailsScroll.frame = CGRectMake(0, headerView.frame.origin.y+headerView.frame.size.height, 320, 455);
            
        }
        else
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            backButton.frame = CGRectMake(0, 20, [UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
            headerLabel.frame = CGRectMake(backButton.frame.size.width+backButton.frame.origin.x, 20, 220, 44);
            editButton.frame = CGRectMake(headerLabel.frame.origin.x+headerLabel.frame.size.width, 20, [UIImage imageNamed:@"profileedit.png"].size.width, [UIImage imageNamed:@"profileedit.png"].size.height);
            
            horizontalLIneView.frame = CGRectMake(0, self.view.frame.size.height-50, 320, 1);
            BottomView.frame=CGRectMake(0, 520, 320, 49);
            myMediButton.frame  = CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width, [UIImage imageNamed:@"bottommymedi.png"].size.height);
            personalDetailsScroll.frame = CGRectMake(0, headerView.frame.origin.y+headerView.frame.size.height, 320, 200);
        }
    }
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

- (void)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark BackButtonFunction
-(void) BackButtonFunction
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark editButtonFunction
-(void) editButtonFunction
{
    firstNameTextField.userInteractionEnabled=TRUE;
    lastNameTextField.userInteractionEnabled=TRUE;
    dobTextField.userInteractionEnabled=TRUE;
    GenderTextField.userInteractionEnabled=TRUE;
}
-(void)scrollViewDidTapped{
    [firstNameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [dobTextField resignFirstResponder];
    [GenderTextField resignFirstResponder];
    [maritalStatusTextField resignFirstResponder];
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
