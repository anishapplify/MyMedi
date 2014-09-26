//
//  EmergencyContactViewController.m
//  MyMedi_Version2
//
//  Created by anish on 25/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "EmergencyContactViewController.h"

@interface EmergencyContactViewController (){
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
    
    
    
    // New lables
    
     UILabel *EmeregencyCountry;
      UITextField  *EmergencyCountryTextField;
    
    UILabel *EmeregencyCountryOtherAddress;
    UITextField  *EmergencyCountryOtherAddressTextField;
    
    UILabel *EmeregencyContactMobileTelephone;
    UITextField  *EmergencyContactMobleTelephoneTextField;
    
    UILabel *EmeregencyContactWorkTelephone;
    UITextField  *EmergencyContactWorkTelephoneTextField;
    
    UILabel *EmeregencyContactHomeTelephone;
    UITextField  *EmergencyContactHomeTelephoneTextField;
    
    
    UILabel *EmeregencyContactEmail;
    UITextField  *EmergencyContactEmailTextField;
    
    
    UILabel *EmeregencyContactRelationship;
    UITextField  *EmergencyContactRelationshipTextField;
}

@end

@implementation EmergencyContactViewController

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
    headerLabel.text= @"Emergency Contact";
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
    

    [personalDetailsScroll removeFromSuperview];
    personalDetailsScroll = nil;
    personalDetailsScroll=[[UIScrollView alloc]init];
    //personalDetailsScroll.backgroundColor=[UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    personalDetailsScroll.backgroundColor=[UIColor whiteColor];
    personalDetailsScroll.delegate=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    personalDetailsScroll.bounces = NO;
    personalDetailsScroll.showsHorizontalScrollIndicator=NO;
    personalDetailsScroll.showsVerticalScrollIndicator=NO;
    [personalDetailsScroll setContentSize:CGSizeMake(320, 910)];
    
    
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
    firstNameLabel.text= @"   Emergency Contact First Name";
    [personalDetailsScroll addSubview:firstNameLabel];
    
    [firstNameTextField removeFromSuperview];
    firstNameTextField = nil;
    firstNameTextField = [[UITextField alloc]init];
    firstNameTextField.frame = CGRectMake(0, 20, 320, 40);
    firstNameTextField.placeholder = @"Enter first name";
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
    // firstNameTextField.leftViewMode=UITextFieldViewModeAlways;
    firstNameTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    firstNameTextField.adjustsFontSizeToFitWidth = YES;
    firstNameTextField.minimumFontSize = 7.0;
    firstNameTextField.userInteractionEnabled=FALSE;
    firstNameTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:firstNameTextField];
    
    UIView *horizontalLineView = [[UIView alloc]initWithFrame:CGRectMake(0, firstNameTextField.frame.size.height+firstNameTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView];
    
    
#pragma mark LAST NAME
    
    [lastNameLabel removeFromSuperview];
    lastNameLabel = nil;
    lastNameLabel = [[UILabel alloc] init];
    lastNameLabel.frame = CGRectMake(0, firstNameTextField.frame.size.height+firstNameTextField.frame.origin.y+1, 320, 20);
    lastNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    lastNameLabel.backgroundColor = [UIColor whiteColor];
    lastNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    lastNameLabel.textAlignment = NSTextAlignmentLeft;
    lastNameLabel.text= @"   Emergency Contact Surname";
    [personalDetailsScroll addSubview:lastNameLabel];
    
    [lastNameTextField removeFromSuperview];
    lastNameTextField = nil;
    lastNameTextField = [[UITextField alloc]init];
    lastNameTextField.frame = CGRectMake(0, lastNameLabel.frame.origin.y+lastNameLabel.frame.size.height, 320, 40);
    lastNameTextField.placeholder = @"Enter surname";
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
    DOBLabel.text= @"   Emergency Contact House/Flat No.";
    [personalDetailsScroll addSubview:DOBLabel];
    
    
    
    [dobTextField removeFromSuperview];
    dobTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, DOBLabel.frame.size.height+DOBLabel.frame.origin.y, 320, 40)];
    dobTextField.delegate = self;
    dobTextField.tag=1080;
    dobTextField.textColor=[UIColor blackColor];
    dobTextField.textAlignment = NSTextAlignmentLeft;
    [dobTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    dobTextField.leftViewMode = UITextFieldViewModeAlways;
    dobTextField.placeholder = @"Enter house/flat number";
    dobTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    dobTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [dobTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    dobTextField.returnKeyType=UIReturnKeyDone;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    dobTextField.leftView = paddingView;
    dobTextField.keyboardType = UIKeyboardTypeDefault;
    dobTextField.leftViewMode = UITextFieldViewModeAlways;
    dobTextField.backgroundColor=[UIColor whiteColor];
    dobTextField.autocapitalizationType = NO;
    dobTextField.userInteractionEnabled=FALSE;
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
    GenderLabel.text= @"   Emergency Address Line 1";
    [personalDetailsScroll addSubview:GenderLabel];
    
    
    [GenderTextField removeFromSuperview];
    GenderTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, GenderLabel.frame.size.height+GenderLabel.frame.origin.y, 320, 40)];
    GenderTextField.delegate = self;
    GenderTextField.tag=108;
    GenderTextField.textColor=[UIColor blackColor];
    GenderTextField.textAlignment = NSTextAlignmentLeft;
    [GenderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    GenderTextField.placeholder = @"Enter line 1";
    GenderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [GenderTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    GenderTextField.returnKeyType=UIReturnKeyDone;
    GenderTextField.backgroundColor=[UIColor whiteColor];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    GenderTextField.leftView = paddingView;
    GenderTextField.keyboardType = UIKeyboardTypeDefault;
    GenderTextField.leftViewMode = UITextFieldViewModeAlways;
    GenderTextField.autocapitalizationType = NO;
       GenderTextField.userInteractionEnabled=FALSE;
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
    maritalStatusLabel.text= @"   Emergency Address Line 2";
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
    maritalStatusTextField.placeholder = @"Enter line 2";
    maritalStatusTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    maritalStatusTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [maritalStatusTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    maritalStatusTextField.returnKeyType=UIReturnKeyDone;
    maritalStatusTextField.keyboardType = UIKeyboardTypeDefault;
    maritalStatusTextField.backgroundColor=[UIColor whiteColor];
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
    bloodGroup.text= @"   Emergency Address Line 3";
    [personalDetailsScroll addSubview:bloodGroup];
    
    [bloodGroupTextField removeFromSuperview];
    bloodGroupTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, bloodGroup.frame.size.height+bloodGroup.frame.origin.y, 320, 40)];
    bloodGroupTextField.delegate = self;
    bloodGroupTextField.tag=1111;
    bloodGroupTextField.textColor=[UIColor blackColor];
    bloodGroupTextField.textAlignment = NSTextAlignmentLeft;
    [bloodGroupTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    bloodGroupTextField.placeholder = @"Enter line 3";
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    bloodGroupTextField.leftView = paddingView;
    bloodGroupTextField.leftViewMode = UITextFieldViewModeAlways;
    bloodGroupTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    bloodGroupTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [bloodGroupTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    bloodGroupTextField.returnKeyType=UIReturnKeyDone;
    bloodGroupTextField.keyboardType = UIKeyboardTypeDefault;
    bloodGroupTextField.backgroundColor=[UIColor whiteColor];
    bloodGroupTextField.autocapitalizationType = NO;
        bloodGroupTextField.userInteractionEnabled=FALSE;
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
    nhsNumber.text= @"   Emergency Contact City";
    [personalDetailsScroll addSubview:nhsNumber];
    
    [nhsNumberTextField removeFromSuperview];
    nhsNumberTextField = nil;
    nhsNumberTextField = [[UITextField alloc]init];
    nhsNumberTextField.frame = CGRectMake(0, nhsNumber.frame.size.height+nhsNumber.frame.origin.y, 320, 40);
    nhsNumberTextField.placeholder = @"Enter city";
    nhsNumberTextField.tag = 2;
    nhsNumberTextField.borderStyle = UITextBorderStyleNone;
    nhsNumberTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    nhsNumberTextField.keyboardType = UIKeyboardTypeDefault;
    nhsNumberTextField.returnKeyType = UIReturnKeyDone;
    nhsNumberTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    nhsNumberTextField.secureTextEntry=false;
    nhsNumberTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    nhsNumberTextField.leftView = paddingView;
    nhsNumberTextField.leftViewMode = UITextFieldViewModeAlways;
    nhsNumberTextField.textColor = [UIColor blackColor];
    nhsNumberTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    nhsNumberTextField.adjustsFontSizeToFitWidth = YES;
    nhsNumberTextField.minimumFontSize = 7.0;
       nhsNumberTextField.userInteractionEnabled=FALSE;
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
    heightLabel.text= @"   Emergency Contact Postcode or zip";
    [personalDetailsScroll addSubview:heightLabel];
    
    [heightTextField removeFromSuperview];
    heightTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, heightLabel.frame.size.height+heightLabel.frame.origin.y, 320, 40)];
    heightTextField.delegate = self;
    heightTextField.tag=108;
    heightTextField.textColor=[UIColor blackColor];
    heightTextField.textAlignment = NSTextAlignmentLeft;
    [heightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    heightTextField.leftViewMode = UITextFieldViewModeAlways;
    heightTextField.placeholder = @"Enter postcode/zip";
    heightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    heightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [heightTextField setFont:[UIFont fontWithName:@"Europa-Regular" size:18]];
    heightTextField.returnKeyType=UIReturnKeyDone;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    heightTextField.leftView = paddingView;
    heightTextField.leftViewMode = UITextFieldViewModeAlways;
    heightTextField.keyboardType=UIKeyboardTypeDecimalPad;
    heightTextField.backgroundColor=[UIColor whiteColor];
    heightTextField.autocapitalizationType = NO;
        heightTextField.userInteractionEnabled=FALSE;
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
    weightLabel.text= @"   Emergency Contact Province State";
    [personalDetailsScroll addSubview:weightLabel];
    
    [weightTextField removeFromSuperview];
    weightTextField = nil;
    weightTextField = [[UITextField alloc]init];
    weightTextField.frame = CGRectMake(0, weightLabel.frame.size.height+weightLabel.frame.origin.y, 320, 40);
    weightTextField.placeholder = @"Enter province state";
    weightTextField.tag = 2895;
    weightTextField.borderStyle = UITextBorderStyleNone;
    weightTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    weightTextField.keyboardType = UIKeyboardTypeDefault;
    weightTextField.returnKeyType = UIReturnKeyDone;
    weightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    weightTextField.secureTextEntry=false;
    weightTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    weightTextField.leftView = paddingView;
    weightTextField.leftViewMode = UITextFieldViewModeAlways;
    weightTextField.textColor = [UIColor blackColor];
    weightTextField.leftViewMode=UITextFieldViewModeAlways;
    weightTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    weightTextField.adjustsFontSizeToFitWidth = YES;
    weightTextField.minimumFontSize = 7.0;
    weightTextField.userInteractionEnabled=FALSE;
    weightTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:weightTextField];
   
    
    
    UIView *horizontalLineView9 = [[UIView alloc]initWithFrame:CGRectMake(0, weightTextField.frame.size.height+weightTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView9.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView9];

    
#pragma mark Emergency Contact Country
    
    [EmeregencyCountry removeFromSuperview];
    EmeregencyCountry = nil;
    EmeregencyCountry = [[UILabel alloc] init];
    EmeregencyCountry.frame = CGRectMake(0, weightTextField.frame.size.height+weightTextField.frame.origin.y+0.5, 320, 20);
    EmeregencyCountry.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    EmeregencyCountry.backgroundColor = [UIColor whiteColor   ];
    EmeregencyCountry.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    EmeregencyCountry.textAlignment = NSTextAlignmentLeft;
    EmeregencyCountry.text= @"   Emergency Contact Country";
    [personalDetailsScroll addSubview:EmeregencyCountry];
    
    [EmergencyCountryTextField removeFromSuperview];
    EmergencyCountryTextField = nil;
    EmergencyCountryTextField = [[UITextField alloc]init];
    EmergencyCountryTextField.frame = CGRectMake(0, EmeregencyCountry.frame.size.height+EmeregencyCountry.frame.origin.y, 320, 40);
    EmergencyCountryTextField.placeholder = @"Enter country";
    EmergencyCountryTextField.tag = 2895;
    EmergencyCountryTextField.borderStyle = UITextBorderStyleNone;
    EmergencyCountryTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    EmergencyCountryTextField.keyboardType = UIKeyboardTypeDecimalPad;
    EmergencyCountryTextField.returnKeyType = UIReturnKeyDone;
    EmergencyCountryTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmergencyCountryTextField.secureTextEntry=false;
    EmergencyCountryTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmergencyCountryTextField.leftView = paddingView;
    EmergencyCountryTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyCountryTextField.textColor = [UIColor blackColor];
    EmergencyCountryTextField.leftViewMode=UITextFieldViewModeAlways;
    EmergencyCountryTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    EmergencyCountryTextField.adjustsFontSizeToFitWidth = YES;
    EmergencyCountryTextField.minimumFontSize = 7.0;
     EmergencyCountryTextField.userInteractionEnabled=FALSE;
    EmergencyCountryTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:EmergencyCountryTextField];
    
    UIView *horizontalLineView10 = [[UIView alloc]initWithFrame:CGRectMake(0, EmergencyCountryTextField.frame.size.height+EmergencyCountryTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView10.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView10];
#pragma mark Emergency Contact Other Address
    
    [EmeregencyCountryOtherAddress removeFromSuperview];
    EmeregencyCountryOtherAddress = nil;
    EmeregencyCountryOtherAddress = [[UILabel alloc] init];
    EmeregencyCountryOtherAddress.frame = CGRectMake(0, EmergencyCountryTextField.frame.size.height+EmergencyCountryTextField.frame.origin.y+0.5, 320, 20);
    EmeregencyCountryOtherAddress.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    EmeregencyCountryOtherAddress.backgroundColor = [UIColor whiteColor   ];
    EmeregencyCountryOtherAddress.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    EmeregencyCountryOtherAddress.textAlignment = NSTextAlignmentLeft;
    EmeregencyCountryOtherAddress.text= @"   Emergency Contact Other Address";
    [personalDetailsScroll addSubview:EmeregencyCountryOtherAddress];
    
    [EmergencyCountryOtherAddressTextField removeFromSuperview];
    EmergencyCountryOtherAddressTextField = nil;
    EmergencyCountryOtherAddressTextField = [[UITextField alloc]init];
    EmergencyCountryOtherAddressTextField.frame = CGRectMake(0, EmeregencyCountryOtherAddress.frame.size.height+EmeregencyCountryOtherAddress.frame.origin.y, 320, 40);
    EmergencyCountryOtherAddressTextField.placeholder = @"Enter other address";
    EmergencyCountryOtherAddressTextField.tag = 2895;
    EmergencyCountryOtherAddressTextField.borderStyle = UITextBorderStyleNone;
    EmergencyCountryOtherAddressTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    EmergencyCountryOtherAddressTextField.keyboardType = UIKeyboardTypeDefault;
    EmergencyCountryOtherAddressTextField.returnKeyType = UIReturnKeyDone;
    EmergencyCountryOtherAddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmergencyCountryOtherAddressTextField.secureTextEntry=false;
    EmergencyCountryOtherAddressTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmergencyCountryOtherAddressTextField.leftView = paddingView;
    EmergencyCountryOtherAddressTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyCountryOtherAddressTextField.textColor = [UIColor blackColor];
    EmergencyCountryOtherAddressTextField.leftViewMode=UITextFieldViewModeAlways;
    EmergencyCountryOtherAddressTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    EmergencyCountryOtherAddressTextField.adjustsFontSizeToFitWidth = YES;
    EmergencyCountryOtherAddressTextField.minimumFontSize = 7.0;
     EmergencyCountryOtherAddressTextField.userInteractionEnabled=FALSE;
    EmergencyCountryOtherAddressTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:EmergencyCountryOtherAddressTextField];
    
    UIView *horizontalLineView11 = [[UIView alloc]initWithFrame:CGRectMake(0, EmergencyCountryOtherAddressTextField.frame.size.height+EmergencyCountryOtherAddressTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView11.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView11];

    
    
#pragma mark Emergency Contact Mobile Telephone
    
    [EmeregencyContactMobileTelephone removeFromSuperview];
    EmeregencyContactMobileTelephone = nil;
    EmeregencyContactMobileTelephone = [[UILabel alloc] init];
    EmeregencyContactMobileTelephone.frame = CGRectMake(0, EmergencyCountryOtherAddressTextField.frame.size.height+EmergencyCountryOtherAddressTextField.frame.origin.y+0.5, 320, 20);
    EmeregencyContactMobileTelephone.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    EmeregencyContactMobileTelephone.backgroundColor = [UIColor whiteColor   ];
    EmeregencyContactMobileTelephone.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    EmeregencyContactMobileTelephone.textAlignment = NSTextAlignmentLeft;
    EmeregencyContactMobileTelephone.text= @"   Emergency Contact Mobile";
    [personalDetailsScroll addSubview:EmeregencyContactMobileTelephone];
    
    [EmergencyContactMobleTelephoneTextField removeFromSuperview];
    EmergencyContactMobleTelephoneTextField = nil;
    EmergencyContactMobleTelephoneTextField = [[UITextField alloc]init];
    EmergencyContactMobleTelephoneTextField.frame = CGRectMake(0, EmeregencyContactMobileTelephone.frame.size.height+EmeregencyContactMobileTelephone.frame.origin.y, 320, 40);
    EmergencyContactMobleTelephoneTextField.placeholder = @"Enter number";
    EmergencyContactMobleTelephoneTextField.tag = 2895;
    EmergencyContactMobleTelephoneTextField.borderStyle = UITextBorderStyleNone;
    EmergencyContactMobleTelephoneTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    EmergencyContactMobleTelephoneTextField.keyboardType = UIKeyboardTypeDecimalPad;
    EmergencyContactMobleTelephoneTextField.returnKeyType = UIReturnKeyDone;
    EmergencyContactMobleTelephoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmergencyContactMobleTelephoneTextField.secureTextEntry=false;
    EmergencyContactMobleTelephoneTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmergencyContactMobleTelephoneTextField.leftView = paddingView;
    EmergencyContactMobleTelephoneTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyContactMobleTelephoneTextField.textColor = [UIColor blackColor];
    EmergencyContactMobleTelephoneTextField.leftViewMode=UITextFieldViewModeAlways;
    EmergencyContactMobleTelephoneTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    EmergencyContactMobleTelephoneTextField.adjustsFontSizeToFitWidth = YES;
    EmergencyContactMobleTelephoneTextField.minimumFontSize = 7.0;
     EmergencyContactMobleTelephoneTextField.userInteractionEnabled=FALSE;
    EmergencyContactMobleTelephoneTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:EmergencyContactMobleTelephoneTextField];
  
    UIView *horizontalLineView12 = [[UIView alloc]initWithFrame:CGRectMake(0, EmergencyContactMobleTelephoneTextField.frame.size.height+EmergencyContactMobleTelephoneTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView12.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView12];
    
#pragma mark Emergency Contact Work Telephone
    
    [EmeregencyContactWorkTelephone removeFromSuperview];
    EmeregencyContactWorkTelephone = nil;
    EmeregencyContactWorkTelephone = [[UILabel alloc] init];
    EmeregencyContactWorkTelephone.frame = CGRectMake(0, EmergencyContactMobleTelephoneTextField.frame.size.height+EmergencyContactMobleTelephoneTextField.frame.origin.y+0.5, 320, 20);
    EmeregencyContactWorkTelephone.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    EmeregencyContactWorkTelephone.backgroundColor = [UIColor whiteColor   ];
    EmeregencyContactWorkTelephone.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    EmeregencyContactWorkTelephone.textAlignment = NSTextAlignmentLeft;
    EmeregencyContactWorkTelephone.text= @"   Emergency Contact Work";
    [personalDetailsScroll addSubview:EmeregencyContactWorkTelephone];
    
    [EmergencyContactWorkTelephoneTextField removeFromSuperview];
    EmergencyContactWorkTelephoneTextField = nil;
    EmergencyContactWorkTelephoneTextField = [[UITextField alloc]init];
    EmergencyContactWorkTelephoneTextField.frame = CGRectMake(0, EmeregencyContactWorkTelephone.frame.size.height+EmeregencyContactWorkTelephone.frame.origin.y, 320, 40);
    EmergencyContactWorkTelephoneTextField.placeholder = @"Enter number";
    EmergencyContactWorkTelephoneTextField.tag = 2895;
    EmergencyContactWorkTelephoneTextField.borderStyle = UITextBorderStyleNone;
    EmergencyContactWorkTelephoneTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    EmergencyContactWorkTelephoneTextField.keyboardType = UIKeyboardTypeDecimalPad;
    EmergencyContactWorkTelephoneTextField.returnKeyType = UIReturnKeyDone;
    EmergencyContactWorkTelephoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmergencyContactWorkTelephoneTextField.secureTextEntry=false;
    EmergencyContactWorkTelephoneTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmergencyContactWorkTelephoneTextField.leftView = paddingView;
    EmergencyContactWorkTelephoneTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyContactWorkTelephoneTextField.textColor = [UIColor blackColor];
    EmergencyContactWorkTelephoneTextField.leftViewMode=UITextFieldViewModeAlways;
    EmergencyContactWorkTelephoneTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    EmergencyContactWorkTelephoneTextField.adjustsFontSizeToFitWidth = YES;
    EmergencyContactWorkTelephoneTextField.minimumFontSize = 7.0;
    EmergencyContactWorkTelephoneTextField.userInteractionEnabled=FALSE;
    EmergencyContactWorkTelephoneTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:EmergencyContactWorkTelephoneTextField];
    
    UIView *horizontalLineView13 = [[UIView alloc]initWithFrame:CGRectMake(0, EmergencyContactWorkTelephoneTextField.frame.size.height+EmergencyContactWorkTelephoneTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView13.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView13];
    
#pragma mark Emergency Contact Work Telephone
    
    [EmeregencyContactHomeTelephone removeFromSuperview];
    EmeregencyContactHomeTelephone = nil;
    EmeregencyContactHomeTelephone = [[UILabel alloc] init];
    EmeregencyContactHomeTelephone.frame = CGRectMake(0, EmergencyContactWorkTelephoneTextField.frame.size.height+EmergencyContactWorkTelephoneTextField.frame.origin.y+0.5, 320, 20);
    EmeregencyContactHomeTelephone.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    EmeregencyContactHomeTelephone.backgroundColor = [UIColor whiteColor   ];
    EmeregencyContactHomeTelephone.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    EmeregencyContactHomeTelephone.textAlignment = NSTextAlignmentLeft;
    EmeregencyContactHomeTelephone.text= @"   Emergency Contact Home";
    [personalDetailsScroll addSubview:EmeregencyContactHomeTelephone];
    
    [EmergencyContactHomeTelephoneTextField removeFromSuperview];
    EmergencyContactHomeTelephoneTextField = nil;
    EmergencyContactHomeTelephoneTextField = [[UITextField alloc]init];
    EmergencyContactHomeTelephoneTextField.frame = CGRectMake(0, EmeregencyContactHomeTelephone.frame.size.height+EmeregencyContactHomeTelephone.frame.origin.y, 320, 40);
    EmergencyContactHomeTelephoneTextField.placeholder = @"Enter number";
    EmergencyContactHomeTelephoneTextField.tag = 2895;
    EmergencyContactHomeTelephoneTextField.borderStyle = UITextBorderStyleNone;
    EmergencyContactHomeTelephoneTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    EmergencyContactHomeTelephoneTextField.keyboardType = UIKeyboardTypeDecimalPad;
    EmergencyContactHomeTelephoneTextField.returnKeyType = UIReturnKeyDone;
    EmergencyContactHomeTelephoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmergencyContactHomeTelephoneTextField.secureTextEntry=false;
    EmergencyContactHomeTelephoneTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmergencyContactHomeTelephoneTextField.leftView = paddingView;
    EmergencyContactHomeTelephoneTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyContactHomeTelephoneTextField.textColor = [UIColor blackColor];
    EmergencyContactHomeTelephoneTextField.leftViewMode=UITextFieldViewModeAlways;
    EmergencyContactHomeTelephoneTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    EmergencyContactHomeTelephoneTextField.adjustsFontSizeToFitWidth = YES;
    EmergencyContactHomeTelephoneTextField.minimumFontSize = 7.0;
     EmergencyContactHomeTelephoneTextField.userInteractionEnabled=FALSE;
    EmergencyContactHomeTelephoneTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:EmergencyContactHomeTelephoneTextField];

    UIView *horizontalLineView14 = [[UIView alloc]initWithFrame:CGRectMake(0, EmergencyContactHomeTelephoneTextField.frame.size.height+EmergencyContactHomeTelephoneTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView14.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView14];
    

    
#pragma mark Emergency Contact Email
    
    [EmeregencyContactEmail removeFromSuperview];
    EmeregencyContactEmail = nil;
    EmeregencyContactEmail = [[UILabel alloc] init];
    EmeregencyContactEmail.frame = CGRectMake(0, EmergencyContactHomeTelephoneTextField.frame.size.height+EmergencyContactHomeTelephoneTextField.frame.origin.y+0.5, 320, 20);
    EmeregencyContactEmail.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    EmeregencyContactEmail.backgroundColor = [UIColor whiteColor   ];
    EmeregencyContactEmail.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    EmeregencyContactEmail.textAlignment = NSTextAlignmentLeft;
    EmeregencyContactEmail.text= @"   Emergency Contact Email";
    [personalDetailsScroll addSubview:EmeregencyContactEmail];
    
    [EmergencyContactEmailTextField removeFromSuperview];
    EmergencyContactEmailTextField = nil;
    EmergencyContactEmailTextField = [[UITextField alloc]init];
    EmergencyContactEmailTextField.frame = CGRectMake(0, EmeregencyContactEmail.frame.size.height+EmeregencyContactEmail.frame.origin.y, 320, 40);
    EmergencyContactEmailTextField.placeholder = @"Enter email";
    EmergencyContactEmailTextField.tag = 2895;
    EmergencyContactEmailTextField.borderStyle = UITextBorderStyleNone;
    EmergencyContactEmailTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    EmergencyContactEmailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    EmergencyContactEmailTextField.returnKeyType = UIReturnKeyDone;
    EmergencyContactEmailTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmergencyContactEmailTextField.secureTextEntry=false;
    EmergencyContactEmailTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmergencyContactEmailTextField.leftView = paddingView;
    EmergencyContactEmailTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyContactEmailTextField.textColor = [UIColor blackColor];
    EmergencyContactEmailTextField.leftViewMode=UITextFieldViewModeAlways;
    EmergencyContactEmailTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    EmergencyContactEmailTextField.adjustsFontSizeToFitWidth = YES;
    EmergencyContactEmailTextField.minimumFontSize = 7.0;
      EmergencyContactEmailTextField.userInteractionEnabled=FALSE;
    EmergencyContactEmailTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:EmergencyContactEmailTextField];
    
    UIView *horizontalLineView15 = [[UIView alloc]initWithFrame:CGRectMake(0, EmergencyContactEmailTextField.frame.size.height+EmergencyContactEmailTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView15.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView15];
    
#pragma mark Emergency Contact Relationship To Patient
    
    [EmeregencyContactRelationship removeFromSuperview];
    EmeregencyContactRelationship = nil;
    EmeregencyContactRelationship = [[UILabel alloc] init];
    EmeregencyContactRelationship.frame = CGRectMake(0, EmergencyContactEmailTextField.frame.size.height+EmergencyContactEmailTextField.frame.origin.y+0.5, 320, 20);
    EmeregencyContactRelationship.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    EmeregencyContactRelationship.backgroundColor = [UIColor whiteColor   ];
    EmeregencyContactRelationship.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    EmeregencyContactRelationship.textAlignment = NSTextAlignmentLeft;
    EmeregencyContactRelationship.text= @"   Emergency Contact Relationship To Patient";
    [personalDetailsScroll addSubview:EmeregencyContactRelationship];
    
    [EmergencyContactRelationshipTextField removeFromSuperview];
    EmergencyContactRelationshipTextField = nil;
    EmergencyContactRelationshipTextField = [[UITextField alloc]init];
    EmergencyContactRelationshipTextField.frame = CGRectMake(0, EmeregencyContactRelationship.frame.size.height+EmeregencyContactRelationship.frame.origin.y, 320, 40);
    EmergencyContactRelationshipTextField.placeholder = @"Enter relationship";
    EmergencyContactRelationshipTextField.tag = 2895;
    EmergencyContactRelationshipTextField.borderStyle = UITextBorderStyleNone;
    EmergencyContactRelationshipTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    EmergencyContactRelationshipTextField.keyboardType = UIKeyboardTypeDefault;
    EmergencyContactRelationshipTextField.returnKeyType = UIReturnKeyDone;
    EmergencyContactRelationshipTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmergencyContactRelationshipTextField.secureTextEntry=false;
    EmergencyContactRelationshipTextField.delegate = self;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmergencyContactRelationshipTextField.leftView = paddingView;
    EmergencyContactRelationshipTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyContactRelationshipTextField.textColor = [UIColor blackColor];
    EmergencyContactRelationshipTextField.leftViewMode=UITextFieldViewModeAlways;
    EmergencyContactRelationshipTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    EmergencyContactRelationshipTextField.adjustsFontSizeToFitWidth = YES;
    EmergencyContactRelationshipTextField.minimumFontSize = 7.0;
      EmergencyContactRelationshipTextField.userInteractionEnabled=FALSE;
    EmergencyContactRelationshipTextField.backgroundColor = [UIColor whiteColor];
    [self.view endEditing:YES];
    [personalDetailsScroll addSubview:EmergencyContactRelationshipTextField];
    
    UIView *horizontalLineView16 = [[UIView alloc]initWithFrame:CGRectMake(0, EmergencyContactRelationshipTextField.frame.size.height+EmergencyContactRelationshipTextField.frame.origin.y, 320, 0.5)];
    horizontalLineView16.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [personalDetailsScroll addSubview:horizontalLineView16];

    
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
    maritalStatusTextField.userInteractionEnabled=TRUE;
    bloodGroupTextField.userInteractionEnabled=TRUE;
    nhsNumberTextField.userInteractionEnabled=TRUE;
    heightTextField.userInteractionEnabled=TRUE;
    weightTextField.userInteractionEnabled=TRUE;
    EmergencyCountryTextField.userInteractionEnabled=TRUE;
    EmergencyCountryOtherAddressTextField.userInteractionEnabled=TRUE;
    EmergencyContactMobleTelephoneTextField.userInteractionEnabled=TRUE;
    EmergencyContactWorkTelephoneTextField.userInteractionEnabled=TRUE;
    EmergencyContactHomeTelephoneTextField.userInteractionEnabled=TRUE;
    EmergencyContactEmailTextField.userInteractionEnabled=TRUE;
    EmergencyContactRelationshipTextField.userInteractionEnabled=TRUE;
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
- (void)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
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
    
    [EmergencyCountryTextField resignFirstResponder];
    [EmergencyCountryOtherAddressTextField resignFirstResponder];
    [EmergencyContactMobleTelephoneTextField resignFirstResponder];
    [EmergencyContactWorkTelephoneTextField resignFirstResponder];
    [EmergencyContactHomeTelephoneTextField resignFirstResponder];
    [EmergencyContactEmailTextField resignFirstResponder];
    [EmergencyContactRelationshipTextField resignFirstResponder];
    
 }
//#pragma mark SCROLL
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if(scrollView == personalDetailsScroll)
//    {
//        [firstNameTextField resignFirstResponder];
//        [lastNameTextField resignFirstResponder];
//        [dobTextField resignFirstResponder];
//        [GenderTextField resignFirstResponder];
//        [maritalStatusTextField resignFirstResponder];
//        [bloodGroupTextField resignFirstResponder];
//        [nhsNumberTextField resignFirstResponder];
//        [heightTextField resignFirstResponder];
//        [weightTextField resignFirstResponder];
//    }
//    
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
