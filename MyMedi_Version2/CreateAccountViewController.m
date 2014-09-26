//
//  CreateAccountViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 09/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController ()
{
    
    BOOL PicClickYes;
    AsyncImageView *EditChangeImage;
    NSString *urlString2;
    
    UITextField*FirstNameTextField;
    UITextField*LastNameTextField;
    UITextField *PhoneTextField;
    UITextField *StdCodeTextField;
    
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton  *NextViewController;
    
    UIButton *SubmitButton;
    UIButton *AccountButton;
    
    UILabel *CreateAccountLable;
    UIImageView *BackGroundImageView;
    
    UIScrollView *CreateAcountScrollView;
    UIView *CenterView;
    UITextField* EmailtextField;
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
    UIButton *CreateAccountButton;
    
    UIButton *HiddenButton;
    UIButton *CrossButton;
    UITextView *TearmTextView;
    
    UITapGestureRecognizer*tapRecognizer;
    UITapGestureRecognizer *tap;
    
    NSString *callingCode;
    NSString *PhoneNumber;
  
    
    ASIFormDataRequest *RequestForSync;

    
    UIImageView *BackgroundImageView;
    UIView *TopLineView;
    
    UIView *FirstNameLineView;
    UILabel *FirstNameAnimation;
    
    UIView *LastNameLineView;
    UILabel *LastNameAnimation;
    
    UIView *EmailNameLineView;
    UILabel *EmailNameAnimation;
    
    UIView *PasswordLineView;
    UILabel *PasswordNameAnimation;
    
    UIView *ComfirPasswordLineView;
    UILabel *ComfirPasswordNameAnimation;
    
    UIView *PhoneLineView;
    UILabel *PhoneNameAnimation;
    UIView *PhoneSepLineView;
    
    UIView *AddressLineView;
    UILabel *AddressAnimation;
    
    UIView *ZipCodeLineView;
    UILabel *ZipCodeAnimation;
    
    UIView *GenderLineView;
    UILabel *GenderAnimation;
    
    UIView *AgeLineView;
    UILabel *AgeAnimation;
    
    UIView *HightLineView;
    UILabel *HightAnimation;
    
    UIView *HightSepLineView;
    UIView *WeightSepLineView;
    
    UIView *WeightLineView;
    UILabel *WeightAnimation;
    
    NSMutableArray *HightMutableArray;
    NSMutableArray *WightMutableArray;
    UIPickerView *chooseHightPickerView;
    
    UIToolbar *toolbar;
    UIBarButtonItem *doneButton;
    
}

@end

