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
    
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    TopBarView.userInteractionEnabled=TRUE;
    
    
    
    EdiButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20, [UIImage imageNamed:@"editButton.png"].size.width ,[UIImage imageNamed:@"editButton.png"].size.height)];
    
    EdiButton.backgroundColor=[UIColor clearColor];
    
    [EdiButton setImage:[UIImage imageNamed:@"editButton.png"] forState:UIControlStateNormal];
    
    [EdiButton addTarget:self action:@selector(EditAppointments) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:EdiButton];
    
    
    EditAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    
    EditAppointmentLable.text=@"Edit Appointment";
    
    EditAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:18];
    
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
    
    informationScrollView.frame=CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, 320, 163);
    
    informationScrollView.backgroundColor=[UIColor clearColor];
    
    informationScrollView.contentSize=CGSizeMake(320, 175);
    
    informationScrollView.bounces=YES;
    
    informationScrollView.delegate=self;
    
    informationScrollView.exclusiveTouch=YES;
    
    informationScrollView.showsVerticalScrollIndicator=FALSE;
    
    informationScrollView.scrollEnabled=true;
    
    
    
    appointmentTextField = [[UITextField alloc] initWithFrame:CGRectMake(125,0, 200, 40)];
    
    appointmentTextField.backgroundColor=[UIColor whiteColor];
    
    appointmentTextField.delegate = self;
    
    appointmentTextField.placeholder = @"Appointment Name";
    
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
    
    appointmentTextField.returnKeyType=UIReturnKeyNext;
    
    [appointmentTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:appointmentTextField];
    
    
    
    
    
    UILabel *AppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 125, 40) ];
    
    AppointmentLable.text= [NSString stringWithFormat:@"   %@",@"Appointment Name"];
    
    AppointmentLable.textAlignment=NSTextAlignmentLeft;
    
    AppointmentLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    AppointmentLable.textColor=[UIColor blackColor];
    
    AppointmentLable.backgroundColor = [UIColor grayColor];
    
    [informationScrollView addSubview:AppointmentLable];
    
    
    
    consultantTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+1, 200, 40)];
    
    consultantTextField.delegate = self;
    
    consultantTextField.placeholder = @"Consultant Name";
    
    //[consultantTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    
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
    
    consultantTextField.returnKeyType=UIReturnKeyNext;
    
    [consultantTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:consultantTextField];
    
    
    
    UILabel *ConsultantLable=[[UILabel alloc]initWithFrame:CGRectMake(0, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+1, 125, 40) ];
    
    ConsultantLable.text= [NSString stringWithFormat:@"   %@",@"Consultant Name"];
    
    ConsultantLable.textAlignment=NSTextAlignmentLeft;
    
    ConsultantLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    ConsultantLable.textColor=[UIColor blackColor];
    
    ConsultantLable.backgroundColor = [UIColor grayColor];
    
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
    
    
    
    dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+1, 200, 40)];
    
    dateTextField.delegate = self;
    
    dateTextField.placeholder = @"Date";
    
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
    
    dateTextField.returnKeyType=UIReturnKeyNext;
    
    [dateTextField setInputView:AppointmentDatePicker];
    
    [dateTextField setInputAccessoryView:toolbar];
    
    [dateTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:dateTextField];
    
    
    
    UILabel *DateLable=[[UILabel alloc]initWithFrame:CGRectMake(0, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+1, 125, 40) ];
    
    DateLable.text= [NSString stringWithFormat:@"   %@",@"Date"];
    
    DateLable.textAlignment=NSTextAlignmentLeft;
    
    DateLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    DateLable.textColor=[UIColor blackColor];
    
    DateLable.backgroundColor = [UIColor grayColor];
    
    [informationScrollView addSubview:DateLable];
    
    
    
    
    
    
    
    UILabel *TimeLable=[[UILabel alloc]initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 125, 40) ];
    
    TimeLable.text= [NSString stringWithFormat:@"   %@",@"Time"];
    
    TimeLable.textAlignment=NSTextAlignmentLeft;
    
    TimeLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    TimeLable.textColor=[UIColor blackColor];
    
    TimeLable.backgroundColor = [UIColor grayColor];
    
    [informationScrollView addSubview:TimeLable];
    
    
    
    hospitalTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 200, 40)];
    
    hospitalTextField.delegate = self;
    
    hospitalTextField.placeholder = @"Hospital Name";
    
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
    
    hospitalTextField.returnKeyType=UIReturnKeyNext;
    
    [hospitalTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [informationScrollView addSubview:hospitalTextField];

    
    
    UILabel *HospitalLable=[[UILabel alloc]initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 125, 40) ];
    
    HospitalLable.text= [NSString stringWithFormat:@"   %@",@"Hospital Name"];
    
    HospitalLable.textAlignment=NSTextAlignmentLeft;
    
    HospitalLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    HospitalLable.textColor=[UIColor blackColor];
    
    HospitalLable.backgroundColor = [UIColor grayColor];
    
    [informationScrollView addSubview:HospitalLable];

    [self.view addSubview:informationScrollView];
    

    
    // Do any additional setup after loading the view.
}
-(void)BackButtonAction{
    
}
-(void)EditAppointments{
    
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
