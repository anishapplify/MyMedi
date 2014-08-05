//

//  EmergencyViewController.m

//  MyMediApp

//

//  Created by Applify Tech on 18/06/14.

//  Copyright (c) 2014 Applify. All rights reserved.

//



#import "EmergencyViewController.h"



@interface EmergencyViewController ()

{
    
    UIView *TopBarView;
    
    UIButton *EdiButton;
    
    UIButton *DoneButton;
    
    UIScrollView *EmergencyScrollView;
    
    UITextField *EmergencyContactTextField;
    
    UITextField *BloodGroupTextField;
    
    UITextField *DonorNameTextField;
    
    UITextField *DonorAddressTextField;
    
    UITextView *AllergiesTextView;
    
    UITextView *CriticalProblemTextView;
    
    UIButton *Backbutton;
    
    NSMutableArray *BloodGropPickerViewArray;
    
    UIPickerView *chooseServicePicker;
    
    
    
    UILabel *EmergencyLable;
    
    UITapGestureRecognizer*tapRecognizer;
    
    UIBarButtonItem *doneButton;
    
}



@end



@implementation EmergencyViewController



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
    
    
    
    EdiButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20, [UIImage imageNamed:@"editButton.png"].size.width ,[UIImage imageNamed:@"editButton.png"].size.height)];
    
    EdiButton.backgroundColor=[UIColor clearColor];
    
    [EdiButton setImage:[UIImage imageNamed:@"editButton.png"] forState:UIControlStateNormal];
    
    [EdiButton addTarget:self action:@selector(EditEmergencyDetails) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:EdiButton];
    
    
    
    
    
    Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    Backbutton.frame = CGRectMake(5,20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height);
    
    Backbutton.backgroundColor=[UIColor clearColor];
    
    [Backbutton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    
    [Backbutton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:Backbutton];
    
    
    
    
    
    
    
    EmergencyLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    
    EmergencyLable.text=@"Emergency";
    
    EmergencyLable.font=[UIFont fontWithName:helveticaRegular size:18];
    
    EmergencyLable.textColor=[UIColor blackColor];
    
    EmergencyLable.textAlignment=NSTextAlignmentCenter;
    
    [TopBarView addSubview:EmergencyLable];
    
    
    
    
    
    [self.view addSubview:TopBarView];
    
    
    
    EmergencyScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+30, self.view.frame.size.width,360)];
    
    EmergencyScrollView.backgroundColor=[UIColor clearColor];
    
    EmergencyScrollView.showsHorizontalScrollIndicator=TRUE;
    
    EmergencyScrollView.contentSize=CGSizeMake(320, 410);
    
    EmergencyScrollView.showsVerticalScrollIndicator=NO;
    
    //EmergencyScrollView.scrollEnabled=FALSE;
    
    
    
    
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 50)];
    
    
    
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];
    
    toolbar.barStyle = UIBarStyleBlackOpaque;
    
    
    
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                               
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               
                                               target:nil
                                               
                                               action:nil];
    
    
    
    doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    
    doneButton.width = 50;
    
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    
    
    
    EmergencyContactTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    EmergencyContactTextField.delegate = self;
    
    EmergencyContactTextField.textColor=[UIColor blackColor];
    
    EmergencyContactTextField.tag = 1201;
    
    EmergencyContactTextField.textAlignment = NSTextAlignmentLeft;
    
    EmergencyContactTextField.leftViewMode = UITextFieldViewModeAlways;
    
    EmergencyContactTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    EmergencyContactTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [EmergencyContactTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    EmergencyContactTextField.autocapitalizationType = NO;
    
    [EmergencyContactTextField setInputAccessoryView:toolbar];
    
    EmergencyContactTextField.returnKeyType=UIReturnKeyNext;
    
    EmergencyContactTextField.backgroundColor=[UIColor whiteColor];
    
    EmergencyContactTextField.delegate = self;
    
    EmergencyContactTextField.leftView = paddingView;
    
    EmergencyContactTextField.leftViewMode = UITextFieldViewModeAlways;
    
    EmergencyContactTextField.keyboardType=UIKeyboardTypePhonePad;
    EmergencyContactTextField.userInteractionEnabled = false;
    
    [EmergencyScrollView addSubview:EmergencyContactTextField];
    
    
    
    UILabel *EmergencyContactLable=[[UILabel alloc]initWithFrame:CGRectMake(10, -5, 120, 50) ];
    
    EmergencyContactLable.text=@"Contact Number";
    
    EmergencyContactLable.textAlignment=NSTextAlignmentLeft;
    
    EmergencyContactLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    EmergencyContactLable.textColor=[UIColor blackColor];
    
    [EmergencyContactTextField addSubview:EmergencyContactLable];
    
    
    
    
    
    BloodGroupTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, EmergencyContactTextField.frame.size.height+EmergencyContactTextField.frame.origin.y+3, 320, 40)];
    
    BloodGroupTextField.delegate = self;
    
    BloodGroupTextField.tag=101;
    
    BloodGroupTextField.textColor=[UIColor blackColor];
    
    BloodGroupTextField.textAlignment = NSTextAlignmentLeft;
    
    BloodGroupTextField.leftView = paddingView1;
    
    BloodGroupTextField.leftViewMode = UITextFieldViewModeAlways;
    
    BloodGroupTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    BloodGroupTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [BloodGroupTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    BloodGroupTextField.autocapitalizationType = NO;
    
    BloodGroupTextField.returnKeyType=UIReturnKeyNext;
    
    BloodGroupTextField.inputView=self.chooseServicePicker;
    
    BloodGroupTextField.backgroundColor=[UIColor whiteColor];
    
    [BloodGroupTextField setInputAccessoryView:toolbar];
    
    BloodGroupTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    
    BloodGroupTextField.userInteractionEnabled = false;
    
    [EmergencyScrollView addSubview:BloodGroupTextField];
    
    
    
    
    
    UILabel *BloodGroupLable=[[UILabel alloc]initWithFrame:CGRectMake(10, -5, 80, 50) ];
    
    BloodGroupLable.text=@"Blood Group";
    
    BloodGroupLable.textAlignment=NSTextAlignmentLeft;
    
    BloodGroupLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    BloodGroupLable.textColor=[UIColor blackColor];
    
    [BloodGroupTextField addSubview:BloodGroupLable];
    
    
    
    
    
    DonorNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, BloodGroupTextField.frame.size.height+BloodGroupTextField.frame.origin.y+3, 320, 40)];
    
    DonorNameTextField.delegate = self;
    
    DonorNameTextField.textColor=[UIColor blackColor];
    
    DonorNameTextField.textAlignment = NSTextAlignmentLeft;
    
    DonorNameTextField.leftView = paddingView2;
    
    DonorNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    DonorNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    DonorNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [DonorNameTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    DonorNameTextField.autocapitalizationType = NO;
    
    DonorNameTextField.returnKeyType=UIReturnKeyNext;
    
    DonorNameTextField.backgroundColor=[UIColor whiteColor];
    
    DonorNameTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    
     DonorNameTextField.userInteractionEnabled = false;
    
    [EmergencyScrollView addSubview:DonorNameTextField];
    
    
    
    UILabel *DonorNameLable=[[UILabel alloc]initWithFrame:CGRectMake(10, -5, 100, 50) ];
    
    DonorNameLable.text=@"Contact Name";
    
    DonorNameLable.textAlignment=NSTextAlignmentLeft;
    
    DonorNameLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    DonorNameLable.textColor=[UIColor blackColor];
    
    [DonorNameTextField addSubview:DonorNameLable];
    
    
    
    
    
    DonorAddressTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, DonorNameTextField.frame.size.height+DonorNameTextField.frame.origin.y+3, 320, 40)];
    
    DonorAddressTextField.delegate = self;
    
    DonorAddressTextField.textColor=[UIColor blackColor];
    
    DonorAddressTextField.textAlignment = NSTextAlignmentLeft;
    
    DonorAddressTextField.leftView = paddingView3;
    
    DonorAddressTextField.leftViewMode = UITextFieldViewModeAlways;
    
    DonorAddressTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    DonorAddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [DonorAddressTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    DonorAddressTextField.autocapitalizationType = NO;
    
    DonorAddressTextField.returnKeyType=UIReturnKeyNext;
    
    DonorAddressTextField.backgroundColor=[UIColor whiteColor];
    
    DonorAddressTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    
    DonorAddressTextField.userInteractionEnabled = false;
    
    [EmergencyScrollView addSubview:DonorAddressTextField];
    
    
    
    UILabel *DonorAddressLable=[[UILabel alloc]initWithFrame:CGRectMake(10, -5, 100, 50) ];
    
    DonorAddressLable.text=@"Contact Address";
    
    DonorAddressLable.textAlignment=NSTextAlignmentLeft;
    
    DonorAddressLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    DonorAddressLable.textColor=[UIColor blackColor];
    
    [DonorAddressTextField addSubview:DonorAddressLable];
    
    
    
    
    
    
    
    AllergiesTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, DonorAddressTextField.frame.size.height+DonorAddressTextField.frame.origin.y+3, 320, 100)];
    
    AllergiesTextView.backgroundColor=[UIColor whiteColor];
    
    AllergiesTextView.tag=100;
    
    AllergiesTextView.delegate = self;
    
    [AllergiesTextView setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    AllergiesTextView.textColor = [UIColor lightGrayColor];
    
    AllergiesTextView.userInteractionEnabled = false;
    
    AllergiesTextView.returnKeyType=UIReturnKeyDone;
    
    [EmergencyScrollView addSubview:AllergiesTextView];
    
    
    [self.view addSubview:EmergencyScrollView];
    
    
    
    CriticalProblemTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, AllergiesTextView.frame.size.height+AllergiesTextView.frame.origin.y+3, 320, 100)];
    
    CriticalProblemTextView.backgroundColor=[UIColor whiteColor];
    
    CriticalProblemTextView.delegate = self;
    
    [CriticalProblemTextView setFont:[UIFont fontWithName:helveticaRegular size:15]];
    
    CriticalProblemTextView.textColor = [UIColor lightGrayColor];
    
    CriticalProblemTextView.userInteractionEnabled = false;
    
     CriticalProblemTextView.returnKeyType=UIReturnKeyDone;
    
    [EmergencyScrollView addSubview:CriticalProblemTextView];
    
    [self.view addSubview:EmergencyScrollView];
    
    
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"contact"] length]==0)
        
    {
        
        EmergencyContactTextField.placeholder = @"Emergency Contact";
        
    }
    
    else
        
    {
        
        EmergencyContactTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"contact"];
        
    }
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"bloodgroup"] length]==0)
        
    {
        
        BloodGroupTextField.placeholder = @"Blood Group";
        
        
        
    }
    
    else
        
    {
        
        BloodGroupTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"bloodgroup"];
        
    }
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"donarname"] length]==0)
        
    {
        
        DonorNameTextField.placeholder = @"Donor Name";
        
        
        
    }
    
    else
        
    {
        
        DonorNameTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"donarname"];
        
    }
    
    
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"donaraddress"] length]==0)
        
    {
        
        DonorAddressTextField.placeholder = @"Donor Address";
        
        
        
    }
    
    else
        
    {
        
        DonorAddressTextField.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"donaraddress"];
        
    }
    
    
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"allergies"] length]==0)
        
    {
        
        AllergiesTextView.text = @"Allergies";
        
        
        
    }
    
    else
        
    {
        
        AllergiesTextView.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"allergies"];
        AllergiesTextView.textColor=[UIColor blackColor];
    }
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"criticalproblem"] length]==0)
        
    {
        
        CriticalProblemTextView.text = @"Critical Problems";
        
        
        
    }
    
    else
        
    {
        
        CriticalProblemTextView.text=[[[NSUserDefaults standardUserDefaults] objectForKey:kEmergencyDetails] valueForKey:@"criticalproblem"];
        CriticalProblemTextView.textColor=[UIColor blackColor];
    }
    
    
    
    BloodGropPickerViewArray=[[NSMutableArray alloc]initWithObjects:@"A+ve",@"A-ve",@"B+ve",@"B-ve",@"AB+ve",@"AB-ve",@"O+ve",@"O-ve", nil];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    
    
    
    
    
    UIView *BottomAccountView=[[UIView alloc]initWithFrame:CGRectMake(0, 470, self.view.frame.size.width,100)];
    
    BottomAccountView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    BottomAccountView.userInteractionEnabled=TRUE;
    
    
    
    UIImageView *tapIconImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 17, [UIImage imageNamed:@"tapicone.png"].size.width, [UIImage imageNamed:@"tapicone.png"].size.height)];
    
    tapIconImageView.image=[UIImage imageNamed:@"tapicone.png"];
    
    [BottomAccountView  addSubview:tapIconImageView];
    
    
    
    
    
    UILabel *tapLable=[[UILabel alloc]initWithFrame:CGRectMake(tapIconImageView.frame.size.width+tapIconImageView.frame.origin.x+5, 0, 270, 50)];
    
    tapLable.backgroundColor=[UIColor clearColor];
    
    tapLable.textAlignment=NSTextAlignmentLeft;
    
    tapLable.textColor=[UIColor blackColor];
    
    tapLable.text=@"Taping the power button three times will send your emergency\ncontact a default emergency message on your behalf.";
    
    tapLable.numberOfLines=2;
    
    tapLable.font=[UIFont fontWithName:helveticaRegular size:9];
    
    [BottomAccountView addSubview:tapLable];
    
    
    
    DoneButton=[[UIButton alloc]initWithFrame:CGRectMake(35, 50, 250, 40)];
    
    DoneButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
    
    [DoneButton addTarget:self action:@selector(DoneButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [DoneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [DoneButton setTitle:@"Done" forState:UIControlStateNormal];
    
    DoneButton.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    
    [DoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    
    [DoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    DoneButton.clipsToBounds = YES;
    
    DoneButton.layer.cornerRadius = 5;
    
    [BottomAccountView addSubview:DoneButton];
    
    
    
    DoneButton.hidden=YES;
    
    
    
    [self.view addSubview:BottomAccountView];
    
    
    
    
    
    
    
}

-(void)DoneButtonAction
{
    
    NSLog(@"AllergiesTextVie===%@",AllergiesTextView.text);
     NSLog(@"CriticalProblemTextView==%@",CriticalProblemTextView.text);
        if (EmergencyContactTextField.text.length>0 || BloodGroupTextField.text.length>0 || DonorNameTextField.text.length>0 || DonorAddressTextField.text.length>0 || ![AllergiesTextView.text isEqualToString:@"Allergies"] || ![CriticalProblemTextView.text isEqualToString:@"Critical Problems"] )
        {
            [self ShowActivityIndicatorWithTitle:@"Loading..."];
            [self performSelector:@selector(serverCallForEmergencyDetails) withObject:nil afterDelay:0.1];
        }
   }

-(void)dismissKeyboard

{
    
    [self.view endEditing:YES];
    
    
    
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
    
    return [BloodGropPickerViewArray count];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 1;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
    return [BloodGropPickerViewArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component

{
    
    BloodGroupTextField.text=[BloodGropPickerViewArray objectAtIndex:row];
    
    [BloodGroupTextField resignFirstResponder];
    
}

-(void)cancel{
    
    
    
}

- (void)onBloodGroupSelection

{
    
    NSInteger row = [chooseServicePicker selectedRowInComponent:0];
    
    BloodGroupTextField.text=[BloodGropPickerViewArray objectAtIndex:row];
    
    [BloodGroupTextField resignFirstResponder];
    
}

-(void)EditEmergencyDetails
{
    
    [EdiButton setImage:[UIImage imageNamed:@"edit_button_selected.png"] forState:UIControlStateNormal];
    
    DoneButton.hidden=NO;
    
    EmergencyContactTextField.userInteractionEnabled=YES;
    
    BloodGroupTextField.userInteractionEnabled=YES;
    
    DonorNameTextField.userInteractionEnabled=YES;
    
    DonorAddressTextField.userInteractionEnabled=YES;
    
    AllergiesTextView.userInteractionEnabled=YES;
    
    CriticalProblemTextView.userInteractionEnabled=YES;
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        
        [AllergiesTextView resignFirstResponder];
        [CriticalProblemTextView resignFirstResponder];
        
        return NO; // or true, whetever you's like
        
    }
    
    return YES;
    

    
}


-(void)BackButtonAction{
    
    [self scrollViewDidTapped];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
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
    
    
    
    CGFloat heightofKeyboard = 250;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [EmergencyScrollView  setContentInset:insets];
    
    [EmergencyScrollView setScrollIndicatorInsets:insets];
    
    
    
}

-(void)keyboardWillHide

{
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [EmergencyScrollView setContentInset:insets];
    
    [EmergencyScrollView setScrollIndicatorInsets:insets];
    
    
    
}

-(void)scrollViewDidTapped

{
    
    [EmergencyContactTextField resignFirstResponder];
    
    [BloodGroupTextField resignFirstResponder];
    
    [DonorNameTextField resignFirstResponder];
    
    [CriticalProblemTextView resignFirstResponder];
    
    [AllergiesTextView resignFirstResponder];
    
    [DonorAddressTextField resignFirstResponder];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView

{
    
    EmergencyScrollView.contentOffset = CGPointMake(0, textView.frame.origin.y);
    
    if(textView.tag==100)
        
    {
        
        if ([textView.text isEqualToString:@"Allergies"]) {
            
            textView.text = @"";
            
            textView.textColor = [UIColor blackColor]; //optional
            
        }
        
    }
    
    else{
        
        if ([textView.text isEqualToString:@"Critical Problems"]) {
            
            textView.text = @"";
            
            textView.textColor = [UIColor blackColor]; //optional
            
        }}
    
    [textView becomeFirstResponder];
    
}



- (void)textViewDidEndEditing:(UITextView *)textView

{
    
    if(textView.tag==100){
        
        if ([textView.text isEqualToString:@""]) {
            
            textView.text = @"Allergies";
            
            textView.textColor = [UIColor lightGrayColor]; //optional
            
        }
        
    }
    
    else{
        
        if ([textView.text isEqualToString:@""]) {
            
            textView.text = @"Critical Problems";
            
            textView.textColor = [UIColor lightGrayColor]; //optional
            
        }
        
        
        
    }
    
    
    
    [textView resignFirstResponder];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    
    if(textField.tag==101 ){
        
        return NO;
        
    }
    
    if ((textField.tag==100) || (textField.tag == 1201))
        
    {
        
        if (textField.text.length >=11 && range.length == 0)
            
            return NO;
        
        // Only characters in the NSCharacterSet you choose will insertable.
        
        NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
        
    }
    
    return YES;
    
}

-(void)dealloc{
    
    
    
    TopBarView=nil;
    
    [TopBarView removeFromSuperview];
    
}

-(void)serverCallForEmergencyDetails

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
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *params = @{
                                 
                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] valueForKey:@"accesstoken"],
                                 
                                 @"contact":EmergencyContactTextField.text,
                                 
                                 @"bloodgroup": BloodGroupTextField.text,
                                 
                                 @"donarname":DonorNameTextField.text,
                                 
                                 @"donaraddress":DonorAddressTextField.text,
                                 
                                 @"allergies": AllergiesTextView.text,
                                 
                                 @"criticalproblem":CriticalProblemTextView.text,
                                 
                                 
                                 };
        
        NSLog(@"Parameter=>%@",params);
        
        
        
        [manager POST:[NSString stringWithFormat:@"%@/create_or_edit_user_emergency",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            
            NSLog(@"EmergencyDetails jSON--->%@",json);
            
            if([json objectForKey:@"error"])
                
            {
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [myAlertView show];
                
            }
            
            else
                
            {
                
                [[NSUserDefaults standardUserDefaults] setObject:json forKey:kEmergencyDetails];
                
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                NSLog(@"kEmergencyDetails=%@",[[NSUserDefaults standardUserDefaults]objectForKey:kEmergencyDetails]);
                
    
                
            }
            
            [self HideActivityIndicator];
            
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Successfully updated your emergency contact." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            myAlertView.tag = 111;
            
            [myAlertView show];

            
            
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 111)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
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