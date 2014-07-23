//
//  AccountViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 02/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "AccountViewController.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.2;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.1;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 100;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


@interface AccountViewController (){
    
    
    
    UIView *TopBarView;
    
    UILabel *AccountLable;
    UIButton *BackButton;
    UIButton *EditButton;
    UIButton  *LogOutButton;
    
    UIView *CenterView;
    UIImageView *EditChangeImage;
    NSString *urlString2;
     UITapGestureRecognizer *tap;
    NSString *path;
    NSData *imageData;
    UIView *BottomAccountView;
    
    UITextField *emailTextFeild;
    UITextField *usernameTextField;
    UITextField *GenderTextField;
    UITextField *AgeTextField;
    UITextField *HeightTextField;
    UITextField *WeightTextField;
    
    UIButton *DeleteAccountButton;
    UIButton *ChangePasswordButton;
    
    UITapGestureRecognizer*tapRecognizer;
    CGFloat animatedDistance;
    NSMutableArray *GenderPickerViewArray;
    UIPickerView *chooseServicePicker;
    UIDatePicker *dateTimePicker;
    
    UILabel *firstNameLable;
    UILabel *lastNameLable;
    UILabel  *addressNameLable;
    UILabel  *PhoneNumberNameLable;
    
}

@end

@implementation AccountViewController

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    EditButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20,[UIImage imageNamed:@"editButton.png"].size.width ,[UIImage imageNamed:@"editButton.png"].size.height)];
    EditButton.backgroundColor=[UIColor clearColor];
    [EditButton setImage:[UIImage imageNamed:@"editButton.png"] forState:UIControlStateNormal];
    [EditButton addTarget:self action:@selector(EditButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:EditButton];
    
    
    AccountLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    AccountLable.text=@"Account";
    AccountLable.font=[UIFont fontWithName:helveticaRegular size:18];
    AccountLable.textColor=[UIColor blackColor];
    AccountLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:AccountLable];
    
    
    [self.view addSubview:TopBarView];
    
    
    CenterView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+10, self.view.frame.size.width,255/2)];
    CenterView.backgroundColor=[UIColor colorWithRed:211/255.0 green:214/255.0 blue:219/255.0 alpha:1.0];
    CenterView.userInteractionEnabled=TRUE;
    
    EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(20, 10, 100, 100)];
    urlString2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"image_url"];
    EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
    EditChangeImage.image=[UIImage imageNamed:@"ProfileImage.jpeg"];
    EditChangeImage.backgroundColor=[UIColor clearColor];
    EditChangeImage.layer.masksToBounds = YES;
    EditChangeImage.layer.borderWidth = 1;
    EditChangeImage.layer.borderColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    EditChangeImage.userInteractionEnabled=YES;
    [[EditChangeImage layer]setCornerRadius:50];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    [tap setNumberOfTouchesRequired:1];
    [EditChangeImage addGestureRecognizer:tap];
    [CenterView addSubview:EditChangeImage];
    
    firstNameLable=[[UILabel alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+20, 20, 120, 20)];
    firstNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"firstname"];
    firstNameLable.backgroundColor=[UIColor clearColor];
    firstNameLable.font=[UIFont fontWithName:helveticaRegular size:17];
    firstNameLable.textAlignment=NSTextAlignmentLeft;
    firstNameLable.textColor=[UIColor blackColor];
    [CenterView addSubview:firstNameLable];
    
    lastNameLable=[[UILabel alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.x+20, firstNameLable.frame.size.height+firstNameLable.frame.origin.y, 120, 20)];
    if ([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"lastname"] isEqualToString:@""]) {
        lastNameLable.text=@"---";
    }
    else{
        lastNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"lastname"];
    }
    lastNameLable.backgroundColor=[UIColor clearColor];
    lastNameLable.font=[UIFont fontWithName:helveticaRegular size:14];
    lastNameLable.textAlignment=NSTextAlignmentLeft;
    lastNameLable.textColor=[UIColor blackColor];
    [CenterView addSubview:lastNameLable];
    
    UIImageView *addressStaticImage=[[UIImageView alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.y+30, firstNameLable.frame.size.height+firstNameLable.frame.origin.y+35, [UIImage imageNamed:@"staticaddress.png"].size.width, [UIImage imageNamed:@"staticaddress.png"].size.height)];
    addressStaticImage.image=[UIImage imageNamed:@"staticaddress.png"];
    addressStaticImage.backgroundColor=[UIColor clearColor];
    [CenterView addSubview:addressStaticImage];
    
    
    addressNameLable=[[UILabel alloc]initWithFrame:CGRectMake(addressStaticImage.frame.size.width+addressStaticImage.frame.origin.x+5, firstNameLable.frame.size.height+firstNameLable.frame.origin.y+35, 120, 20)];
    if ([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"] isEqualToString:@""]) {
        addressNameLable.text=@"---";
    }
    else{
        addressNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"address"];
    }

    addressNameLable.backgroundColor=[UIColor clearColor];
    addressNameLable.font=[UIFont fontWithName:helveticaRegular size:13];
    addressNameLable.textAlignment=NSTextAlignmentLeft;
    addressNameLable.textColor=[UIColor blackColor];
    [CenterView addSubview:addressNameLable];
    
    
    UIImageView *PhoneStaticImage=[[UIImageView alloc]initWithFrame:CGRectMake(EditChangeImage.frame.size.width+EditChangeImage.frame.origin.y+30, addressNameLable.frame.size.height+addressNameLable.frame.origin.y+5, [UIImage imageNamed:@"staticelephone.png"].size.width, [UIImage imageNamed:@"staticelephone.png"].size.height)];
    PhoneStaticImage.image=[UIImage imageNamed:@"staticelephone.png"];
    PhoneStaticImage.backgroundColor=[UIColor clearColor];
    [CenterView addSubview:PhoneStaticImage];
    
    PhoneNumberNameLable=[[UILabel alloc]initWithFrame:CGRectMake(PhoneStaticImage.frame.size.width+PhoneStaticImage.frame.origin.x+5, addressNameLable.frame.size.height+addressNameLable.frame.origin.y+2, 120, 20)];
    PhoneNumberNameLable.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"phone"];
    PhoneNumberNameLable.backgroundColor=[UIColor clearColor];
    PhoneNumberNameLable.font=[UIFont fontWithName:helveticaRegular size:13];
    PhoneNumberNameLable.textAlignment=NSTextAlignmentLeft;
    PhoneNumberNameLable.textColor=[UIColor blackColor];
    [CenterView addSubview:PhoneNumberNameLable];
    
    [self.view addSubview:CenterView];
    
    
    
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    UIView *paddingView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    UIView *paddingView6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];

    
    
    emailTextFeild=[[UITextField alloc]initWithFrame:CGRectMake(0, CenterView.frame.size.height+CenterView.frame.origin.y+10, 320, 40)];
    [emailTextFeild setTextColor:[UIColor blackColor]];
    [emailTextFeild setBackgroundColor:[UIColor whiteColor]];
    emailTextFeild.userInteractionEnabled=FALSE;
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"email"] length]==0)
    {
         [emailTextFeild setPlaceholder:@"Email"];
        
    }
    else{
        emailTextFeild.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"email"];
    }
   
    [emailTextFeild setAutocorrectionType:UITextAutocorrectionTypeNo];
    [emailTextFeild setKeyboardType:UIKeyboardTypeEmailAddress];
    [emailTextFeild setReturnKeyType:UIReturnKeyNext];
    emailTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [emailTextFeild setClearButtonMode:UITextFieldViewModeWhileEditing];
    emailTextFeild.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [emailTextFeild setFont:[UIFont fontWithName:helveticaThin size:16]];
    [emailTextFeild setDelegate:self];
    emailTextFeild.leftView = paddingView;
    emailTextFeild.keyboardType=UIKeyboardTypeEmailAddress;
    emailTextFeild.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:emailTextFeild];
    
