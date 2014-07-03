//
//  ProfileDetailViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 09/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "ProfileDetailViewController.h"
#import "AsyncImageView.h"
@interface ProfileDetailViewController ()
{
    AsyncImageView *EditChangeImage;
    NSString *urlString2;
    UIButton *ProfileButton;
    UIButton *InformationButton;
    UIButton *TermsButton;
    UIView *subViewCenter;
    UIButton*NextViewController;
    UIScrollView *AddProfileScrollView;
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
    UIView *BottomView;
    NSString *savedImagePath;
    BOOL ProfileActionBool;
    BOOL InformationActionBool;
    BOOL TearmActionBool;
    
    
    NSData *imageData;
    UIAlertView *alertviewLogout;
    UIButton *ProfilePickImageButton;
    UIButton*AgePickerViewButton;
    UIPickerView *AgePickerView;

    
    UITextField*BloodGropTextField;
    UITextField *MedicalInsTextField;
    UITextField *CurrentProblemTextField;
    UITextField *AllergiesTextField;
    
    UILabel *TermAndConditionLable;
    UIButton*TermClickButton;
    UIButton*CheckTermAndConditonButton;
    
    int termandConditionPressOK;
    
    UIDatePicker *dateTimePicker;
    
}

@end

@implementation ProfileDetailViewController

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
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,40)];
    //TopBarView.backgroundColor=[UIColor colorWithRed:255.0/63 green:255.0/63 blue:255.0/63 alpha:1.0];
    TopBarView.backgroundColor=[UIColor colorWithRed:60/255.0 green:61/255.0 blue:60/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    NextViewController=[[UIButton alloc]initWithFrame:CGRectMake(250, 5, 50, 50)];
    NextViewController.backgroundColor=[UIColor clearColor];
    [NextViewController setTitle:@"Next" forState:UIControlStateNormal];
    [NextViewController.titleLabel setFont:[UIFont boldSystemFontOfSize:10]];
  //  NextViewController.enabled=FALSE;
    [NextViewController addTarget:self action:@selector(nextviewController) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:NextViewController];
    
    [self.view addSubview:TopBarView];
    
    BottomView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    BottomView.backgroundColor=[UIColor colorWithRed:171/255.0 green:175/255.0 blue:184/255.0 alpha:1.0];
    
    
    subViewCenter=[[UIView alloc]initWithFrame:CGRectMake(20, 20, 300, self.view.frame.size.height)];
    subViewCenter.backgroundColor=[UIColor whiteColor];
    subViewCenter.userInteractionEnabled=TRUE;
    
    
       ProfileButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 388, 300, 40)];
       [ProfileButton addTarget:self action:@selector(ProfileAction)
                forControlEvents:UIControlEventTouchUpInside];
        [ProfileButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         ProfileButton.backgroundColor=[UIColor colorWithRed:64/255.0 green:68/255.0 blue:73/255.0 alpha:1.0];
        ProfileButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
        ProfileButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [ProfileButton setTitle:@"Profile" forState:(UIControlState)UIControlStateNormal];
        ProfileButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        ProfileButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        ProfileButton.layer.borderWidth = 1.0f;
        [subViewCenter addSubview:ProfileButton];
    
    
        InformationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ProfileButton.frame.size.height+ProfileButton.frame.origin.y, 300, 40)];
        [InformationButton addTarget:self action:@selector(InformationAction)
                forControlEvents:UIControlEventTouchUpInside];
        [InformationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        InformationButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0];
        InformationButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
        InformationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [InformationButton setTitle:@"Information" forState:(UIControlState)UIControlStateNormal];
        InformationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        InformationButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        InformationButton.layer.borderWidth = 1.0f;
        [subViewCenter addSubview:InformationButton];
    
        TermsButton=[[UIButton alloc]initWithFrame:CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40)];
        [TermsButton addTarget:self action:@selector(TermAction)
                    forControlEvents:UIControlEventTouchUpInside];
        [TermsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
       TermsButton.backgroundColor=[UIColor colorWithRed:129/255.0 green:136/255.0 blue:128/255.0 alpha:1.0];
        TermsButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
        TermsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [TermsButton setTitle:@"Terms" forState:(UIControlState)UIControlStateNormal];
        TermsButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        TermsButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        TermsButton.layer.borderWidth = 1.0f;
        [subViewCenter addSubview:TermsButton];
    
    [BottomView addSubview:subViewCenter];
    [self.view addSubview:BottomView];
    
    termandConditionPressOK=0;
}
-(void)ProfileAction{
    
    [TermAndConditionLable removeFromSuperview];
    [TermClickButton removeFromSuperview];
    [CheckTermAndConditonButton removeFromSuperview];
    
    if(ProfileActionBool==FALSE)
    {
        ProfileActionBool=TRUE;
        [UIView animateWithDuration:.5f animations:^{
            ProfileButton.frame = CGRectMake(0, 100, 300, 40);
            InformationButton.frame = CGRectMake(0, 800, 300, 40);
            TermsButton.frame = CGRectMake(0, 800, 300, 40);
            
        } completion:^(BOOL finished) {
            [self ProfileScrollViewAction];
        }];
        
    }else{
        ProfileActionBool=FALSE;
        [AddProfileScrollView removeFromSuperview];
       
        [UIView animateWithDuration:.5f animations:^{
            ProfileButton.frame = CGRectMake(0, 388, 300, 40);
            InformationButton.frame = CGRectMake(0, ProfileButton.frame.size.height+ProfileButton.frame.origin.y, 300, 40);
            TermsButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
}
-(void)InformationAction{
    
    [TermAndConditionLable removeFromSuperview];
    [TermClickButton removeFromSuperview];
    [CheckTermAndConditonButton removeFromSuperview];
    
    if(InformationActionBool==FALSE){
        InformationActionBool=TRUE;
        [UIView animateWithDuration:.5f animations:^{
            ProfileButton.frame = CGRectMake(0, 80, 300, 40);
            InformationButton.frame = CGRectMake(0, ProfileButton.frame.size.height+ProfileButton.frame.origin.y, 300, 40);
            TermsButton.frame = CGRectMake(0, 800, 300, 40);
            
        } completion:^(BOOL finished) {
            [self InformationScrollViewAction];
        }];
    }else{
         InformationActionBool=FALSE;
         [AddProfileScrollView removeFromSuperview];
       
        [UIView animateWithDuration:.5f animations:^{
            ProfileButton.frame = CGRectMake(0, 388, 300, 40);
            InformationButton.frame = CGRectMake(0, ProfileButton.frame.size.height+ProfileButton.frame.origin.y, 300, 40);
            TermsButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
           
        }];
    }
    
}
-(void)TermAction{
    
    [TermAndConditionLable removeFromSuperview];
    [TermClickButton removeFromSuperview];
    [CheckTermAndConditonButton removeFromSuperview];
    
    if(TearmActionBool==FALSE){
        TearmActionBool=TRUE;
        [UIView animateWithDuration:.5f animations:^{
            ProfileButton.frame = CGRectMake(0, 80, 300, 40);
            InformationButton.frame = CGRectMake(0, ProfileButton.frame.size.height+ProfileButton.frame.origin.y, 300, 40);
            TermsButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            [self TermActionView];
        }];
    }
    else{
        TearmActionBool=FALSE;
        [UIView animateWithDuration:.5f animations:^{
            ProfileButton.frame = CGRectMake(0, 388, 300, 40);
            InformationButton.frame = CGRectMake(0, ProfileButton.frame.size.height+ProfileButton.frame.origin.y, 300, 40);
            TermsButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            //        [self AddAccountScrollView];
        }];
    }
}
-(void)TermActionView
{
    TermAndConditionLable=[[UILabel alloc]initWithFrame:CGRectMake(40, TermsButton.frame.size.height+TermsButton.frame.origin.y+80, 200, 20)];
    TermAndConditionLable.text=@"By cheaking the box and creating the account, You are agreeing to the";
    TermAndConditionLable.textColor=[UIColor blackColor];
    TermAndConditionLable.numberOfLines=3;
    [TermAndConditionLable sizeToFit];
    [TermAndConditionLable setFont:[UIFont boldSystemFontOfSize:12]];
    TermAndConditionLable.backgroundColor=[UIColor clearColor];
    
    TermClickButton=[[UIButton alloc]initWithFrame:CGRectMake(42, TermsButton.frame.size.height+TermsButton.frame.origin.y+115, 180, 20)];
    [TermClickButton addTarget:self action:@selector(TermConditonAction)
              forControlEvents:UIControlEventTouchUpInside];
    [TermClickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    TermClickButton.backgroundColor=[UIColor colorWithRed:0.97265625 green:0.97265625 blue:0.97265625 alpha:1.0];
    TermClickButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 12];
    TermClickButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [TermClickButton setTitle:@"TERMS AND CONDITIONS." forState:(UIControlState)UIControlStateNormal];
    TermClickButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    TermClickButton.backgroundColor=[UIColor clearColor];
    [self.view addSubview:TermClickButton];
    [self.view addSubview:TermAndConditionLable];
    
    CheckTermAndConditonButton=[[UIButton alloc]initWithFrame:CGRectMake(270, TermClickButton.frame.size.height+TermClickButton.frame.origin.y+50, 20, 20)];
    CheckTermAndConditonButton.backgroundColor=[UIColor redColor];
    [CheckTermAndConditonButton addTarget:self action:@selector(termbuttonMark) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CheckTermAndConditonButton];
    
}
-(void)TermConditonAction{
    
}
-(void)termbuttonMark{
    termandConditionPressOK=1;
}
#pragma mark Information ScrollView Action
-(void)InformationScrollViewAction
{
   
    [AddProfileScrollView  removeFromSuperview];
    AddProfileScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y+10, subViewCenter.frame.size.width,subViewCenter.frame.size.height+100)];
    AddProfileScrollView.backgroundColor=[UIColor clearColor];
    AddProfileScrollView.showsHorizontalScrollIndicator=TRUE;
    AddProfileScrollView.contentSize=CGSizeMake(subViewCenter.frame.size.width, 550);
    
    
    
    BloodGropTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 10, 286, 20)];
    BloodGropTextField.delegate = self;
    BloodGropTextField.placeholder = @"Blood Group";
    [BloodGropTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    BloodGropTextField.textColor=[UIColor blackColor];
    BloodGropTextField.textAlignment = NSTextAlignmentLeft;
    BloodGropTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    BloodGropTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [BloodGropTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    BloodGropTextField.autocapitalizationType = NO;
    BloodGropTextField.returnKeyType=UIReturnKeyNext;
    [BloodGropTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:BloodGropTextField];
    
    
  //  UIImage *MarkImageview=[UIImage imageNamed:@""];
    //UIImage *UnMarkImageView=[UIImage imageNamed:@""];
    
    UIButton*CheckBoxButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 2, 15, 15)];
   // [CheckBoxButton setBackgroundImage:MarkImageview forState:UIControlStateNormal];
    CheckBoxButton.backgroundColor=[UIColor redColor];
    
    
    MedicalInsTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, BloodGropTextField.frame.size.height+BloodGropTextField.frame.origin.y+15,286, 20)];
    MedicalInsTextField.delegate = self;
    MedicalInsTextField.placeholder = @"Medical Insurance";
    [MedicalInsTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    MedicalInsTextField.textColor=[UIColor blackColor];
    MedicalInsTextField.textAlignment = NSTextAlignmentLeft;
    MedicalInsTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    MedicalInsTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [MedicalInsTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    MedicalInsTextField.autocapitalizationType = NO;
    MedicalInsTextField.returnKeyType=UIReturnKeyNext;
    [MedicalInsTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [MedicalInsTextField addSubview:CheckBoxButton];
    [AddProfileScrollView addSubview:MedicalInsTextField];
    

    CurrentProblemTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, MedicalInsTextField.frame.size.height+MedicalInsTextField.frame.origin.y+15, 286, 20)];
    CurrentProblemTextField.delegate = self;
    CurrentProblemTextField.placeholder = @"Current Problem";
    [CurrentProblemTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    CurrentProblemTextField.textColor=[UIColor blackColor];
    CurrentProblemTextField.textAlignment = NSTextAlignmentLeft;
    CurrentProblemTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    CurrentProblemTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [CurrentProblemTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    CurrentProblemTextField.autocapitalizationType = NO;
    CurrentProblemTextField.returnKeyType=UIReturnKeyNext;
    [CurrentProblemTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:CurrentProblemTextField];

    
    
    AllergiesTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, CurrentProblemTextField.frame.size.height+CurrentProblemTextField.frame.origin.y+15, 286, 20)];
    AllergiesTextField.delegate = self;
    AllergiesTextField.placeholder = @"Allergies";
    [AllergiesTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    AllergiesTextField.textColor=[UIColor blackColor];
    AllergiesTextField.textAlignment = NSTextAlignmentLeft;
    AllergiesTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    AllergiesTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AllergiesTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    AllergiesTextField.autocapitalizationType = NO;
    AllergiesTextField.returnKeyType=UIReturnKeyNext;
    [AllergiesTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:AllergiesTextField];
    
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [subViewCenter addGestureRecognizer:tapRecognizer];
    
    [subViewCenter addSubview:AddProfileScrollView];
    
}
#pragma mark Profile ScrollView Action
-(void)ProfileScrollViewAction{
    
    [AddProfileScrollView  removeFromSuperview];
    AddProfileScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, ProfileButton.frame.size.height+ProfileButton.frame.origin.y+10, subViewCenter.frame.size.width,subViewCenter.frame.size.height+100)];
    AddProfileScrollView.backgroundColor=[UIColor clearColor];
    AddProfileScrollView.showsHorizontalScrollIndicator=TRUE;
    AddProfileScrollView.contentSize=CGSizeMake(subViewCenter.frame.size.width, 550);
    
    
    EditChangeImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
    //urlString2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"image_url"];
    EditChangeImage.imageURL = [NSURL URLWithString:urlString2];
    EditChangeImage.backgroundColor=[UIColor grayColor];
    
   
    ProfilePickImageButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 10, 80, 80)];
    ProfilePickImageButton.backgroundColor=[UIColor clearColor];
    [ProfilePickImageButton addTarget:self action:@selector(ImageEditing_Done_Function) forControlEvents:UIControlEventTouchUpInside];
    [ProfilePickImageButton addSubview:EditChangeImage];
    [AddProfileScrollView addSubview:ProfilePickImageButton];

    
    
    FirstNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(ProfilePickImageButton.frame.size.width+ProfilePickImageButton.frame.origin.x+10, 20, 286-90, 20)];
    FirstNameTextField.delegate = self;
    FirstNameTextField.placeholder = @"First Name";
    [FirstNameTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    FirstNameTextField.textColor=[UIColor blackColor];
    FirstNameTextField.textAlignment = NSTextAlignmentLeft;
    FirstNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    FirstNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [FirstNameTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    FirstNameTextField.autocapitalizationType = NO;
    FirstNameTextField.returnKeyType=UIReturnKeyNext;
    [FirstNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:FirstNameTextField];
    
    
    
    LastNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(ProfilePickImageButton.frame.size.width+ProfilePickImageButton.frame.origin.x+10, FirstNameTextField.frame.size.height+FirstNameTextField.frame.origin.y+15, 286-90, 20)];
    LastNameTextField.delegate = self;
    LastNameTextField.placeholder = @"Last Name";
    [LastNameTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    LastNameTextField.textColor=[UIColor blackColor];
    LastNameTextField.textAlignment = NSTextAlignmentLeft;
    LastNameTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    LastNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [LastNameTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    LastNameTextField.autocapitalizationType = NO;
    LastNameTextField.returnKeyType=UIReturnKeyNext;
    [LastNameTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:LastNameTextField];
    
    
    
    
    AddressTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, LastNameTextField.frame.size.height+LastNameTextField.frame.origin.y+30, 286, 20)];
    AddressTextField.delegate = self;
    AddressTextField.placeholder = @"Address";
    [AddressTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    AddressTextField.textColor=[UIColor blackColor];
    AddressTextField.textAlignment = NSTextAlignmentLeft;
    AddressTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    AddressTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AddressTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    AddressTextField.autocapitalizationType = NO;
    AddressTextField.returnKeyType=UIReturnKeyNext;
    [AddressTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:AddressTextField];
    
    
    ZipCodeTextFeild = [[UITextField alloc] initWithFrame:CGRectMake(5, AddressTextField.frame.size.height+AddressTextField.frame.origin.y+15, 286-150, 20)];
    ZipCodeTextFeild.delegate = self;
    ZipCodeTextFeild.placeholder = @"Zip Code";
   [ZipCodeTextFeild setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    ZipCodeTextFeild.textColor=[UIColor blackColor];
    ZipCodeTextFeild.textAlignment = NSTextAlignmentLeft;
    ZipCodeTextFeild.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    ZipCodeTextFeild.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [ZipCodeTextFeild setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    ZipCodeTextFeild.autocapitalizationType = NO;
    ZipCodeTextFeild.returnKeyType=UIReturnKeyNext;
    ZipCodeTextFeild.keyboardType=UIKeyboardTypeNumberPad;
    [ZipCodeTextFeild addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:ZipCodeTextFeild];
    

    
    PhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(ZipCodeTextFeild.frame.size.width+ZipCodeTextFeild.frame.origin.x+10, AddressTextField.frame.size.height+AddressTextField.frame.origin.y+15, 286-150, 20)];
    PhoneTextField.delegate = self;
    PhoneTextField.placeholder = @"Phone No.";
    PhoneTextField.textColor=[UIColor blackColor];
     [PhoneTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
     PhoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    PhoneTextField.textAlignment = NSTextAlignmentLeft;
    PhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [PhoneTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    PhoneTextField.keyboardType=UIKeyboardTypeNumberPad;
    PhoneTextField.returnKeyType=UIReturnKeyNext;
  
    [PhoneTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:PhoneTextField];
    
    
    GenderTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+15, 286-150, 20)];
    GenderTextField.delegate = self;
    GenderTextField.placeholder = @"Gender";
    GenderTextField.textColor=[UIColor blackColor];
    GenderTextField.textAlignment = NSTextAlignmentLeft;
     [GenderTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    GenderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    GenderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [GenderTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    GenderTextField.autocapitalizationType = NO;
    GenderTextField.keyboardType=UIKeyboardTypeNumberPad;
    GenderTextField.returnKeyType=UIReturnKeyNext;
    [GenderTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:GenderTextField];
    

    dateTimePicker  = [[UIDatePicker alloc]init];
    [dateTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
    dateTimePicker.datePickerMode = UIDatePickerModeDate;
    [dateTimePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
    
    AgeTextField = [[UITextField alloc] initWithFrame:CGRectMake(GenderTextField.frame.size.width+GenderTextField.frame.origin.x+10, ZipCodeTextFeild.frame.size.height+ZipCodeTextFeild.frame.origin.y+15, 286-150, 20)];
    AgeTextField.delegate = self;
    AgeTextField.placeholder = @"Age";
    AgeTextField.textColor=[UIColor blackColor];
    AgeTextField.textAlignment = NSTextAlignmentLeft;
    [AgeTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    AgeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    AgeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AgeTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    AgeTextField.autocapitalizationType = NO;
    [AgeTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AgeTextField setInputView:dateTimePicker];
    [AddProfileScrollView addSubview:AgeTextField];


    HeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+15, 286-150, 20)];
    HeightTextField.delegate = self;
    HeightTextField.placeholder = @"Height";
    [HeightTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    HeightTextField.textColor=[UIColor blackColor];
    HeightTextField.textAlignment = NSTextAlignmentLeft;
    HeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    HeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [HeightTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    HeightTextField.autocapitalizationType = NO;
    //ZipCodeTextFeild.returnKeyType=UIReturnKeyNext;
    HeightTextField.keyboardType=UIKeyboardTypeNumberPad;
    [HeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:HeightTextField];
    
    
    
    WeightTextField = [[UITextField alloc] initWithFrame:CGRectMake(HeightTextField.frame.size.width+HeightTextField.frame.origin.x+10, GenderTextField.frame.size.height+GenderTextField.frame.origin.y+15, 286-150, 20)];
    WeightTextField.delegate = self;
    WeightTextField.placeholder = @"Weight";
    [WeightTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    WeightTextField.textColor=[UIColor blackColor];
    WeightTextField.textAlignment = NSTextAlignmentLeft;
    WeightTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    WeightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [WeightTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    WeightTextField.autocapitalizationType = NO;
    WeightTextField.returnKeyType=UIReturnKeyNext;
    WeightTextField.keyboardType=UIKeyboardTypeNumberPad;
    [WeightTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [AddProfileScrollView addSubview:WeightTextField];

    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [subViewCenter addGestureRecognizer:tapRecognizer];
    [subViewCenter addSubview:AddProfileScrollView];
}
#pragma mark Picker View Controller
-(void)updateDateField
{
    
    AgeTextField.text = [self formatDate:dateTimePicker.date];
    
    NSLog(@"%@",AgeTextField.text);
}
- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"MM'/'dd'/'yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
   
    //return [IncomePaymentCashArray count];
    return 0;
    
}

// tell the picker how many components it will have

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
        return 2;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   
        
       // return [IncomePaymentCashArray objectAtIndex:row];
        
    return 0;
    

}

-(void)ImageEditing_Done_Function
{
    alertviewLogout = [[UIAlertView alloc]
                       
                       initWithTitle:@"Add Photo"
                       message:nil
                       delegate:self
                       cancelButtonTitle:@"Cancel"
                       otherButtonTitles:@"Take Photo", @"Choose from Gallery", nil];
    
    alertviewLogout.delegate=self;
    alertviewLogout.tag=0;
    [alertviewLogout show];
    
}
-(void)galleryFunction
{
    if([UIImagePickerController isSourceTypeAvailable:
        
        UIImagePickerControllerSourceTypePhotoLibrary])
        
    {
        UIImagePickerController *picker= [[UIImagePickerController alloc]init];
        
        picker.delegate = self;
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }
}
- (void) imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
- (void) imagePickerController:(UIImagePickerController *)aPicker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    //[self presentViewController:aPicker animated:YES completion:nil];
    //[self presentModalViewController:aPicker animated:YES];
    
   [aPicker dismissModalViewControllerAnimated:YES];
    UIImageView *cameraRollImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    UIImage *image = (UIImage*) [info objectForKey:UIImagePickerControllerOriginalImage];
    [cameraRollImageView setImage:image];
    cameraRollImageView.userInteractionEnabled = YES;
    cameraRollImageView.multipleTouchEnabled = YES;
    int kMaxResolution = 1024;
    CGImageRef imgRef = image.CGImage;
    CGFloat widthR = CGImageGetWidth(imgRef);
    CGFloat heightR = CGImageGetHeight(imgRef);
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, widthR, heightR);
    if (widthR > kMaxResolution || heightR > kMaxResolution)
    {
        CGFloat ratio = widthR/heightR;
        if (ratio > 1)
        {
            bounds.size.width = kMaxResolution;
            bounds.size.height = roundf(bounds.size.width / ratio);
        }
        else
        {
            bounds.size.height = kMaxResolution;
            bounds.size.width = roundf(bounds.size.height * ratio);
        }
    }
    CGFloat scaleRatio = bounds.size.width / widthR;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
    }
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft)
    {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -heightR, 0);
    }
    else
    {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -heightR);
    }
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, widthR, heightR), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"selectedImage.png"];
    
    imageData = UIImagePNGRepresentation(imageCopy);
    [imageData writeToFile:savedImagePath atomically:NO];
    EditChangeImage.image=image;
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==0)
    {
        if(buttonIndex == 2)
        {
            
            [self galleryFunction];
        }
        else
            if(buttonIndex == 1)
                
            {
               [self Opencamera];
            }
    }
}
-(void)Opencamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:@"cameraMethodvalue"];
    
    
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
        [PhoneTextField becomeFirstResponder];
        return NO;
    }else
    if (textField == PhoneTextField)
        
    {
        [GenderTextField becomeFirstResponder];
        return NO;
    }else
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
    
            else
            {
                [textField resignFirstResponder];
            }
    return YES;
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
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    CGRect rect = self.view.frame;if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
    }else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        // rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}
