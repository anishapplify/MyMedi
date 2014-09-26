//
//  AddMedicalRecordViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/10/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "AddMedicalRecordViewController.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.2;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.1;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 170;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

@interface AddMedicalRecordViewController ()
{
    AsyncImageView *thumbImageViewForVideo;
    
    UIImage *thumbImageOfVideo;
    NSString *path;
    NSData *imageData;
    UIButton *transparentButtonForVideo;
    UIButton *BackButton;
    UIButton *DoneButton;
    NSURL *urlofVideoToBeUpload;
    UIView *TopBarView;
    UIButton *transparentButtonForImage;
    UIButton *TypeButton;
    UIButton *ProviderButton;
    UIButton *InformationButton;
    UIButton *NotesButton;
    UIButton *AttachmentButton;
    UIImageView *largeImageView;
    UIButton *closeButton;
    UILabel*NewAppointmentLable;
    UIView *lineView;
    UIImagePickerController *groupPhotoPicker;
    UITableView *TypeTableView;
    UITableView *ProviderTableView;
    NSString *savedvedioPath;
    int typeStatus;
    int purposeStatus;
    int informationStatus;
    int notesStatus;
    int attachmentsStatus;
    
    AsyncImageView *largeImageView1;
    UIDatePicker *AppointmentDatePicker;
    UIScrollView *informationScrollView;
    UIScrollView *informationbottomScrollView;
    MPMoviePlayerController * moviePlayer;
    UITextField *appointmentTextField;
    UITextField *consultantTextField;
    UITextField *dateTextField;
    UITextField *hospitalTextField;
    
    UIView *appointmentnameLine;
    
    
    UILabel *AppointmentLable;
    UILabel *ConsultantLable;
    UILabel *DateLable;
    UILabel *TimeLable;
    UILabel *HospitalLable;
    
    UITextView *NotesTextView;
    UIButton*TypeValuesShowButton;
    UIButton*ProviderValuesShowButton;
    UIView *paddingView;
    UIButton *plusButton;
    UIButton *transparentButtonForVideo1;
    
    UIImageView *InformationImageView;
    UIImageView *TypeImageView;
    UIImageView *ProviderImageView;
    UIImageView *NotesImageView;
    UIImageView *AttachmentsImageView;
    UIImageView *thumbImageView;
    
    int height;
    int heightProvider;
    UILabel *TypeTitleLable;
    UILabel *ProviderTitleLable;
    UIButton *transparentButtonForImage1;
    int TypeTagValue;
    int ProiverTagValue;
    CGFloat animatedDistance;
    int  intTypeServerCall;
    ASIFormDataRequest *RequestForSync;
    BOOL attachedFileTrue;
    BOOL attachedVideoFileTrue;
    
    UICollectionView *attachmentCollectionView;
    NSMutableArray *arrayofAttachmentsComingFromServer;
    NSMutableArray *arrayofAttachmentsIdsComingFromServer;
    UIView *attachmentView;
    AsyncImageView *thumbImageView123;
    UIButton *removeButton;
    
    int deleteImage;
    NSString *deleteValueString;
    NSMutableArray *deleteValueArray;
    NSMutableArray *arrayForGeneratingThumbnail;
}

@end

