//
//  AddressDetailViewController.m
//  MyMedi_Version2
//
//  Created by Applify Tech on 19/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "AddressDetailViewController.h"

@interface AddressDetailViewController ()

@end

@implementation AddressDetailViewController
{
    UIView *headerView;
    UILabel *headerLabel;
    UIButton *backButton;
    UIButton *editButton;
    UIView *horizontalLIneView;
    UIView *BottomView;
    UIButton *myMediButton;
    UIScrollView *addressDetailsScroll;
    
    UILabel *houseNumberLabel;
    UITextField *houseNumberTextField;
    UILabel *line_1_Label;
    UITextField *line_1_TextField;
    UILabel *line_2_Label;
    UITextField *line_2_TextField;
    UILabel *line_3_Label;
    UITextField *line_3_TextField;
    
    UILabel *cityNameLabel;
    UITextField *cityTextField;
    UILabel *countryNameLabel;
    UITextField *countryTextField;

    
    UILabel *countryStateProvinceLabel;
    UITextField *countryStateProvinceTextField;
    UILabel *postCodeOrZipLabel;
    UITextField *postCodeOrZipTextField;
    
    UILabel *otherAddressDetailsLabel;
    UITextField *otherAddressDetailsTextField;
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
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
    headerLabel.text= @"Address Details";
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

    
    [addressDetailsScroll removeFromSuperview];
    addressDetailsScroll = nil;
    addressDetailsScroll=[[UIScrollView alloc]init];
    addressDetailsScroll.backgroundColor=[UIColor clearColor];
    addressDetailsScroll.delegate=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    addressDetailsScroll.bounces = NO;
    addressDetailsScroll.showsHorizontalScrollIndicator=NO;
    addressDetailsScroll.showsVerticalScrollIndicator=NO;
    [addressDetailsScroll setContentSize:CGSizeMake(320, 600)];
    
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    [self.view addSubview:addressDetailsScroll];

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
            
            addressDetailsScroll.frame = CGRectMake(0, headerView.frame.origin.y+headerView.frame.size.height, 320, 450);
            
        }
        else
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            backButton.frame = CGRectMake(0, 20, [UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
            headerLabel.frame = CGRectMake(backButton.frame.size.width+backButton.frame.origin.x, 20, 220, 44);
            editButton.frame = CGRectMake(headerLabel.frame.origin.x+headerLabel.frame.size.width, 20, [UIImage imageNamed:@"profileedit.png"].size.width, [UIImage imageNamed:@"profileedit.png"].size.height);
            
            horizontalLIneView.frame = CGRectMake(0, self.view.frame.size.height-50, 320, 1);
            BottomView.frame = CGRectMake(0, 430, 320, 49);
            myMediButton.frame  = CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width, [UIImage imageNamed:@"bottommymedi.png"].size.height);
            addressDetailsScroll.frame = CGRectMake(0, headerView.frame.origin.y+headerView.frame.size.height, 320, 300);
        }
    }

    
    
#pragma mark HOUSE NUMBER
    
    [houseNumberLabel removeFromSuperview];
    houseNumberLabel = nil;
    houseNumberLabel = [[UILabel alloc] init];
    houseNumberLabel.frame = CGRectMake(10, 0, 320, 20);
    houseNumberLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    houseNumberLabel.backgroundColor = [UIColor clearColor];
    houseNumberLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    houseNumberLabel.textAlignment = NSTextAlignmentLeft;
    houseNumberLabel.text= @"House/Flat Number";
    [addressDetailsScroll addSubview:houseNumberLabel];
    
    [houseNumberTextField removeFromSuperview];
    houseNumberTextField = nil;
    houseNumberTextField = [[UITextField alloc]init];
    houseNumberTextField.frame = CGRectMake(10, 25, 300, 25);
    houseNumberTextField.placeholder = @"Enter house number";
    houseNumberTextField.tag = 1;
    houseNumberTextField.borderStyle = UITextBorderStyleNone;
    houseNumberTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    houseNumberTextField.keyboardType = UIKeyboardTypeDefault;
    houseNumberTextField.returnKeyType = UIReturnKeyDone;
    houseNumberTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    houseNumberTextField.secureTextEntry=false;
    houseNumberTextField.delegate = self;
    houseNumberTextField.textColor = [UIColor blackColor];
    houseNumberTextField.leftViewMode=UITextFieldViewModeAlways;
    houseNumberTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    houseNumberTextField.adjustsFontSizeToFitWidth = YES;
    houseNumberTextField.minimumFontSize = 7.0;
    houseNumberTextField.userInteractionEnabled=FALSE;
    houseNumberTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:houseNumberTextField];
    
    UIView *horizontalLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 58, 320, 0.5)];
    horizontalLineView.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:horizontalLineView];

    
