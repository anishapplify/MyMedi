//
//  EditAppointmentViewController.m
//  MyMediApp
//
//  Created by anish on 24/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "EditAppointmentViewController.h"

@interface EditAppointmentViewController (){
    UIView *TopBarView;
    UIButton *EdiButton;
    UIButton    *Backbutton;
    
    UILabel *EditAppointmentLable;
    
    UITextField *consultantTextField;
    
    UIDatePicker *AppointmentDatePicker;
    
    UIScrollView *informationScrollView;
    
    
    
    UITextField *appointmentTextField;
    
    UITextField *dateTextField;
    
    UITextField *hospitalTextField;
    
    UIView *paddingView;
}

@end

@implementation EditAppointmentViewController

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
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    TopBarView.userInteractionEnabled=TRUE;
    
    
    
    EdiButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20, [UIImage imageNamed:@"editButton.png"].size.width ,[UIImage imageNamed:@"editButton.png"].size.height)];
    
    EdiButton.backgroundColor=[UIColor clearColor];
    
    [EdiButton setImage:[UIImage imageNamed:@"editButton.png"] forState:UIControlStateNormal];
    
    [EdiButton addTarget:self action:@selector(EditAppointments) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:EdiButton];
    
    
    EditAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    
   
    
    EditAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:15];
    
    EditAppointmentLable.textColor=[UIColor blackColor];
    
    EditAppointmentLable.textAlignment=NSTextAlignmentCenter;
    
    [TopBarView addSubview:EditAppointmentLable];

    
    
    Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    Backbutton.frame = CGRectMake(5,20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height);
    
    Backbutton.backgroundColor=[UIColor clearColor];
    
    [Backbutton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    
    [Backbutton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:Backbutton];
    [self.view addSubview:TopBarView];
    
    
    

    informationScrollView=[[UIScrollView alloc]init];
    
    informationScrollView.hidden=NO;
    
    informationScrollView.frame=CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, 320, 200);
    
    informationScrollView.backgroundColor=[UIColor whiteColor];
    
    informationScrollView.contentSize=CGSizeMake(320, 175);
    
    informationScrollView.bounces=YES;
    
    informationScrollView.delegate=self;
    
    informationScrollView.exclusiveTouch=YES;
    
    informationScrollView.showsVerticalScrollIndicator=FALSE;
    
    informationScrollView.scrollEnabled=true;
    
    
    
    appointmentTextField = [[UITextField alloc] initWithFrame:CGRectMake(125,0, 180, 30)];
    appointmentTextField.backgroundColor=[UIColor clearColor];
    appointmentTextField.delegate = self;
    appointmentTextField.textColor=[UIColor blackColor];
    
    appointmentTextField.textAlignment = NSTextAlignmentLeft;
    
    [appointmentTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    appointmentTextField.leftView = paddingView;
    
    appointmentTextField.leftViewMode = UITextFieldViewModeAlways;
    
    appointmentTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    appointmentTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [appointmentTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
    appointmentTextField.autocapitalizationType = NO;
    
    appointmentTextField.userInteractionEnabled=FALSE;
    
    appointmentTextField.returnKeyType=UIReturnKeyNext;
    
    [appointmentTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:appointmentTextField];
    
    UIView *LineView=[[UIView alloc]initWithFrame:CGRectMake(130, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y, 180, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    [informationScrollView addSubview:LineView];
    
    
    UILabel *AppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 125, 30) ];
    
    AppointmentLable.text= [NSString stringWithFormat:@"   %@",@"Appointment Name"];
    
    AppointmentLable.textAlignment=NSTextAlignmentLeft;
    
    AppointmentLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    AppointmentLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    AppointmentLable.backgroundColor = [UIColor clearColor];
    
    [informationScrollView addSubview:AppointmentLable];
    
    
    
    consultantTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+1, 200, 30)];
    
    consultantTextField.delegate = self;
    
    consultantTextField.textColor=[UIColor blackColor];
    
    consultantTextField.backgroundColor=[UIColor whiteColor];
    
    consultantTextField.textAlignment = NSTextAlignmentLeft;
    
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    consultantTextField.leftView = paddingView;
    
    [appointmentTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    consultantTextField.leftViewMode = UITextFieldViewModeAlways;
    
    consultantTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    consultantTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [consultantTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
    consultantTextField.autocapitalizationType = NO;
    
     consultantTextField.userInteractionEnabled=FALSE;
    consultantTextField.returnKeyType=UIReturnKeyNext;
    
    [consultantTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:consultantTextField];
    
    LineView=[[UIView alloc]initWithFrame:CGRectMake(130, consultantTextField.frame.size.height+consultantTextField.frame.origin.y, 180, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    [informationScrollView addSubview:LineView];
    
    
    
    UILabel *ConsultantLable=[[UILabel alloc]initWithFrame:CGRectMake(0, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+1, 125, 30) ];
    
    ConsultantLable.text= [NSString stringWithFormat:@"   %@",@"Consultant Name"];
    
    ConsultantLable.textAlignment=NSTextAlignmentLeft;
    
    ConsultantLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    ConsultantLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    ConsultantLable.backgroundColor = [UIColor clearColor];
    
    [informationScrollView addSubview:ConsultantLable];
    
    
    
    
    
    AppointmentDatePicker  = [[UIDatePicker alloc]init];
    
    [AppointmentDatePicker setMinimumDate:[NSDate date]];
    
    [AppointmentDatePicker setFrame:CGRectMake(100, 518, 320, 100)];
    
    AppointmentDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    [AppointmentDatePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
    
    
    
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];
    
    toolbar.barStyle = UIBarStyleBlackOpaque;
    
    
    
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                               
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               
                                               target:nil
                                               
                                               action:nil];
    
    
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    
    doneButton.width = 50;
    
    
    
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    
    
    
    dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+1, 200, 30)];
    
    dateTextField.delegate = self;
    
    
    
    // [dateTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    
    dateTextField.textColor=[UIColor blackColor];
    
    dateTextField.backgroundColor = [UIColor whiteColor];
    
    dateTextField.tag=108;
    
    dateTextField.textAlignment = NSTextAlignmentLeft;
    
    [dateTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    dateTextField.leftView = paddingView;
    
    dateTextField.leftViewMode = UITextFieldViewModeAlways;
    
    dateTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    dateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [dateTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
    dateTextField.autocapitalizationType = NO;
    dateTextField.userInteractionEnabled=FALSE;
    
    dateTextField.returnKeyType=UIReturnKeyNext;
    
    [dateTextField setInputView:AppointmentDatePicker];
    
    [dateTextField setInputAccessoryView:toolbar];
    
//    dateTextField.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
//    dateTextField.layer.borderWidth = 1;

    
    [dateTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:dateTextField];
    
    
    
    UILabel *DateLable=[[UILabel alloc]initWithFrame:CGRectMake(0, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+1, 125, 30) ];
    
    DateLable.text= [NSString stringWithFormat:@"   %@",@"Date"];
    
    DateLable.textAlignment=NSTextAlignmentLeft;
    
    DateLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    DateLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    DateLable.backgroundColor = [UIColor clearColor];
    
    [informationScrollView addSubview:DateLable];
    
    
    LineView=[[UIView alloc]initWithFrame:CGRectMake(130, dateTextField.frame.size.height+dateTextField.frame.origin.y, 180, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    [informationScrollView addSubview:LineView];
    
    
    
    hospitalTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 200, 30)];
    
    hospitalTextField.delegate = self;
    
   
    
    //[hospitalTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    
    hospitalTextField.textColor=[UIColor blackColor];
    
    hospitalTextField.backgroundColor = [UIColor whiteColor];
    
    hospitalTextField.textAlignment = NSTextAlignmentLeft;
    
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    hospitalTextField.leftView = paddingView;
    
    hospitalTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [hospitalTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    hospitalTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    hospitalTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [hospitalTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
    hospitalTextField.autocapitalizationType = NO;
    
    hospitalTextField.userInteractionEnabled=FALSE;
    hospitalTextField.returnKeyType=UIReturnKeyNext;
    
    
    [hospitalTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:hospitalTextField];

    
    
    UILabel *HospitalLable=[[UILabel alloc]initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 125, 30) ];
    
    HospitalLable.text= [NSString stringWithFormat:@"   %@",@"Hospital Name"];
    
    HospitalLable.textAlignment=NSTextAlignmentLeft;
    
    HospitalLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    HospitalLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    HospitalLable.backgroundColor = [UIColor clearColor];
    
    [informationScrollView addSubview:HospitalLable];
    
    LineView=[[UIView alloc]initWithFrame:CGRectMake(130, hospitalTextField.frame.size.height+hospitalTextField.frame.origin.y, 180, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    [informationScrollView addSubview:LineView];
    
    
    
  UITextField *AppointtypeTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, hospitalTextField.frame.size.height+hospitalTextField.frame.origin.y+1, 200, 30)];
    
    AppointtypeTextField.delegate = self;
    
  
    
    //[hospitalTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    
    AppointtypeTextField.textColor=[UIColor blackColor];
    
    AppointtypeTextField.backgroundColor = [UIColor whiteColor];
    
    AppointtypeTextField.textAlignment = NSTextAlignmentLeft;
    
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    AppointtypeTextField.leftView = paddingView;
    
    AppointtypeTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [AppointtypeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    AppointtypeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    AppointtypeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [AppointtypeTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
       AppointtypeTextField.userInteractionEnabled=FALSE;
    AppointtypeTextField.autocapitalizationType = NO;
    

    AppointtypeTextField.returnKeyType=UIReturnKeyNext;
    
    [AppointtypeTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:AppointtypeTextField];
    
    
    
    UILabel *AppointmentTypeLable=[[UILabel alloc]initWithFrame:CGRectMake(0, hospitalTextField.frame.size.height+hospitalTextField.frame.origin.y+1, 125, 30) ];
    
    AppointmentTypeLable.text= [NSString stringWithFormat:@"   %@",@"Type"];
    
    AppointmentTypeLable.textAlignment=NSTextAlignmentLeft;
    
    AppointmentTypeLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    AppointmentTypeLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    AppointmentTypeLable.backgroundColor = [UIColor clearColor];
    
    [informationScrollView addSubview:AppointmentTypeLable];
    
    LineView=[[UIView alloc]initWithFrame:CGRectMake(130, AppointtypeTextField.frame.size.height+AppointtypeTextField.frame.origin.y, 180, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    [informationScrollView addSubview:LineView];

    
    UITextField *AppointtypeProivderTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, AppointtypeTextField.frame.size.height+AppointtypeTextField.frame.origin.y+1, 200, 30)];
    
    AppointtypeProivderTextField.delegate = self;
    
    
    AppointtypeProivderTextField.textColor=[UIColor blackColor];
    
    AppointtypeProivderTextField.backgroundColor = [UIColor whiteColor];
    
    AppointtypeProivderTextField.textAlignment = NSTextAlignmentLeft;
    
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    AppointtypeProivderTextField.leftView = paddingView;
     AppointtypeProivderTextField.userInteractionEnabled=FALSE;
    
    AppointtypeProivderTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [AppointtypeProivderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    AppointtypeProivderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    AppointtypeProivderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [AppointtypeProivderTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
    AppointtypeProivderTextField.autocapitalizationType = NO;
    
    AppointtypeProivderTextField.returnKeyType=UIReturnKeyNext;
    
    [AppointtypeProivderTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:AppointtypeProivderTextField];
    
    
    UILabel *AppointmentProivderLable=[[UILabel alloc]initWithFrame:CGRectMake(0, AppointtypeTextField.frame.size.height+AppointtypeTextField.frame.origin.y+1, 125, 30) ];
    
    AppointmentProivderLable.text= [NSString stringWithFormat:@"   %@",@"Provider"];
    
    AppointmentProivderLable.textAlignment=NSTextAlignmentLeft;
    
    AppointmentProivderLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    AppointmentProivderLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    AppointmentProivderLable.backgroundColor = [UIColor clearColor];
    
    [informationScrollView addSubview:AppointmentProivderLable];
    
    LineView=[[UIView alloc]initWithFrame:CGRectMake(130, AppointtypeProivderTextField.frame.size.height+AppointtypeProivderTextField.frame.origin.y, 180, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    [informationScrollView addSubview:LineView];
  //  informationScrollView.backgroundColor=[UIColor   greenColor ];

        [self.view addSubview:informationScrollView];

    UILabel  *NoteStaticLable=[[UILabel alloc]initWithFrame:CGRectMake(10, informationScrollView.frame.size.height+informationScrollView.frame.origin.y+5 , 100 , 45)];
    NoteStaticLable.text=@"Notes";
    NoteStaticLable.textAlignment=NSTextAlignmentLeft;
    NoteStaticLable.backgroundColor=[UIColor clearColor];
    NoteStaticLable.font=[UIFont fontWithName:helveticaRegular size:15];
    NoteStaticLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    [self.view addSubview:NoteStaticLable];
    
    
    LineView=[[UIView alloc]initWithFrame:CGRectMake(10, 330, 310, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    //LineView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:LineView];
    
    NSString *descriptionString;


    NSString *abc=[[NSUserDefaults standardUserDefaults] valueForKey:@"TapFlagVriable"];
    int test=[[NSString stringWithFormat:@"%@",abc] integerValue];
    
    
    if(test==1)
    {
        NSLog(@"kMedicalRecordeNameHospital=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordeNameHospital]);
        
        
        appointmentTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordeNameString];
        consultantTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordeNameConsultantString];
        dateTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordeNameDate];
        hospitalTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordeNameHospital];
        AppointtypeTextField.text=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordeNameTypeName]];
        AppointtypeProivderTextField.text=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordeNameProviderName]];
        descriptionString=[NSString stringWithFormat:@"     %@",[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordsNotes]];
        
         EditAppointmentLable.text=@"Medical Records";
    }
    else
    {
        appointmentTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameString];
        consultantTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameConsultantString];
        dateTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameDate];
        hospitalTextField.text=[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameHospital];
        AppointtypeTextField.text=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameTypeName]];
        AppointtypeProivderTextField.text=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameProviderName]];
        descriptionString=[NSString stringWithFormat:@"     %@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNotes]];
        
         EditAppointmentLable.text=@"Appointment";
    }
    
    CGSize constraint;
    CGSize size;
    CGFloat height;
    constraint = CGSizeMake(320 - (1.0 * 2), 20000.0f);
    
    CGRect textRect = [descriptionString boundingRectWithSize:constraint
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                                      context:nil];
    
    size = textRect.size;
    height = size.height;
    
    UITextView *BioView=[[UITextView alloc] init];
    NSLog(@"height=%f",height);
    BioView.frame=CGRectMake(0, NoteStaticLable.frame.size.height+NoteStaticLable.frame.origin.y, 320, height+40);
    BioView.backgroundColor=[UIColor whiteColor];
    BioView.textColor=[UIColor blackColor];
    BioView.delegate=self;
    BioView.text=descriptionString;
  //  BioView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
   // BioView.layer.borderWidth = 0.5f;
    BioView.textAlignment=NSTextAlignmentLeft;
    BioView.returnKeyType=UIReturnKeyDone;
    BioView.userInteractionEnabled=FALSE;
   [self.view addSubview:BioView];
    
    UILabel  *AttachmentsStaticLable=[[UILabel alloc]initWithFrame:CGRectMake(10, BioView.frame.size.height+BioView.frame.origin.y , 100 , 45)];
    AttachmentsStaticLable.text=@"Attachments";
    AttachmentsStaticLable.backgroundColor=[UIColor clearColor];
    AttachmentsStaticLable.font=[UIFont fontWithName:helveticaRegular size:15];
    AttachmentsStaticLable.textColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    [self.view addSubview:AttachmentsStaticLable];
    
    LineView=[[UIView alloc]initWithFrame:CGRectMake(10, 435, 310, 1)];
    LineView.layer.borderColor = [UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0].CGColor;
    LineView.layer.borderWidth = 1;
    [self.view addSubview:LineView];

    
    // Do any additional setup after loading the view.
}
-(void)BackButtonAction{
    [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"isEditAppointmentPressed"];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)EditAppointments{
    
    NSString *abc=[[NSUserDefaults standardUserDefaults] valueForKey:@"TapFlagVriable"];
    int test=[[NSString stringWithFormat:@"%@",abc] integerValue];
    
    
    if(test==1)
    {
        
        MedicalRecordsHomeViewController  *crete=[[MedicalRecordsHomeViewController alloc ]init];
        [self.navigationController pushViewController:crete animated:YES];
    }
    else{
         [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"isEditAppointmentPressed"];
        CreateNewAppointmentViewController *crete=[[CreateNewAppointmentViewController alloc ]init];
        [self.navigationController pushViewController:crete animated:YES];
    }
    
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)textFieldDoneEditing:(id)sender{
    
}
-(void)updateDateField

{
    
    dateTextField.text = [self formatDate:AppointmentDatePicker.date];
    NSLog(@"dateTextField=%@",dateTextField.text);
    
}

- (NSString *)formatDate:(NSDate *)date

{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd hh:mm:ss"];
    
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    return formattedDate;
    
}

-(void)dismissKeyboard

{
    
    [self.view endEditing:YES];
    
    
    
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