@implementation AddMedicalRecordViewController

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
    
    self.view.backgroundColor=[UIColor colorWithRed:241/255.0 green:245/255.0 blue:246/255.0 alpha:1.0];
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    [BackButton removeFromSuperview];
    BackButton=nil;
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"back_Button_image.png"].size.width ,[UIImage imageNamed:@"back_Button_image.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setImage:[UIImage imageNamed:@"back_Button_image.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    [NewAppointmentLable removeFromSuperview];
    NewAppointmentLable=nil;
    NewAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 170, 30)];
    NewAppointmentLable.textColor= [UIColor whiteColor];
    NewAppointmentLable.textAlignment=NSTextAlignmentCenter;
    NewAppointmentLable.text=@"New Medical Records";
    NewAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:15];
    [TopBarView addSubview:NewAppointmentLable];
    
    [DoneButton removeFromSuperview];
    DoneButton=nil;
    DoneButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20, [UIImage imageNamed:@"doneCheck.png"].size.width, [UIImage imageNamed:@"doneCheck.png"].size.height)];
    DoneButton.backgroundColor=[UIColor clearColor];
    [DoneButton setBackgroundImage:[UIImage imageNamed:@"doneCheck.png"] forState:UIControlStateNormal];
    [DoneButton addTarget:self action:@selector(DoneButtonFuction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:DoneButton];
    DoneButton.exclusiveTouch=YES;
    [self.view addSubview:TopBarView];
    [self informationScrollAction];
}
-(void)informationScrollAction
{
    [informationScrollView removeFromSuperview];
    informationScrollView=nil;
    informationScrollView=[[UIScrollView alloc]init];
    informationScrollView.hidden=NO;
    informationScrollView.frame=CGRectMake(0,80, 320, 221);
    informationScrollView.backgroundColor=[UIColor whiteColor];
    informationScrollView.contentSize=CGSizeMake(320, 192);
    informationScrollView.bounces=YES;
    informationScrollView.delegate=self;
    informationScrollView.exclusiveTouch=YES;
    informationScrollView.showsVerticalScrollIndicator=FALSE;
    informationScrollView.scrollEnabled=true;
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [informationScrollView addGestureRecognizer:tapRecognizer];
    
    
    [appointmentTextField removeFromSuperview];
    appointmentTextField=nil;
    appointmentTextField = [[UITextField alloc] initWithFrame:CGRectMake(135,15, 165, 40)];
    appointmentTextField.backgroundColor=[UIColor clearColor];
    appointmentTextField.delegate = self;
    appointmentTextField.textColor=[UIColor lightGrayColor];
    [appointmentTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    appointmentTextField.leftView = paddingView;
    appointmentTextField.leftViewMode = UITextFieldViewModeAlways;
    appointmentTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [appointmentTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    appointmentTextField.autocapitalizationType = NO;
    [appointmentTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:appointmentTextField];
    
    [appointmentnameLine removeFromSuperview];
    appointmentnameLine=nil;
    appointmentnameLine=[[UIView alloc]initWithFrame:CGRectMake(20, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+15, 1)];
    appointmentnameLine.layer.borderColor = [UIColor colorWithRed:123/255.0 green:221/255.0 blue:254/255.0 alpha:1.0].CGColor;;
    appointmentnameLine.layer.borderWidth = 0.5f;
    appointmentnameLine.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:appointmentnameLine];
    
    [AppointmentLable removeFromSuperview];
    AppointmentLable=nil;
    AppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(10, 15, 130, 40) ];
    AppointmentLable.text= [NSString stringWithFormat:@"   %@",@"Appointment Name"];
    AppointmentLable.textAlignment=NSTextAlignmentLeft;
    AppointmentLable.font = [UIFont fontWithName:@"MuseoSans-300" size:13];
    AppointmentLable.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    AppointmentLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:AppointmentLable];
    
    
    [consultantTextField removeFromSuperview];
    consultantTextField=nil;
    consultantTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+15, 165, 40)];
    consultantTextField.delegate = self;
    consultantTextField.textColor=[UIColor lightGrayColor];
    consultantTextField.backgroundColor=[UIColor clearColor];
    consultantTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    consultantTextField.leftView = paddingView;
    [consultantTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    consultantTextField.leftViewMode = UITextFieldViewModeAlways;
    consultantTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    consultantTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [consultantTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    consultantTextField.autocapitalizationType = NO;
    [informationScrollView addSubview:consultantTextField];
    
    
    UIView *consultantLine=[[UIView alloc]initWithFrame:CGRectMake(20, consultantTextField.frame.size.height+consultantTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+10, 1)];
    consultantLine.layer.borderColor = [UIColor colorWithRed:123/255.0 green:221/255.0 blue:254/255.0 alpha:1.0].CGColor;;
    consultantLine.layer.borderWidth = 0.5f;
    consultantLine.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:consultantLine];
    
    
    [ConsultantLable removeFromSuperview];
    ConsultantLable=nil;
    
    ConsultantLable=[[UILabel alloc]initWithFrame:CGRectMake(10, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+15, 125, 40) ];
    ConsultantLable.text= [NSString stringWithFormat:@"   %@",@"Consultant Name"];
    ConsultantLable.font = [UIFont fontWithName:@"MuseoSans-300" size:13];
    ConsultantLable.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
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
    
    UIBarButtonItem *doneButton;
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditAppointmentPressed"]==true)
    {
        doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    }
    else
    {
        doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Next" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    }
    
    doneButton.width = 50;
    
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    
    [dateTextField removeFromSuperview];
    dateTextField=nil;
    dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(135, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+15, 170, 40)];
    dateTextField.delegate = self;
    dateTextField.textColor=[UIColor lightGrayColor];
    dateTextField.backgroundColor = [UIColor clearColor];
    dateTextField.tag=108;
    [dateTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    dateTextField.leftView = paddingView;
    dateTextField.leftViewMode = UITextFieldViewModeAlways;
    dateTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    dateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [dateTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    dateTextField.autocapitalizationType = NO;
    [dateTextField setInputView:AppointmentDatePicker];
    [dateTextField setInputAccessoryView:toolbar];
    [informationScrollView addSubview:dateTextField];
    
    UIView *DateLine=[[UIView alloc]initWithFrame:CGRectMake(20, dateTextField.frame.size.height+dateTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+15, 1)];
    DateLine.layer.borderColor = [UIColor colorWithRed:123/255.0 green:221/255.0 blue:254/255.0 alpha:1.0].CGColor;;
    DateLine.layer.borderWidth = 0.5f;
    DateLine.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:DateLine];
    
    
    [DateLable removeFromSuperview];
    DateLable=nil;
    DateLable=[[UILabel alloc]initWithFrame:CGRectMake(15, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+15, 125, 40) ];
    DateLable.text= [NSString stringWithFormat:@"   %@",@"Date"];
    DateLable.textAlignment=NSTextAlignmentLeft;
    DateLable.font = [UIFont fontWithName:@"MuseoSans-300" size:13];
    DateLable.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    DateLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:DateLable];
    
    
    hospitalTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, dateTextField.frame.size.height+dateTextField.frame.origin.y+15, 165, 40)];
    hospitalTextField.delegate = self;
    hospitalTextField.textColor=[UIColor lightGrayColor];
    hospitalTextField.backgroundColor = [UIColor clearColor];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    hospitalTextField.leftView = paddingView;
    hospitalTextField.leftViewMode = UITextFieldViewModeAlways;
    [hospitalTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    hospitalTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    hospitalTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [hospitalTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    hospitalTextField.returnKeyType=UIReturnKeyDone;
    hospitalTextField.autocapitalizationType = NO;
    [hospitalTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:hospitalTextField];
    
    UIView *HostpitalLine=[[UIView alloc]initWithFrame:CGRectMake(20, hospitalTextField.frame.size.height+hospitalTextField.frame.origin.y, [UIImage imageNamed:@"mymediloginbutton.png"].size.width+15, 1)];
    HostpitalLine.layer.borderColor = [UIColor colorWithRed:123/255.0 green:221/255.0 blue:254/255.0 alpha:1.0].CGColor;;
    HostpitalLine.layer.borderWidth = 0.5f;
    HostpitalLine.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:HostpitalLine];
    
    [HospitalLable removeFromSuperview];
    HospitalLable=nil;
    HospitalLable=[[UILabel alloc]initWithFrame:CGRectMake(20, dateTextField.frame.size.height+dateTextField.frame.origin.y+10, 125, 40) ];
    HospitalLable.text= [NSString stringWithFormat:@"   %@",@"Hospital Name"];
    HospitalLable.textAlignment=NSTextAlignmentLeft;
    HospitalLable.font = [UIFont fontWithName:@"MuseoSans-300" size:13];
    HospitalLable.textColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    HospitalLable.backgroundColor = [UIColor clearColor];
    [informationScrollView addSubview:HospitalLable];
    
    [self.view addSubview:informationScrollView];
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditAppointmentPressed"]==true)
    {
        appointmentTextField.returnKeyType=UIReturnKeyDone;
        consultantTextField.returnKeyType=UIReturnKeyDone;
        dateTextField.returnKeyType=UIReturnKeyDone;
    }
    else
    {
        appointmentTextField.returnKeyType=UIReturnKeyNext;
        consultantTextField.returnKeyType=UIReturnKeyNext;
        dateTextField.returnKeyType=UIReturnKeyNext;
    }
    
    [informationbottomScrollView removeFromSuperview];
    informationbottomScrollView=nil;
    
    informationbottomScrollView=[[UIScrollView alloc]init];
    informationbottomScrollView.hidden=NO;
    informationbottomScrollView.frame=CGRectMake(0,informationScrollView.frame.size.height+informationScrollView.frame.origin.y+10, 320, 260);
    informationbottomScrollView.backgroundColor=[UIColor whiteColor];
    informationbottomScrollView.contentSize=CGSizeMake(320, 192);
    informationbottomScrollView.bounces=YES;
    informationbottomScrollView.delegate=self;
    informationbottomScrollView.exclusiveTouch=YES;
    informationbottomScrollView.showsVerticalScrollIndicator=FALSE;
    informationbottomScrollView.scrollEnabled=true;
    
    
    [TypeButton removeFromSuperview];
    TypeButton=nil;
    TypeButton=[[UIButton alloc]init];
    TypeButton.frame=CGRectMake(0, 0, [UIImage imageNamed:@"listviewsbutton.png"].size.width, [UIImage imageNamed:@"listviewsbutton.png"].size.height);
    [TypeButton addTarget:self action:@selector(typeAction) forControlEvents:UIControlEventTouchUpInside];
    [TypeButton setTitleColor:[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0] forState:UIControlStateNormal];
    [TypeButton setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    TypeButton.backgroundColor=[UIColor clearColor];
    TypeButton.titleLabel.font = [UIFont fontWithName:@"Europa-Regular" size: 13];
    TypeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [TypeButton setTitle:@"Type" forState:(UIControlState)UIControlStateNormal];
    TypeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    TypeButton.exclusiveTouch=YES;
    [informationbottomScrollView addSubview:TypeButton];
    
    
    [ProviderButton removeFromSuperview];
    ProviderButton=nil;
    ProviderButton=[[UIButton alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, [UIImage imageNamed:@"listviewsbutton.png"].size.width, [UIImage imageNamed:@"listviewsbutton.png"].size.height)];
    [ProviderButton addTarget:self action:@selector(ProviderAction) forControlEvents:UIControlEventTouchUpInside];
    [ProviderButton setTitleColor:[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0] forState:UIControlStateNormal];
    [ProviderButton setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    ProviderButton.backgroundColor=[UIColor clearColor];
    ProviderButton.titleLabel.font = [UIFont fontWithName:@"Europa-Regular" size: 13];
    ProviderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [ProviderButton setTitle:@"Provider" forState:(UIControlState)UIControlStateNormal];
    ProviderButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    ProviderButton.exclusiveTouch=YES;
    [informationbottomScrollView addSubview:ProviderButton];
    
    
    [NotesButton removeFromSuperview];
    NotesButton=nil;
    NotesButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, [UIImage imageNamed:@"listviewsbutton.png"].size.width, [UIImage imageNamed:@"listviewsbutton.png"].size.height)];
    [NotesButton addTarget:self action:@selector(notesAction) forControlEvents:UIControlEventTouchUpInside];
    [NotesButton setTitleColor:[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0] forState:UIControlStateNormal];
    [NotesButton setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    NotesButton.backgroundColor=[UIColor clearColor];
    NotesButton.titleLabel.font = [UIFont fontWithName:@"Europa-Regular" size: 13];
    NotesButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NotesButton setTitle:@"Notes" forState:(UIControlState)UIControlStateNormal];
    NotesButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    NotesButton.exclusiveTouch=YES;
    [informationbottomScrollView addSubview:NotesButton];
    
    
    [AttachmentButton removeFromSuperview];
    AttachmentButton=nil;
    
    
    AttachmentButton=[[UIButton alloc]initWithFrame:CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, [UIImage imageNamed:@"listviewsbutton.png"].size.width, [UIImage imageNamed:@"listviewsbutton.png"].size.height)];
    AttachmentButton.backgroundColor=[UIColor redColor];
    [AttachmentButton addTarget:self action:@selector(attachmentAction) forControlEvents:UIControlEventTouchUpInside];
    [AttachmentButton setBackgroundImage:[UIImage imageNamed:@"listviewsbutton.png"] forState:UIControlStateNormal];
    [AttachmentButton setTitleColor:[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0] forState:UIControlStateNormal];
    AttachmentButton.backgroundColor=[UIColor clearColor];
    AttachmentButton.titleLabel.font = [UIFont fontWithName:@"Europa-Regular" size: 13];
    AttachmentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [AttachmentButton setTitle:@"Attachments" forState:(UIControlState)UIControlStateNormal];
    AttachmentButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    AttachmentButton.exclusiveTouch=YES;
    [informationbottomScrollView addSubview:AttachmentButton];
    [self.view addSubview:informationbottomScrollView];
}
-(void)typeAction
{
    MedicalTypesViewController *typeview=[[MedicalTypesViewController  alloc]init];
    [self.navigationController pushViewController:typeview animated:YES];
}
-(void)ProviderAction
{
    MedicalProviderViewController *providerview=[[MedicalProviderViewController  alloc]init];
    [self.navigationController pushViewController:providerview animated:YES];
}
-(void)notesAction
{
    MedicalNotesViewController *notesview=[[MedicalNotesViewController  alloc]init];
    [self.navigationController pushViewController:notesview animated:YES];
}
#pragma mark attachmentAction
-(void)attachmentAction
{
    MedicalAttachmentsViewController *attachments=[[MedicalAttachmentsViewController  alloc]init];
    [self.navigationController pushViewController:attachments animated:YES];
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
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag==108)
    {
        dateTextField.text = [self formatDate:AppointmentDatePicker.date];
    }
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Bio"])
    {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    
    CGRect textFieldRect = [self.view.window convertRect:textView.bounds fromView:textView];
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
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""])
    {
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

-(IBAction)textFieldDoneEditing:(id)sender
{
}

-(void)BackButtonAction
{
    [self scrollViewDidTapped];
    [self endAnimation];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)DoneButtonFuction
{
    if(appointmentTextField.text.length<1)
    {
        [self scrollViewDidTapped];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the appointment name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
    }
    else if(consultantTextField.text.length<1){
        [self scrollViewDidTapped];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the consultant name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
    }
    else if(dateTextField.text.length<1){
        [self scrollViewDidTapped];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the date and time" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
    }
    else if (hospitalTextField.text.length<1){
        [self scrollViewDidTapped];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the hospital name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
    }
    else if(TypeTitleLable.text.length<1){
        [self scrollViewDidTapped];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the type name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
    }
    else
        if(ProviderTitleLable.text.length<1){
            [self scrollViewDidTapped];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter the Provider name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            alert = nil;
        }
        else
        {
            [self beforeDoneButtonAPICall ];
            [self ShowActivityIndicatorWithTitle:@"Loading..."];
            [self performSelector:@selector(serverCall) withObject:nil afterDelay:0.1];
        }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [TypeTitleLable removeFromSuperview];
    TypeTitleLable=nil;
    TypeTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(200,23,100,20)];
    TypeTitleLable.textColor = [UIColor darkGrayColor];
    TypeTitleLable.backgroundColor = [UIColor clearColor];
    TypeTitleLable.textAlignment = NSTextAlignmentLeft;
    TypeTitleLable.font = [UIFont fontWithName:@"MuseoSans-300" size:15];
    TypeTitleLable.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"setMedicalTypeValueSelect"];
    [TypeButton addSubview:TypeTitleLable];
    
    [ProviderTitleLable removeFromSuperview];
    ProviderTitleLable=nil;
    ProviderTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(200,23,100,20)];
    ProviderTitleLable.textColor = [UIColor darkGrayColor];
    ProviderTitleLable.backgroundColor = [UIColor clearColor];
    ProviderTitleLable.textAlignment = NSTextAlignmentLeft;
    ProviderTitleLable.font = [UIFont fontWithName:@"MuseoSans-300" size:15];
    ProviderTitleLable.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"setMedicalProviderValueSelect"];
    [ProviderButton addSubview:ProviderTitleLable];
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