#pragma mark LINE 1
    
    [line_1_Label removeFromSuperview];
    line_1_Label = nil;
    line_1_Label = [[UILabel alloc] init];
    line_1_Label.frame = CGRectMake(10, horizontalLineView.frame.size.height+horizontalLineView.frame.origin.y, 320, 20);
    line_1_Label.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    line_1_Label.backgroundColor = [UIColor clearColor];
    line_1_Label.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    line_1_Label.textAlignment = NSTextAlignmentLeft;
    line_1_Label.text= @"Address Line 1";
    [addressDetailsScroll addSubview:line_1_Label];
    
    [line_1_TextField removeFromSuperview];
    line_1_TextField = nil;
    line_1_TextField = [[UITextField alloc]init];
    line_1_TextField.frame = CGRectMake(10, line_1_Label.frame.origin.y+line_1_Label.frame.size.height+5, 300, 25);
    line_1_TextField.placeholder = @"Enter address line 1";
    line_1_TextField.tag = 2;
    line_1_TextField.borderStyle = UITextBorderStyleNone;
    line_1_TextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    line_1_TextField.keyboardType = UIKeyboardTypeDefault;
    line_1_TextField.returnKeyType = UIReturnKeyDone;
    line_1_TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    line_1_TextField.secureTextEntry=false;
    line_1_TextField.delegate = self;
    line_1_TextField.textColor = [UIColor blackColor];
    line_1_TextField.leftViewMode=UITextFieldViewModeAlways;
    line_1_TextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    line_1_TextField.adjustsFontSizeToFitWidth = YES;
    line_1_TextField.minimumFontSize = 7.0;
    line_1_TextField.userInteractionEnabled=FALSE;
    line_1_TextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:line_1_TextField];
    
    UIView *horizontalLineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 116, 320, 0.5)];
    horizontalLineView1.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:horizontalLineView1];
    
    
#pragma mark LINE 2
    
    [line_2_Label removeFromSuperview];
    line_2_Label = nil;
    line_2_Label = [[UILabel alloc] init];
    line_2_Label.frame = CGRectMake(10, horizontalLineView1.frame.size.height+horizontalLineView1.frame.origin.y, 320, 20);
    line_2_Label.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    line_2_Label.backgroundColor = [UIColor clearColor];
    line_2_Label.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    line_2_Label.textAlignment = NSTextAlignmentLeft;
    line_2_Label.text= @"Address Line 2";
    [addressDetailsScroll addSubview:line_2_Label];
    
    [line_2_TextField removeFromSuperview];
    line_2_TextField = nil;
    line_2_TextField = [[UITextField alloc]init];
    line_2_TextField.frame = CGRectMake(10, line_2_Label.frame.origin.y+line_2_Label.frame.size.height+5, 300, 25);
    line_2_TextField.placeholder = @"Enter address line 2";
    line_2_TextField.tag = 2;
    line_2_TextField.borderStyle = UITextBorderStyleNone;
    line_2_TextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    line_2_TextField.keyboardType = UIKeyboardTypeDefault;
    line_2_TextField.returnKeyType = UIReturnKeyDone;
    line_2_TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    line_2_TextField.secureTextEntry=false;
    line_2_TextField.delegate = self;
    line_2_TextField.textColor = [UIColor blackColor];
    line_2_TextField.leftViewMode=UITextFieldViewModeAlways;
    line_2_TextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    line_2_TextField.adjustsFontSizeToFitWidth = YES;
    line_2_TextField.minimumFontSize = 7.0;
      line_2_TextField.userInteractionEnabled=FALSE;
    line_2_TextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:line_2_TextField];
    
    UIView *horizontalLineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 174, 320, 0.5)];
    horizontalLineView2.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:horizontalLineView2];
    
    