-(void)keyboardWillShow
{
    // Animate the current view out of the way
    CGFloat heightofKeyboard = 540;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [AddProfileScrollView  setContentInset:insets];
    [AddProfileScrollView setScrollIndicatorInsets:insets];
    
}
-(void)scrollViewDidTapped
{
    [FirstNameTextField resignFirstResponder];
    [LastNameTextField resignFirstResponder];
    [ZipCodeTextFeild resignFirstResponder];
    [HeightTextField resignFirstResponder];
    [WeightTextField resignFirstResponder];
    [AgeTextField resignFirstResponder];
    [AddressTextField resignFirstResponder];
    [PhoneTextField resignFirstResponder];
    [GenderTextField resignFirstResponder];
    [AgePickerView removeFromSuperview];

}
-(void)keyboardWillHide
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [AddProfileScrollView setContentInset:insets];
    [AddProfileScrollView setScrollIndicatorInsets:insets];
    
}
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    
//    if(textField.tag==100){
//        //[AgeTextField resignFirstResponder];
//        AgeTextField.keyboardAppearance=NO;
//        AgeTextField.keyboardType=NO;
//        [self pickerCallFunction];
//    }
//    
//    
//}
-(IBAction)textFieldDoneEditing:(id)sender{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)nextviewController{
    
    if(termandConditionPressOK==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Agree to the Terms & Conditions." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
               [alert show];
               alert = nil;
        
    }
    else{
        termandConditionPressOK=0;
        VerifyAccountDetailViewController*Verify=[[VerifyAccountDetailViewController alloc]init];
        [self.navigationController pushViewController:Verify animated:YES];
    }
    
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