-(void)keyboardWillShow
{
    CGFloat heightofKeyboard = 60;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    [informationScrollView  setContentInset:insets];
    [informationScrollView setScrollIndicatorInsets:insets];
}
-(void)keyboardWillHide
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    [informationScrollView setContentInset:insets];
    [informationScrollView setScrollIndicatorInsets:insets];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"isEditAppointmentPressed"]==true)
    {
        if ([textField canResignFirstResponder])
        {
            [textField resignFirstResponder];
        }
    }
    else
    {
        if (textField == appointmentTextField)
        {
            [consultantTextField becomeFirstResponder];
            return NO;
        }
        else if (textField == consultantTextField)
        {
            [dateTextField becomeFirstResponder];
            return NO;
        }
        else if (textField == dateTextField)
        {
            [hospitalTextField becomeFirstResponder];
            return NO;
        }
        else
        {
            [textField resignFirstResponder];
        }
    }
    return YES;
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField.tag==108 || textField.tag==109 )
    {
        return NO;
    }
    return YES;
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

#pragma mark Server Call Main

-(void)serverCall
{
    NSLog(@"intTypeServerCall=%d",intTypeServerCall);
    NSLog(@"AppointmentIdGetValue=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"AppointmentIdGetValue"]);
    [self scrollViewDidTapped];
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@/create_or_edit_user_appointment",kBaseUrl]];
    RequestForSync = [ASIFormDataRequest requestWithURL:url];
    [RequestForSync setTimeOutSeconds:300];
    RequestForSync.delegate=self;
    [RequestForSync setRequestMethod:@"POST"];
    
    [RequestForSync setPostValue:[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"] forKey:@"accesstoken"];
    [RequestForSync setPostValue:appointmentTextField.text forKey:@"appointmentname"];
    [RequestForSync setPostValue:consultantTextField.text forKey:@"consultantname"];
    [RequestForSync setPostValue:dateTextField.text forKey:@"datetime"];
    [RequestForSync setPostValue:hospitalTextField.text forKey:@"hospital"];
    [RequestForSync setPostValue:[NSString stringWithFormat:@"%d",TypeTagValue] forKey:@"appointmenttype"];
    [RequestForSync setPostValue:[NSString stringWithFormat:@"%d",ProiverTagValue] forKey:@"provider"];
    [RequestForSync setPostValue:NotesTextView.text forKey:@"notes"];
    NSLog(@"intTypeServerCall=%d",intTypeServerCall);
    [RequestForSync setPostValue:[NSString stringWithFormat:@"%d",intTypeServerCall] forKey:@"type"];
    [RequestForSync setPostValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"AppointmentIdGetValue"] forKey:@"appointmentid"];
    
    NSLog(@"deleteValueString is %@",deleteValueString);
    //Delete key
    [RequestForSync setPostValue:deleteValueString forKey:@"removeattachmentids"];
    
    NSLog(@"arrayofAttachmentsComingFromServer=%@",arrayofAttachmentsComingFromServer);
    //    if(arrayofAttachmentsComingFromServer.count>0)
    //    {
    
    
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isAttachmentAddedByUserinAddAppointment"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    int count = 0;
    for (int i=0; i<arrayofAttachmentsComingFromServer.count; i++)
    {
        if ([[arrayofAttachmentsComingFromServer objectAtIndex:i] hasPrefix:@"http://"])
        {
            
        }
        else
        {
            count++;
        }
    }
    
    if (count==0)
    {
        count=0;
    }
    else if (count == 1)
    {
        count=1;
    }
    else
    {
        count=2;
    }
    
    [RequestForSync setPostValue:[NSString stringWithFormat:@"%d",count] forKey:@"attachmenttype"];
    
    if (arrayofAttachmentsComingFromServer.count==1)        // IF ATTACHMENT == 1
    {
        if ([[arrayofAttachmentsComingFromServer objectAtIndex:0] hasPrefix:@"http://"])
        {}
        else
        {
            [RequestForSync setFile: [arrayofAttachmentsComingFromServer objectAtIndex:0] forKey:@"attachment"];
        }
    }
    else             // IF ATTACHMENT == 2
    {
        for (int i=0; i<arrayofAttachmentsComingFromServer.count; i++)
        {
            if ([[arrayofAttachmentsComingFromServer objectAtIndex:i] rangeOfString:@".png"].location != NSNotFound)
            {
                //image
                NSLog(@"arrayofAttachmentsComingFromServer=%@",[arrayofAttachmentsComingFromServer objectAtIndex:i]);
                if ([[arrayofAttachmentsComingFromServer objectAtIndex:i] hasPrefix:@"http://"])
                {}
                else
                {
                    NSLog(@"myArray is %@",[arrayofAttachmentsComingFromServer objectAtIndex:i]);
                    [RequestForSync addFile:[arrayofAttachmentsComingFromServer objectAtIndex:i] forKey:@"attachment"];
                }
            }
            else
            {
                // video
                if ([[arrayofAttachmentsComingFromServer objectAtIndex:i] hasPrefix:@"http://"])
                {}
                else
                {
                    [RequestForSync setFile:[arrayofAttachmentsComingFromServer objectAtIndex:i] forKey:@"attachment"];
                }
            }
        }
    }
    
    RequestForSync.tag = 20001;
    [RequestForSync startSynchronous];
    
}
- (void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"starteeeddd");
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"%@",error);
    [self HideActivityIndicator];
    
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    if(request.tag==20001)
    {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[RequestForSync responseData] options:kNilOptions error:nil];
        
        [[NSUserDefaults standardUserDefaults] setObject:json forKey:kAppointmentData];
        NSLog(@"kAppointmentData=%@",[[NSUserDefaults standardUserDefaults]objectForKey:kAppointmentData]);
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isNewAppointmentCreatedByUser"];
        
        UIAlertView *complete=[[UIAlertView alloc]initWithTitle:nil  message:@"Done" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        complete.tag = 111;
        [complete show];
    }
    [self HideActivityIndicator];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 111)
    {
        NSArray *viewContrlls=[[self navigationController] viewControllers];
        for( int i=0;i<[ viewContrlls count];i++)
        {
            id obj=[viewContrlls objectAtIndex:i];
            if([obj isKindOfClass:[AddAppointmentViewController class]])
            {
                [[self navigationController] popToViewController:obj animated:YES];
                return;
            }
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void) endAnimation
{
    informationStatus=1;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch");
    
    UITouch* touch =[touches anyObject];
    if([touch view] == (UIView *)[self.view viewWithTag:8520])
    {
        NSLog(@"66256565656");
    }
    else
    {
        transparentButtonForImage.userInteractionEnabled = false;
        transparentButtonForImage1.userInteractionEnabled = false;
        transparentButtonForVideo1.userInteractionEnabled = false;
        
        thumbImageViewForVideo.hidden=YES;
        thumbImageView.hidden=YES;
        transparentButtonForImage.hidden =YES;
        transparentButtonForVideo.hidden = YES;
        attachmentView.hidden=YES;
        informationStatus=1;
    }
}

-(void) beforeDoneButtonAPICall
{
    thumbImageViewForVideo.hidden=YES;
    
    transparentButtonForImage.userInteractionEnabled = false;
    transparentButtonForImage1.userInteractionEnabled = false;
    transparentButtonForVideo1.userInteractionEnabled = false;
    
    thumbImageView.hidden=YES;
    attachmentView.hidden=YES;
    transparentButtonForImage.hidden = YES;
    transparentButtonForVideo.hidden = YES;
    
    informationStatus=1;

}
-(void)scrollViewDidTapped
{
    attachmentView.hidden=YES;
    thumbImageViewForVideo.hidden=YES;
    thumbImageView.hidden=YES;
    transparentButtonForImage.hidden = YES;
    transparentButtonForVideo.hidden = YES;
    
    [appointmentTextField  resignFirstResponder];
    
    transparentButtonForImage1.userInteractionEnabled = NO;
    transparentButtonForVideo1.userInteractionEnabled = false;
    
    [dateTextField resignFirstResponder];
    [hospitalTextField resignFirstResponder];
    [consultantTextField resignFirstResponder];
    [NotesTextView resignFirstResponder];
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