#pragma mark LINE 3
    
    [line_3_Label removeFromSuperview];
    line_3_Label = nil;
    line_3_Label = [[UILabel alloc] init];
    line_3_Label.frame = CGRectMake(10, horizontalLineView2.frame.size.height+horizontalLineView2.frame.origin.y, 320, 20);
    line_3_Label.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    line_3_Label.backgroundColor = [UIColor clearColor];
    line_3_Label.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    line_3_Label.textAlignment = NSTextAlignmentLeft;
    line_3_Label.text= @"Address Line 3";
    [addressDetailsScroll addSubview:line_3_Label];
    
    [line_3_TextField removeFromSuperview];
    line_3_TextField = nil;
    line_3_TextField = [[UITextField alloc]init];
    line_3_TextField.frame = CGRectMake(10, line_3_Label.frame.origin.y+line_3_Label.frame.size.height+5, 300, 25);
    line_3_TextField.placeholder = @"Enter address line 3";
    line_3_TextField.tag = 2;
    line_3_TextField.borderStyle = UITextBorderStyleNone;
    line_3_TextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    line_3_TextField.keyboardType = UIKeyboardTypeDefault;
    line_3_TextField.returnKeyType = UIReturnKeyDone;
    line_3_TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    line_3_TextField.secureTextEntry=false;
    line_3_TextField.delegate = self;
    line_3_TextField.textColor = [UIColor blackColor];
    line_3_TextField.leftViewMode=UITextFieldViewModeAlways;
    line_3_TextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    line_3_TextField.adjustsFontSizeToFitWidth = YES;
    line_3_TextField.minimumFontSize = 7.0;
    line_3_TextField.userInteractionEnabled=FALSE;
    line_3_TextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:line_3_TextField];
    
    UIView *horizontalLineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 232, 320, 0.5)];
    horizontalLineView3.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:horizontalLineView3];
    

    