//    UILabel *email=[[UILabel alloc]initWithFrame:CGRectMake(20, 3, 80, 40) ];
//    email.text=@"EMAIL";
//    email.backgroundColor=[UIColor clearColor];
//    email.textAlignment=NSTextAlignmentRight;
//    email.font = [UIFont fontWithName:helveticaThin size:16];
//    email.textAlignment=NSTextAlignmentLeft;
//    email.textColor=[UIColor grayColor];
//    [emailTextFeild addSubview:email];
    
//    usernameTextField=[[UITextField alloc]initWithFrame:CGRectMake(0, emailTextFeild.frame.size.height+emailTextFeild.frame.origin.y+3, 320, 40)];
//    [usernameTextField setTextColor:[UIColor blackColor]];
//    [usernameTextField setBackgroundColor:[UIColor whiteColor]];
//    [usernameTextField setPlaceholder:@"Username"];
//    [usernameTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
//    [usernameTextField setKeyboardType:UIKeyboardTypeEmailAddress];
//    [usernameTextField setReturnKeyType:UIReturnKeyNext];
//    usernameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [usernameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
//    usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    [usernameTextField setFont:[UIFont fontWithName:helveticaThin size:16]];
//    [usernameTextField setDelegate:self];
//    usernameTextField.leftView = paddingView2;
//    usernameTextField.keyboardType=UIKeyboardTypeAlphabet;
//    usernameTextField.leftViewMode=UITextFieldViewModeAlways;
//    [self.view addSubview:usernameTextField];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               target:nil
                                               action:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    doneButton.width = 60;
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    
    
    GenderTextField=[[UITextField alloc]initWithFrame:CGRectMake(0, emailTextFeild.frame.size.height+emailTextFeild.frame.origin.y+3, 320/2, 40)];
    [GenderTextField setTextColor:[UIColor blackColor]];
    [GenderTextField setBackgroundColor:[UIColor whiteColor]];
    GenderTextField.userInteractionEnabled=FALSE;
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"gender"] length]==0)
    {
        [GenderTextField setPlaceholder:@"Gender"];
        
    }
    else{
        GenderTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"gender"];
    }
    
     GenderTextField.tag=108;
    [GenderTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [GenderTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [GenderTextField setReturnKeyType:UIReturnKeySearch];
    GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [GenderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    GenderTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [GenderTextField setFont:[UIFont fontWithName:helveticaThin size:16]];
    [GenderTextField setDelegate:self];
    GenderTextField.leftView = paddingView3;
    GenderTextField.inputView=self.chooseServicePicker;
    [GenderTextField setInputAccessoryView:toolbar];
    GenderTextField.keyboardType=UIKeyboardTypeAlphabet;
    GenderTextField.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:GenderTextField];
    
    
    dateTimePicker=[[UIDatePicker alloc]init];
    [dateTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
    dateTimePicker.datePickerMode = UIDatePickerModeDate;
    [dateTimePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
    
    
    AgeTextField=[[UITextField alloc]initWithFrame:CGRectMake(GenderTextField.frame.size.width+GenderTextField.frame.origin.x+3, emailTextFeild.frame.size.height+emailTextFeild.frame.origin.y+3, 320/2, 40)];
    [AgeTextField setTextColor:[UIColor blackColor]];
    [AgeTextField setBackgroundColor:[UIColor whiteColor]];
      AgeTextField.userInteractionEnabled=FALSE;
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"dob"] length]==0)
    {
        [AgeTextField setPlaceholder:@"Age"];
        
    }
    else{
        AgeTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"dob"];
    }
    [AgeTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [AgeTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [AgeTextField setInputView:dateTimePicker];
    [AgeTextField setInputAccessoryView:toolbar];
    AgeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AgeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    AgeTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [AgeTextField setFont:[UIFont fontWithName:helveticaThin size:16]];
    [AgeTextField setDelegate:self];
    AgeTextField.leftView = paddingView4;
    AgeTextField.keyboardType=UIKeyboardTypeAlphabet;
    AgeTextField.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:AgeTextField];
    
    HeightTextField=[[UITextField alloc]initWithFrame:CGRectMake(0, AgeTextField.frame.size.height+AgeTextField.frame.origin.y+3, 320/2, 40)];
    [HeightTextField setTextColor:[UIColor blackColor]];
    [HeightTextField setBackgroundColor:[UIColor whiteColor]];
    HeightTextField.userInteractionEnabled=FALSE;
    
    NSString *HeightString = [NSString stringWithFormat:@"%@", [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"height"]];
    NSLog(@"HeightString is %@",HeightString);
   // NSLog(@"HeightString lenfth is %d",HeightString.length);

    
    if(HeightString.length==0)
    {
          [HeightTextField setPlaceholder:@"Height"];
        
    }
    else{
        HeightTextField.text=HeightString;
    }
    [HeightTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [HeightTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [HeightTextField setReturnKeyType:UIReturnKeyNext];
    HeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [HeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    HeightTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [HeightTextField setFont:[UIFont fontWithName:helveticaThin size:16]];
    [HeightTextField setDelegate:self];
    HeightTextField.leftView = paddingView5;
    HeightTextField.keyboardType=UIKeyboardTypeAlphabet;
    HeightTextField.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:HeightTextField];
    
    
    WeightTextField=[[UITextField alloc]initWithFrame:CGRectMake(HeightTextField.frame.size.width+HeightTextField.frame.origin.x+3, AgeTextField.frame.size.height+AgeTextField.frame.origin.y+3, 320/2, 40)];
    [WeightTextField setTextColor:[UIColor blackColor]];
    [WeightTextField setBackgroundColor:[UIColor whiteColor]];
   WeightTextField.userInteractionEnabled=FALSE;
     NSString *WeightString = [NSString stringWithFormat:@"%@", [[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"weight"]];
    
   if(WeightString.length ==0)
    {
        [WeightTextField setPlaceholder:@"Weight"];
        
    }
    else{
        WeightTextField.text=WeightString;
    }
    [WeightTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [WeightTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [WeightTextField setReturnKeyType:UIReturnKeyDone];
    WeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [WeightTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    WeightTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [WeightTextField setFont:[UIFont fontWithName:helveticaThin size:16]];
    [WeightTextField setDelegate:self];
    WeightTextField.leftView = paddingView6;
    WeightTextField.keyboardType=UIKeyboardTypeAlphabet;
    WeightTextField.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:WeightTextField];


    BottomAccountView=[[UIView alloc]initWithFrame:CGRectMake(0, CenterView.frame.size.height+CenterView.frame.origin.y+297, self.view.frame.size.width,65)];
    BottomAccountView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    BottomAccountView.userInteractionEnabled=TRUE;
    
    
    DeleteAccountButton=[[UIButton alloc]initWithFrame:CGRectMake(12, 10, 290/2, 45)];
    DeleteAccountButton.backgroundColor=[UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1.0];
    [DeleteAccountButton addTarget:self action:@selector(DeleteButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [DeleteAccountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [DeleteAccountButton setTitle:@"Delete Account" forState:UIControlStateNormal];
    DeleteAccountButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    [DeleteAccountButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [DeleteAccountButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    DeleteAccountButton.clipsToBounds = YES;
    DeleteAccountButton.layer.cornerRadius = 5;
    [BottomAccountView addSubview:DeleteAccountButton];
    
    ChangePasswordButton=[UIButton buttonWithType:UIButtonTypeCustom];
    ChangePasswordButton.frame=CGRectMake(DeleteAccountButton.frame.size.width+DeleteAccountButton.frame.origin.x+5, 10, 290/2, 45);
    ChangePasswordButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
    [ChangePasswordButton setTitle:@"Change Password" forState:UIControlStateNormal];
    [ChangePasswordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ChangePasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [ChangePasswordButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    ChangePasswordButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    ChangePasswordButton.clipsToBounds = YES;
    ChangePasswordButton.layer.cornerRadius=5;
    [ChangePasswordButton addTarget:self action:@selector(ChangePasswordButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomAccountView addSubview:ChangePasswordButton];

    
    
    
    
    [self.view addSubview:BottomAccountView];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];

  GenderPickerViewArray=[[NSMutableArray alloc]initWithObjects:@"Male",@"Female", nil];
}
-(void)EditButtonAction{
    
      [EditButton setImage:[UIImage imageNamed:@"editButton.png"] forState:UIControlStateNormal];
  //  emailTextFeild.userInteractionEnabled=TRUE;
    //GenderTextField.userInteractionEnabled=TRUE;
    //AgeTextField.userInteractionEnabled=TRUE;
      //HeightTextField.userInteractionEnabled=TRUE;
     //WeightTextField.userInteractionEnabled=TRUE;
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditProfileButtonPressed"];
    
    CreateAccountViewController *create = [[CreateAccountViewController alloc]init];
    [self.navigationController pushViewController:create animated:NO];
}
-(void)DeleteButtonAction{
    
}
-(void)ChangePasswordButtonAction{
    
}
-(void)changeImage:(UITapGestureRecognizer*)recognizer
{
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle: nil delegate: self cancelButtonTitle: @"Cancel" destructiveButtonTitle: nil otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    [actionSheet1 showInView:self.view];
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
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)BackButtonAction{
    [[soundManager shared]buttonSound];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- slide Keyboard up

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =[[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown)
        
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    CGRect viewFrame = self.view.frame;
    NSLog(@"animated=%f",animatedDistance);
    NSLog(@"y=%f",viewFrame.origin.y);
    viewFrame.origin.y -= animatedDistance;
    NSLog(@"y=%f",viewFrame.origin.y);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
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

-(void)dealloc{
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    [BackButton removeFromSuperview];
    BackButton=nil;
    [LogOutButton removeFromSuperview];
    LogOutButton=nil;
   
}
-(void)scrollViewDidTapped{
    
    [emailTextFeild resignFirstResponder];
}
-(void)dismissKeyboard
{
    [self.view endEditing:YES];
    
}
-(void)NextKeyKeyboard{
    [AgeTextField becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == emailTextFeild)
    {
        [usernameTextField becomeFirstResponder];
        return NO;
    }
        if (textField == usernameTextField)
        {
            [GenderTextField becomeFirstResponder];
            return NO;
        }
    
    if (textField == HeightTextField)
    {
        [WeightTextField becomeFirstResponder];
        return NO;
    }
    else
    {
        [textField resignFirstResponder];
        
    }
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField.tag==108 || textField.tag==109 ){
        return NO;
    }
    if(textField.tag==105 ||textField.tag==110 ||textField.tag==111){
        if (textField.text.length >=10 && range.length == 0)
            return NO;
        // Only characters in the NSCharacterSet you choose will insertable.
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    return YES;
}
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
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
-(void)HeightKeyKeyboard{
    [HeightTextField becomeFirstResponder];
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
