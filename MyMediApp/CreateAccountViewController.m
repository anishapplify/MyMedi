//
//  CreateAccountViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 09/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController (){
    
    
    AsyncImageView *EditChangeImage;
    NSString *urlString2;
    
    UITextField*FirstNameTextField;
    UITextField*LastNameTextField;
    UITextField *AddressTextField;
    UITextField *ZipCodeTextFeild;
    UITextField *PhoneTextField;
    UITextField *GenderTextField;
    UITextField *HeightTextField;
    UITextField *WeightTextField;
    UITextField *AgeTextField;
    
    
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton  *NextViewController;
    
    UIButton *SubmitButton;
    UIButton *AccountButton;
  
    UILabel *CreateAccountLable;
    UIView *lineView;
    UIImageView *BackGroundImageView;
   
    UIScrollView *CreateAcountScrollView;
    UITextField*emailtextField;
    UITextField *PassWordTextField;
    UITextField *ConfirmPasswordTextFeild;

    UIDatePicker *dateTimePicker;
    NSMutableArray *GenderPickerViewArray;
    UIPickerView *chooseServicePicker;
    UIView *paddingView;
    
    UILabel *TermAndConditionLable;
    UIButton *TermClickButton;
    UIButton *CheckTermAndConditonButton;
    UIScrollView *TearmScrollVeiw;
    UIView *TearmBackGroundView;
    int tearmButtonFlag;
    
    UIAlertView *ImageAlertView;
    NSString *savedImagePath;
    NSData *imageData;
    NSString *path;
    NMCustomLabel *labelRegister;
}

@end

@implementation CreateAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//TopBarView.backgroundColor=[UIColor colorWithRed:255.0/63 green:255.0/63 blue:255.0/63 alpha:1.0];
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;

    

   // UIImage * backImg = [UIImage imageNamed:@"Newback_50.png"];

//    UIButton *HiddenBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    HiddenBackButton.frame = CGRectMake(5,22,backImg.size.width+25, backImg.size.height);
//    HiddenBackButton.backgroundColor=[UIColor clearColor];
//    [HiddenBackButton addTarget:self action:@selector(BACK) forControlEvents:UIControlEventTouchUpInside];
//    [TopBarView addSubview:HiddenBackButton];
    
    UIImage * backImg = [UIImage imageNamed:@"Newback_50.png"];
    
    UIButton *HiddenBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    HiddenBackButton.frame = CGRectMake(5,22,backImg.size.width+25, backImg.size.height+10);
    HiddenBackButton.backgroundColor=[UIColor clearColor];
    [HiddenBackButton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:HiddenBackButton];
    
    
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(5,35,backImg.size.width, backImg.size.height);
   
    [BackButton setImage:backImg forState:UIControlStateNormal];
     [BackButton setImage:[UIImage imageNamed:@"back_btn_pressed.png"] forState:UIControlStateSelected];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    lineView=[[UIView alloc]initWithFrame:CGRectMake(270,35,1,25)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView];
    
    UIImage *SignImage=[UIImage imageNamed:@"SignIn_icon.png"];
    
    
    UIButton *LoginButtonHidden=[[UIButton alloc]initWithFrame:CGRectMake(265, 30, SignImage.size.width+10, SignImage.size.height)];
    LoginButtonHidden.backgroundColor=[UIColor clearColor];
    [LoginButtonHidden addTarget:self action:@selector(SubmitButtonAction)
          forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:LoginButtonHidden];
     
    UIButton *LoginButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 25, SignImage.size.width, SignImage.size.height)];
    LoginButton.backgroundColor=[UIColor clearColor];
    [LoginButton setImage:SignImage forState:UIControlStateNormal];
    [LoginButton addTarget:self action:@selector(SubmitButtonAction)
          forControlEvents:UIControlEventTouchUpInside];
    //    LoginButton.titleEdgeInsets = UIEdgeInsetsMake(5, 100, 0, 0);
    //    LoginButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    //    LoginButton.layer.borderWidth = 1.0f;
    //    LoginButton.layer.cornerRadius = 3;
    [TopBarView addSubview:LoginButton];
    
    
    CreateAccountLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 30, 150, 30)];
    CreateAccountLable.text=@"Create Account";
    CreateAccountLable.font=[UIFont fontWithName:@"Comfortaa-Bold" size:15];
    CreateAccountLable.textColor=[UIColor whiteColor];
    CreateAccountLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:CreateAccountLable];
    
    
    [self.view addSubview:TopBarView];
    
   