#pragma mark City And Country
    
    [cityNameLabel removeFromSuperview];
    cityNameLabel = nil;
    cityNameLabel = [[UILabel alloc] init];
    cityNameLabel.frame = CGRectMake(10, horizontalLineView3.frame.size.height+horizontalLineView3.frame.origin.y, 150, 20);
    cityNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    cityNameLabel.backgroundColor = [UIColor clearColor];
    cityNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    cityNameLabel.textAlignment = NSTextAlignmentLeft;
    cityNameLabel.text= @"City";
    [addressDetailsScroll addSubview:cityNameLabel];
    
    [cityTextField removeFromSuperview];
    cityTextField = nil;
    cityTextField = [[UITextField alloc]init];
    cityTextField.frame = CGRectMake(10, cityNameLabel.frame.origin.y+cityNameLabel.frame.size.height+5, 140, 25);
    cityTextField.placeholder = @"Enter city";
    cityTextField.tag = 2;
    cityTextField.borderStyle = UITextBorderStyleNone;
    cityTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    cityTextField.keyboardType = UIKeyboardTypeDefault;
    cityTextField.returnKeyType = UIReturnKeyDone;
    cityTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    cityTextField.secureTextEntry=false;
    cityTextField.delegate = self;
    cityTextField.textColor = [UIColor blackColor];
    cityTextField.leftViewMode=UITextFieldViewModeAlways;
    cityTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    cityTextField.adjustsFontSizeToFitWidth = YES;
    cityTextField.minimumFontSize = 7.0;
     cityTextField.userInteractionEnabled=FALSE;
    cityTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:cityTextField];
    
    UIView *verticalLineView = [[UIView alloc]init];
    verticalLineView.frame = CGRectMake(159, horizontalLineView3.frame.size.height+horizontalLineView3.frame.origin.y, 0.5, 58);
    verticalLineView.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:verticalLineView];

    
    
    [countryNameLabel removeFromSuperview];
    countryNameLabel = nil;
    countryNameLabel = [[UILabel alloc] init];
    countryNameLabel.frame = CGRectMake(170, horizontalLineView3.frame.size.height+horizontalLineView3.frame.origin.y, 150, 20);
    countryNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    countryNameLabel.backgroundColor = [UIColor clearColor];
    countryNameLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    countryNameLabel.textAlignment = NSTextAlignmentLeft;
    countryNameLabel.text= @"Country";
    [addressDetailsScroll addSubview:countryNameLabel];
    
    [countryTextField removeFromSuperview];
    countryTextField = nil;
    countryTextField = [[UITextField alloc]init];
    countryTextField.frame = CGRectMake(170, countryNameLabel.frame.origin.y+countryNameLabel.frame.size.height+5, 140, 25);
    countryTextField.placeholder = @"Enter country";
    countryTextField.tag = 214;
    countryTextField.borderStyle = UITextBorderStyleNone;
    countryTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    countryTextField.keyboardType = UIKeyboardTypeDefault;
    countryTextField.returnKeyType = UIReturnKeyDone;
    countryTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    countryTextField.secureTextEntry=false;
    countryTextField.delegate = self;
         countryTextField.userInteractionEnabled=FALSE;
    countryTextField.textColor = [UIColor blackColor];
    countryTextField.leftViewMode=UITextFieldViewModeAlways;
    countryTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    countryTextField.adjustsFontSizeToFitWidth = YES;
    countryTextField.minimumFontSize = 7.0;
    countryTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:countryTextField];

    
    UIView *horizontalLineView4 = [[UIView alloc]initWithFrame:CGRectMake(0, 290, 320, 0.5)];
    horizontalLineView4.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:horizontalLineView4];
    
    
    
    
