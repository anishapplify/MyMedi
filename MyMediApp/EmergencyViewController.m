//
//  EmergencyViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 18/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "EmergencyViewController.h"

@interface EmergencyViewController (){
  
    
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
   UIView *paddingView;
      UIImageView *BackGroundImageView;
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
    self.view.backgroundColor=[UIColor colorWithRed:224/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
    
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    
//    UIButton *LoginButtonHidden=[[UIButton alloc]initWithFrame:CGRectMake(260, 35, 50, 50)];
//    LoginButtonHidden.backgroundColor=[UIColor clearColor];
//    [LoginButtonHidden addTarget:self action:@selector(EditEmergencyDetails)
//                forControlEvents:UIControlEventTouchUpInside];
//    [TopBarView addSubview:LoginButtonHidden];
    
    
    
    EdiButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 35, 50, 25)];
    EdiButton.backgroundColor=[UIColor clearColor];
    [EdiButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [EdiButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [EdiButton setTitle:@"Edit" forState:UIControlStateNormal];
    EdiButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [EdiButton addTarget:self action:@selector(EditEmergencyDetails) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:EdiButton];
    
    UIImage * backImg = [UIImage imageNamed:@"back_mymediNew.png"];
    NSLog(@"backImg=%f",backImg.size.width);
    
    Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Backbutton.frame = CGRectMake(5,35,backImg.size.width, backImg.size.height);
    [Backbutton setImage:backImg forState:UIControlStateNormal];
    [Backbutton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:Backbutton];
    [self.view addSubview:TopBarView];

    UIImage *BackGroundImage=[UIImage imageNamed:@"Back_pattern.png"];
    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, BackGroundImage.size.width, BackGroundImage.size.height)];
    BackGroundImageView.backgroundColor=[UIColor clearColor];
    BackGroundImageView.image=BackGroundImage;
    BackGroundImageView.userInteractionEnabled=TRUE;
    
    [self setMaskTo:BackGroundImageView byRoundingCorners:UIRectCornerTopLeft];
    
    
    UILabel *EmergencyLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 130, 40)];
    EmergencyLable.text=@"Emergency";
    EmergencyLable.textColor=[UIColor grayColor];
    EmergencyLable.textAlignment=NSTextAlignmentCenter;
    EmergencyLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
    [BackGroundImageView addSubview:EmergencyLable];
    
    UIView*lineView=[[UIView alloc]initWithFrame:CGRectMake(3,EmergencyLable.frame.origin.y+45,300,1)];
    lineView.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    lineView.layer.borderWidth = 1.0f;
    [BackGroundImageView addSubview:lineView];
    
    
    EmergencyScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, lineView.frame.size.height+lineView.frame.origin.y+10, BackGroundImageView.frame.size.width,BackGroundImageView.frame.size.height)];
    EmergencyScrollView.backgroundColor=[UIColor clearColor];
    EmergencyScrollView.showsHorizontalScrollIndicator=TRUE;
    EmergencyScrollView.contentSize=CGSizeMake(BackGroundImageView.frame.size.width, 500);
    
    EmergencyContactTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 10, 286, 35)];
    EmergencyContactTextField.delegate = self;
    EmergencyContactTextField.tag=100;
    EmergencyContactTextField.placeholder = @"Emergency Contact";
    EmergencyContactTextField.enabled=NO;
    [EmergencyContactTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    EmergencyContactTextField.textColor=[UIColor blackColor];
    EmergencyContactTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    EmergencyContactTextField.leftView = paddingView;
    EmergencyContactTextField.leftViewMode = UITextFieldViewModeAlways;
    EmergencyContactTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    EmergencyContactTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [EmergencyContactTextField setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    EmergencyContactTextField.autocapitalizationType = NO;
    EmergencyContactTextField.returnKeyType=UIReturnKeyNext;
    EmergencyContactTextField.keyboardType=UIKeyboardTypeNumberPad;
    //[EmergencyContactTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [EmergencyScrollView addSubview:EmergencyContactTextField];

    BloodGroupTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, EmergencyContactTextField.frame.size.height+EmergencyContactTextField.frame.origin.y+10, 286, 35)];
    BloodGroupTextField.delegate = self;
    BloodGroupTextField.tag=101;
    BloodGroupTextField.enabled=NO;
    BloodGroupTextField.placeholder = @"Blood Group";
    [BloodGroupTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    BloodGroupTextField.textColor=[UIColor blackColor];
    BloodGroupTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    BloodGroupTextField.leftView = paddingView;
    BloodGroupTextField.leftViewMode = UITextFieldViewModeAlways;
    BloodGroupTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    BloodGroupTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [BloodGroupTextField setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    BloodGroupTextField.autocapitalizationType = NO;
    BloodGroupTextField.returnKeyType=UIReturnKeyNext;
    BloodGroupTextField.inputView=self.chooseServicePicker;
    
  //  BloodGroupTextField.inputAccessoryView=self.accessoryView;
    BloodGroupTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    //[EmergencyContactTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [EmergencyScrollView addSubview:BloodGroupTextField];
   
    
    
    DonorNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, BloodGroupTextField.frame.size.height+BloodGroupTextField.frame.origin.y+10, 286, 35)];
    DonorNameTextField.delegate = self;
       DonorNameTextField.enabled=NO;
    DonorNameTextField.tag=102;
    DonorNameTextField.placeholder = @"Donor Name";
    [DonorNameTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    DonorNameTextField.textColor=[UIColor blackColor];
    DonorNameTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    DonorNameTextField.leftView = paddingView;
    DonorNameTextField.leftViewMode = UITextFieldViewModeAlways;
    DonorNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    DonorNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [DonorNameTextField setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    DonorNameTextField.autocapitalizationType = NO;
    DonorNameTextField.returnKeyType=UIReturnKeyNext;
    DonorNameTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    //[EmergencyContactTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [EmergencyScrollView addSubview:DonorNameTextField];
    
    DonorAddressTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, DonorNameTextField.frame.size.height+DonorNameTextField.frame.origin.y+10, 286, 35)];
    DonorAddressTextField.delegate = self;
    DonorAddressTextField.enabled=NO;
     DonorAddressTextField.tag=103;
    DonorAddressTextField.placeholder = @"Donor Address";
    [DonorAddressTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    DonorAddressTextField.textColor=[UIColor blackColor];
    DonorAddressTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    DonorAddressTextField.leftView = paddingView;
    DonorAddressTextField.leftViewMode = UITextFieldViewModeAlways;
    DonorAddressTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    DonorAddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [DonorAddressTextField setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    DonorAddressTextField.autocapitalizationType = NO;
    DonorAddressTextField.returnKeyType=UIReturnKeyNext;
    DonorAddressTextField.keyboardType=UIKeyboardTypeNamePhonePad;
    //[EmergencyContactTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [EmergencyScrollView addSubview:DonorAddressTextField];
    
  
    AllergiesTextView=[[UITextView alloc]initWithFrame:CGRectMake(5, DonorAddressTextField.frame.size.height+DonorAddressTextField.frame.origin.y+15, 286, 100)];
    AllergiesTextView.backgroundColor=[UIColor colorWithRed:228/255.0 green:225/255.0 blue:223/255.0 alpha:1.0];
    AllergiesTextView.delegate = self;
    AllergiesTextView.editable=NO;
    AllergiesTextView.text = @"Allergies";
    [AllergiesTextView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    AllergiesTextView.tag=100;
    AllergiesTextView.textColor = [UIColor lightGrayColor];

    [EmergencyScrollView addSubview:AllergiesTextView];
    [BackGroundImageView addSubview:EmergencyScrollView];
    
    CriticalProblemTextView=[[UITextView alloc]initWithFrame:CGRectMake(5, AllergiesTextView.frame.size.height+AllergiesTextView.frame.origin.y+15, 286, 100)];
    CriticalProblemTextView.backgroundColor=[UIColor colorWithRed:228/255.0 green:225/255.0 blue:223/255.0 alpha:1.0];
    CriticalProblemTextView.delegate = self;
    CriticalProblemTextView.editable=NO;
    CriticalProblemTextView.tag=200;
    CriticalProblemTextView.text = @"Critical Problems";
    [CriticalProblemTextView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    CriticalProblemTextView.textColor = [UIColor lightGrayColor];
    [EmergencyScrollView addSubview:CriticalProblemTextView];
    [BackGroundImageView addSubview:EmergencyScrollView];
    

    BloodGropPickerViewArray=[[NSMutableArray alloc]initWithObjects:@"A+ve",@"A-ve",@"B+ve",@"B-ve",@"AB+ve",@"AB-ve",@"O+ve",@"O-ve", nil];
    NSLog(@"BloodGropPickerView=%@",BloodGropPickerViewArray);
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    [self.view addSubview:BackGroundImageView];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    
    
    if(textField.tag==100){ EmergencyContactTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==101){ BloodGroupTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==102){ DonorNameTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    if(textField.tag==103){ DonorAddressTextField.background = [UIImage imageNamed:@"after_click_input.png"];}
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    if(textField.tag==100){ EmergencyContactTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==101){ BloodGroupTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==102){ DonorNameTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    if(textField.tag==103){ DonorAddressTextField.background = [UIImage imageNamed:@"inputBoxfor-shiping.png"];}
    
    return YES;
}

- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(25, 25)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
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


//-(UIToolbar *)accessoryView
//{
//    
//    if ( accessoryView == nil )
//    {
//        accessoryView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
//        
//        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]  initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onBloodGroupSelection)];
//        
//        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
//        
//        accessoryView.items=[NSArray arrayWithObjects:doneButton,cancelButton, nil];
//    }
//    return accessoryView;
//}

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
    [[soundManager shared] buttonSound];
    [EdiButton removeFromSuperview];
    
    DoneButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 35, 50, 25)];
    DoneButton.backgroundColor=[UIColor clearColor];
    [DoneButton setTitle:@"Done" forState:UIControlStateNormal];
    [DoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [DoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
     DoneButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [DoneButton addTarget:self action:@selector(DoneButtonFuction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:DoneButton];
    
    EmergencyContactTextField.enabled=YES;
    BloodGroupTextField.enabled=YES;
    DonorNameTextField.enabled=YES;
    DonorAddressTextField.enabled=YES;
    AllergiesTextView.editable=YES;
    CriticalProblemTextView.editable=YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [AllergiesTextView resignFirstResponder];
        return NO; // or true, whetever you's like
    }
    return YES;
}
-(void)DoneButtonFuction{
    
    [[soundManager shared] buttonSound];
    [DoneButton removeFromSuperview];
    EdiButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 35, 50, 25)];
    EdiButton.backgroundColor=[UIColor clearColor];
    
    [EdiButton setTitle:@"Edit" forState:UIControlStateNormal];
    [EdiButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [EdiButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    EdiButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [EdiButton addTarget:self action:@selector(EditEmergencyDetails) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:EdiButton];
    
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Your emergency contact information has been saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [alert show];
//    alert = nil;
}
-(void)BackButtonAction{
    
     [[soundManager shared] buttonSound];
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

    CGFloat heightofKeyboard = 450;
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
     if(textView.tag==100){
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
