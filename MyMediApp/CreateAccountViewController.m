//
//  CreateAccountViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 09/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController (){
    
    BOOL PicClickYes;
    AsyncImageView *EditChangeImage;
    NSString *urlString2;
    
    UITextField*FirstNameTextField;
    UITextField*LastNameTextField;
    UITextField *AddressTextField;
    UITextField *ZipCodeTextFeild;
    UITextField *PhoneTextField;
    UITextField *StdCodeTextField;
    UITextField *GenderTextField;
    UITextField *HeightTextField;
    UITextField *WeightTextField;
    UITextField *AgeTextField;
    UITextField *Height2TextField;
    UITextField *Weight2TextField;
    
    
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton  *NextViewController;
    
    UIButton *SubmitButton;
    UIButton *AccountButton;
    
    UILabel *CreateAccountLable;
    UIImageView *BackGroundImageView;
    
    UIScrollView *CreateAcountScrollView;
    UITextField*emailtextField;
    UITextField *PassWordTextField;
    UITextField *ConfirmPasswordTextFeild;
    
    UIDatePicker *dateTimePicker;
    NSMutableArray *GenderPickerViewArray;
    UIPickerView *chooseServicePicker;
    UIView *paddingView;
    
    NSMutableArray *HeightPickerArray;
    UIPickerView *chooseHeightPicker;
    
    NSMutableArray *WeightPickerArray;
    UIPickerView *chooseWeightPicker;
    
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
    
    UIButton *HiddenBackButton;
    UIView *lineView1;
    
    UIButton *HiddenButton;
    UIButton *CrossButton;
    UITextView *TearmTextView;
    
    UITapGestureRecognizer*tapRecognizer;
    UITapGestureRecognizer *tap;
    
    NSString *callingCode;
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
    
    ASIFormDataRequest  *RequestForSync;
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
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    CTTelephonyNetworkInfo *network_Info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = network_Info.subscriberCellularProvider;
    NSString *isdCode = [carrier.isoCountryCode uppercaseString];
    NSLog(@"isd code is %@",isdCode);
    
    
    
    
    NSDictionary *dictCodes = [NSDictionary dictionaryWithObjectsAndKeys:@"972", @"IL",
                               @"93", @"AF", @"355", @"AL", @"213", @"DZ", @"1", @"AS",
                               @"376", @"AD", @"244", @"AO", @"1", @"AI", @"1", @"AG",
                               @"54", @"AR", @"374", @"AM", @"297", @"AW", @"61", @"AU",
                               @"43", @"AT", @"994", @"AZ", @"1", @"BS", @"973", @"BH",
                               @"880", @"BD", @"1", @"BB", @"375", @"BY", @"32", @"BE",
                               @"501", @"BZ", @"229", @"BJ", @"1", @"BM", @"975", @"BT",
                               @"387", @"BA", @"267", @"BW", @"55", @"BR", @"246", @"IO",
                               @"359", @"BG", @"226", @"BF", @"257", @"BI", @"855", @"KH",
                               @"237", @"CM", @"1", @"CA", @"238", @"CV", @"345", @"KY",
                               @"236", @"CF", @"235", @"TD", @"56", @"CL", @"86", @"CN",
                               @"61", @"CX", @"57", @"CO", @"269", @"KM", @"242", @"CG",
                               @"682", @"CK", @"506", @"CR", @"385", @"HR", @"53", @"CU",
                               @"537", @"CY", @"420", @"CZ", @"45", @"DK", @"253", @"DJ",
                               @"1", @"DM", @"1", @"DO", @"593", @"EC", @"20", @"EG",
                               @"503", @"SV", @"240", @"GQ", @"291", @"ER", @"372", @"EE",
                               @"251", @"ET", @"298", @"FO", @"679", @"FJ", @"358", @"FI",
                               @"33", @"FR", @"594", @"GF", @"689", @"PF", @"241", @"GA",
                               @"220", @"GM", @"995", @"GE", @"49", @"DE", @"233", @"GH",
                               @"350", @"GI", @"30", @"GR", @"299", @"GL", @"1", @"GD",
                               @"590", @"GP", @"1", @"GU", @"502", @"GT", @"224", @"GN",
                               @"245", @"GW", @"595", @"GY", @"509", @"HT", @"504", @"HN",
                               @"36", @"HU", @"354", @"IS", @"91", @"IN", @"62", @"ID",
                               @"964", @"IQ", @"353", @"IE", @"972", @"IL", @"39", @"IT",
                               @"1", @"JM", @"81", @"JP", @"962", @"JO", @"77", @"KZ",
                               @"254", @"KE", @"686", @"KI", @"965", @"KW", @"996", @"KG",
                               @"371", @"LV", @"961", @"LB", @"266", @"LS", @"231", @"LR",
                               @"423", @"LI", @"370", @"LT", @"352", @"LU", @"261", @"MG",
                               @"265", @"MW", @"60", @"MY", @"960", @"MV", @"223", @"ML",
                               @"356", @"MT", @"692", @"MH", @"596", @"MQ", @"222", @"MR",
                               @"230", @"MU", @"262", @"YT", @"52", @"MX", @"377", @"MC",
                               @"976", @"MN", @"382", @"ME", @"1", @"MS", @"212", @"MA",
                               @"95", @"MM", @"264", @"NA", @"674", @"NR", @"977", @"NP",
                               @"31", @"NL", @"599", @"AN", @"687", @"NC", @"64", @"NZ",
                               @"505", @"NI", @"227", @"NE", @"234", @"NG", @"683", @"NU",
                               @"672", @"NF", @"1", @"MP", @"47", @"NO", @"968", @"OM",
                               @"92", @"PK", @"680", @"PW", @"507", @"PA", @"675", @"PG",
                               @"595", @"PY", @"51", @"PE", @"63", @"PH", @"48", @"PL",
                               @"351", @"PT", @"1", @"PR", @"974", @"QA", @"40", @"RO",
                               @"250", @"RW", @"685", @"WS", @"378", @"SM", @"966", @"SA",
                               @"221", @"SN", @"381", @"RS", @"248", @"SC", @"232", @"SL",
                               @"65", @"SG", @"421", @"SK", @"386", @"SI", @"677", @"SB",
                               @"27", @"ZA", @"500", @"GS", @"34", @"ES", @"94", @"LK",
                               @"249", @"SD", @"597", @"SR", @"268", @"SZ", @"46", @"SE",
                               @"41", @"CH", @"992", @"TJ", @"66", @"TH", @"228", @"TG",
                               @"690", @"TK", @"676", @"TO", @"1", @"TT", @"216", @"TN",
                               @"90", @"TR", @"993", @"TM", @"1", @"TC", @"688", @"TV",
                               @"256", @"UG", @"380", @"UA", @"971", @"AE", @"44", @"GB",
                               @"1", @"US", @"598", @"UY", @"998", @"UZ", @"678", @"VU",
                               @"681", @"WF", @"967", @"YE", @"260", @"ZM", @"263", @"ZW",
                               @"591", @"BO", @"673", @"BN", @"61", @"CC", @"243", @"CD",
                               @"225", @"CI", @"500", @"FK", @"44", @"GG", @"379", @"VA",
                               @"852", @"HK", @"98", @"IR", @"44", @"IM", @"44", @"JE",
                               @"850", @"KP", @"82", @"KR", @"856", @"LA", @"218", @"LY",
                               @"853", @"MO", @"389", @"MK", @"691", @"FM", @"373", @"MD",
                               @"258", @"MZ", @"970", @"PS", @"872", @"PN", @"262", @"RE",
                               @"7", @"RU", @"590", @"BL", @"290", @"SH", @"1", @"KN",
                               @"1", @"LC", @"590", @"MF", @"508", @"PM", @"1", @"VC",
                               @"239", @"ST", @"252", @"SO", @"47", @"SJ", @"963", @"SY",
                               @"886", @"TW", @"255", @"TZ", @"670", @"TL", @"58", @"VE",
                               @"84", @"VN", @"1", @"VG", @"1", @"VI", nil];
    
    
    //    NSLocale *locale = [NSLocale currentLocale];
    //    NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];
    //    NSString *callingCode = [dictCodes objectForKey:countryCode];
    //    NSLog(@"callingCode Code is %@",callingCode);
    
    callingCode = [dictCodes objectForKey:isdCode];
    NSLog(@"callingCode Code is %@",callingCode);
    
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    HiddenBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    HiddenBackButton.frame = CGRectMake(5,22,[UIImage imageNamed:@"Newback_50.png"].size.width+25, [UIImage imageNamed:@"Newback_50.png"].size.height+10);
    HiddenBackButton.backgroundColor=[UIColor clearColor];
    [HiddenBackButton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:HiddenBackButton];
    
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(5,25,[UIImage imageNamed:@"backButtonNew.png"].size.width, [UIImage imageNamed:@"backButtonNew.png"].size.height);
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    
    CreateAccountLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 30, 150, 30)];
    CreateAccountLable.font=[UIFont fontWithName:helveticaRegular size:18];
    CreateAccountLable.textColor=[UIColor blackColor];
    CreateAccountLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:CreateAccountLable];
    [self.view addSubview:TopBarView];
    
    GenderPickerViewArray=[[NSMutableArray alloc]initWithObjects:@"Male",@"Female", nil];
    tearmButtonFlag=2;
    [self AddAccountScrollView];
    
    HeightPickerArray = [[NSMutableArray alloc]initWithObjects:@"Centimetres",@"Feet-Inches", nil];
    WeightPickerArray = [[NSMutableArray alloc]initWithObjects:@"Lbs",@"Kgs", nil];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    // Do any additional setup after loading the view.
}
-(void)BackVeiwController{
    [[soundManager shared]buttonSound];
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
    CreateAcountScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+30, 320,400)];
    CreateAcountScrollView.backgroundColor=[UIColor clearColor];
    CreateAcountScrollView.showsVerticalScrollIndicator=NO;
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"]==true) {
        CreateAcountScrollView.contentSize=CGSizeMake(300, 460);
    }
    else{
        CreateAcountScrollView.contentSize=CGSizeMake(300, 600);
    }
    CreateAcountScrollView.userInteractionEnabled=true;
    
    
    UIView *CenterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,120)];
    CenterView.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
    CenterView.userInteractionEnabled=TRUE;
    [CreateAcountScrollView addSubview:CenterView];
    
    
    EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 10, 100, 100)];
    //urlString2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"image_url"];
    EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
    EditChangeImage.image=[UIImage imageNamed:@"ProfileImage.jpeg"];
    EditChangeImage.backgroundColor=[UIColor lightGrayColor];
    EditChangeImage.userInteractionEnabled=YES;
    EditChangeImage.layer.masksToBounds = YES;
    EditChangeImage.layer.borderWidth = 1;
    EditChangeImage.contentMode = UIViewContentModeScaleAspectFill;
    EditChangeImage.layer.borderColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    EditChangeImage.userInteractionEnabled=YES;
    [[EditChangeImage layer]setCornerRadius:50];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    [tap setNumberOfTouchesRequired:1];
    [EditChangeImage addGestureRecognizer:tap];
    [CenterView addSubview:EditChangeImage];
    
    
    FirstNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+10, 20, 205, 40)];
    FirstNameTextField.delegate = self;
    FirstNameTextField.backgroundColor=[UIColor whiteColor];
    [FirstNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    FirstNameTextField.textColor=[UIColor blackColor];
    FirstNameTextField.textAlignment=NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    FirstNameTextField.leftView = paddingView;
    FirstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    FirstNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    FirstNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [FirstNameTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
    FirstNameTextField.returnKeyType=UIReturnKeyNext;
    FirstNameTextField.autocapitalizationType = NO;
    [FirstNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CenterView addSubview:FirstNameTextField];
    
    LastNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+10, FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y+3, 205, 40)];
    LastNameTextField.delegate = self;
    LastNameTextField.backgroundColor=[UIColor whiteColor];
    LastNameTextField.textColor=[UIColor blackColor];
    [LastNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    LastNameTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    LastNameTextField.leftView = paddingView;
    LastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    LastNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    LastNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [LastNameTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
    LastNameTextField.returnKeyType=UIReturnKeyNext;
    LastNameTextField.autocapitalizationType = NO;
    [LastNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CenterView addSubview:LastNameTextField];
    
    emailtextField = [[UITextField alloc] initWithFrame:CGRectMake(0, CenterView.frame.size.height+CenterView.frame.origin.y+25, 320, 40)];
    emailtextField.delegate = self;
    emailtextField.textAlignment = NSTextAlignmentLeft;
    [emailtextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    emailtextField.leftView = paddingView;
    emailtextField.leftViewMode = UITextFieldViewModeAlways;
    emailtextField.textColor=[UIColor blackColor];
    emailtextField.keyboardType = UIKeyboardTypeEmailAddress;
    emailtextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    emailtextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [emailtextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
    emailtextField.returnKeyType=UIReturnKeyNext;
    emailtextField.backgroundColor=[UIColor whiteColor];
    emailtextField.autocapitalizationType = NO;
    [emailtextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:emailtextField];
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"] == true)
    {
        
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];
        toolbar.barStyle = UIBarStyleBlackOpaque;
        
        UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
        doneButton.width = 50;
        toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
        
        
        StdCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, emailtextField.frame.size.height+emailtextField.frame.origin.y+3, 100, 40)];
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        StdCodeTextField.leftView = paddingView;
        StdCodeTextField.leftViewMode = UITextFieldViewModeAlways;
        StdCodeTextField.tag=106;
        StdCodeTextField.textColor=[UIColor blackColor];
        [StdCodeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [StdCodeTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        StdCodeTextField.backgroundColor=[UIColor whiteColor];
        StdCodeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        StdCodeTextField.keyboardType = UIKeyboardTypePhonePad;
        StdCodeTextField.returnKeyType = UIReturnKeyNext;
        StdCodeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        StdCodeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        StdCodeTextField.delegate = self;
        StdCodeTextField.leftView = paddingView;
        StdCodeTextField.autocapitalizationType = NO;
        [StdCodeTextField setInputAccessoryView:toolbar];
        StdCodeTextField.userInteractionEnabled = false;
        
        StdCodeTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        StdCodeTextField.layer.borderWidth = 0.5f;
        StdCodeTextField.backgroundColor = [UIColor whiteColor];
        
        [CreateAcountScrollView addSubview:StdCodeTextField];
        
        PhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(StdCodeTextField.frame.size.width+StdCodeTextField.frame.origin.x, emailtextField.frame.size.height+emailtextField.frame.origin.y+3, 280, 40)];
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        PhoneTextField.leftView = paddingView;
        PhoneTextField.leftViewMode = UITextFieldViewModeAlways;
        PhoneTextField.tag=105;
        PhoneTextField.textColor=[UIColor blackColor];
        [PhoneTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [PhoneTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        PhoneTextField.backgroundColor=[UIColor whiteColor];
        PhoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        PhoneTextField.keyboardType = UIKeyboardTypePhonePad;
        PhoneTextField.returnKeyType = UIReturnKeyNext;
        PhoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        PhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        PhoneTextField.delegate = self;
        PhoneTextField.leftView = paddingView;
        PhoneTextField.autocapitalizationType = NO;
        PhoneTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        PhoneTextField.layer.borderWidth = 0.5f;
        PhoneTextField.backgroundColor = [UIColor whiteColor];
        [PhoneTextField setInputAccessoryView:toolbar];
        [CreateAcountScrollView addSubview:PhoneTextField];
        
        AddressTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y+3, 320, 40)];
        AddressTextField.delegate = self;
        AddressTextField.textColor=[UIColor blackColor];
        AddressTextField.textAlignment = NSTextAlignmentLeft;
        [AddressTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        AddressTextField.leftView = paddingView;
        AddressTextField.leftViewMode = UITextFieldViewModeAlways;
        AddressTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        AddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [AddressTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        AddressTextField.backgroundColor=[UIColor whiteColor];
        AddressTextField.returnKeyType=UIReturnKeyNext;
        AddressTextField.autocapitalizationType = NO;
        [AddressTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:AddressTextField];
        
        ZipCodeTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(0, AddressTextField.frame.size.height+AddressTextField.frame.origin.y+3, 320, 40)];
        ZipCodeTextFeild.delegate = self;
        ZipCodeTextFeild.textColor=[UIColor blackColor];
        ZipCodeTextFeild.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        ZipCodeTextFeild.leftView = paddingView;
        [ZipCodeTextFeild setClearButtonMode:UITextFieldViewModeWhileEditing];
        ZipCodeTextFeild.leftViewMode = UITextFieldViewModeAlways;
        ZipCodeTextFeild.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        ZipCodeTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        ZipCodeTextFeild.autocorrectionType = UITextAutocorrectionTypeNo;
        [ZipCodeTextFeild setFont:[UIFont fontWithName:helveticaRegular size:18]];
        ZipCodeTextFeild.returnKeyType=UIReturnKeyNext;
        ZipCodeTextFeild.keyboardType=UIKeyboardTypeAlphabet;
        ZipCodeTextFeild.backgroundColor=[UIColor whiteColor];
        ZipCodeTextFeild.autocapitalizationType = NO;
        [ZipCodeTextFeild addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:ZipCodeTextFeild];
        
        
        GenderTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+3, 157, 40)];
        GenderTextField.delegate = self;
        GenderTextField.tag=108;
        GenderTextField.textColor=[UIColor blackColor];
        GenderTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        GenderTextField.leftView = paddingView;
        [GenderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        GenderTextField.leftViewMode = UITextFieldViewModeAlways;
        GenderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [GenderTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        GenderTextField.returnKeyType=UIReturnKeyNext;
        GenderTextField.backgroundColor=[UIColor whiteColor];
        GenderTextField.inputView=self.chooseServicePicker;
        [GenderTextField setInputAccessoryView:toolbar];
        GenderTextField.autocapitalizationType = NO;
        [GenderTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:GenderTextField];
        
        dateTimePicker=[[UIDatePicker alloc]init];
        [dateTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
        dateTimePicker.datePickerMode = UIDatePickerModeDate;
        [dateTimePicker setMaximumDate:[NSDate  date]];
        [dateTimePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
        
        AgeTextField = [[UITextField alloc] initWithFrame:CGRectMake(GenderTextField.frame.size.width+GenderTextField.frame.origin.x+3, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+3, 160, 40)];
        AgeTextField.delegate = self;
        AgeTextField.tag=109;
        [AgeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        AgeTextField.textColor=[UIColor blackColor];
        AgeTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        AgeTextField.leftView = paddingView;
        AgeTextField.leftViewMode = UITextFieldViewModeAlways;
        AgeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        AgeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [AgeTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        AgeTextField.backgroundColor=[UIColor whiteColor];
        [AgeTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [AgeTextField setInputView:dateTimePicker];
        AgeTextField.autocapitalizationType = NO;
        [AgeTextField setInputAccessoryView:toolbar];
        [CreateAcountScrollView addSubview:AgeTextField];
        
        
        HeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+3, 157, 40)];
        HeightTextField.delegate = self;
        HeightTextField.tag=110;
        HeightTextField.textColor=[UIColor blackColor];
        HeightTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        HeightTextField.leftView = paddingView;
        [HeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        HeightTextField.leftViewMode = UITextFieldViewModeAlways;
        HeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        HeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [HeightTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        HeightTextField.returnKeyType=UIReturnKeyNext;
        HeightTextField.backgroundColor=[UIColor whiteColor];
        HeightTextField.inputView=self.chooseHeightPicker;
        [HeightTextField setInputAccessoryView:toolbar];
        HeightTextField.autocapitalizationType = NO;
        [HeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        HeightTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        HeightTextField.layer.borderWidth = 0.5f;
        HeightTextField.backgroundColor = [UIColor whiteColor];
        
        [CreateAcountScrollView addSubview:HeightTextField];
        
        Height2TextField = [[UITextField alloc] initWithFrame:CGRectMake(HeightTextField.frame.size.width+HeightTextField.frame.origin.x, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+3, 163, 40)];
        Height2TextField.delegate = self;
        Height2TextField.textColor=[UIColor blackColor];
        Height2TextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        Height2TextField.leftView = paddingView;
        [Height2TextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        Height2TextField.leftViewMode = UITextFieldViewModeAlways;
        Height2TextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        Height2TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        Height2TextField.autocorrectionType = UITextAutocorrectionTypeNo;
        [Height2TextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        Height2TextField.returnKeyType=UIReturnKeyNext;
        Height2TextField.keyboardType=UIKeyboardTypeDecimalPad;
        Height2TextField.backgroundColor=[UIColor whiteColor];
        Height2TextField.autocapitalizationType = NO;
        [Height2TextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        Height2TextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        Height2TextField.layer.borderWidth = 0.5f;
        Height2TextField.backgroundColor = [UIColor whiteColor];
        
        
        [CreateAcountScrollView addSubview:Height2TextField];
        
        
        WeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, Height2TextField.frame.size.height+Height2TextField.frame.origin.y+3, 157, 40)];
        WeightTextField.delegate = self;
        WeightTextField.tag=111;
        WeightTextField.textColor=[UIColor blackColor];
        WeightTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        WeightTextField.leftView = paddingView;
        [WeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        WeightTextField.leftViewMode = UITextFieldViewModeAlways;
        WeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        WeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [WeightTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        WeightTextField.returnKeyType=UIReturnKeyNext;
        WeightTextField.backgroundColor=[UIColor whiteColor];
        WeightTextField.inputView=self.chooseWeightPicker;
        [WeightTextField setInputAccessoryView:toolbar];
        WeightTextField.autocapitalizationType = NO;
        [WeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        WeightTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        WeightTextField.layer.borderWidth = 0.5f;
        WeightTextField.backgroundColor = [UIColor whiteColor];
        
        
        [CreateAcountScrollView addSubview:WeightTextField];
        
        Weight2TextField= [[UITextField alloc] initWithFrame:CGRectMake(WeightTextField.frame.size.width+WeightTextField.frame.origin.x, Height2TextField.frame.size.height+Height2TextField.frame.origin.y+3, 163, 40)];
        Weight2TextField.delegate = self;
        Weight2TextField.textColor=[UIColor blackColor];
        Weight2TextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        Weight2TextField.leftView = paddingView;
        [Weight2TextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        Weight2TextField.leftViewMode = UITextFieldViewModeAlways;
        Weight2TextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        Weight2TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        Weight2TextField.autocorrectionType = UITextAutocorrectionTypeNo;
        [Weight2TextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        Weight2TextField.returnKeyType=UIReturnKeyNext;
        Weight2TextField.keyboardType=UIKeyboardTypeDecimalPad;
        Weight2TextField.backgroundColor=[UIColor whiteColor];
        Weight2TextField.autocapitalizationType = NO;
        [Weight2TextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        Weight2TextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        Weight2TextField.layer.borderWidth = 0.5f;
        Weight2TextField.backgroundColor = [UIColor whiteColor];
        
        
        [CreateAcountScrollView addSubview:Weight2TextField];
        
        
    }
    else{
        
        PassWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, emailtextField.frame.size.height+emailtextField.frame.origin.y+3, 320, 40)];
        PassWordTextField.delegate = self;
        [PassWordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        PassWordTextField.textColor=[UIColor blackColor];
        PassWordTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        PassWordTextField.leftView = paddingView;
        PassWordTextField.leftViewMode = UITextFieldViewModeAlways;
        PassWordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        PassWordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [PassWordTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        PassWordTextField.secureTextEntry=TRUE;
        PassWordTextField.backgroundColor=[UIColor whiteColor];
        PassWordTextField.returnKeyType=UIReturnKeyNext;
        PassWordTextField.autocapitalizationType = NO;
        [PassWordTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:PassWordTextField];
        
        ConfirmPasswordTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(0, PassWordTextField.frame.size.height+PassWordTextField.frame.origin.y+3, 320, 40)];
        ConfirmPasswordTextFeild.delegate = self;
        ConfirmPasswordTextFeild.textColor=[UIColor blackColor];
        ConfirmPasswordTextFeild.backgroundColor=[UIColor whiteColor];
        [ConfirmPasswordTextFeild setClearButtonMode:UITextFieldViewModeWhileEditing];
        ConfirmPasswordTextFeild.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        ConfirmPasswordTextFeild.leftView = paddingView;
        ConfirmPasswordTextFeild.leftViewMode = UITextFieldViewModeAlways;
        ConfirmPasswordTextFeild.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        ConfirmPasswordTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [ConfirmPasswordTextFeild setFont:[UIFont fontWithName:helveticaRegular size:18]];
        ConfirmPasswordTextFeild.autocapitalizationType = NO;
        ConfirmPasswordTextFeild.secureTextEntry=TRUE;
        ConfirmPasswordTextFeild.returnKeyType=UIReturnKeyNext;
        [ConfirmPasswordTextFeild addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:ConfirmPasswordTextFeild];
        
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];
        toolbar.barStyle = UIBarStyleBlackOpaque;
        
        UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
        doneButton.width = 50;
        toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
        
        StdCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+3, 70, 40)];
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        StdCodeTextField.leftView = paddingView;
        StdCodeTextField.leftViewMode = UITextFieldViewModeAlways;
        StdCodeTextField.tag=106;
        StdCodeTextField.textColor=[UIColor blackColor];
        [StdCodeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [StdCodeTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        StdCodeTextField.backgroundColor=[UIColor whiteColor];
        StdCodeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        StdCodeTextField.keyboardType = UIKeyboardTypePhonePad;
        StdCodeTextField.returnKeyType = UIReturnKeyNext;
        StdCodeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        StdCodeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        StdCodeTextField.delegate = self;
        StdCodeTextField.leftView = paddingView;
        StdCodeTextField.autocapitalizationType = NO;
        [StdCodeTextField setInputAccessoryView:toolbar];
        StdCodeTextField.userInteractionEnabled = false;
        StdCodeTextField.userInteractionEnabled = false;
        StdCodeTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        StdCodeTextField.layer.borderWidth = 0.5f;
        StdCodeTextField.backgroundColor = [UIColor whiteColor];
        [CreateAcountScrollView addSubview:StdCodeTextField];
        
        
        PhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(StdCodeTextField.frame.size.width+StdCodeTextField.frame.origin.x, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+3, 280, 40)];
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        PhoneTextField.leftView = paddingView;
        PhoneTextField.leftViewMode = UITextFieldViewModeAlways;
        PhoneTextField.tag=105;
        PhoneTextField.textColor=[UIColor blackColor];
        [PhoneTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [PhoneTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        PhoneTextField.backgroundColor=[UIColor whiteColor];
        PhoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        PhoneTextField.keyboardType = UIKeyboardTypePhonePad;
        PhoneTextField.returnKeyType = UIReturnKeyNext;
        PhoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        PhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        PhoneTextField.delegate = self;
        PhoneTextField.leftView = paddingView;
        PhoneTextField.autocapitalizationType = NO;
        [PhoneTextField setInputAccessoryView:toolbar];
        PhoneTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        PhoneTextField.layer.borderWidth = 0.5f;
        PhoneTextField.backgroundColor = [UIColor whiteColor];
        [CreateAcountScrollView addSubview:PhoneTextField];
        
        AddressTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y+3, 320, 40)];
        AddressTextField.delegate = self;
        AddressTextField.textColor=[UIColor blackColor];
        AddressTextField.textAlignment = NSTextAlignmentLeft;
        [AddressTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        AddressTextField.leftView = paddingView;
        AddressTextField.leftViewMode = UITextFieldViewModeAlways;
        AddressTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        AddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [AddressTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        AddressTextField.backgroundColor=[UIColor whiteColor];
        AddressTextField.returnKeyType=UIReturnKeyNext;
        AddressTextField.autocapitalizationType = NO;
        [AddressTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:AddressTextField];
        
        ZipCodeTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(0, AddressTextField.frame.size.height+AddressTextField.frame.origin.y+3, 320, 40)];
        ZipCodeTextFeild.delegate = self;
        ZipCodeTextFeild.textColor=[UIColor blackColor];
        ZipCodeTextFeild.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        ZipCodeTextFeild.leftView = paddingView;
        [ZipCodeTextFeild setClearButtonMode:UITextFieldViewModeWhileEditing];
        ZipCodeTextFeild.leftViewMode = UITextFieldViewModeAlways;
        ZipCodeTextFeild.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        ZipCodeTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        ZipCodeTextFeild.autocorrectionType = UITextAutocorrectionTypeNo;
        [ZipCodeTextFeild setFont:[UIFont fontWithName:helveticaRegular size:18]];
        ZipCodeTextFeild.returnKeyType=UIReturnKeyNext;
        ZipCodeTextFeild.keyboardType=UIKeyboardTypeAlphabet;
        ZipCodeTextFeild.backgroundColor=[UIColor whiteColor];
        ZipCodeTextFeild.autocapitalizationType = NO;
        [ZipCodeTextFeild addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:ZipCodeTextFeild];
        
        
        GenderTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+3, 157, 40)];
        GenderTextField.delegate = self;
        GenderTextField.tag=108;
        GenderTextField.textColor=[UIColor blackColor];
        GenderTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        GenderTextField.leftView = paddingView;
        [GenderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        GenderTextField.leftViewMode = UITextFieldViewModeAlways;
        GenderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [GenderTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        GenderTextField.returnKeyType=UIReturnKeyNext;
        GenderTextField.backgroundColor=[UIColor whiteColor];
        GenderTextField.inputView=self.chooseServicePicker;
        [GenderTextField setInputAccessoryView:toolbar];
        GenderTextField.autocapitalizationType = NO;
        [GenderTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [CreateAcountScrollView addSubview:GenderTextField];
        
        dateTimePicker=[[UIDatePicker alloc]init];
        [dateTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
        dateTimePicker.datePickerMode = UIDatePickerModeDate;
         [dateTimePicker setMaximumDate:[NSDate  date]];
        [dateTimePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
        
        AgeTextField = [[UITextField alloc] initWithFrame:CGRectMake(GenderTextField.frame.size.width+GenderTextField.frame.origin.x+3, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+3, 160, 40)];
        AgeTextField.delegate = self;
        AgeTextField.tag=109;
        [AgeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        AgeTextField.textColor=[UIColor blackColor];
        AgeTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        AgeTextField.leftView = paddingView;
        AgeTextField.leftViewMode = UITextFieldViewModeAlways;
        AgeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        AgeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [AgeTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        AgeTextField.backgroundColor=[UIColor whiteColor];
        [AgeTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [AgeTextField setInputView:dateTimePicker];
        AgeTextField.autocapitalizationType = NO;
        [AgeTextField setInputAccessoryView:toolbar];
        [CreateAcountScrollView addSubview:AgeTextField];
        
        
        HeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+3, 157, 40)];
        HeightTextField.delegate = self;
        HeightTextField.tag=110;
        HeightTextField.textColor=[UIColor blackColor];
        HeightTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        HeightTextField.leftView = paddingView;
        [HeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        HeightTextField.leftViewMode = UITextFieldViewModeAlways;
        HeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        HeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [HeightTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        HeightTextField.returnKeyType=UIReturnKeyNext;
        HeightTextField.backgroundColor=[UIColor whiteColor];
        HeightTextField.inputView=self.chooseHeightPicker;
        [HeightTextField setInputAccessoryView:toolbar];
        HeightTextField.autocapitalizationType = NO;
        [HeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        HeightTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        HeightTextField.layer.borderWidth = 0.5f;
        HeightTextField.backgroundColor = [UIColor whiteColor];
        
        
        [CreateAcountScrollView addSubview:HeightTextField];
        
        Height2TextField = [[UITextField alloc] initWithFrame:CGRectMake(HeightTextField.frame.size.width+HeightTextField.frame.origin.x, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+3, 163, 40)];
        Height2TextField.delegate = self;
        Height2TextField.textColor=[UIColor blackColor];
        Height2TextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        Height2TextField.leftView = paddingView;
        [Height2TextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        Height2TextField.leftViewMode = UITextFieldViewModeAlways;
        Height2TextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        Height2TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        Height2TextField.autocorrectionType = UITextAutocorrectionTypeNo;
        [Height2TextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        Height2TextField.returnKeyType=UIReturnKeyNext;
        Height2TextField.keyboardType=UIKeyboardTypeDecimalPad;
        Height2TextField.backgroundColor=[UIColor whiteColor];
        Height2TextField.autocapitalizationType = NO;
        [Height2TextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        Height2TextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        Height2TextField.layer.borderWidth = 0.5f;
        Height2TextField.backgroundColor = [UIColor whiteColor];
        
        [CreateAcountScrollView addSubview:Height2TextField];
        
        
        WeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, Height2TextField.frame.size.height+Height2TextField.frame.origin.y+3, 157, 40)];
        WeightTextField.delegate = self;
        WeightTextField.tag=111;
        WeightTextField.textColor=[UIColor blackColor];
        WeightTextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        WeightTextField.leftView = paddingView;
        [WeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        WeightTextField.leftViewMode = UITextFieldViewModeAlways;
        WeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        WeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [WeightTextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        WeightTextField.returnKeyType=UIReturnKeyNext;
        WeightTextField.backgroundColor=[UIColor whiteColor];
        WeightTextField.inputView=self.chooseWeightPicker;
        [WeightTextField setInputAccessoryView:toolbar];
        WeightTextField.autocapitalizationType = NO;
        [WeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        WeightTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        WeightTextField.layer.borderWidth = 0.5f;
        WeightTextField.backgroundColor = [UIColor whiteColor];
        
        
        [CreateAcountScrollView addSubview:WeightTextField];
        
        Weight2TextField= [[UITextField alloc] initWithFrame:CGRectMake(WeightTextField.frame.size.width+WeightTextField.frame.origin.x, Height2TextField.frame.size.height+Height2TextField.frame.origin.y+3, 163, 40)];
        Weight2TextField.delegate = self;
        Weight2TextField.textColor=[UIColor blackColor];
        Weight2TextField.textAlignment = NSTextAlignmentLeft;
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        Weight2TextField.leftView = paddingView;
        [Weight2TextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        Weight2TextField.leftViewMode = UITextFieldViewModeAlways;
        Weight2TextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        Weight2TextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        Weight2TextField.autocorrectionType = UITextAutocorrectionTypeNo;
        [Weight2TextField setFont:[UIFont fontWithName:helveticaRegular size:18]];
        Weight2TextField.returnKeyType=UIReturnKeyNext;
        Weight2TextField.keyboardType=UIKeyboardTypeDecimalPad;
        Weight2TextField.backgroundColor=[UIColor whiteColor];
        Weight2TextField.autocapitalizationType = NO;
        [Weight2TextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
        Weight2TextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
        Weight2TextField.layer.borderWidth = 0.5f;
        Weight2TextField.backgroundColor = [UIColor whiteColor];
        
        
        [CreateAcountScrollView addSubview:Weight2TextField];
        
        labelRegister = [[NMCustomLabel alloc]initWithFrame:CGRectMake(10, WeightTextField.frame.size.height+WeightTextField.frame.origin.y+20, 260, 45)];
        labelRegister.backgroundColor = [UIColor clearColor];
        labelRegister.numberOfLines=3;
        labelRegister.textAlignment = NSTextAlignmentLeft;
        [labelRegister setDefaultStyle:[NMCustomLabelStyle styleWithFont:[UIFont fontWithName:helveticaRegular size:11] color:[UIColor blackColor]]];
        [labelRegister setStyle:[NMCustomLabelStyle styleWithFont:[UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size:13] color:[UIColor blackColor]] forKey:@"style"];
        labelRegister.text = [NSString stringWithFormat:@"By checking creating the account, You are agreeing to the<span class='style'> TERMS AND CONDITIONS.</span>"];
        [CreateAcountScrollView addSubview:labelRegister];
        
        
        
        TermClickButton=[[UIButton alloc]initWithFrame:CGRectMake(5, WeightTextField.frame.size.height+WeightTextField.frame.origin.y+42, 180, 20)];
        [TermClickButton addTarget:self action:@selector(TermConditonAction)forControlEvents:UIControlEventTouchUpInside];
        TermClickButton.backgroundColor=[UIColor clearColor];
        [CreateAcountScrollView addSubview:TermClickButton];
        
        HiddenButton=[[UIButton alloc]initWithFrame:CGRectMake(235, WeightTextField.frame.size.height+WeightTextField.frame.origin.y+10, 50, 50)];
        HiddenButton.backgroundColor=[UIColor clearColor];
        [HiddenButton addTarget:self action:@selector(termbuttonMark) forControlEvents:UIControlEventTouchUpInside];
        [CreateAcountScrollView addSubview:HiddenButton];
        
        
        CheckTermAndConditonButton=[[UIButton alloc]initWithFrame:CGRectMake(250,WeightTextField.frame.size.height+WeightTextField.frame.origin.y+35, [UIImage imageNamed:@"check_mark_on.png"].size.width, [UIImage imageNamed:@"check_mark_on.png"].size.height)];
        [CheckTermAndConditonButton setBackgroundImage:[UIImage imageNamed:@"check_mark_off.png"] forState:UIControlStateNormal];
        CheckTermAndConditonButton.backgroundColor=[UIColor clearColor];
        [CheckTermAndConditonButton addTarget:self action:@selector(termbuttonMark) forControlEvents:UIControlEventTouchUpInside];
        [CreateAcountScrollView addSubview:CheckTermAndConditonButton];
        
        lineView1=[[UIView alloc]initWithFrame:CGRectMake(43,labelRegister.frame.origin.y+labelRegister.frame.size.height-15,155,1)];
        lineView1.layer.borderColor = [UIColor blackColor].CGColor;
        lineView1.backgroundColor=[UIColor clearColor];
        lineView1.layer.borderWidth = 1.0f;
        [CreateAcountScrollView addSubview:lineView1];
        
        
        
    }
    
    
    
    
    UIView *BottomAccountView=[[UIView alloc]initWithFrame:CGRectMake(0, 503, self.view.frame.size.width,65)];
    BottomAccountView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    BottomAccountView.userInteractionEnabled=TRUE;
    
    UIButton *LogInButton=[[UIButton alloc]initWithFrame:CGRectMake(35, 13, 250, 40)];
    LogInButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
    [LogInButton addTarget:self action:@selector(SubmitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [LogInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    LogInButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    [LogInButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [LogInButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    LogInButton.clipsToBounds = YES;
    LogInButton.layer.cornerRadius = 5;
    [BottomAccountView addSubview:LogInButton];
    
    [self.view addSubview:BottomAccountView];
    
    [self.view addSubview:CreateAcountScrollView];
    
    
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"] == true)
    {
        CreateAccountLable.text=@"Edit Account";
        [LogInButton setTitle:@"Done" forState:UIControlStateNormal];
        
        NSLog(@"firstname is=%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"firstname"]);
        NSLog(@"zip is=%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"zip"]);
        
        FirstNameTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"firstname"];
        emailtextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"email"];
        PassWordTextField.placeholder = @"Password*";
        ConfirmPasswordTextFeild.placeholder = @"Confirm Password*";
        
        if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"lastname"] length]==0)
        {
            LastNameTextField.placeholder = @"Last Name";
        }
        else
        {
            LastNameTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"lastname"];
        }
        if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"phone"] length]==0)       // std code
        {
            StdCodeTextField.placeholder= callingCode;
        }
        else
        {
            NSString *stdCode = [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"phone"];
            NSArray *myArray = [stdCode componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"-"]];
            NSLog(@"std code is %@",myArray);
            if (myArray.count==1) {
                PhoneTextField.text=[myArray objectAtIndex:0];
                StdCodeTextField.placeholder = callingCode;
            }
            else{
                StdCodeTextField.text= [myArray objectAtIndex:0];
                PhoneTextField.text=[myArray objectAtIndex:1];
            }
            
            
        }
        if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"] length]==0)
        {
            AddressTextField.placeholder = @"Address";
        }
        else
        {
            AddressTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"];
        }
        
        if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"zip"] length]==0)       // zip code
        {
            ZipCodeTextFeild.placeholder = @"Zip Code";
        }
        else
        {
            ZipCodeTextFeild.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"zip"];
        }
        if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"gender"] length]==0)
        {
            GenderTextField.placeholder = @"Gender";
        }
        else
        {
            GenderTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"gender"];
        }
        
        NSString *dobString = [NSString stringWithFormat:@"%d", [[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"dob"] integerValue]];
        if(dobString.length==0)
        {
            AgeTextField.placeholder = @"DOB";
        }
        else
        {
            AgeTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"dob"];
        }
        
        NSString *heightString = [NSString stringWithFormat:@"%@", [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"height"]];
        if(heightString.length==0)
        {
            Height2TextField.placeholder = @"Height";
            HeightTextField.placeholder =@"Select";
        }
        else
        {
            NSString *height = [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"height"];
            NSArray *myArray = [height componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
            NSLog(@"height is %@",myArray);
            
            if (myArray.count==1) {
                Height2TextField.text=[myArray objectAtIndex:0];
                HeightTextField.placeholder = @"Select";
            }
            else{
                HeightTextField.text= [myArray objectAtIndex:1];
                Height2TextField.text=[myArray objectAtIndex:0];
            }
        }
        
        NSString *WeightString = [NSString stringWithFormat:@"%@", [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"weight"]];
        if(WeightString.length==0)
        {
            Weight2TextField.placeholder = @"Weight";
            WeightTextField.placeholder = @"Select";
        }
        else
        {
            NSString *height = [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"weight"];
            NSArray *myArray = [height componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
            NSLog(@"weight is %@",myArray);
            
            if (myArray.count==1) {
                Weight2TextField.text=[myArray objectAtIndex:0];
                WeightTextField.placeholder = @"Select";
            }
            else{
                WeightTextField.text= [myArray objectAtIndex:1];
                Weight2TextField.text=[myArray objectAtIndex:0];
            }
        }
    }
    else
    {
        CreateAccountLable.text=@"Create Account";
        FirstNameTextField.placeholder = @"First Name*";
        LastNameTextField.placeholder = @"Last Name";
        emailtextField.placeholder = @"Email*";
        PassWordTextField.placeholder = @"Password*";
        ConfirmPasswordTextFeild.placeholder = @"Confirm Password*";
        StdCodeTextField.placeholder= callingCode;
        PhoneTextField.placeholder= @"Phone*";
        AddressTextField.placeholder = @"Address";
        ZipCodeTextFeild.placeholder = @"Zip Code";
        GenderTextField.placeholder = @"Gender";
        AgeTextField.placeholder = @"DOB";
        HeightTextField.placeholder = @"Select";
        Height2TextField.placeholder = @"Height";
        WeightTextField.placeholder = @"Select";
        Weight2TextField.placeholder = @"Weight";
        [LogInButton setTitle:@"Create Account" forState:UIControlStateNormal];
    }
    
}
-(void)dismissKeyboard
{
    [self.view endEditing:YES];
    
}
-(void)viewDidAppear:(BOOL)animated{
    // [FirstNameTextField becomeFirstResponder];
}
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

-(UIPickerView *)chooseHeightPicker
{
    if(chooseHeightPicker==nil)
    {
        
        chooseHeightPicker=[[UIPickerView alloc]init];
        
        chooseHeightPicker.delegate=self;
        
        chooseHeightPicker.dataSource=self;
        
        chooseHeightPicker.showsSelectionIndicator=YES;
        
        chooseHeightPicker.tag = 2;
        
    }
    return chooseHeightPicker;
}

-(UIPickerView *)chooseWeightPicker
{
    if(chooseWeightPicker==nil)
    {
        
        chooseWeightPicker=[[UIPickerView alloc]init];
        
        chooseWeightPicker.delegate=self;
        
        chooseWeightPicker.dataSource=self;
        
        chooseWeightPicker.showsSelectionIndicator=YES;
        
        chooseWeightPicker.tag = 3;
        
    }
    return chooseWeightPicker;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        return [GenderPickerViewArray count];
    }
    else if (pickerView.tag == 2){
        return [HeightPickerArray count];
    }
    else{
        return [WeightPickerArray count];
    }
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        return [GenderPickerViewArray objectAtIndex:row];
    }
    else if (pickerView.tag == 2){
        return [HeightPickerArray objectAtIndex:row];
    }
    else
    {
        return [WeightPickerArray objectAtIndex:row];
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        GenderTextField.text=[GenderPickerViewArray objectAtIndex:row];
        [GenderTextField resignFirstResponder];
    }
    else if (pickerView.tag == 2){
        HeightTextField.text=[HeightPickerArray objectAtIndex:row];
        [HeightTextField resignFirstResponder];
    }
    else
    {
        WeightTextField.text = [WeightPickerArray objectAtIndex:row];
        [WeightTextField resignFirstResponder];
    }
    
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
    [self scrollViewDidTapped];
    
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle: nil
                                                              delegate: self
                                                     cancelButtonTitle: @"Cancel"
                                                destructiveButtonTitle: nil
                                                     otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    [actionSheet1 showInView:self.view];
    
    
    NSLog(@"changeImage");
    
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
    
    path= [documentsDirectory stringByAppendingPathComponent:@"userprofile.png" ];  // IT IS THE PATH OF CHOOSEN IMAGE
    
    imageData= UIImagePNGRepresentation([info objectForKey:@"UIImagePickerControllerEditedImage"]);
    
    [imageData writeToFile:path atomically:YES];
    
    // STORING THE PATH OF IMAGE IN NSUserDefault
    
    EditChangeImage.image=[UIImage imageWithContentsOfFile:path];
    
    PicClickYes=YES;
    
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
    
    TearmScrollVeiw=[[UIScrollView alloc]initWithFrame:CGRectMake(20, 70, 280, 480)];
    TearmScrollVeiw.backgroundColor=[UIColor whiteColor];
    
    
    CrossButton=[[UIButton  alloc]initWithFrame:CGRectMake(260, 0, 20, 20)];
    [CrossButton addTarget:self action:@selector(removeTearmScrollView) forControlEvents:UIControlEventTouchUpInside];
    CrossButton.backgroundColor=[UIColor blackColor];
    [CrossButton setImage:[UIImage imageNamed:@"CrossImage.png"] forState:UIControlStateNormal];
    [TearmScrollVeiw addSubview:CrossButton];
    
    TearmTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 50, 300, 490)];
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
-(void)termbuttonMark
{
    [[soundManager shared] buttonSound];
    if(tearmButtonFlag==2)
    {
        tearmButtonFlag=1;//check_mark_on.png
        [CheckTermAndConditonButton setBackgroundImage:[UIImage imageNamed:@"check_mark_on.png"] forState:UIControlStateNormal];
    }
    else
    {
        tearmButtonFlag=2;
        [CheckTermAndConditonButton setBackgroundImage:[UIImage imageNamed:@"check_mark_off.png"] forState:UIControlStateNormal];
    }
}
-(void)SubmitButtonActionNormal
{
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
    if (([HeightTextField.text isEqualToString:@""]) && (Height2TextField.text.length>0)) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please select the height" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        [self scrollViewDidTapped];
    }
    else
        if (([WeightTextField.text isEqualToString:@""]) && (Weight2TextField.text.length>0)){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please select the weight" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            alert = nil;
            [self scrollViewDidTapped];
        }
        else
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
                        if(PassWordTextField.text.length<1  && [[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"]==false) {
                            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                            [alert show];
                            alert = nil;
                            [self scrollViewDidTapped];
                            
                        }
                        else
                            if(ConfirmPasswordTextFeild.text.length<1 && [[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"]==false)
                            {
                                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the confirm password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                [alert show];
                                alert = nil;
                                [self scrollViewDidTapped];
                            }
                            else
                            {  if (![self validateEmail:emailtextField.text])
                            {
                                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid email address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                [alert show];
                                alert = nil;
                                [self scrollViewDidTapped];
                            }
                            else
                            {
                                if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"]==true)
                                {
                                    PassWordTextField = [[UITextField alloc]init];
                                    ConfirmPasswordTextFeild = [[UITextField alloc]init];
                                    PassWordTextField.text =@"";
                                    ConfirmPasswordTextFeild.text = @"";
                                    
                                }
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
                                        if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"] == true)
                                        {
                                            NSLog(@"API HIT OF EDIT PROFILE");
                                        }
                                        else
                                        {
                                            [self ShowActivityIndicatorWithTitle:@"Loading..."];
                                            [self performSelector:@selector(serverCallForRegistration) withObject:nil afterDelay:0.1];
                                        }
                                    }
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
-(void)serverCallForRegistration
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
        NSString *phoneNumber;
        NSString *height;
        NSString *weight;
        if (StdCodeTextField.text.length>0)
        {
            phoneNumber = [[StdCodeTextField.text stringByAppendingString:@"-"]stringByAppendingString:PhoneTextField.text];
        }
        else
        {
            phoneNumber = PhoneTextField.text;
        }
        
        if (Height2TextField.text.length>0 && HeightTextField.text.length>0) {
            height = [[Height2TextField.text stringByAppendingString:@" "]stringByAppendingString:HeightTextField.text];
        }
        else
        {
            height = @"";
        }
        if (Weight2TextField.text.length>0 && WeightTextField.text.length>0) {
            weight = [[Weight2TextField.text stringByAppendingString:@" "]stringByAppendingString:WeightTextField.text];
        }
        else
        {
            weight= @"";
        }
        
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *params = @{
                                 @"firstname":FirstNameTextField.text,
                                 @"lastname":LastNameTextField.text,
                                 @"email": emailtextField.text,
                                 @"password":PassWordTextField.text,
                                 @"address":AddressTextField.text,
                                 @"zip": ZipCodeTextFeild.text,
                                 @"dob":AgeTextField.text,
                                 @"height":height,
                                 @"weight":weight,
                                 @"phone": phoneNumber,
                                 @"gender":GenderTextField.text,
                                 @"devicetoken":@"1",
                                 @"login":@"0"
                                 
                                 };
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/register_or_login_through_email",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json)
         {
            NSLog(@"JSON--->%@",json);
            if([json objectForKey:@"error"])
            {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [myAlertView show];
            }
            else
            {
                
                
                [[NSUserDefaults standardUserDefaults] setObject:json forKey:kLoginData];
                [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",[[json objectForKey:@"user_data"] objectForKey:@"id"]] forKey:kIDForLogout];
                
                NSLog(@"login data=%@",[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData]);
                
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
                
                
                [self createDataBaseFunction];
                [self InsertIntoDataBase];
                
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                CreateVerificationViewController *veri=[[CreateVerificationViewController  alloc]init];
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
-(void)serverCall{
    
    NSString *phoneNumber;
    NSString *height;
    NSString *weight;
    if (StdCodeTextField.text.length>0)
    {
        phoneNumber = [[StdCodeTextField.text stringByAppendingString:@"-"]stringByAppendingString:PhoneTextField.text];
    }
    else
    {
        phoneNumber = PhoneTextField.text;
    }
    
    if (Height2TextField.text.length>0 && HeightTextField.text.length>0) {
        height = [[Height2TextField.text stringByAppendingString:@" "]stringByAppendingString:HeightTextField.text];
    }
    else
    {
        height = @"";
    }
    if (Weight2TextField.text.length>0 && WeightTextField.text.length>0) {
        weight = [[Weight2TextField.text stringByAppendingString:@" "]stringByAppendingString:WeightTextField.text];
    }
    else
    {
        weight= @"";
    }

    
    
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@/register_or_login_through_email",kBaseUrl]];
    
    
    
    RequestForSync = [ASIFormDataRequest requestWithURL:url];
    
    
     [RequestForSync setPostValue:FirstNameTextField.text forKey:@"firstname"];
    
    
     [RequestForSync setPostValue:LastNameTextField.text forKey:@"lastname"];
    
    
     [RequestForSync setPostValue:emailtextField.text forKey:@"email"];
    
    
     [RequestForSync setPostValue:PassWordTextField.text forKey:@"password"];
    
    
     [RequestForSync setPostValue:AddressTextField.text forKey:@"address"];
    
    
    [RequestForSync setPostValue:ZipCodeTextFeild.text forKey:@"zip"];
    
    
      [RequestForSync setPostValue:AgeTextField.text forKey:@"dob"];
    
    
    
      [RequestForSync setPostValue:height forKey:@"height"];
    
    
      [RequestForSync setPostValue:weight forKey:@"weight"];
    
    
     [RequestForSync setPostValue:phoneNumber forKey:@"phone"];
    
    
     [RequestForSync setPostValue:GenderTextField.text forKey:@"gender"];
    
      [RequestForSync setPostValue:@"1" forKey:@"devicetoken"];
    
     [RequestForSync setPostValue:@"0" forKey:@"login"];
    
    
    
    
    if(PicClickYes==YES){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        path= [documentsDirectory stringByAppendingPathComponent:@"userprofile.png" ];
        
        [RequestForSync setFile:path forKey:@"userpic"];
    }
    else{
       // [RequestForSync setPostValue:@"" forKey:@"userpic"];
    }
   
    

    RequestForSync.tag = 20001;
    
    [RequestForSync setTimeOutSeconds:30];
    
    
    
    RequestForSync.delegate=self;
    
    
    
    [RequestForSync setRequestMethod:@"POST"];
    
    [RequestForSync startAsynchronous];
    
}

- (void)requestFinished:(ASIHTTPRequest *)reques

{

    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[RequestForSync responseData] options:kNilOptions error:nil];
    
    
    
    NSLog(@"json in app delegate ==>> %@",json);
    
    if([[json objectForKey:@"error"] isEqualToString:@"Email already exists!"])
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [myAlertView show];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:json forKey:kLoginData];
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",[[json objectForKey:@"user_data"] objectForKey:@"id"]] forKey:kIDForLogout];
        
        NSLog(@"login data=%@",[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData]);
        
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
        
        
      //  [self createDataBaseFunction];
       // [self InsertIntoDataBase];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        CreateVerificationViewController *veri=[[CreateVerificationViewController  alloc]init];
        [self.navigationController pushViewController:veri animated:YES];
        
    }
    
    
    [self HideActivityIndicator];
    
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

-(void) InsertIntoDataBase
{
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = dirPaths[0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"MyMedi.db"]];
    sqlite3 *MyMediDB;
    sqlite3_stmt *statement;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &MyMediDB) == SQLITE_OK)
    {
        NSString *insertStatement = [NSString stringWithFormat: @"INSERT INTO UserInformationTable(UserID, FirstName, LastName, Email, Image, Address, Zip, DOB, Height, Weight, PhoneNumber, Gender) VALUES ('%@', '%@' , '%@' , '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@' )",userId, firstName, lastName, Email, image, Address, Zip, DOB, Height, Weight, PhoneNumber, Gender ];
        NSLog(@"insertStatement=%@",insertStatement);
        const char *insert_stmt = [insertStatement UTF8String];
        sqlite3_prepare_v2(MyMediDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Insertion Successful");
        }
        else
        {
            NSLog(@"Insertion Failure: %s",sqlite3_errmsg(MyMediDB));
        }
    }
    sqlite3_close(MyMediDB);
}




-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField.tag==108 || textField.tag==109 ){
        return NO;
    }
    if(textField.tag==105)
    {
        if (textField.text.length >=11 && range.length == 0)
            return NO;
        // Only characters in the NSCharacterSet you choose will insertable.
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    if (textField.tag == 106)
    {
        if (textField.text.length >=5 && range.length == 0)
        {
            return NO;
            NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
            return [string isEqualToString:filtered];
        }
    }
    return YES;
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
    CGFloat heightofKeyboard = 230;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [CreateAcountScrollView setContentInset:insets];
    [CreateAcountScrollView setScrollIndicatorInsets:insets];
    
}
-(void)scrollViewDidTapped
{
    [ZipCodeTextFeild resignFirstResponder];
    [Height2TextField resignFirstResponder];
    [Weight2TextField resignFirstResponder];
    [StdCodeTextField resignFirstResponder];
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
    [sender resignFirstResponder];
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
-(void)dealloc
{
    
    [FirstNameTextField removeFromSuperview];
    FirstNameTextField.text=nil;
    
    [LastNameTextField removeFromSuperview];
    LastNameTextField.text=nil;
    
    [AddressTextField removeFromSuperview];
    AddressTextField.text=nil;
    
    [ZipCodeTextFeild removeFromSuperview];
    ZipCodeTextFeild.text=nil;
    
    [PhoneTextField removeFromSuperview];
    PhoneTextField.text=nil;
    
    [GenderTextField removeFromSuperview];
    GenderTextField.text=nil;
    
    [HeightTextField removeFromSuperview];
    HeightTextField.text=nil;
    
    [WeightTextField removeFromSuperview];
    WeightTextField.text=nil;
    
    [AgeTextField removeFromSuperview];
    AgeTextField.text=nil;
    
    [emailtextField removeFromSuperview];
    emailtextField.text=nil;
    
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    
    [BackButton removeFromSuperview];
    BackButton=nil;
    
    [NextViewController removeFromSuperview];
    NextViewController=nil;
    [SubmitButton removeFromSuperview];
    SubmitButton=nil;
    [CreateAccountLable removeFromSuperview];
    CreateAccountLable=nil;
    [BackGroundImageView removeFromSuperview];
    BackGroundImageView=nil;
    [CreateAccountLable removeFromSuperview];
    CreateAccountLable=nil;
    [CreateAcountScrollView removeFromSuperview];
    CreateAcountScrollView=nil;
    [dateTimePicker removeFromSuperview];
    dateTimePicker=nil;
    GenderPickerViewArray=nil;
    GenderPickerViewArray=nil;
    [CheckTermAndConditonButton removeFromSuperview];
    CheckTermAndConditonButton=nil;
    [chooseServicePicker removeFromSuperview];
    chooseServicePicker=nil;
    [paddingView removeFromSuperview];
    paddingView=nil;
    [TermAndConditionLable removeFromSuperview];
    TermAndConditionLable=nil;
    [TermClickButton removeFromSuperview];
    TermClickButton=nil;
    [TearmScrollVeiw removeFromSuperview];
    TearmScrollVeiw=nil;
    [TearmBackGroundView removeFromSuperview];
    TearmBackGroundView=nil;
    [ImageAlertView removeFromSuperview];
    ImageAlertView=nil;
    savedImagePath=nil;
    imageData=nil;
    path=nil;
    [labelRegister removeFromSuperview];
    labelRegister=nil;
    
    [HiddenBackButton removeFromSuperview];
    HiddenBackButton=nil;
    [lineView1 removeFromSuperview];
    lineView1=nil;
    [HiddenButton removeFromSuperview];
    HiddenButton=nil;
    
    [CrossButton removeFromSuperview];
    CrossButton=nil;
    [TearmTextView removeFromSuperview];
    TearmTextView=nil;
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