@implementation CreateAccountViewController
int Pickerflag=0;
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
    
    callingCode = [dictCodes objectForKey:isdCode];
    NSLog(@"callingCode Code is %@",callingCode);
    
    [BackgroundImageView removeFromSuperview];
    BackgroundImageView=nil;
    BackgroundImageView=[[UIImageView alloc]init];
    [self.view addSubview:BackgroundImageView];

    
    
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,64)];
    TopBarView.backgroundColor=[UIColor clearColor];
    TopBarView.userInteractionEnabled=TRUE;

    [BackButton removeFromSuperview];
    BackButton=nil;
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(0,15,[UIImage imageNamed:@"back_Button_image.png"].size.width, [UIImage imageNamed:@"back_Button_image.png"].size.height);
    [BackButton setBackgroundImage:[UIImage imageNamed:@"back_Button_image.png"] forState:UIControlStateNormal];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton addTarget:self action:@selector(BackVeiwController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    [CreateAccountLable removeFromSuperview];
    CreateAccountLable=nil;
    CreateAccountLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 23, 150, 30)];
    CreateAccountLable.font=[UIFont fontWithName:helveticaRegular size:20];
    CreateAccountLable.textColor=[UIColor whiteColor];
    CreateAccountLable.textAlignment=NSTextAlignmentCenter;
    CreateAccountLable.text=@"Create Account";
    [TopBarView addSubview:CreateAccountLable];
    [self.view addSubview:TopBarView];
    
    [TopLineView removeFromSuperview];
    TopLineView=nil;
    TopLineView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, self.view.frame.size.width, 1)];
    TopLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    TopLineView.layer.borderWidth = 0.5f;
    TopLineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:TopLineView];
    
    GenderPickerViewArray=[[NSMutableArray alloc]initWithObjects:@"Select Gender",@"Male",@"Female", nil];
    tearmButtonFlag=2;
 
    [CreateAcountScrollView removeFromSuperview];
    CreateAcountScrollView=nil;
    CreateAcountScrollView=[[UIScrollView alloc]init];
    CreateAcountScrollView.backgroundColor=[UIColor clearColor];
    CreateAcountScrollView.showsVerticalScrollIndicator=NO;
    CreateAcountScrollView.userInteractionEnabled=true;
    
    [EditChangeImage removeFromSuperview];
    EditChangeImage=nil;
    EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(110, 10, 100, 100)];
    NSString *abc=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"image"];
    if(abc.length<1)
    {
        EditChangeImage.image=[UIImage imageNamed:@"Headshot-Placeholder.png"];
    }
    else
    {
        urlString2 = [[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] valueForKey:@"image"];
        EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
    }
    EditChangeImage.backgroundColor=[UIColor whiteColor];
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
    [CreateAcountScrollView addSubview:EditChangeImage];
    [self.view addSubview:CreateAcountScrollView];
    
    [FirstNameTextField removeFromSuperview];
    FirstNameTextField=nil;
    FirstNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, EditChangeImage.frame.size.height+EditChangeImage.frame.origin.y+30, [UIImage imageNamed:@"mymediloginbutton.png"].size.width-80, 45)];
    FirstNameTextField.delegate = self;
    FirstNameTextField.tag=100;
    FirstNameTextField.backgroundColor=[UIColor clearColor];
    FirstNameTextField.textColor=[UIColor whiteColor];
    FirstNameTextField.textAlignment=NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    FirstNameTextField.leftView = paddingView;
    FirstNameTextField.font=[UIFont fontWithName:@"MuseoSans-300" size:17];
    FirstNameTextField.leftViewMode = UITextFieldViewModeAlways;
    FirstNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    FirstNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    FirstNameTextField.autocapitalizationType = NO;
    FirstNameTextField.returnKeyType = UIReturnKeyNext;
    [FirstNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:FirstNameTextField];
    
    [FirstNameAnimation removeFromSuperview];
    FirstNameAnimation=nil;
    FirstNameAnimation=[[UILabel alloc]initWithFrame:CGRectMake(35, EditChangeImage.frame.size.height+EditChangeImage.frame.origin.y+35, 90, 30)];
    FirstNameAnimation.text=@"First Name";
    FirstNameAnimation.textAlignment=NSTextAlignmentLeft;
    FirstNameAnimation.textColor=[UIColor whiteColor];
    FirstNameAnimation.backgroundColor=[UIColor clearColor];
    [FirstNameAnimation setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    [CreateAcountScrollView addSubview:FirstNameAnimation];
    
    [FirstNameLineView removeFromSuperview];
    FirstNameLineView=nil;
    FirstNameLineView=[[UIView alloc]initWithFrame:CGRectMake(25, FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+5, 1)];
    FirstNameLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    FirstNameLineView.layer.borderWidth = 0.5f;
    FirstNameLineView.backgroundColor = [UIColor whiteColor];
    [CreateAcountScrollView addSubview:FirstNameLineView];
    
    [LastNameTextField removeFromSuperview];
    LastNameTextField=nil;
    LastNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y+20, [UIImage imageNamed:@"mymediloginbutton.png"].size.width-80, 45)];
    LastNameTextField.delegate=self;
    LastNameTextField.tag=101;
    LastNameTextField.backgroundColor=[UIColor clearColor];
    LastNameTextField.textColor=[UIColor whiteColor];
    LastNameTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    LastNameTextField.leftView = paddingView;
    LastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    LastNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    LastNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    LastNameTextField.font=[UIFont fontWithName:@"MuseoSans-300" size:17];
    LastNameTextField.autocapitalizationType = NO;
    LastNameTextField.returnKeyType = UIReturnKeyNext;
    [LastNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:LastNameTextField];
    
    [LastNameAnimation removeFromSuperview];
    LastNameAnimation=nil;
    LastNameAnimation=[[UILabel alloc]initWithFrame:CGRectMake(35, FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y+25, 85, 30)];
    LastNameAnimation.text=@"Last Name";
    LastNameAnimation.textAlignment=NSTextAlignmentLeft;
    LastNameAnimation.textColor=[UIColor whiteColor];
    LastNameAnimation.backgroundColor=[UIColor clearColor];
    [LastNameAnimation setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    [CreateAcountScrollView addSubview:LastNameAnimation];
    
    [LastNameLineView removeFromSuperview];
    LastNameLineView=nil;
    LastNameLineView=[[UIView alloc]initWithFrame:CGRectMake(25, LastNameTextField.frame.size.height+LastNameTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+5, 1)];
    LastNameLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    LastNameLineView.layer.borderWidth = 0.5f;
    LastNameLineView.backgroundColor = [UIColor whiteColor];
    [CreateAcountScrollView addSubview:LastNameLineView];
    
    [EmailtextField removeFromSuperview];
    EmailtextField=nil;
    EmailtextField = [[UITextField alloc] initWithFrame:CGRectMake(25, LastNameTextField.frame.size.height+LastNameTextField.frame.origin.y+20, [UIImage imageNamed:@"mymediloginbutton.png"].size.width-80, 45)];
    EmailtextField.delegate = self;
    EmailtextField.tag=102;
    EmailtextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    EmailtextField.leftView = paddingView;
    EmailtextField.leftViewMode = UITextFieldViewModeAlways;
    EmailtextField.textColor=[UIColor whiteColor];
    EmailtextField.keyboardType = UIKeyboardTypeEmailAddress;
    EmailtextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    EmailtextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    EmailtextField.font=[UIFont fontWithName:@"MuseoSans-300" size:17];
    EmailtextField.backgroundColor=[UIColor clearColor];
    EmailtextField.autocapitalizationType = NO;
    EmailtextField.returnKeyType = UIReturnKeyNext;
    [EmailtextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:EmailtextField];

    [EmailNameLineView removeFromSuperview];
    EmailNameLineView=nil;
    EmailNameLineView=[[UIView alloc]initWithFrame:CGRectMake(25, EmailtextField.frame.size.height+EmailtextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+5, 1)];
    EmailNameLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    EmailNameLineView.layer.borderWidth = 0.5f;
    EmailNameLineView.backgroundColor = [UIColor whiteColor];
    [CreateAcountScrollView addSubview:EmailNameLineView];
    
    [EmailNameAnimation removeFromSuperview];
    EmailNameAnimation=nil;
    EmailNameAnimation=[[UILabel alloc]initWithFrame:CGRectMake(35, LastNameTextField.frame.size.height+LastNameTextField.frame.origin.y+25, 85, 30)];
    EmailNameAnimation.text=@"Email";
    EmailNameAnimation.textAlignment=NSTextAlignmentLeft;
    EmailNameAnimation.textColor=[UIColor whiteColor];
    EmailNameAnimation.backgroundColor=[UIColor clearColor];
    [EmailNameAnimation setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    [CreateAcountScrollView addSubview:EmailNameAnimation];
    
    [PassWordTextField removeFromSuperview];
    PassWordTextField=nil;
    PassWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, EmailtextField.frame.size.height+EmailtextField.frame.origin.y+20, [UIImage imageNamed:@"mymediloginbutton.png"].size.width-80,45)];
    PassWordTextField.delegate = self;
    PassWordTextField.tag=103;
    PassWordTextField.textColor=[UIColor whiteColor];
    PassWordTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    PassWordTextField.leftView = paddingView;
    PassWordTextField.leftViewMode = UITextFieldViewModeAlways;
    PassWordTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    PassWordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
   [PassWordTextField setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    PassWordTextField.secureTextEntry=TRUE;
    PassWordTextField.backgroundColor=[UIColor clearColor];
    PassWordTextField.returnKeyType=UIReturnKeyNext;
    PassWordTextField.autocapitalizationType = NO;
    [PassWordTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:PassWordTextField];
    
    [PasswordLineView removeFromSuperview];
    PasswordLineView=nil;
    PasswordLineView=[[UIView alloc]initWithFrame:CGRectMake(25, PassWordTextField.frame.size.height+PassWordTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+5, 1)];
    PasswordLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    PasswordLineView.layer.borderWidth = 0.5f;
    PasswordLineView.backgroundColor = [UIColor whiteColor];
    [CreateAcountScrollView addSubview:PasswordLineView];
    
    [PasswordNameAnimation removeFromSuperview];
    PasswordNameAnimation=nil;
    PasswordNameAnimation=[[UILabel alloc]initWithFrame:CGRectMake(35, EmailtextField.frame.size.height+EmailtextField.frame.origin.y+25, 85, 30)];
    PasswordNameAnimation.text=@"Password";
    PasswordNameAnimation.textAlignment=NSTextAlignmentLeft;
    PasswordNameAnimation.textColor=[UIColor whiteColor];
    PasswordNameAnimation.backgroundColor=[UIColor clearColor];
    [PasswordNameAnimation setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    [CreateAcountScrollView addSubview:PasswordNameAnimation];
   
    
    [ConfirmPasswordTextFeild removeFromSuperview];
    ConfirmPasswordTextFeild=nil;
    ConfirmPasswordTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(25,PassWordTextField.frame.size.height+PassWordTextField.frame.origin.y+20, [UIImage imageNamed:@"mymediloginbutton.png"].size.width-130,45)];
    ConfirmPasswordTextFeild.delegate = self;
    ConfirmPasswordTextFeild.tag=104;
    ConfirmPasswordTextFeild.textColor=[UIColor whiteColor];
    ConfirmPasswordTextFeild.backgroundColor=[UIColor clearColor];
    ConfirmPasswordTextFeild.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    ConfirmPasswordTextFeild.leftView = paddingView;
    ConfirmPasswordTextFeild.leftViewMode = UITextFieldViewModeAlways;
    ConfirmPasswordTextFeild.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    ConfirmPasswordTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [ConfirmPasswordTextFeild setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    ConfirmPasswordTextFeild.autocapitalizationType = NO;
    ConfirmPasswordTextFeild.secureTextEntry=TRUE;
    ConfirmPasswordTextFeild.returnKeyType=UIReturnKeyNext;
    [ConfirmPasswordTextFeild addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [CreateAcountScrollView addSubview:ConfirmPasswordTextFeild];

    
    [ComfirPasswordLineView removeFromSuperview];
    ComfirPasswordLineView=nil;
    ComfirPasswordLineView=[[UIView alloc]initWithFrame:CGRectMake(25, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+5, 1)];
    ComfirPasswordLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    ComfirPasswordLineView.layer.borderWidth = 0.5f;
    ComfirPasswordLineView.backgroundColor = [UIColor whiteColor];
    [CreateAcountScrollView addSubview:ComfirPasswordLineView];
    
    [ComfirPasswordNameAnimation removeFromSuperview];
    ComfirPasswordNameAnimation=nil;
    ComfirPasswordNameAnimation=[[UILabel alloc]initWithFrame:CGRectMake(35, PassWordTextField.frame.size.height+PassWordTextField.frame.origin.y+25, 150, 30)];
    ComfirPasswordNameAnimation.text=@"Confirm Password";
    ComfirPasswordNameAnimation.textAlignment=NSTextAlignmentLeft;
    ComfirPasswordNameAnimation.textColor=[UIColor whiteColor];
    ComfirPasswordNameAnimation.backgroundColor=[UIColor clearColor];
    [ComfirPasswordNameAnimation setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    [CreateAcountScrollView addSubview:ComfirPasswordNameAnimation];
    

    [toolbar removeFromSuperview];
    toolbar=nil;
    toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];

   
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                       target:nil
                                                       action:nil];
    toolbar.translucent=NO;
    toolbar.barTintColor=[UIColor colorWithRed:186.00/255 green:186.00/255 blue:186.00/255 alpha:1.0];
    
    doneButton=nil;
    doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Next" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    doneButton.width = 50;
    doneButton.tintColor = [UIColor whiteColor];
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    
    [StdCodeTextField removeFromSuperview];
    StdCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+20, 70, 45)];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    StdCodeTextField.leftView = paddingView;
    StdCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    StdCodeTextField.tag=105;
    StdCodeTextField.textColor=[UIColor whiteColor];
    [StdCodeTextField setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    StdCodeTextField.backgroundColor=[UIColor clearColor];
    StdCodeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    StdCodeTextField.keyboardType = UIKeyboardTypePhonePad;
    StdCodeTextField.returnKeyType = UIReturnKeyNext;
    StdCodeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    StdCodeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    StdCodeTextField.delegate = self;
    StdCodeTextField.leftView = paddingView;
    StdCodeTextField.autocapitalizationType = NO;
    [StdCodeTextField setInputAccessoryView:toolbar];
    
    [PhoneSepLineView removeFromSuperview];
    PhoneSepLineView=nil;
    PhoneSepLineView=[[UIView alloc]initWithFrame:CGRectMake(StdCodeTextField.frame.size.width+StdCodeTextField.frame.origin.x, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+13, 1, 40)];
    PhoneSepLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    PhoneSepLineView.layer.borderWidth = 0.5f;
    PhoneSepLineView.backgroundColor = [UIColor clearColor];
    [CreateAcountScrollView addSubview:PhoneSepLineView];
    
    
    [CreateAcountScrollView addSubview:StdCodeTextField];
    [PhoneTextField removeFromSuperview];
    
    PhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(StdCodeTextField.frame.size.width+StdCodeTextField.frame.origin.x+10, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+20, 140, 45)];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    PhoneTextField.leftView = paddingView;
    PhoneTextField.leftViewMode = UITextFieldViewModeAlways;
    PhoneTextField.tag=106;
    PhoneTextField.textColor=[UIColor whiteColor];
    [PhoneTextField setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
    PhoneTextField.backgroundColor=[UIColor clearColor];
    PhoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    PhoneTextField.keyboardType = UIKeyboardTypePhonePad;
    PhoneTextField.returnKeyType = UIReturnKeyNext;
    PhoneTextField.placeholder=@"Phone";
    [PhoneTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    PhoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    PhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    PhoneTextField.delegate = self;
   [PhoneTextField setInputAccessoryView:toolbar];
    PhoneTextField.leftView = paddingView;
    PhoneTextField.autocapitalizationType = NO;
    [CreateAcountScrollView addSubview:PhoneTextField];

    
    [PhoneLineView removeFromSuperview];
    PhoneLineView=nil;
    PhoneLineView=[[UIView alloc]initWithFrame:CGRectMake(25, PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+5, 1)];
    PhoneLineView.layer.borderColor = [UIColor whiteColor].CGColor;;
    PhoneLineView.layer.borderWidth = 0.5f;
    PhoneLineView.backgroundColor = [UIColor whiteColor];
    [CreateAcountScrollView addSubview:PhoneLineView];
    
//    [PhoneNameAnimation removeFromSuperview];
//    PhoneNameAnimation=nil;
//    PhoneNameAnimation=[[UILabel alloc]initWithFrame:CGRectMake(StdCodeTextField.frame.size.width+StdCodeTextField.frame.origin.x+20, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+25, 85, 30)];
//    PhoneNameAnimation.text=@"Phone";
//    PhoneNameAnimation.textAlignment=NSTextAlignmentLeft;
//    PhoneNameAnimation.textColor=[UIColor whiteColor];
//    PhoneNameAnimation.backgroundColor=[UIColor clearColor];
//    [PhoneNameAnimation setFont:[UIFont fontWithName:@"MuseoSans-300" size:17]];
//    [CreateAcountScrollView addSubview:PhoneNameAnimation];
    

    [labelRegister removeFromSuperview];
    labelRegister = [[NMCustomLabel alloc]initWithFrame:CGRectMake(25, PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y+20, 260, 45)];
    labelRegister.backgroundColor = [UIColor clearColor];
    labelRegister.numberOfLines=3;
    labelRegister.textAlignment = NSTextAlignmentLeft;
    [labelRegister setDefaultStyle:[NMCustomLabelStyle styleWithFont:[UIFont fontWithName:@"MuseoSans-300" size:11] color:[UIColor whiteColor]]];
    [labelRegister setStyle:[NMCustomLabelStyle styleWithFont:[UIFont fontWithName:@"MuseoSans-500" size:13] color:[UIColor whiteColor]] forKey:@"style"];
    labelRegister.text = [NSString stringWithFormat:@"By checking creating the account, You are agreeing to the<span class='style'> TERMS AND CONDITIONS.</span>"];
    [CreateAcountScrollView addSubview:labelRegister];
    
    
    [TermClickButton removeFromSuperview];
    TermClickButton=[[UIButton alloc]initWithFrame:CGRectMake(5, PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y+42, 180, 20)];
    [TermClickButton addTarget:self action:@selector(TermConditonAction)forControlEvents:UIControlEventTouchUpInside];
    TermClickButton.backgroundColor=[UIColor clearColor];
    [CreateAcountScrollView addSubview:TermClickButton];
    
    
    [HiddenButton removeFromSuperview];
    HiddenButton=[[UIButton alloc]initWithFrame:CGRectMake(235, PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y+10, 50, 50)];
    HiddenButton.backgroundColor=[UIColor clearColor];
    [HiddenButton addTarget:self action:@selector(termbuttonMark) forControlEvents:UIControlEventTouchUpInside];
    [CreateAcountScrollView addSubview:HiddenButton];
    
    [CheckTermAndConditonButton removeFromSuperview];
    CheckTermAndConditonButton=[[UIButton alloc]initWithFrame:CGRectMake(250,PhoneTextField.frame.size.height+PhoneTextField.frame.origin.y+35, [UIImage imageNamed:@"check_mark_on.png"].size.width, [UIImage imageNamed:@"check_mark_on.png"].size.height)];
    [CheckTermAndConditonButton setBackgroundImage:[UIImage imageNamed:@"check_mark_off.png"] forState:UIControlStateNormal];
    CheckTermAndConditonButton.backgroundColor=[UIColor clearColor];
    [CheckTermAndConditonButton addTarget:self action:@selector(termbuttonMark) forControlEvents:UIControlEventTouchUpInside];
    [CreateAcountScrollView addSubview:CheckTermAndConditonButton];
    
    
    [lineView1 removeFromSuperview];
    lineView1=[[UIView alloc]initWithFrame:CGRectMake(60,labelRegister.frame.origin.y+labelRegister.frame.size.height-15,155,1)];
    lineView1.layer.borderColor = [UIColor whiteColor].CGColor;
    lineView1.backgroundColor=[UIColor clearColor];
    lineView1.layer.borderWidth = 1.0f;
    [CreateAcountScrollView addSubview:lineView1];
    
    
    [CreateAccountButton removeFromSuperview];
    CreateAccountButton=nil;
    CreateAccountButton=[[UIButton alloc]init];
    CreateAccountButton.frame = CGRectMake(25, labelRegister.frame.size.height+labelRegister.frame.origin.y+10, [UIImage imageNamed:@"createaccount.png"].size.width, [UIImage imageNamed:@"createaccount.png"].size.height);
   // [CreateAccountButton addTarget:self action:@selector(SubmitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [CreateAccountButton setBackgroundImage:[UIImage imageNamed:@"createaccount.png"] forState:UIControlStateNormal];
    CreateAccountButton.clipsToBounds = YES;
    CreateAccountButton.layer.cornerRadius = 5;
    [CreateAcountScrollView addSubview:CreateAccountButton];
    
 
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            BackgroundImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone5.png"].size.height);
            BackgroundImageView.image=[UIImage imageNamed:@"MainBackGround_iphone5.png"];
            CreateAcountScrollView.frame = CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+1, 320,510);
             CreateAcountScrollView.contentSize=CGSizeMake(300, 650);
            
        }
        else
        {
            BackgroundImageView.frame = CGRectMake(0, 0, 320, [UIImage imageNamed:@"MainBackGround_iphone4.png"].size.height);
            BackgroundImageView.image=[UIImage imageNamed:@"MainBackGround_iphone4.png"];
            CreateAcountScrollView.frame = CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+1, 320,415);
             CreateAcountScrollView.contentSize=CGSizeMake(300, 650);
            
        }
    }
    
   

    
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)HightButtonAction
{
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField.tag==100)
    {
        if(FirstNameTextField.text.length==0)
        {
            [UIView animateWithDuration:.3f animations:^{
                FirstNameAnimation.frame=CGRectMake(200, EditChangeImage.frame.size.height+EditChangeImage.frame.origin.y+35, 90, 30);
                FirstNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                FirstNameAnimation.textColor=[UIColor lightGrayColor];
            }];
        }
    }
    if(textField.tag==101){
        
        if(LastNameTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                LastNameAnimation.frame=CGRectMake(200, FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y+25, 85, 30);
                LastNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                LastNameAnimation.textColor=[UIColor lightGrayColor];
            }];
        }
    }
    if(textField.tag==102){
        
        if(EmailtextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                EmailNameAnimation.frame=CGRectMake(200, LastNameTextField.frame.size.height+LastNameTextField.frame.origin.y+25, 85, 30);
                EmailNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                EmailNameAnimation.textColor=[UIColor lightGrayColor];
            }];
        }
    }
    
    if(textField.tag==103){
        
        if(PassWordTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                PasswordNameAnimation.frame=CGRectMake(200, EmailtextField.frame.size.height+EmailtextField.frame.origin.y+25, 85, 30);
                PasswordNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                PasswordNameAnimation.textColor=[UIColor lightGrayColor];
            }];
        }
    }
    if(textField.tag==104){
        
        if(ConfirmPasswordTextFeild.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                ComfirPasswordNameAnimation.frame=CGRectMake(150, PassWordTextField.frame.size.height+PassWordTextField.frame.origin.y+25, 150, 30);
                ComfirPasswordNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                ComfirPasswordNameAnimation.textColor=[UIColor lightGrayColor];
            }];
        }
    }
    
    if(textField.tag==106){
        
        if(PhoneTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                PhoneNameAnimation.frame=CGRectMake(200, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+25, 150, 30);
                PhoneNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                PhoneNameAnimation.textColor=[UIColor lightGrayColor];
            }];
        }
    }
   
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if(textField.tag==100){
        if(FirstNameTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                FirstNameAnimation.frame=CGRectMake(35, EditChangeImage.frame.size.height+EditChangeImage.frame.origin.y+35, 100, 30);
                FirstNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                FirstNameAnimation.textColor=[UIColor whiteColor];
            }];
        }
    }
    if(textField.tag==101){
        
        if(LastNameTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                LastNameAnimation.frame=CGRectMake(35,FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y+25, 85, 30);
                LastNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                LastNameAnimation.textColor=[UIColor whiteColor];
            }];
        }
    }
    if(textField.tag==102){
        
        if(EmailtextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                EmailNameAnimation.frame=CGRectMake(35, LastNameTextField.frame.size.height+LastNameTextField.frame.origin.y+25, 85, 30);
                EmailNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                EmailNameAnimation.textColor=[UIColor whiteColor];
            }];
        }
    }
    if(textField.tag==103){
        
        if(PassWordTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                PasswordNameAnimation.frame=CGRectMake(35, EmailtextField.frame.size.height+EmailtextField.frame.origin.y+25, 85, 30);
                PasswordNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                PasswordNameAnimation.textColor=[UIColor whiteColor];
            }];
        }
    }
    if(textField.tag==104){
        
        if(ConfirmPasswordTextFeild.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                ComfirPasswordNameAnimation.frame=CGRectMake(35, PassWordTextField.frame.size.height+PassWordTextField.frame.origin.y+25, 150, 30);
                ComfirPasswordNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                ComfirPasswordNameAnimation.textColor=[UIColor whiteColor];
            }];
        }
    }
    if(textField.tag==106){
        
        if(PhoneTextField.text.length==0){
            [UIView animateWithDuration:.3f animations:^{
                PhoneNameAnimation.frame=CGRectMake(StdCodeTextField.frame.size.width+StdCodeTextField.frame.origin.x+20, ConfirmPasswordTextFeild.frame.size.height+ConfirmPasswordTextFeild.frame.origin.y+25, 150, 30);
                PhoneNameAnimation.textColor=[UIColor lightGrayColor];
            } completion:^(BOOL finished) {
                PhoneNameAnimation.textColor=[UIColor whiteColor];
            }];
        }
    }

}