#pragma mark Country State Province And Pincode or Zip
    
    [countryStateProvinceLabel removeFromSuperview];
    countryStateProvinceLabel = nil;
    countryStateProvinceLabel = [[UILabel alloc] init];
    countryStateProvinceLabel.frame = CGRectMake(10, horizontalLineView4.frame.size.height+horizontalLineView4.frame.origin.y, 150, 20);
    countryStateProvinceLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    countryStateProvinceLabel.backgroundColor = [UIColor clearColor];
    countryStateProvinceLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    countryStateProvinceLabel.textAlignment = NSTextAlignmentLeft;
    countryStateProvinceLabel.text= @"Province State";
    [addressDetailsScroll addSubview:countryStateProvinceLabel];
    
    [countryStateProvinceTextField removeFromSuperview];
    countryStateProvinceTextField = nil;
    countryStateProvinceTextField = [[UITextField alloc]init];
    countryStateProvinceTextField.frame = CGRectMake(10, countryStateProvinceLabel.frame.origin.y+countryStateProvinceLabel.frame.size.height+5, 140, 25);
    countryStateProvinceTextField.placeholder = @"Enter province state";
    countryStateProvinceTextField.tag = 2;
    countryStateProvinceTextField.borderStyle = UITextBorderStyleNone;
    countryStateProvinceTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    countryStateProvinceTextField.keyboardType = UIKeyboardTypeDefault;
    countryStateProvinceTextField.returnKeyType = UIReturnKeyDone;
    countryStateProvinceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    countryStateProvinceTextField.secureTextEntry=false;
    countryStateProvinceTextField.delegate = self;
    countryStateProvinceTextField.textColor = [UIColor blackColor];
    countryStateProvinceTextField.leftViewMode=UITextFieldViewModeAlways;
    countryStateProvinceTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    countryStateProvinceTextField.adjustsFontSizeToFitWidth = YES;
    countryStateProvinceTextField.minimumFontSize = 7.0;
     countryStateProvinceTextField.userInteractionEnabled=FALSE;
    countryStateProvinceTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:countryStateProvinceTextField];
    
    UIView *verticalLineView1 = [[UIView alloc]init];
    verticalLineView1.frame = CGRectMake(159, horizontalLineView4.frame.size.height+horizontalLineView4.frame.origin.y, 0.5, 58);
    verticalLineView1.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:verticalLineView1];
    
    
    
    [postCodeOrZipLabel removeFromSuperview];
    postCodeOrZipLabel = nil;
    postCodeOrZipLabel = [[UILabel alloc] init];
    postCodeOrZipLabel.frame = CGRectMake(170, horizontalLineView4.frame.size.height+horizontalLineView4.frame.origin.y, 150, 20);
    postCodeOrZipLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    postCodeOrZipLabel.backgroundColor = [UIColor clearColor];
    postCodeOrZipLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    postCodeOrZipLabel.textAlignment = NSTextAlignmentLeft;
    postCodeOrZipLabel.text= @"Postcode or Zip";
    [addressDetailsScroll addSubview:postCodeOrZipLabel];
    
    [postCodeOrZipTextField removeFromSuperview];
    postCodeOrZipTextField = nil;
    postCodeOrZipTextField = [[UITextField alloc]init];
    postCodeOrZipTextField.frame = CGRectMake(170, postCodeOrZipLabel.frame.origin.y+postCodeOrZipLabel.frame.size.height+5, 140, 25);
    postCodeOrZipTextField.placeholder = @"Enter postcode";
    postCodeOrZipTextField.tag = 214;
    postCodeOrZipTextField.borderStyle = UITextBorderStyleNone;
    postCodeOrZipTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    postCodeOrZipTextField.keyboardType = UIKeyboardTypeDefault;
    postCodeOrZipTextField.returnKeyType = UIReturnKeyDone;
    postCodeOrZipTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    postCodeOrZipTextField.secureTextEntry=false;
    postCodeOrZipTextField.delegate = self;
    postCodeOrZipTextField.textColor = [UIColor blackColor];
    postCodeOrZipTextField.leftViewMode=UITextFieldViewModeAlways;
    postCodeOrZipTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    postCodeOrZipTextField.adjustsFontSizeToFitWidth = YES;
    postCodeOrZipTextField.minimumFontSize = 7.0;
     postCodeOrZipTextField.userInteractionEnabled=FALSE;
    postCodeOrZipTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:postCodeOrZipTextField];
    
    
    UIView *horizontalLineView5 = [[UIView alloc]initWithFrame:CGRectMake(0, 348, 320, 0.5)];
    horizontalLineView5.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:horizontalLineView5];
    



