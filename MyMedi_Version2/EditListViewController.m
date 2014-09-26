//
//  EditListViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/12/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "EditListViewController.h"

@interface EditListViewController (){
    UIView *TopBarView;
    UIButton *BackButton;
    UILabel *TopBarLable;
    
    UILabel *EditAppointmentLable;
    UITextField *consultantTextField;
    UIDatePicker *AppointmentDatePicker;
    UIScrollView *informationScrollView;
    AsyncImageView *thumbImageViewForVideo;
    
    UITextField *appointmentTextField;
    UILabel *AppointmentLable;
    UILabel *ConsultantLable;
    UITextField *dateTextField;
    UITextField *hospitalTextField;
    UIView *paddingView;
    UILabel *AppointmentTypeLable;
    UITextField *AppointtypeProivderTextField;
    UILabel *AppointmentProivderLable;
    UILabel  *NoteStaticLable;
    UILabel *DateLable;
    UILabel *HospitalLable;
    UITextField *AppointtypeTextField;
    
    UICollectionView *attachmentCollectionView;
    NSMutableArray *arrayofAttachmentsComingFromServer;
    NSMutableArray *arrayofAttachmentsIdsComingFromServer;
}

@end

@implementation EditListViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    
    
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,64)];
    TopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    [BackButton removeFromSuperview];
    BackButton=nil;
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"backWithMyMedi.png"].size.width ,[UIImage imageNamed:@"backWithMyMedi.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setBackgroundImage:[UIImage imageNamed:@"backWithMyMedi.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    
    [TopBarLable removeFromSuperview];
    TopBarLable=nil;
    TopBarLable=[[UILabel alloc]initWithFrame:CGRectMake(110, 30, 100, 25)];
    TopBarLable.text=@"Appointment";
    TopBarLable.backgroundColor=[UIColor clearColor];
    TopBarLable.font=[UIFont fontWithName:@"Europa-Regular" size:17];
    TopBarLable.textAlignment=NSTextAlignmentCenter;
    TopBarLable.textColor=[UIColor whiteColor];
    [TopBarView addSubview:TopBarLable];
    [self.view addSubview:TopBarView];
    
    [informationScrollView removeFromSuperview];
    informationScrollView=nil;
    informationScrollView=[[UIScrollView alloc]init];
    informationScrollView.hidden=NO;
    informationScrollView.frame=CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, 320, 280);
    informationScrollView.backgroundColor=[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    informationScrollView.contentSize=CGSizeMake(320, 175);
    informationScrollView.bounces=YES;
    informationScrollView.delegate=self;
    informationScrollView.exclusiveTouch=YES;
    informationScrollView.showsVerticalScrollIndicator=FALSE;
    informationScrollView.scrollEnabled=true;
    
    
    [appointmentTextField removeFromSuperview];
    appointmentTextField=nil;
    appointmentTextField = [[UITextField alloc] initWithFrame:CGRectMake(0,0, 320, 55)];
    appointmentTextField.delegate = self;
    appointmentTextField.backgroundColor = [UIColor whiteColor];
    appointmentTextField.textColor=[UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    appointmentTextField.textAlignment = NSTextAlignmentLeft;
    
    [appointmentTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,10, 20)];
    appointmentTextField.leftView = paddingView;
    appointmentTextField.leftViewMode = UITextFieldViewModeAlways;
    appointmentTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    appointmentTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [appointmentTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    appointmentTextField.autocapitalizationType = NO;
    appointmentTextField.userInteractionEnabled=FALSE;
    appointmentTextField.returnKeyType=UIReturnKeyNext;
    [informationScrollView addSubview:appointmentTextField];
   
    [AppointmentLable removeFromSuperview];
    AppointmentLable=nil;
    AppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 130, 30) ];
    AppointmentLable.text= [NSString stringWithFormat:@"   %@",@"Appointment Name"];
    AppointmentLable.textAlignment=NSTextAlignmentLeft;
    AppointmentLable.font = [UIFont fontWithName:helveticaRegular size:13];
    AppointmentLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    AppointmentLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:AppointmentLable];
    [self.view addSubview:informationScrollView];
    
    [consultantTextField removeFromSuperview];
    consultantTextField=nil;
    consultantTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+1, 320, 55)];
    consultantTextField.delegate = self;
    consultantTextField.textColor=[UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    consultantTextField.backgroundColor=[UIColor whiteColor];
    consultantTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    consultantTextField.leftView = paddingView;
    [appointmentTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    consultantTextField.leftViewMode = UITextFieldViewModeAlways;
    consultantTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    consultantTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [consultantTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    consultantTextField.autocapitalizationType = NO;
    consultantTextField.userInteractionEnabled=FALSE;
    consultantTextField.returnKeyType=UIReturnKeyNext;
    [informationScrollView addSubview:consultantTextField];
    

    [ConsultantLable removeFromSuperview];
    ConsultantLable=nil;
    ConsultantLable=[[UILabel alloc]initWithFrame:CGRectMake(0, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+1, 125, 30) ];
    ConsultantLable.text= [NSString stringWithFormat:@"   %@",@"Consultant Name"];
    ConsultantLable.textAlignment=NSTextAlignmentLeft;
    ConsultantLable.font = [UIFont fontWithName:helveticaRegular size:13];
    ConsultantLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    ConsultantLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:ConsultantLable];
    
    [AppointmentDatePicker removeFromSuperview];
    AppointmentDatePicker=nil;
    AppointmentDatePicker  = [[UIDatePicker alloc]init];
    [AppointmentDatePicker setMinimumDate:[NSDate date]];
    [AppointmentDatePicker setFrame:CGRectMake(100, 518, 320, 100)];
    AppointmentDatePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               target:nil
                                               action:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    doneButton.width = 50;
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    
    [dateTextField removeFromSuperview];
    dateTextField=nil;
    dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+1, 320, 55)];
    dateTextField.delegate = self;
    dateTextField.textColor=[UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    dateTextField.backgroundColor = [UIColor whiteColor];
    dateTextField.tag=108;
    dateTextField.textAlignment = NSTextAlignmentLeft;
    [dateTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
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
    [informationScrollView addSubview:dateTextField];
    
    [DateLable removeFromSuperview];
    DateLable=nil;
    DateLable=[[UILabel alloc]initWithFrame:CGRectMake(0, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+1, 125, 30) ];
    DateLable.text= [NSString stringWithFormat:@"   %@",@"Date"];
    DateLable.textAlignment=NSTextAlignmentLeft;
    DateLable.font = [UIFont fontWithName:helveticaRegular size:13];
    DateLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    DateLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:DateLable];
    
    [hospitalTextField removeFromSuperview];
    hospitalTextField=nil;
    hospitalTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 320, 55)];
    hospitalTextField.delegate = self;
    hospitalTextField.textColor=[UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    hospitalTextField.backgroundColor = [UIColor whiteColor];
    hospitalTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    hospitalTextField.leftView = paddingView;
    hospitalTextField.leftViewMode = UITextFieldViewModeAlways;
    [hospitalTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    hospitalTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    hospitalTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [hospitalTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    hospitalTextField.autocapitalizationType = NO;
    hospitalTextField.userInteractionEnabled=FALSE;
    hospitalTextField.returnKeyType=UIReturnKeyNext;
    [informationScrollView addSubview:hospitalTextField];
    
    [HospitalLable removeFromSuperview];
    HospitalLable=nil;
    HospitalLable=[[UILabel alloc]initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 125, 30) ];
    HospitalLable.text= [NSString stringWithFormat:@"   %@",@"Hospital Name"];
    HospitalLable.textAlignment=NSTextAlignmentLeft;
    HospitalLable.font = [UIFont fontWithName:helveticaRegular size:13];
    HospitalLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    HospitalLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:HospitalLable];
    

    [AppointtypeTextField removeFromSuperview];
    AppointtypeTextField=nil;
    AppointtypeTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, hospitalTextField.frame.size.height+hospitalTextField.frame.origin.y+1, 160, 55)];
    AppointtypeTextField.delegate = self;
    AppointtypeTextField.textColor=[UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    AppointtypeTextField.backgroundColor = [UIColor whiteColor];
    AppointtypeTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    AppointtypeTextField.leftView = paddingView;
    AppointtypeTextField.leftViewMode = UITextFieldViewModeAlways;
    [AppointtypeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    AppointtypeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    AppointtypeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AppointtypeTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    AppointtypeTextField.userInteractionEnabled=FALSE;
    AppointtypeTextField.autocapitalizationType = NO;
    AppointtypeTextField.returnKeyType=UIReturnKeyNext;
    [informationScrollView addSubview:AppointtypeTextField];
    
    [AppointmentTypeLable removeFromSuperview];
    AppointmentTypeLable=nil;
    AppointmentTypeLable=[[UILabel alloc]initWithFrame:CGRectMake(0, hospitalTextField.frame.size.height+hospitalTextField.frame.origin.y+1, 125, 30) ];
    AppointmentTypeLable.text= [NSString stringWithFormat:@"   %@",@"Type"];
    AppointmentTypeLable.textAlignment=NSTextAlignmentLeft;
    AppointmentTypeLable.font = [UIFont fontWithName:helveticaRegular size:13];
    AppointmentTypeLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    AppointmentTypeLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:AppointmentTypeLable];
    

    [AppointtypeProivderTextField removeFromSuperview];
    AppointtypeProivderTextField=nil;
    AppointtypeProivderTextField = [[UITextField alloc] initWithFrame:CGRectMake(AppointtypeTextField.frame.size.width+AppointtypeTextField.frame.origin.x+1, AppointtypeTextField.frame.size.height+hospitalTextField.frame.origin.y+1, 160, 55)];
    AppointtypeProivderTextField.delegate = self;
    AppointtypeProivderTextField.textColor=[UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    AppointtypeProivderTextField.backgroundColor = [UIColor whiteColor];
    AppointtypeProivderTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    AppointtypeProivderTextField.leftView = paddingView;
    AppointtypeProivderTextField.userInteractionEnabled=FALSE;
    AppointtypeProivderTextField.leftViewMode = UITextFieldViewModeAlways;
    [AppointtypeProivderTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    AppointtypeProivderTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    AppointtypeProivderTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [AppointtypeProivderTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    AppointtypeProivderTextField.autocapitalizationType = NO;
    AppointtypeProivderTextField.returnKeyType=UIReturnKeyNext;
    [informationScrollView addSubview:AppointtypeProivderTextField];
    
    [AppointmentProivderLable removeFromSuperview];
    AppointmentProivderLable=nil;
    AppointmentProivderLable=[[UILabel alloc]initWithFrame:CGRectMake(AppointtypeTextField.frame.size.width+AppointtypeTextField.frame.origin.x, hospitalTextField.frame.size.height+hospitalTextField.frame.origin.y+1, 125, 30) ];
    AppointmentProivderLable.text= [NSString stringWithFormat:@"   %@",@"Provider"];
    AppointmentProivderLable.textAlignment=NSTextAlignmentLeft;
    AppointmentProivderLable.font = [UIFont fontWithName:helveticaRegular size:13];
    AppointmentProivderLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    AppointmentProivderLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:AppointmentProivderLable];
  
    [self.view addSubview:informationScrollView];
    [NoteStaticLable removeFromSuperview];
    NoteStaticLable=nil;
    NoteStaticLable=[[UILabel alloc]initWithFrame:CGRectMake(0, informationScrollView.frame.size.height+informationScrollView.frame.origin.y , 320 , 45)];
    NoteStaticLable.text=@"    Notes";
    NoteStaticLable.textAlignment=NSTextAlignmentLeft;
    NoteStaticLable.backgroundColor=[UIColor whiteColor];
    NoteStaticLable.font=[UIFont fontWithName:helveticaRegular size:15];
    NoteStaticLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    [self.view addSubview:NoteStaticLable];
    
    
    NSString *descriptionString;
    
    NSString *abc=[[NSUserDefaults standardUserDefaults] valueForKey:@"TapFlagVriable"];
    int test=[[NSString stringWithFormat:@"%@",abc] integerValue];
//    
//    [attachmentCollectionView removeFromSuperview];
//    attachmentCollectionView = nil;
//    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
//    attachmentCollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10, 440, 300, 128)collectionViewLayout:layout];
//    attachmentCollectionView.backgroundColor=[UIColor clearColor];
//    attachmentCollectionView.delegate=self;
//    attachmentCollectionView.dataSource = self;
//    attachmentCollectionView.tag=8520;
//    attachmentCollectionView.hidden = NO;
//    [attachmentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
//    [self.view addSubview:attachmentCollectionView];
    
    
    // MEDICAL RECORDS
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
        arrayofAttachmentsComingFromServer = [[[NSUserDefaults standardUserDefaults] valueForKey:kMedicalRecordAttachments]valueForKey:@"attachment"];
        NSLog(@"attachmentArray is %@",arrayofAttachmentsComingFromServer);
        [attachmentCollectionView reloadData];
        
    }
    // APPOINTMENT
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
        
        
        NSLog(@"kAppointmentmentAttachmentString=%@",[[[NSUserDefaults standardUserDefaults] objectForKey:kAppointmentmentAttachmentString] valueForKey:@"attachment"]);
        arrayofAttachmentsComingFromServer = [[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentAttachmentString] valueForKey:@"attachment"];
        arrayofAttachmentsIdsComingFromServer=[[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentAttachmentString] valueForKey:@"id"];
        NSLog(@"arrayofAttachmentsComingFromServer is>>>>> %@",arrayofAttachmentsComingFromServer);
        NSLog(@"arrayofAttachmentsIdsComingFromServer is>>>> %@",arrayofAttachmentsIdsComingFromServer);
        [attachmentCollectionView reloadData];
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
    if(height <20)
    {
        height=40;
    }
    BioView.frame=CGRectMake(0, NoteStaticLable.frame.size.height+NoteStaticLable.frame.origin.y, 320, height);
    BioView.backgroundColor=[UIColor whiteColor];
    BioView.textColor=[UIColor blackColor];
    BioView.delegate=self;
    BioView.text=descriptionString;
    BioView.textAlignment=NSTextAlignmentLeft;
    BioView.returnKeyType=UIReturnKeyDone;
    BioView.userInteractionEnabled=FALSE;
    [self.view addSubview:BioView];
    
    UILabel  *AttachmentsStaticLable=[[UILabel alloc]initWithFrame:CGRectMake(0, BioView.frame.size.height+BioView.frame.origin.y+1 , 320 , 45)];
    AttachmentsStaticLable.text=@"   Attachments";
    AttachmentsStaticLable.backgroundColor=[UIColor whiteColor];
    AttachmentsStaticLable.font=[UIFont fontWithName:helveticaRegular size:15];
    AttachmentsStaticLable.textColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    [self.view addSubview:AttachmentsStaticLable];

}
-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}
-(void)BackButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