-(void)BackVeiwController
{
   
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
    
    [RequestForSync cancel];
    [RequestForSync clearDelegatesAndCancel];
}

#pragma mark Next View Controller
-(void)nextviewController{
    
    
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
    
}
-(void)viewDidAppear:(BOOL)animated{
    // [FirstNameTextField becomeFirstResponder];
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 1)
    {
        return [GenderPickerViewArray count];
    }
    else
    if (pickerView.tag == 2)
    {
        if(component==0)
        {
            return 1;
        }
        else
        {
            return [HightMutableArray count];
        }
    }
    else{
        
        if(component==0)
        {
            return 2;
        }
        else
        {
            return [WightMutableArray count];
        }
        
    }
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(pickerView.tag==1)
    {
    return 1;
    }
    else
    {
        return 2;
    }
    
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 1)
    {
        return [GenderPickerViewArray objectAtIndex:row];
    }
    else
    if (pickerView.tag == 2)
    {
        if(component==0)
        {
            return [HeightPickerArray objectAtIndex:row];
        }
        else
        {
            return [HightMutableArray objectAtIndex:row];
        }
    }
    else
    {
        if(component==0)
        {
            return [WeightPickerArray objectAtIndex:row];
        }
        else
        {
            return [WightMutableArray objectAtIndex:row];
        }
    }
    
}
-(void)cancel
{
    
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
-(void)TermConditonAction{
    
    [self scrollViewDidTapped];
    [TearmBackGroundView removeFromSuperview];
    TearmBackGroundView=nil;
    TearmBackGroundView=[[UIView alloc]init];
    
    
    
    TearmBackGroundView.backgroundColor=[UIColor blackColor];
    TearmBackGroundView.alpha=0.5;
    [self.view addSubview:TearmBackGroundView];
    
    [TearmScrollVeiw removeFromSuperview];
    TearmScrollVeiw=nil;
    TearmScrollVeiw=[[UIScrollView alloc]init];
    TearmScrollVeiw.backgroundColor=[UIColor whiteColor];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            
            TearmBackGroundView.frame = CGRectMake(0, 0, self.view.frame.size.width, 500);
            TearmScrollVeiw.frame = CGRectMake(20, 70, 280, 480);
            
        }
        else
        {
            TearmBackGroundView.frame = CGRectMake(0, 0, self.view.frame.size.width, 480);
            TearmScrollVeiw.frame = CGRectMake(20, 70, 280, 400);
        }
    }
    
    
    [CrossButton removeFromSuperview];
    CrossButton=nil;
    CrossButton=[[UIButton  alloc]initWithFrame:CGRectMake(260, 0, 20, 20)];
    [CrossButton addTarget:self action:@selector(removeTearmScrollView) forControlEvents:UIControlEventTouchUpInside];
    CrossButton.backgroundColor=[UIColor blackColor];
    [CrossButton setImage:[UIImage imageNamed:@"CrossImage.png"] forState:UIControlStateNormal];
    [TearmScrollVeiw addSubview:CrossButton];
    
    [TearmTextView removeFromSuperview];
    TearmTextView=nil;
    TearmTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 50, 300, 490)];
    TearmTextView.backgroundColor=[UIColor clearColor];
    TearmTextView.text=@"asdflk haklsdfh klasdfsl kjasdflk jaslk;djf lkasdflkjasdlkf jlaskdjf lkasjdflk jasdlkfj lkasdjfl kasjdlfkj aslk asdfjl kasjdf salkdjf lksajdfl kjsadlkfj lkasjdflk jsadlkfj lksajdfk jsadlkfj lkdsajf lkjdsaflk jsdaklfj lkadsjf lkjsdalfkj lsakdjflkasdjflkjdslkfjdsalkfjlksadjflkj sadfj lsadjf jasdlfj lsadjfl";
    [TearmTextView setFont:[UIFont boldSystemFontOfSize:10]];
    [TearmScrollVeiw addSubview:TearmTextView];
    [self.view addSubview:TearmScrollVeiw];
    [self attachPopUpAnimationToView:TearmScrollVeiw];
}
-(void)removeTearmScrollView{

    [TearmBackGroundView removeFromSuperview];
    [TearmScrollVeiw removeFromSuperview];
}
-(void)termbuttonMark
{
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
    [self scrollViewDidTapped];
            if(FirstNameTextField.text.length < 1)
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the first name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                alert = nil;
                [self scrollViewDidTapped];
            }
            else
                if(EmailtextField.text.length < 1)
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
                        if(PassWordTextField.text.length<1  && [[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"]==false)
                        {
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
                            {  if (![self validateEmail:EmailtextField.text])
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
                                            [self ShowActivityIndicatorWithTitle:@"Loading..."];
                                            [self performSelector:@selector(EditserverCall) withObject:nil afterDelay:0.1];
                                            
                                        }
                                        else
                                        {
                                            [self ShowActivityIndicatorWithTitle:@"Loading..."];
                                            [self performSelector:@selector(serverCall) withObject:nil afterDelay:0.1];
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

-(void)serverCall
{

    if (StdCodeTextField.text.length>0)
    {
        PhoneNumber = [[StdCodeTextField.text stringByAppendingString:@"-"]stringByAppendingString:PhoneTextField.text];
    }
    else
    {
        PhoneNumber = PhoneTextField.text;
    }
    
    RequestForSync = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/register_or_login_through_email",kBaseUrl]]];
    RequestForSync.tag = 20001;
    [RequestForSync setTimeOutSeconds:30];
    RequestForSync.delegate=self;
    [RequestForSync setRequestMethod:@"POST"];
    [RequestForSync setPostValue:FirstNameTextField.text forKey:@"firstname"];
    [RequestForSync setPostValue:LastNameTextField.text forKey:@"lastname"];
    [RequestForSync setPostValue:EmailtextField.text forKey:@"email"];
    [RequestForSync setPostValue:PassWordTextField.text forKey:@"password"];
    [RequestForSync setPostValue:PhoneNumber forKey:@"phone"];
    [RequestForSync setPostValue:@"1" forKey:@"devicetoken"];
    [RequestForSync setPostValue:@"0" forKey:@"login"];
    
    if(PicClickYes==YES)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        path= [documentsDirectory stringByAppendingPathComponent:@"userprofile.png" ];
        
        [RequestForSync setFile:path forKey:@"userpic"];
        [RequestForSync setPostValue:@"1" forKey:@"imagetype"];
    }
    else
    {
        [RequestForSync setPostValue:@"0" forKey:@"imagetype"];
    }
   
    [RequestForSync startAsynchronous];
    
}
#pragma mark ASIFORMDATA REQUEST DELEGATE
- (void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"starteeeddd with tag %d",request.tag);
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"%@",error);
    
}
- (void)requestFinished:(ASIHTTPRequest *)reques
{
    if(reques.tag==20001)
    {
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[RequestForSync responseData] options:kNilOptions error:nil];
    NSLog(@"json in app delegate ==>> %@",json);
    
    if([json objectForKey:@"error"])
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [myAlertView show];
    }
        
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:json forKey:kLoginData];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"kLoginData=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kLoginData]);
        
        CreateVerificationViewController *veri=[[CreateVerificationViewController  alloc]init];
        [self.navigationController pushViewController:veri animated:YES];
        
    }
    
}
    
    [self HideActivityIndicator];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1112)
    {
        NSArray *viewContrlls=[[self navigationController] viewControllers];
        for( int i=0;i<[ viewContrlls count];i++)
        {
            id obj=[viewContrlls objectAtIndex:i];
           // if([obj isKindOfClass:[AccountViewController class]])
           // {
                
            //    [[self navigationController] popToViewController:obj animated:YES];
           //     return;
          //  }
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditProfileButtonPressed"] == true)
    {
        if ([textField canResignFirstResponder])
        {
            [textField resignFirstResponder];
        }
    }
    
    else {
        
    if (textField == FirstNameTextField)
    {
        [LastNameTextField becomeFirstResponder];
        return NO;
    }
    
    else
        if (textField == LastNameTextField)
        {
            [EmailtextField becomeFirstResponder];
            return NO;
        }
    
        else
            if (textField == EmailtextField)
                
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
                            {
                                        [textField resignFirstResponder];
                                    }
        
    }
    return YES;
}

-(void)keyboardWillShow
{
    // Animate the current view out of the way
    CGFloat heightofKeyboard = 260;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [CreateAcountScrollView setContentInset:insets];
    [CreateAcountScrollView setScrollIndicatorInsets:insets];
    
}
-(void)scrollViewDidTapped
{
    [chooseHightPickerView removeFromSuperview];
  
    [StdCodeTextField resignFirstResponder];
    [EmailtextField resignFirstResponder];
    [PassWordTextField resignFirstResponder];
    [ConfirmPasswordTextFeild resignFirstResponder];
    [FirstNameTextField resignFirstResponder];
    [LastNameTextField resignFirstResponder];
    [PhoneTextField resignFirstResponder];
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
    
    
    [EmailtextField removeFromSuperview];
    EmailtextField.text=nil;
    
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