#pragma mark Other Address Details
    
    [otherAddressDetailsLabel removeFromSuperview];
    otherAddressDetailsLabel = nil;
    otherAddressDetailsLabel = [[UILabel alloc] init];
    otherAddressDetailsLabel.frame = CGRectMake(10, horizontalLineView5.frame.size.height+horizontalLineView5.frame.origin.y, 320, 20);
    otherAddressDetailsLabel.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    otherAddressDetailsLabel.backgroundColor = [UIColor clearColor];
    otherAddressDetailsLabel.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    otherAddressDetailsLabel.textAlignment = NSTextAlignmentLeft;
    otherAddressDetailsLabel.text= @"Other Address Details";
    [addressDetailsScroll addSubview:otherAddressDetailsLabel];
    
    [otherAddressDetailsTextField removeFromSuperview];
    otherAddressDetailsTextField = nil;
    otherAddressDetailsTextField = [[UITextField alloc]init];
    otherAddressDetailsTextField.frame = CGRectMake(10, otherAddressDetailsLabel.frame.origin.y+otherAddressDetailsLabel.frame.size.height+5, 300, 25);
    otherAddressDetailsTextField.placeholder = @"Enter details";
    otherAddressDetailsTextField.tag = 452;
    otherAddressDetailsTextField.borderStyle = UITextBorderStyleNone;
    otherAddressDetailsTextField.font = [UIFont fontWithName:@"Europa-Regular" size:18];
    otherAddressDetailsTextField.keyboardType = UIKeyboardTypeDefault;
    otherAddressDetailsTextField.returnKeyType = UIReturnKeyDone;
    otherAddressDetailsTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    otherAddressDetailsTextField.secureTextEntry=false;
    otherAddressDetailsTextField.delegate = self;
    otherAddressDetailsTextField.textColor = [UIColor blackColor];
    otherAddressDetailsTextField.leftViewMode=UITextFieldViewModeAlways;
    otherAddressDetailsTextField.autocapitalizationType= UITextAutocapitalizationTypeSentences;;
    otherAddressDetailsTextField.adjustsFontSizeToFitWidth = YES;
    otherAddressDetailsTextField.minimumFontSize = 7.0;
       otherAddressDetailsTextField.userInteractionEnabled=FALSE;
    otherAddressDetailsTextField.backgroundColor = [UIColor clearColor];
    [self.view endEditing:YES];
    [addressDetailsScroll addSubview:otherAddressDetailsTextField];
    
    UIView *horizontalLineView6 = [[UIView alloc]initWithFrame:CGRectMake(0, 406, 320, 0.5)];
    horizontalLineView6.backgroundColor = [UIColor colorWithRed:178.0/255 green:178.0/255 blue:178.0/255 alpha:1.0];
    [addressDetailsScroll addSubview:horizontalLineView6];
    
    
    
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
    houseNumberTextField.userInteractionEnabled=TRUE;
    line_1_TextField.userInteractionEnabled=TRUE;
    line_2_TextField.userInteractionEnabled=TRUE;
    line_3_TextField.userInteractionEnabled=TRUE;
    cityTextField.userInteractionEnabled=TRUE;
    countryTextField.userInteractionEnabled=TRUE;
    countryStateProvinceTextField.userInteractionEnabled=TRUE;
    postCodeOrZipTextField.userInteractionEnabled=TRUE;
    otherAddressDetailsTextField.userInteractionEnabled=TRUE;
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
-(void)scrollViewDidTapped{
    [houseNumberTextField resignFirstResponder];
    [line_1_TextField resignFirstResponder];
    [line_2_TextField resignFirstResponder];
    [line_3_TextField resignFirstResponder];
    [cityTextField resignFirstResponder];
    [countryTextField resignFirstResponder];
    [countryStateProvinceTextField resignFirstResponder];
    [postCodeOrZipTextField resignFirstResponder];
    [postCodeOrZipTextField resignFirstResponder];
    [otherAddressDetailsTextField resignFirstResponder];
}
//#pragma mark SCROLL
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if(scrollView == addressDetailsScroll)
//    {
//        [houseNumberTextField resignFirstResponder];
//        [line_1_TextField resignFirstResponder];
//        [line_2_TextField resignFirstResponder];
//        [line_3_TextField resignFirstResponder];
//        [cityTextField resignFirstResponder];
//        [countryTextField resignFirstResponder];
//        [countryStateProvinceTextField resignFirstResponder];
//        [postCodeOrZipTextField resignFirstResponder];
//        [postCodeOrZipTextField resignFirstResponder];
//        [otherAddressDetailsTextField resignFirstResponder];
//    }
//}
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
    
    [addressDetailsScroll setContentInset:insets];
    [addressDetailsScroll setScrollIndicatorInsets:insets];
    
}

-(void)keyboardWillHide
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    [addressDetailsScroll setContentInset:insets];
    [addressDetailsScroll setScrollIndicatorInsets:insets];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