//    UIImage *BackGroundImage=[UIImage imageNamed:@"Back_pattern.png"];
//    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, BackGroundImage.size.width, BackGroundImage.size.height)];
//    BackGroundImageView.backgroundColor=[UIColor clearColor];
//    BackGroundImageView.image=BackGroundImage;
//    BackGroundImageView.userInteractionEnabled=TRUE;
//
//    [self setMaskTo:BackGroundImageView byRoundingCorners:UIRectCornerTopLeft];
   
   

    GenderPickerViewArray=[[NSMutableArray alloc]initWithObjects:@"Male",@"Female", nil];
    tearmButtonFlag=1;
    [self AddAccountScrollView];
   

    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    // Do any additional setup after loading the view.
}
-(void)BackVeiwController{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(9.0, 9.0)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
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

#pragma mark Next View Controller
-(void)nextviewController{
    
    
}

 #pragma mark Add Account ScrollView
-(void)AddAccountScrollView
{
    CreateAcountScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, 300,470)];
    CreateAcountScrollView.backgroundColor=[UIColor clearColor];
    CreateAcountScrollView.showsVerticalScrollIndicator=NO;
    CreateAcountScrollView.contentSize=CGSizeMake(300, 550);
    CreateAcountScrollView.userInteractionEnabled=true;
    
    
    EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 10, 80, 80)];
    //urlString2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"image_url"];
    EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
    EditChangeImage.image=[UIImage imageNamed:@"ProfileImage.jpeg"];
    EditChangeImage.backgroundColor=[UIColor lightGrayColor];
    EditChangeImage.userInteractionEnabled=YES;
    EditChangeImage.layer.masksToBounds = YES;
    EditChangeImage.layer.borderWidth = 1;
    EditChangeImage.layer.borderColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    EditChangeImage.userInteractionEnabled=YES;
    [[EditChangeImage layer]setCornerRadius:25];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(changeImage:)];
    [tap setNumberOfTouchesRequired:1];
    [EditChangeImage addGestureRecognizer:tap];
    
    [CreateAcountScrollView addSubview:EditChangeImage];
    
    FirstNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+10, 20, 200, 35)];
    FirstNameTextField.delegate = self;
    FirstNameTextField.placeholder = @"First Name*";
    [FirstNameTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    FirstNameTextField.tag=100;
    [FirstNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    FirstNameTextField.textColor=[UIColor blackColor];
    FirstNameTextField.textAlignment=NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    FirstNameTextField.leftView = paddingView;
    FirstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    FirstNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    FirstNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [FirstNameTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    FirstNameTextField.autocapitalizationType = NO;
    FirstNameTextField.backgroundColor=[UIColor clearColor];
    FirstNameTextField.returnKeyType=UIReturnKeyNext;
    [FirstNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:FirstNameTextField];
    
    LastNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+10, FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y+10, 286-90, 35)];
    LastNameTextField.delegate = self;
    LastNameTextField.tag=101;
    LastNameTextField.placeholder = @"Last Name";
    [LastNameTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    LastNameTextField.textColor=[UIColor blackColor];
    [LastNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    LastNameTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    LastNameTextField.leftView = paddingView;
    LastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    LastNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    LastNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [LastNameTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    LastNameTextField.autocapitalizationType = NO;
     LastNameTextField.backgroundColor=[UIColor clearColor];
    LastNameTextField.returnKeyType=UIReturnKeyNext;
    [LastNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:LastNameTextField];
    
    
    emailtextField = [[UITextField alloc] initWithFrame:CGRectMake(5, LastNameTextField.frame.size.height+LastNameTextField.frame.origin.y+10, 286, 35)];
    emailtextField.delegate = self;
    emailtextField.tag=104;
    [emailtextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    emailtextField.placeholder = @"Email*";
    emailtextField.textAlignment = NSTextAlignmentLeft;
    [emailtextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    emailtextField.leftView = paddingView;
    emailtextField.leftViewMode = UITextFieldViewModeAlways;
    emailtextField.textColor=[UIColor blackColor];
    emailtextField.keyboardType = UIKeyboardTypeEmailAddress;
    
    emailtextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    emailtextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [emailtextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    emailtextField.autocapitalizationType = NO;
    emailtextField.returnKeyType=UIReturnKeyNext;
    emailtextField.backgroundColor=[UIColor clearColor];
    
    [emailtextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:emailtextField];
    
    
    PassWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, emailtextField.frame.size.height+emailtextField.frame.origin.y+10, 286, 35)];
    PassWordTextField.delegate = self;
    PassWordTextField.tag=106;
    PassWordTextField.placeholder = @"Password*";
    [PassWordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    PassWordTextField.textColor=[UIColor blackColor];
    [PassWordTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    PassWordTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    PassWordTextField.leftView = paddingView;
    PassWordTextField.leftViewMode = UITextFieldViewModeAlways;
    PassWordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    PassWordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [PassWordTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    PassWordTextField.secureTextEntry=TRUE;
    PassWordTextField.autocapitalizationType = NO;
    PassWordTextField.returnKeyType=UIReturnKeyNext;
    [PassWordTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:PassWordTextField];
    
    
  //  UIImage *image=[UIImage imageNamed:@"inputBoxfor-shiping.png"];

    ConfirmPasswordTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(5, PassWordTextField.frame.size.height+PassWordTextField.frame.origin.y+10, 286, 35)];
    ConfirmPasswordTextFeild.delegate = self;
    ConfirmPasswordTextFeild.tag=107;
    ConfirmPasswordTextFeild.placeholder = @"Confirm Password*";
    [ConfirmPasswordTextFeild setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    ConfirmPasswordTextFeild.textColor=[UIColor blackColor];
    [ConfirmPasswordTextFeild setClearButtonMode:UITextFieldViewModeWhileEditing];
    ConfirmPasswordTextFeild.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    ConfirmPasswordTextFeild.leftView = paddingView;
    ConfirmPasswordTextFeild.leftViewMode = UITextFieldViewModeAlways;
    ConfirmPasswordTextFeild.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    ConfirmPasswordTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [ConfirmPasswordTextFeild setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    ConfirmPasswordTextFeild.autocapitalizationType = NO;
    ConfirmPasswordTextFeild.secureTextEntry=TRUE;
    ConfirmPasswordTextFeild.returnKeyType=UIReturnKeyNext;
    [ConfirmPasswordTextFeild addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:ConfirmPasswordTextFeild];
    
    
    
    PhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+10, 286, 35)];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    PhoneTextField.leftView = paddingView;
    PhoneTextField.leftViewMode = UITextFieldViewModeAlways;
    PhoneTextField.tag=105;
    PhoneTextField.textColor=[UIColor blackColor];
    PhoneTextField.placeholder= @"Phone*";
    [PhoneTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [PhoneTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    [PhoneTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    PhoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    PhoneTextField.keyboardType = UIKeyboardTypePhonePad;
    PhoneTextField.returnKeyType = UIReturnKeyNext;
    PhoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    PhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    PhoneTextField.delegate = self;
    PhoneTextField.backgroundColor=[UIColor clearColor];
    PhoneTextField.leftView = paddingView;
    [CreateAcountScrollView addSubview:PhoneTextField];
    
    AddressTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y+10, 286, 35)];
    AddressTextField.delegate = self;
    AddressTextField.placeholder = @"Address";
     AddressTextField.tag=102;
    [AddressTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    AddressTextField.textColor=[UIColor blackColor];
    AddressTextField.textAlignment = NSTextAlignmentLeft;
    [AddressTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    AddressTextField.leftView = paddingView;
    AddressTextField.leftViewMode = UITextFieldViewModeAlways;
    AddressTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    AddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AddressTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    AddressTextField.autocapitalizationType = NO;
    AddressTextField.returnKeyType=UIReturnKeyNext;
    AddressTextField.backgroundColor=[UIColor clearColor];
    [AddressTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:AddressTextField];
    
    
    ZipCodeTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(5, AddressTextField.frame.size.height+AddressTextField.frame.origin.y+10, 286, 35)];
    ZipCodeTextFeild.delegate = self;
    ZipCodeTextFeild.placeholder = @"Zip Code";
    ZipCodeTextFeild.tag=103;
    [ZipCodeTextFeild setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    ZipCodeTextFeild.textColor=[UIColor blackColor];
    ZipCodeTextFeild.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    ZipCodeTextFeild.leftView = paddingView;
     [ZipCodeTextFeild setClearButtonMode:UITextFieldViewModeWhileEditing];
    ZipCodeTextFeild.leftViewMode = UITextFieldViewModeAlways;
    ZipCodeTextFeild.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    ZipCodeTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    ZipCodeTextFeild.autocorrectionType = UITextAutocorrectionTypeNo;
    [ZipCodeTextFeild setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    ZipCodeTextFeild.returnKeyType=UIReturnKeyNext;
    ZipCodeTextFeild.keyboardType=UIKeyboardTypePhonePad;
     ZipCodeTextFeild.backgroundColor=[UIColor clearColor];
    [ZipCodeTextFeild addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:ZipCodeTextFeild];
    
    
    GenderTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+10, 286-150, 35)];
    GenderTextField.delegate = self;
    GenderTextField.placeholder = @"Gender";
    GenderTextField.tag=108;
    GenderTextField.textColor=[UIColor blackColor];
    GenderTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    GenderTextField.leftView = paddingView;
    [GenderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    GenderTextField.leftViewMode = UITextFieldViewModeAlways;
    [GenderTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    GenderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [GenderTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    GenderTextField.autocapitalizationType = NO;
    GenderTextField.returnKeyType=UIReturnKeyNext;
     GenderTextField.inputView=self.chooseServicePicker;
    [GenderTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:GenderTextField];
    
    dateTimePicker  = [[UIDatePicker alloc]init];
    [dateTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
    dateTimePicker.datePickerMode = UIDatePickerModeDate;
    [dateTimePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
    
    AgeTextField = [[UITextField alloc] initWithFrame:CGRectMake(GenderTextField.frame.size.width+GenderTextField.frame.origin.x+10, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+10, 286-150, 35)];
    AgeTextField.delegate = self;
     AgeTextField.tag=109;
    AgeTextField.placeholder = @"DOB";
    [AgeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    AgeTextField.textColor=[UIColor blackColor];
    AgeTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    AgeTextField.leftView = paddingView;
    AgeTextField.leftViewMode = UITextFieldViewModeAlways;
    [AgeTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    AgeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    AgeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AgeTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    AgeTextField.autocapitalizationType = NO;
    [AgeTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AgeTextField setInputView:dateTimePicker];
    [CreateAcountScrollView addSubview:AgeTextField];
    
    HeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+10, 286-150, 35)];
    HeightTextField.delegate = self;
    HeightTextField.tag=110;
    HeightTextField.placeholder = @"Height";
    [HeightTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    HeightTextField.textColor=[UIColor blackColor];
     [HeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    HeightTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    HeightTextField.leftView = paddingView;
    HeightTextField.leftViewMode = UITextFieldViewModeAlways;
    HeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    HeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [HeightTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    HeightTextField.autocapitalizationType = NO;
    //ZipCodeTextFeild.returnKeyType=UIReturnKeyNext;
    HeightTextField.keyboardType=UIKeyboardTypeNumberPad;
    [HeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:HeightTextField];
    
    WeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(HeightTextField.frame.size.width+HeightTextField.frame.origin.x+10, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+10, 286-150, 35)];
    WeightTextField.delegate = self;
     WeightTextField.tag=111;
    WeightTextField.placeholder = @"Weight";
    [WeightTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    WeightTextField.textColor=[UIColor blackColor];
    [WeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    WeightTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    WeightTextField.leftView = paddingView;
    WeightTextField.leftViewMode = UITextFieldViewModeAlways;
    WeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    WeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [WeightTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    WeightTextField.autocapitalizationType = NO;
    WeightTextField.keyboardType=UIKeyboardTypeDecimalPad;
     WeightTextField.returnKeyType=UIReturnKeyDone;
    [WeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:WeightTextField];
    
//    TermAndConditionLable=[[UILabel alloc]initWithFrame:CGRectMake(10, WeightTextField.frame.size.height+WeightTextField.frame.origin.y+20, 220, 20)];
//    TermAndConditionLable.text=@"By cheaking the box and creating the account, You are agreeing to the";
//    TermAndConditionLable.textColor=[UIColor blackColor];
//    TermAndConditionLable.numberOfLines=3;
//     [TermAndConditionLable setFont:[UIFont fontWithName:@"Helvetica" size:9]];
//    [TermAndConditionLable sizeToFit];
//    TermAndConditionLable.backgroundColor=[UIColor clearColor];
    
    
    labelRegister = [[NMCustomLabel alloc]initWithFrame:CGRectMake(10, WeightTextField.frame.size.height+WeightTextField.frame.origin.y+20, 200, 45)];
    labelRegister.backgroundColor = [UIColor clearColor];
    labelRegister.numberOfLines=3;
   // [labelRegister sizeToFit];
    labelRegister.textAlignment = NSTextAlignmentLeft;
    [labelRegister setDefaultStyle:[NMCustomLabelStyle styleWithFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Roman" size:11] color:[UIColor grayColor]]];
    [labelRegister setStyle:[NMCustomLabelStyle styleWithFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:13] color:[UIColor blackColor]] forKey:@"style"];
    labelRegister.text = [NSString stringWithFormat:@"By checking the box and creating\nthe account, You are agreeing to the<span class='style'> TERMS AND CONDITIONS.</span>"];
    [CreateAcountScrollView addSubview:labelRegister];
    
    
    TermClickButton=[[UIButton alloc]initWithFrame:CGRectMake(5, WeightTextField.frame.size.height+WeightTextField.frame.origin.y+42, 180, 20)];
    [TermClickButton addTarget:self action:@selector(TermConditonAction)
              forControlEvents:UIControlEventTouchUpInside];
//    [TermClickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    TermClickButton.backgroundColor=[UIColor clearColor];

   [CreateAcountScrollView addSubview:TermClickButton];

    
    
    UIButton *HiddenButton=[[UIButton alloc]initWithFrame:CGRectMake(235, WeightTextField.frame.size.height+WeightTextField.frame.origin.y+10, 50, 50)];
    HiddenButton.backgroundColor=[UIColor clearColor];
    [HiddenButton addTarget:self action:@selector(termbuttonMark) forControlEvents:UIControlEventTouchUpInside];
    [CreateAcountScrollView addSubview:HiddenButton];
    CheckTermAndConditonButton=[[UIButton alloc]initWithFrame:CGRectMake(250,WeightTextField.frame.size.height+WeightTextField.frame.origin.y+20, 20, 20)];
    [CheckTermAndConditonButton setBackgroundImage:[UIImage imageNamed:@"check_mark_on.png"] forState:UIControlStateNormal];
    CheckTermAndConditonButton.backgroundColor=[UIColor clearColor];
    [CheckTermAndConditonButton addTarget:self action:@selector(termbuttonMark) forControlEvents:UIControlEventTouchUpInside];
    [CreateAcountScrollView addSubview:CheckTermAndConditonButton];
    
//    SubmitButton=[[UIButton alloc]initWithFrame:CGRectMake(25, 455, 250, 40)];
//    [SubmitButton setTitleColor:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0] forState:UIControlStateNormal];
//    [SubmitButton addTarget:self action:@selector(SubmitButtonAction)
//    forControlEvents:UIControlEventTouchUpInside];
//    [SubmitButton addTarget:self action:@selector(SubmitButtonActionNormal) forControlEvents:UIControlEventTouchDown];
//    SubmitButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    SubmitButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [SubmitButton setTitle:@"Create Account" forState:(UIControlState)UIControlStateNormal];
//    SubmitButton.titleEdgeInsets = UIEdgeInsetsMake(5, 75, 0, 0);
//    SubmitButton.backgroundColor=[UIColor clearColor];
//    SubmitButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
//    SubmitButton.layer.borderWidth = 1.0f;
//    SubmitButton.layer.cornerRadius = 3;
//    SubmitButton.clipsToBounds = YES;
//    
//    [BackGroundImageView addSubview:SubmitButton];
   
    [self.view addSubview:CreateAcountScrollView];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [FirstNameTextField becomeFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

    
    
    if(textField.tag==100){ FirstNameTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==101){ LastNameTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==102){ AddressTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==103){ ZipCodeTextFeild.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==104){ emailtextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==105){ PhoneTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==106){ PassWordTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==107){ ConfirmPasswordTextFeild.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==108){ GenderTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==109){ AgeTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==110){ HeightTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==111){ WeightTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    if(textField.tag==100){ FirstNameTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==101){ LastNameTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==102){ AddressTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==103){ ZipCodeTextFeild.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==104){ emailtextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==105){ PhoneTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==106){ PassWordTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==107){ ConfirmPasswordTextFeild.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==108){ GenderTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==109){ AgeTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==110){ HeightTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==111){ WeightTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    
    return YES;
}
-(UIPickerView *)chooseServicePicker
{
    if(chooseServicePicker==nil)
    {
        
        chooseServicePicker=[[UIPickerView alloc]init];
        
        chooseServicePicker.delegate=self;
        
        chooseServicePicker.dataSource=self;
        
        chooseServicePicker.showsSelectionIndicator=YES;
        
    }
    return chooseServicePicker;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [GenderPickerViewArray count];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [GenderPickerViewArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    
    GenderTextField.text=[GenderPickerViewArray objectAtIndex:row];
    [GenderTextField resignFirstResponder];
}
-(void)cancel{
    [[soundManager shared] buttonSound];
}
- (void)onBloodGroupSelection
{
    NSInteger row = [chooseServicePicker selectedRowInComponent:0];
    GenderTextField.text=[GenderPickerViewArray objectAtIndex:row];
    [GenderTextField resignFirstResponder];
}
-(void)changeImage:(UITapGestureRecognizer*)recognizer
{
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle: nil
                                                              delegate: self
                                                     cancelButtonTitle: @"Cancel"
                                                destructiveButtonTitle: nil
                                                     otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    [actionSheet1 showInView:self.view];
    
    
    NSLog(@"changeImage");
    
    //    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //
    //    picker.delegate  = self;
    //
    //    picker.allowsEditing = YES;
    
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate  = self;
    
    picker.allowsEditing = YES;
    switch (buttonIndex) {
        case 0:
            
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                
                UIAlertView*  myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                       message:@"Device has no camera"
                                                                      delegate:nil
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles: nil];
                
                [myAlertView show];
                
            }
            else
            {
                
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                
                [self presentViewController:picker animated:YES completion:Nil];
            }
            
            break;
        case 1:
            
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:NULL];
        default:
            break;
    }
    
}

#pragma mark IMAGE PICKER DELEGATES

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    path= [documentsDirectory stringByAppendingPathComponent:@"clicklabs.png" ];  // IT IS THE PATH OF CHOOSEN IMAGE
    
    imageData= UIImagePNGRepresentation([info objectForKey:@"UIImagePickerControllerEditedImage"]);
    
    [imageData writeToFile:path atomically:YES];
    
    // STORING THE PATH OF IMAGE IN NSUserDefault
    
    EditChangeImage.image=[UIImage imageWithContentsOfFile:path];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma mark Picker View Controller
-(void)updateDateField
{
    AgeTextField.text = [self formatDate:dateTimePicker.date];
}
- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"MM'/'dd'/'yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}
-(void)TermConditonAction{
    
      [self scrollViewDidTapped];
    [[soundManager shared] buttonSound];
    TearmBackGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    TearmBackGroundView.backgroundColor=[UIColor blackColor];
    TearmBackGroundView.alpha=0.8;
    [self.view addSubview:TearmBackGroundView];
    
    TearmScrollVeiw=[[UIScrollView alloc]initWithFrame:CGRectMake(20, 40, 280, 490)];
    TearmScrollVeiw.backgroundColor=[UIColor whiteColor];
  
    
    UIButton *CrossButton=[[UIButton  alloc]initWithFrame:CGRectMake(260, 0, 20, 20)];
    [CrossButton addTarget:self action:@selector(removeTearmScrollView) forControlEvents:UIControlEventTouchUpInside];
    CrossButton.backgroundColor=[UIColor blackColor];
    [CrossButton setImage:[UIImage imageNamed:@"CrossImage.png"] forState:UIControlStateNormal];
    [TearmScrollVeiw addSubview:CrossButton];
    
    UITextView *TearmTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 50, 300, 490)];
    TearmTextView.backgroundColor=[UIColor clearColor];
    TearmTextView.text=@"asdflk haklsdfh klasdfsl kjasdflk jaslk;djf lkasdflkjasdlkf jlaskdjf lkasjdflk jasdlkfj lkasdjfl kasjdlfkj aslk asdfjl kasjdf salkdjf lksajdfl kjsadlkfj lkasjdflk jsadlkfj lksajdfk jsadlkfj lkdsajf lkjdsaflk jsdaklfj lkadsjf lkjsdalfkj lsakdjflkasdjflkjdslkfjdsalkfjlksadjflkj sadfj lsadjf jasdlfj lsadjfl";
    
    [TearmTextView setFont:[UIFont boldSystemFontOfSize:10]];
    [TearmScrollVeiw addSubview:TearmTextView];
    [self.view addSubview:TearmScrollVeiw];
    [self attachPopUpAnimationToView:TearmScrollVeiw];
}
-(void)removeTearmScrollView{
     [[soundManager shared] buttonSound];
    [TearmBackGroundView removeFromSuperview];
    [TearmScrollVeiw removeFromSuperview];
}
-(void)termbuttonMark{
    
     [[soundManager shared] buttonSound];
    if(tearmButtonFlag==1){
        tearmButtonFlag=2;
        [CheckTermAndConditonButton setBackgroundImage:[UIImage imageNamed:@"check_mark_off.png"] forState:UIControlStateNormal];
    }
    else{
        tearmButtonFlag=1;
         [CheckTermAndConditonButton setBackgroundImage:[UIImage imageNamed:@"check_mark_on.png"] forState:UIControlStateNormal];
    }
}

-(void)SubmitButtonActionNormal{
      SubmitButton.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
     [SubmitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
      [SubmitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
   
}

 #pragma mark Submit Button Action
-(void)SubmitButtonAction
{
   
    SubmitButton.backgroundColor=[UIColor whiteColor];
   
    [[soundManager shared] buttonSound];
    [self scrollViewDidTapped];
    if(FirstNameTextField.text.length < 1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the first name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        [self scrollViewDidTapped];
    }
    else
    if(emailtextField.text.length < 1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
       [self scrollViewDidTapped];
    }
     else
    if(PhoneTextField.text.length < 1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the phone no" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        [self scrollViewDidTapped];
    }
    else
    if(PassWordTextField.text.length<1){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
         [self scrollViewDidTapped];
      
    }
    else
    if(ConfirmPasswordTextFeild.text.length<1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the confirm password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
         [self scrollViewDidTapped];
    }
    else
    {
        if (![self validateEmail:emailtextField.text])
        {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            alert = nil;
            [self scrollViewDidTapped];
        }
        else
        {
            if([PassWordTextField.text isEqualToString:ConfirmPasswordTextFeild.text])
            {
                
                
                if(tearmButtonFlag==1)
                {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Agree to the Terms & Conditions." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [alert show];
                    alert = nil;
 
                }
                else
                
                {
                    VerifyAccountDetailViewController *veri=[[VerifyAccountDetailViewController  alloc]init];
                    [self.navigationController pushViewController:veri animated:YES];
                }
                
                
                
//                Reachability *reach = [Reachability reachabilityForInternetConnection];
//                NetworkStatus netStatus = [reach currentReachabilityStatus];
//                if (netStatus == NotReachable)
//                {
//                    UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:@"No internet connection available" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Retry", nil];
//                    alertview3.tag = 69;
//                    [alertview3 show];
//                }
//                else
//                {
//                   // NSLog(@"username=%@ email=%@ password=%@ mobile=%@",emailtextField.text,PassWordTextField.text,ConfirmPasswordTextFeild.text);
//                    //NSString *checkTextLowerCase=[emailId lowercaseString];
//                    //NSLog(@"valu is=%@",checkTextLowerCase);
//                    //[[NSUserDefaults standardUserDefaults] objectForKey:@"device_token"]
//                    
//                    NSString *post =[NSString stringWithFormat:@"email=%@&password=%@&device_token=%@",emailtextField.text,PassWordTextField.text,@"1"];
//                    NSLog(@"post %@",post);
//                    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//                    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
//                    
//                    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
//                    //[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@index.php?action=email_login",kBaseUrl]]];
//        
//                    [request setHTTPMethod:@"POST"];
//                    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//                    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//                    
//                    [request setHTTPBody:postData];
//                    
//                    NSError *error1 = nil;
//                    
//                    NSURLResponse *response = nil;
//                    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error1];
//                    // NSLog(@"data=%@",data);
//                    if (data)
//                    {
//                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
//                        NSLog(@"JSON%@",json);
//                        if([json valueForKey:@"error"])
//                        {
//                            UIAlertView *alertview3=[[UIAlertView alloc] initWithTitle:nil message:[json valueForKey:@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
//                            alertview3.tag = 1;
//                            [alertview3 show];
//                        }
//                        else if([json objectForKey:@"data"])
//                        {
//                            NSArray *dataArray = [[NSArray alloc] initWithArray:[json objectForKey:@"data"]];
//                            NSDictionary *data = [[NSDictionary alloc] initWithDictionary:[dataArray objectAtIndex:0]];
//                            NSLog(@"%@",data);
//                            
//                    [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"access_token"] forKey:@"token"];
//                    [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_image"] forKey:@"userImage"];
//                    [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_name"] forKey:@"userName"];
//                    [[NSUserDefaults standardUserDefaults] setObject:[data valueForKey:@"user_email"] forKey:@"userEmail"];
//                    [[NSUserDefaults standardUserDefaults] synchronize];
//                            
//                            NSLog(@"user name=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"token"]);
//                            NSLog(@"userName=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"userName"]);
//                            NSLog(@"userEmail=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"userEmail"]);
//                            
//                            VerifyAccountDetailViewController *abc=[[VerifyAccountDetailViewController alloc]init];
//                            [self.navigationController pushViewController:abc animated:YES];
//                            
//                            
//                            [self HideActivityIndicator];
//                        }
//                    }
//                }
                
            
               
                
                
            }
            
            
            
            
            
            
            
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Password not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                alert = nil;
                [self scrollViewDidTapped];
            }
            
        }
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == FirstNameTextField)
    {
        [LastNameTextField becomeFirstResponder];
        return NO;
    }
    
    else
        if (textField == LastNameTextField)
        {
            [emailtextField becomeFirstResponder];
            return NO;
        }
    
        else
            if (textField == emailtextField)
                
            {
                [PassWordTextField becomeFirstResponder];
                return NO;
            }
            else
                if (textField == PassWordTextField)
                    
                {
                    [ConfirmPasswordTextFeild becomeFirstResponder];
                    return NO;
                }
                else
                    if (textField == ConfirmPasswordTextFeild)
                        
                    {
                        [PhoneTextField becomeFirstResponder];
                        return NO;
                    }
                    else
                        if (textField == PhoneTextField)
                            
                        {
                            [AddressTextField becomeFirstResponder];
                            return NO;
                        }
                        else
                            if (textField == AddressTextField)
                                
                            {
                                [ZipCodeTextFeild becomeFirstResponder];
                                return NO;
                            }
                            else
                                if (textField == ZipCodeTextFeild)
                                    
                                {
                                    [GenderTextField becomeFirstResponder];
                                    return NO;
                                }
                                else
                                    if (textField == GenderTextField)
                                        
                                    {
                                        [AgeTextField becomeFirstResponder];
                                        return NO;
                                    }
                                    else
                                        if (textField == AgeTextField)
                                            
                                        {
                                            [HeightTextField becomeFirstResponder];
                                            return NO;
                                        }
                                        else
                                            if (textField == HeightTextField)
                                                
                                            {
                                                [WeightTextField becomeFirstResponder];
                                                return NO;
                                            }
//                                            else
//                                                if (textField == WeightTextField)
//                                                    
//                                                {
//                                                    [WeightTextField becomeFirstResponder];
//                                                    return NO;
//                                                }
    
            else
            {
                [textField resignFirstResponder];
            }
    return YES;
}

-(void)keyboardWillShow
{
    // Animate the current view out of the way
    CGFloat heightofKeyboard = 270;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [CreateAcountScrollView setContentInset:insets];
    [CreateAcountScrollView setScrollIndicatorInsets:insets];
    
}
-(void)scrollViewDidTapped
{
    [emailtextField resignFirstResponder];
    [PassWordTextField resignFirstResponder];
    [ConfirmPasswordTextFeild resignFirstResponder];
    [FirstNameTextField resignFirstResponder];
    [LastNameTextField resignFirstResponder];
    [ZipCodeTextFeild resignFirstResponder];
    [HeightTextField resignFirstResponder];
    [WeightTextField resignFirstResponder];
    [AgeTextField resignFirstResponder];
    [AddressTextField resignFirstResponder];
    [PhoneTextField resignFirstResponder];
    [GenderTextField resignFirstResponder];
}
-(void)keyboardWillHide
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [CreateAcountScrollView setContentInset:insets];
    [CreateAcountScrollView setScrollIndicatorInsets:insets];
    
}
- (void) attachPopUpAnimationToView:(UIView *)myView
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .2;
    
    [myView.layer addAnimation:animation forKey:@"popup"];
}
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
- (void)textFieldDoneEditing:(id)sender
{
    // [sender resignFirstResponder];
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
