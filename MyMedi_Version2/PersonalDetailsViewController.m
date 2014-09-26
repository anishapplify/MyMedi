//
//  PersonalDetailsViewController.m
//  MyMedi_Version2
//
//  Created by Applify Tech on 19/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "PersonalDetailsViewController.h"
@interface PersonalDetailsViewController ()

@end

@implementation PersonalDetailsViewController
{
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
    
    self.view.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];

    
    GenderPickerViewArray=[[NSMutableArray alloc]initWithObjects:@"Select Gender",@"Male",@"Female",@"Other", nil];
    
    bloodGroupArray = [[NSMutableArray alloc]initWithObjects:@"Select Blood Group",@"A-",@"A+",@"B-",@"B+",@"AB-",@"AB+",@"O-",@"O+", nil];
    
     maritalStatusArray = [[NSMutableArray alloc]initWithObjects:@"Select Marital Status",@"Single",@"Married",@"Divorced", nil];

    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 477,320,45)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               target:nil
                                               action:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    doneButton.width = 50;
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    
    
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
    headerLabel.text= @"Personal Details";
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
   personalDetailsScroll.backgroundColor=[UIColor whiteColor];
    //personalDetailsScroll.backgroundColor=[UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];

    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    [self.view addSubview:personalDetailsScroll];

#pragma mark FIRST NAME
    
    [firstNameLabel removeFromSuperview];
    firstNameLabel = nil;
    firstNameLabel = [[UILabel alloc] init];
    firstNameLabel.frame = CGRectMake(0, 0, 320, 20);
    firstNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    firstNameLabel.backgroundColor = [UIColor clearColor];
    firstNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    firstNameLabel.textAlignment = NSTextAlignmentLeft;
    firstNameLabel.text= @"   First Name";
    [personalDetailsScroll addSubview:firstNameLabel];

    [firstNameTextField removeFromSuperview];
    firstNameTextField = nil;
    firstNameTextField = [[UITextField alloc]init];
    firstNameTextField.frame = CGRectMake(0, 15, 320, 40);
    firstNameTextField.placeholder = @"Enter first name";
    firstNameTextField.tag = 2;
    firstNameTextField.borderStyle = UITextBorderStyleNone;
    firstNameTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    firstNameTextField.keyboardType = UIKeyboardTypeDefault;
    firstNameTextField.returnKeyType = UIReturnKeyDone;
    firstNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    firstNameTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    firstNameTextField.leftView = paddingView;
    firstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    firstNameTextField.textColor = [UIColor blackColor];
   // firstNameTextField.leftViewMode=UITextFieldViewModeAlways;
    firstNameTextField.adjustsFontSizeToFitWidth = YES;
    firstNameTextField.minimumFontSize = 7.0;
    firstNameTextField.userInteractionEnabled=FALSE;
    firstNameTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:firstNameTextField];

    
    UIView *horizontalLineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, firstNameTextField.frame.size.height+firstNameTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView1.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView1];
    
#pragma mark LAST NAME
    
    [lastNameLabel removeFromSuperview];
    lastNameLabel = nil;
    lastNameLabel = [[UILabel alloc] init];
    lastNameLabel.frame = CGRectMake(0, firstNameTextField.frame.size.height+firstNameTextField.frame.origin.y+0.5, 320, 15);
    lastNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    lastNameLabel.backgroundColor = [UIColor whiteColor];
    lastNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    lastNameLabel.textAlignment = NSTextAlignmentLeft;
    lastNameLabel.text= @"   Last Name";
    [personalDetailsScroll addSubview:lastNameLabel];
    
    [lastNameTextField removeFromSuperview];
    lastNameTextField = nil;
    lastNameTextField = [[UITextField alloc]init];
    lastNameTextField.frame = CGRectMake(0, lastNameLabel.frame.origin.y+lastNameLabel.frame.size.height, 320, 40);
    lastNameTextField.placeholder = @"Enter last name";
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
    lastNameTextField.minimumFontSize = 7.0;
      lastNameTextField.userInteractionEnabled=FALSE;
    lastNameTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:lastNameTextField];
    
    UIView *horizontalLineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, lastNameTextField.frame.size.height+lastNameTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView2.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView2];
    
    
#pragma mark DOB
    
    [DOBLabel removeFromSuperview];
    DOBLabel = nil;
    DOBLabel = [[UILabel alloc] init];
    DOBLabel.frame = CGRectMake(0, lastNameTextField.frame.size.height+lastNameTextField.frame.origin.y+0.5, 320, 20);
    DOBLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    DOBLabel.backgroundColor = [UIColor whiteColor];
    DOBLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    DOBLabel.textAlignment = NSTextAlignmentLeft;
    DOBLabel.text= @"   DOB";
    [personalDetailsScroll addSubview:DOBLabel];
    
    datePicker=[[UIDatePicker alloc]init];
    [datePicker setFrame:CGRectMake(0, 518, 320, 100)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.maximumDate = [NSDate date];
    [datePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
    
    [dobTextField removeFromSuperview];
    dobTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, DOBLabel.frame.size.height+DOBLabel.frame.origin.y, 320, 40)];
    dobTextField.delegate = self;
    dobTextField.tag=1080;
    dobTextField.textColor=[UIColor blackColor];
    dobTextField.textAlignment = NSTextAlignmentLeft;
    [dobTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    dobTextField.leftViewMode = UITextFieldViewModeAlways;
    dobTextField.placeholder = @"Enter dob";
    dobTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    dobTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [dobTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    dobTextField.returnKeyType=UIReturnKeyDone;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    dobTextField.leftView = paddingView;
    dobTextField.leftViewMode = UITextFieldViewModeAlways;
    dobTextField.backgroundColor=[UIColor whiteColor];
    dobTextField.inputView=datePicker;
     dobTextField.userInteractionEnabled=FALSE;
    [dobTextField setInputAccessoryView:toolbar];
    dobTextField.autocapitalizationType = NO;
    [dobTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [personalDetailsScroll addSubview:dobTextField];

    
    UIView *horizontalLineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, dobTextField.frame.size.height+dobTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView3.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView3];
    
#pragma mark Gender
    
    [GenderLabel removeFromSuperview];
    GenderLabel = nil;
    GenderLabel = [[UILabel alloc] init];
    GenderLabel.frame = CGRectMake(0, dobTextField.frame.size.height+dobTextField.frame.origin.y+0.5, 320, 20);
    GenderLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    GenderLabel.backgroundColor = [UIColor whiteColor];
    GenderLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    GenderLabel.textAlignment = NSTextAlignmentLeft;
    GenderLabel.text= @"   Gender";
    [personalDetailsScroll addSubview:GenderLabel];
    
    
    [GenderTextField removeFromSuperview];
    GenderTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, GenderLabel.frame.size.height+GenderLabel.frame.origin.y, 320, 40)];
    GenderTextField.delegate = self;
    GenderTextField.tag=108;
    GenderTextField.textColor=[UIColor blackColor];
    GenderTextField.textAlignment = NSTextAlignmentLeft;
    [GenderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    GenderTextField.placeholder = @"Enter gender";
    GenderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [GenderTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    GenderTextField.returnKeyType=UIReturnKeyDone;
    GenderTextField.backgroundColor=[UIColor whiteColor];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    GenderTextField.leftView = paddingView;
    GenderTextField.leftViewMode = UITextFieldViewModeAlways;
    GenderTextField.inputView=self.chooseServicePicker;
    GenderTextField.userInteractionEnabled=FALSE;
    [GenderTextField setInputAccessoryView:toolbar];
    GenderTextField.autocapitalizationType = NO;
    [GenderTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [personalDetailsScroll addSubview:GenderTextField];

    
    UIView *horizontalLineView4 = [[UIView alloc]initWithFrame:CGRectMake(0, GenderTextField.frame.size.height+GenderTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView4.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView4];
    
#pragma mark Marital Status
    
    [maritalStatusLabel removeFromSuperview];
    maritalStatusLabel = nil;
    maritalStatusLabel = [[UILabel alloc] init];
    maritalStatusLabel.frame = CGRectMake(0, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+0.5, 320, 20);
    maritalStatusLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    maritalStatusLabel.backgroundColor = [UIColor whiteColor];
    maritalStatusLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    maritalStatusLabel.textAlignment = NSTextAlignmentLeft;
    maritalStatusLabel.text= @"   Marital Status";
    [personalDetailsScroll addSubview:maritalStatusLabel];
    
    
    [maritalStatusTextField removeFromSuperview];
    maritalStatusTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, maritalStatusLabel.frame.size.height+maritalStatusLabel.frame.origin.y, 320, 40)];
    maritalStatusTextField.delegate = self;
    maritalStatusTextField.tag=1111;
    maritalStatusTextField.textColor=[UIColor blackColor];
    maritalStatusTextField.textAlignment = NSTextAlignmentLeft;
    [maritalStatusTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    maritalStatusTextField.leftView = paddingView;
    maritalStatusTextField.leftViewMode = UITextFieldViewModeAlways;
    maritalStatusTextField.placeholder = @"Enter marital status";
    maritalStatusTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    maritalStatusTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [maritalStatusTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    maritalStatusTextField.returnKeyType=UIReturnKeyDone;
    maritalStatusTextField.backgroundColor=[UIColor whiteColor];
    maritalStatusTextField.inputView=self.chooseMaritalStatusGroupPicker;
    [maritalStatusTextField setInputAccessoryView:toolbar];
    maritalStatusTextField.autocapitalizationType = NO;
     maritalStatusTextField.userInteractionEnabled=FALSE;
    [maritalStatusTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [personalDetailsScroll addSubview:maritalStatusTextField];


    UIView *horizontalLineView5 = [[UIView alloc]initWithFrame:CGRectMake(0, maritalStatusTextField.frame.size.height+maritalStatusTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView5.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView5];

    
#pragma mark Blood Group
    
    [bloodGroup removeFromSuperview];
    bloodGroup = nil;
    bloodGroup = [[UILabel alloc] init];
    bloodGroup.frame = CGRectMake(0, maritalStatusTextField.frame.size.height+maritalStatusTextField.frame.origin.y+0.5, 320, 20);
    bloodGroup.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    bloodGroup.backgroundColor = [UIColor whiteColor];
    bloodGroup.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    bloodGroup.textAlignment = NSTextAlignmentLeft;
    bloodGroup.text= @"   Blood Group";
    [personalDetailsScroll addSubview:bloodGroup];
    
    [bloodGroupTextField removeFromSuperview];
    bloodGroupTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, bloodGroup.frame.size.height+bloodGroup.frame.origin.y, 320, 40)];
    bloodGroupTextField.delegate = self;
    bloodGroupTextField.tag=1111;
    bloodGroupTextField.textColor=[UIColor blackColor];
    bloodGroupTextField.textAlignment = NSTextAlignmentLeft;
    [bloodGroupTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    bloodGroupTextField.placeholder = @"Enter blood group";
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    bloodGroupTextField.leftView = paddingView;
    bloodGroupTextField.leftViewMode = UITextFieldViewModeAlways;
    bloodGroupTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    bloodGroupTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [bloodGroupTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    bloodGroupTextField.returnKeyType=UIReturnKeyDone;
    bloodGroupTextField.userInteractionEnabled=FALSE;
    bloodGroupTextField.backgroundColor=[UIColor whiteColor];
    bloodGroupTextField.inputView=self.chooseBloodGroupPicker;
    [bloodGroupTextField setInputAccessoryView:toolbar];
    bloodGroupTextField.autocapitalizationType = NO;
    [bloodGroupTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [personalDetailsScroll addSubview:bloodGroupTextField];


    UIView *horizontalLineView6 = [[UIView alloc]initWithFrame:CGRectMake(0, bloodGroupTextField.frame.size.height+bloodGroupTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView6.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView6];
    

    
#pragma mark NHS NUMBER
    
    [nhsNumber removeFromSuperview];
    nhsNumber = nil;
    nhsNumber = [[UILabel alloc] init];
    nhsNumber.frame = CGRectMake(0, bloodGroupTextField.frame.size.height+bloodGroupTextField.frame.origin.y+0.5, 320, 20);
    nhsNumber.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    nhsNumber.backgroundColor = [UIColor whiteColor];
    nhsNumber.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    nhsNumber.textAlignment = NSTextAlignmentLeft;
    nhsNumber.text= @"   NHS NUMBER";
    [personalDetailsScroll addSubview:nhsNumber];
    
    [nhsNumberTextField removeFromSuperview];
    nhsNumberTextField = nil;
    nhsNumberTextField = [[UITextField alloc]init];
    nhsNumberTextField.frame = CGRectMake(0, nhsNumber.frame.size.height+nhsNumber.frame.origin.y, 320, 40);
    nhsNumberTextField.placeholder = @"Enter NHS number";
    nhsNumberTextField.tag = 2;
    nhsNumberTextField.borderStyle = UITextBorderStyleNone;
    nhsNumberTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    nhsNumberTextField.keyboardType = UIKeyboardTypeDecimalPad;
    nhsNumberTextField.returnKeyType = UIReturnKeyDone;
    nhsNumberTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    nhsNumberTextField.secureTextEntry=false;
    nhsNumberTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    nhsNumberTextField.leftView = paddingView;
      nhsNumberTextField.userInteractionEnabled=FALSE;
    nhsNumberTextField.leftViewMode = UITextFieldViewModeAlways;
    nhsNumberTextField.textColor = [UIColor blackColor];
    nhsNumberTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    nhsNumberTextField.adjustsFontSizeToFitWidth = YES;
    nhsNumberTextField.minimumFontSize = 7.0;
    nhsNumberTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:nhsNumberTextField];
    
    
    
    UIView *horizontalLineView7 = [[UIView alloc]initWithFrame:CGRectMake(0, nhsNumberTextField.frame.size.height+nhsNumberTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView7.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView7];

    

#pragma mark Height
    
    [heightLabel removeFromSuperview];
    heightLabel = nil;
    heightLabel = [[UILabel alloc] init];
    heightLabel.frame = CGRectMake(0, nhsNumberTextField.frame.size.height+nhsNumberTextField.frame.origin.y+0.5, 320, 20);
    heightLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    heightLabel.backgroundColor = [UIColor whiteColor];
    heightLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    heightLabel.textAlignment = NSTextAlignmentLeft;
    heightLabel.text= @"   Height";
    [personalDetailsScroll addSubview:heightLabel];
    
    [heightTextField removeFromSuperview];
    heightTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, heightLabel.frame.size.height+heightLabel.frame.origin.y, 320, 40)];
    heightTextField.delegate = self;
    heightTextField.tag=108;
    heightTextField.textColor=[UIColor blackColor];
    heightTextField.textAlignment = NSTextAlignmentLeft;
    [heightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    heightTextField.leftViewMode = UITextFieldViewModeAlways;
    heightTextField.placeholder = @"Enter height";
    heightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    heightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [heightTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    heightTextField.returnKeyType=UIReturnKeyDone;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    heightTextField.leftView = paddingView;
    heightTextField.userInteractionEnabled=FALSE;

    heightTextField.leftViewMode = UITextFieldViewModeAlways;
    heightTextField.keyboardType=UIKeyboardTypeDecimalPad;
    heightTextField.backgroundColor=[UIColor whiteColor];
    [heightTextField setInputAccessoryView:toolbar];
    heightTextField.autocapitalizationType = NO;
    [heightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [personalDetailsScroll addSubview:heightTextField];


    UIView *horizontalLineView8 = [[UIView alloc]initWithFrame:CGRectMake(0, heightTextField.frame.size.height+heightTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView8.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView8];
    

    
#pragma mark Weight
    
    [weightLabel removeFromSuperview];
    weightLabel = nil;
    weightLabel = [[UILabel alloc] init];
    weightLabel.frame = CGRectMake(0, heightTextField.frame.size.height+heightTextField.frame.origin.y+0.5, 320, 20);
    weightLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    weightLabel.backgroundColor = [UIColor whiteColor   ];
    weightLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    weightLabel.textAlignment = NSTextAlignmentLeft;
    weightLabel.text= @"   Weight";
    [personalDetailsScroll addSubview:weightLabel];
    
    [weightTextField removeFromSuperview];
    weightTextField = nil;
    weightTextField = [[UITextField alloc]init];
    weightTextField.frame = CGRectMake(0, weightLabel.frame.size.height+weightLabel.frame.origin.y, 320, 40);
    weightTextField.placeholder = @"Enter weight";
    weightTextField.tag = 2895;
    weightTextField.borderStyle = UITextBorderStyleNone;
    weightTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    weightTextField.keyboardType = UIKeyboardTypeDecimalPad;
    weightTextField.returnKeyType = UIReturnKeyDone;
    weightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    weightTextField.secureTextEntry=false;
    weightTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    weightTextField.leftView = paddingView;
    weightTextField.userInteractionEnabled=FALSE;
    weightTextField.leftViewMode = UITextFieldViewModeAlways;
    weightTextField.textColor = [UIColor blackColor];
    weightTextField.leftViewMode=UITextFieldViewModeAlways;
    weightTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    weightTextField.adjustsFontSizeToFitWidth = YES;
    weightTextField.minimumFontSize = 7.0;
    weightTextField.backgroundColor = [UIColor whiteColor];
    [weightTextField setInputAccessoryView:toolbar];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:weightTextField];


    UIView *horizontalLineView9 = [[UIView alloc]initWithFrame:CGRectMake(0, weightTextField.frame.size.height+weightTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView9.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView9];

    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            backButton.frame = CGRectMake(0, 20, [UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
            headerLabel.frame = CGRectMake(backButton.frame.size.width+backButton.frame.origin.x, 20, 220, 44);
            editButton.frame = CGRectMake(headerLabel.frame.origin.x+headerLabel.frame.size.width, 20, [UIImage imageNamed:@"profileedit.png"].size.width, [UIImage imageNamed:@"profileedit.png"].size.height);

            //editButton.backgroundColor=[UIColor yellowColor];
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

#pragma mark BackButtonFunction
-(void) BackButtonFunction
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark editButtonFunction
-(void) editButtonFunction
{
    weightTextField.userInteractionEnabled=TRUE;
    firstNameTextField.userInteractionEnabled=TRUE;
    lastNameTextField.userInteractionEnabled=TRUE;
    dobTextField.userInteractionEnabled=TRUE;
    GenderTextField.userInteractionEnabled=TRUE;
    maritalStatusTextField.userInteractionEnabled=TRUE;
    bloodGroupTextField.userInteractionEnabled=TRUE;
    nhsNumberTextField.userInteractionEnabled=TRUE;
    heightTextField.userInteractionEnabled=TRUE;
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
-(void)scrollViewDidTapped
{
    [firstNameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [dobTextField resignFirstResponder];
    [GenderTextField resignFirstResponder];
    [maritalStatusTextField resignFirstResponder];
    [bloodGroupTextField resignFirstResponder];
    [nhsNumberTextField resignFirstResponder];
    [heightTextField resignFirstResponder];
    [weightTextField resignFirstResponder];
}


#pragma mark chooseServicePicker
-(UIPickerView *)chooseServicePicker
{
    if(chooseServicePicker==nil)
    {
        chooseServicePicker=[[UIPickerView alloc]init];
        chooseServicePicker.delegate=self;
        chooseServicePicker.dataSource=self;
        chooseServicePicker.showsSelectionIndicator=YES;
        chooseServicePicker.tag = 1;
    }
    return chooseServicePicker;
}

#pragma mark chooseServicePicker
-(UIPickerView *)chooseBloodGroupPicker
{
    if(chooseBloodGroupPicker==nil)
    {
        chooseBloodGroupPicker=[[UIPickerView alloc]init];
        chooseBloodGroupPicker.delegate=self;
        chooseBloodGroupPicker.dataSource=self;
        chooseBloodGroupPicker.showsSelectionIndicator=YES;
        chooseBloodGroupPicker.tag = 2;
    }
    return chooseBloodGroupPicker;
}

#pragma mark chooseMaritalStatusGroupPicker
-(UIPickerView *)chooseMaritalStatusGroupPicker
{
    if(chooseMaritalStatusGroupPicker==nil)
    {
        chooseMaritalStatusGroupPicker=[[UIPickerView alloc]init];
        chooseMaritalStatusGroupPicker.delegate=self;
        chooseMaritalStatusGroupPicker.dataSource=self;
        chooseMaritalStatusGroupPicker.showsSelectionIndicator=YES;
        chooseMaritalStatusGroupPicker.tag = 3;
    }
    return chooseMaritalStatusGroupPicker;
}


-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}
- (void)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField.tag==2895){
        
    }
    else {
        
    }
}
#pragma mark Picker View Delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 1)
    {
        return [GenderPickerViewArray count];
    }
    else if (pickerView.tag == 3)
    {
        return [maritalStatusArray count];
    }
    else
    {
        return [bloodGroupArray count];
    }
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag==1)
    {
        return [GenderPickerViewArray objectAtIndex:row];
    }
    else if (pickerView.tag==3)
    {
        return [maritalStatusArray objectAtIndex:row];
    }
    else
    {
        return [bloodGroupArray objectAtIndex:row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 1)
    {
        NSLog(@"%@",[GenderPickerViewArray objectAtIndex:row]);
        if([[GenderPickerViewArray objectAtIndex:row]isEqualToString:@"Select Gender"])
        {
        }
        else
        {
            GenderTextField.text=[GenderPickerViewArray objectAtIndex:row];
        }
    }
    
    else if (pickerView.tag == 2)
    {
        NSLog(@"%@",[bloodGroupArray objectAtIndex:row]);
        if([[bloodGroupArray objectAtIndex:row]isEqualToString:@"Select Blood Group"])
        {
        }
        else
        {
            bloodGroupTextField.text=[bloodGroupArray objectAtIndex:row];
        }
    }
    
    else
    {
        NSLog(@"%@",[maritalStatusArray objectAtIndex:row]);
        if([[maritalStatusArray objectAtIndex:row]isEqualToString:@"Select Marital Status"])
        {
        }
        else
        {
            maritalStatusTextField.text=[maritalStatusArray objectAtIndex:row];
        }
    }
}

#pragma mark Date Picker
-(void)updateDateField
{
    dobTextField.text = [self formatDate:datePicker.date];
}
- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"dd'-'MM'-'yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- slide Keyboard up

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
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
    CGFloat heightofKeyboard = 280;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [personalDetailsScroll setContentInset:insets];
    [personalDetailsScroll setScrollIndicatorInsets:insets];
    
}

-(void)keyboardWillHide
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    [personalDetailsScroll setContentInset:insets];
    [personalDetailsScroll setScrollIndicatorInsets:insets];
    
}

@end
