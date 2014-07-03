//
//  MedicalRecordsHomeViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 19/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "MedicalRecordsHomeViewController.h"

@interface MedicalRecordsHomeViewController ()<UIGestureRecognizerDelegate,UIDynamicAnimatorDelegate>{
    
    
    UIView*TopBarView;
    UIButton *BackButton;

    UIView*SortButtonView;
    UIButton *TypeButton;
    UIButton *HealthCareButton;
    UIButton *DateButton;
    int SortButtonFlag;
    UIPushBehavior* pushBehavior;
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravityBehaviour;
    UIAttachmentBehavior *panAttachmentBehaviour;

    int typeButtonFlag;
    int dateButtonFlag;
    int healthCareFlag;
    UIDatePicker *dateTimePicker;
    UIDatePicker *EnddateTimePicker;
    UITextField *StartDateTextField;
    UITextField *EndDateTextField;
    
    UILabel *StartDateTextLable;
    UILabel *EndDateTextLable;
    
    UIButton *DoneButton;
    
    UIImageView *BackGroundImageView;
    

    UIButton *ProviderButton;
    UIButton *InformationButton;
    UIButton *NotesButton;
    UIButton *AttachmentButton;
    
    UILabel*NewMedicalRecordLable;
    UIView *lineView;
    
    
    UITableView *TypeTableView;
    UITableView *ProviderTableView;
    
    int typeStatus;
    int purposeStatus;
    int informationStatus;
    int notesStatus;
    int attachmentsStatus;
    
    
    UIDatePicker *AppointmentDatePicker;
    UIDatePicker *AppointmentTimePicker;
    UIScrollView *informationScrollView;
    
    UITextField *appointmentTextField;
    UITextField *consultantTextField;
    UITextField *dateTextField;
    UITextField *timeTextField;
    UITextField *hospitalTextField;
    
    MFUnderlinedTextView *NotesTextView;
    UIButton*TypeValuesShowButton;
    
       UIView *paddingView;
    
    
}

@end

@implementation MedicalRecordsHomeViewController

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

    self.view.backgroundColor=[UIColor colorWithRed:224/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,60)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    UIImage * backImg = [UIImage imageNamed:@"back_mymediNew.png"];
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(5,25,backImg.size.width, backImg.size.height);
    [BackButton setImage:backImg forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    
    lineView=[[UIView alloc]initWithFrame:CGRectMake(265,30,1,20)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView];
    
    
//    NextViewControllerButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 18,60 ,50)];
//    NextViewControllerButton.backgroundColor=[UIColor clearColor];
//    [NextViewControllerButton setTitle:@"Next" forState:UIControlStateNormal];
//    [NextViewControllerButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
//    [NextViewControllerButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    NextViewControllerButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    [NextViewControllerButton addTarget:self action:@selector(nextviewController) forControlEvents:UIControlEventTouchUpInside];
//    [TopBarView addSubview:NextViewControllerButton];
    
    
    DoneButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 18,60 ,50)];
    DoneButton.backgroundColor=[UIColor clearColor];
    [DoneButton setTitle:@"Done" forState:UIControlStateNormal];
    [DoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [DoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    DoneButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [DoneButton addTarget:self action:@selector(DoneButtonFuction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:DoneButton];
    
    
    
    [self.view addSubview:TopBarView];
    
    
  
    UIImage *BackGroundImage=[UIImage imageNamed:@"Back_pattern.png"];
    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, BackGroundImage.size.width, BackGroundImage.size.height)];
    BackGroundImageView.backgroundColor=[UIColor clearColor];
    BackGroundImageView.image=BackGroundImage;
    BackGroundImageView.userInteractionEnabled=TRUE;
    
    [self setMaskTo:BackGroundImageView byRoundingCorners:UIRectCornerTopLeft];
    
    
    NewMedicalRecordLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 150, 40)];
    NewMedicalRecordLable.text=@"New Medical Record";
    NewMedicalRecordLable.textColor=[UIColor colorWithRed:132/255.0 green:130/255.0 blue:136/255.0 alpha:1.0];
    NewMedicalRecordLable.textAlignment=NSTextAlignmentCenter;
    NewMedicalRecordLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
    [BackGroundImageView addSubview:NewMedicalRecordLable];
    
    lineView=[[UIView alloc]initWithFrame:CGRectMake(3,NewMedicalRecordLable.frame.origin.y+45,300,1)];
    lineView.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [BackGroundImageView addSubview:lineView];
    
    TypeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 302, 300, 40)];
    [TypeButton addTarget:self action:@selector(typeAction)
        forControlEvents:UIControlEventTouchUpInside];
    [TypeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    TypeButton.backgroundColor=[UIColor colorWithRed:161/255.0 green:207/255.0 blue:223/255.0 alpha:1.0];
    TypeButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    TypeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [TypeButton setTitle:@"Type" forState:(UIControlState)UIControlStateNormal];
    TypeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:TypeButton];
    
    
   ProviderButton=[[UIButton alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40)];
    [ProviderButton addTarget:self action:@selector(ProviderAction)
             forControlEvents:UIControlEventTouchUpInside];
    [ProviderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ProviderButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    ProviderButton.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
    ProviderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [ProviderButton setTitle:@"Provider" forState:(UIControlState)UIControlStateNormal];
    ProviderButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:ProviderButton];
    
    
 InformationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40)];
    [InformationButton addTarget:self action:@selector(InformationAction)
                forControlEvents:UIControlEventTouchUpInside];
    [InformationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    InformationButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:174/255.0 blue:216/255.0 alpha:1.0];
    InformationButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    InformationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [InformationButton setTitle:@"Information" forState:(UIControlState)UIControlStateNormal];
    InformationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:InformationButton];
    
   NotesButton=[[UIButton alloc]initWithFrame:CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40)];
    [NotesButton addTarget:self action:@selector(notesAction)
          forControlEvents:UIControlEventTouchUpInside];
    [NotesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NotesButton.backgroundColor=[UIColor colorWithRed:20/255.0 green:161/255.0 blue:211/255.0 alpha:1.0];
  NotesButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    NotesButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NotesButton setTitle:@"Notes" forState:(UIControlState)UIControlStateNormal];
    NotesButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:NotesButton];
    
    
  AttachmentButton=[[UIButton alloc]initWithFrame:CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 300, 40)];
    AttachmentButton.backgroundColor=[UIColor redColor];
    [AttachmentButton addTarget:self action:@selector(attachmentAction)
               forControlEvents:UIControlEventTouchUpInside];
    [AttachmentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AttachmentButton.backgroundColor=[UIColor colorWithRed:2/255.0 green:145/255.0 blue:195/255.0 alpha:1.0];
 AttachmentButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    AttachmentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [AttachmentButton setTitle:@"Attachments" forState:(UIControlState)UIControlStateNormal];
    AttachmentButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [BackGroundImageView addSubview:AttachmentButton];
    
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    [self.view addSubview:BackGroundImageView];
    
    

    
//    SortButtonView=[[UIView alloc]initWithFrame:CGRectMake(0, 440, self.view.frame.size.width, 120)];
//    SortButtonView.backgroundColor=[UIColor whiteColor];
//    SortButtonView.layer.shadowColor = [[UIColor blackColor] CGColor];
//    SortButtonView.layer.shadowOpacity = 1.0f;
//    SortButtonView.layer.shadowPath = [[UIBezierPath bezierPathWithRect:SortButtonView.bounds] CGPath];
//    SortButtonView.layer.shadowOffset = CGSizeZero;
//    SortButtonView.layer.shadowRadius = 5.0f;
//    
//    
//    TypeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
//    [TypeButton addTarget:self action:@selector(typeAction)
//         forControlEvents:UIControlEventTouchUpInside];
//    [TypeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    TypeButton.backgroundColor=[UIColor colorWithRed:64/255.0 green:68/255.0 blue:73/255.0 alpha:1.0];
//    TypeButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
//    TypeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [TypeButton setTitle:@"Type" forState:(UIControlState)UIControlStateNormal];
//    TypeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    TypeButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
//    TypeButton.layer.borderWidth = 1.0f;
//    [SortButtonView addSubview:TypeButton];
//    
//    
//    HealthCareButton=[[UIButton alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40)];
//    [HealthCareButton addTarget:self action:@selector(HealthCareAction)
//             forControlEvents:UIControlEventTouchUpInside];
//    [HealthCareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    HealthCareButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0];
//    HealthCareButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
//    HealthCareButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [HealthCareButton setTitle:@"Healthcare Provider" forState:(UIControlState)UIControlStateNormal];
//    HealthCareButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    HealthCareButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
//    HealthCareButton.layer.borderWidth = 1.0f;
//    [SortButtonView addSubview:HealthCareButton];
//    
//    
//    DateButton=[[UIButton alloc]initWithFrame:CGRectMake(0, HealthCareButton.frame.size.height+HealthCareButton.frame.origin.y, 320, 40)];
//    [DateButton addTarget:self action:@selector(DateButtonAction)
//                forControlEvents:UIControlEventTouchUpInside];
//    [DateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    DateButton.backgroundColor=[UIColor colorWithRed:129/255.0 green:136/255.0 blue:128/255.0 alpha:1.0];
//    DateButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
//    DateButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [DateButton setTitle:@"Date" forState:(UIControlState)UIControlStateNormal];
//    DateButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    DateButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
//    DateButton.layer.borderWidth = 1.0f;
//    [SortButtonView addSubview:DateButton];
//    
//    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
//    tapRecognizer.numberOfTapsRequired = 1;
//    [SortButtonView addGestureRecognizer:tapRecognizer];
//    
//    
//    dateTimePicker  = [[UIDatePicker alloc]init];
//    [dateTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
//    dateTimePicker.datePickerMode = UIDatePickerModeDate;
//    [dateTimePicker addTarget:self action:@selector(StartDateField) forControlEvents:UIControlEventValueChanged];
//    
//    EnddateTimePicker  = [[UIDatePicker alloc]init];
//    [EnddateTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
//    EnddateTimePicker.datePickerMode = UIDatePickerModeDate;
//    [EnddateTimePicker addTarget:self action:@selector(EndDateField) forControlEvents:UIControlEventValueChanged];
//    
//    
//    StartDateTextField = [[UITextField alloc] initWithFrame:CGRectMake(150, DateButton.frame.size.height+DateButton.frame.origin.y+40, 286-150, 20)];
//    StartDateTextField.delegate = self;
//    StartDateTextField.placeholder = @"Start Date";
//    StartDateTextField.textColor=[UIColor blackColor];
//    StartDateTextField.textAlignment = NSTextAlignmentCenter;
//    [StartDateTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
//    StartDateTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    StartDateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [StartDateTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
//    StartDateTextField.autocapitalizationType = NO;
//    [StartDateTextField setInputView:dateTimePicker];
//    [SortButtonView addSubview:StartDateTextField];
//    
//    EndDateTextField = [[UITextField alloc] initWithFrame:CGRectMake(150, StartDateTextField.frame.size.height+StartDateTextField.frame.origin.y+20, 286-150, 20)];
//    EndDateTextField.delegate = self;
//    EndDateTextField.placeholder = @"End Date";
//    EndDateTextField.textColor=[UIColor blackColor];
//    EndDateTextField.textAlignment = NSTextAlignmentCenter;
//    [EndDateTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
//    EndDateTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    EndDateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    [EndDateTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
//    EndDateTextField.autocapitalizationType = NO;
//    [EndDateTextField setInputView:EnddateTimePicker];
//    [SortButtonView addSubview:EndDateTextField];
//    
//    
//    StartDateTextLable=[[UILabel alloc]initWithFrame:CGRectMake(20, DateButton.frame.size.height+DateButton.frame.origin.y+40, 100, 20)];
//    StartDateTextLable.text=@"Start Date";
//    StartDateTextLable.backgroundColor=[UIColor clearColor];
//    StartDateTextLable.textColor=[UIColor darkGrayColor];
//    [StartDateTextLable setFont:[UIFont boldSystemFontOfSize:10]];
//    [SortButtonView addSubview:StartDateTextLable];
//    
//    EndDateTextLable=[[UILabel alloc]initWithFrame:CGRectMake(20, StartDateTextField.frame.size.height+StartDateTextField.frame.origin.y+20, 100, 20)];
//    EndDateTextLable.text=@"End Date";
//    EndDateTextLable.backgroundColor=[UIColor clearColor];
//    EndDateTextLable.textColor=[UIColor darkGrayColor];
//    [EndDateTextLable setFont:[UIFont boldSystemFontOfSize:10]];
//    [SortButtonView addSubview:EndDateTextLable];
//    [self.view addSubview:SortButtonView];
    
    SortButtonFlag=1;
    typeButtonFlag=1;
    dateButtonFlag=1;
    healthCareFlag=1;
    [self HideActivityIndicator];
    
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
-(void)typeAction{
    
    [informationScrollView removeFromSuperview];
    [ProviderTableView removeFromSuperview];
    if(typeStatus==0)
    {
        typeStatus=1;
        [UIView animateWithDuration:.5f animations:^{
            
           
            TypeButton.frame = CGRectMake(0, 80, 300, 40);
            ProviderButton.frame = CGRectMake(0, 800, 300, 40);
            InformationButton.frame = CGRectMake(0, 800, 300, 40);
            NotesButton.frame = CGRectMake(0, 800, 300, 40);
            AttachmentButton.frame = CGRectMake(0, 800, 300, 40);
            
        } completion:^(BOOL finished) {
            [self TypeFunctionCall];
        }];
    }
    else{
        typeStatus=0;
        [UIView animateWithDuration:.5f animations:^{
            [TypeTableView removeFromSuperview];
            [ProviderTableView removeFromSuperview];
         
            
            
            TypeButton.frame = CGRectMake(0, 307, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            
            
        }];
    }
    
}
-(void)ProviderAction{
    
    [informationScrollView removeFromSuperview];
    
    if(purposeStatus==0){
        purposeStatus=1;
        [UIView animateWithDuration:.5f animations:^{
            
            
            
            
            TypeButton.frame = CGRectMake(0, 80, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, 800, 300, 40);
            NotesButton.frame = CGRectMake(0, 800, 300, 40);
            AttachmentButton.frame = CGRectMake(0, 800, 300, 40);
            
        } completion:^(BOOL finished) {
            [self ProviderFunction];
        }];
    }
    else{
        purposeStatus=0;
        [UIView animateWithDuration:.5f animations:^{
            [ProviderTableView removeFromSuperview];
            [TypeTableView removeFromSuperview];
           
            
            
            TypeButton.frame = CGRectMake(0, 307, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(void)ProviderFunction{
    
    ProviderTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y+10, BackGroundImageView.frame.size.width, 350)];
    ProviderTableView.backgroundColor=[UIColor clearColor];
    ProviderTableView.delegate=self;
    ProviderTableView.dataSource = self;
    ProviderTableView.separatorStyle=UITableViewCellAccessoryNone;
    [BackGroundImageView addSubview:ProviderTableView];
}
-(void)InformationAction{
    
    [informationScrollView removeFromSuperview];
    if(informationStatus==0){
        informationStatus=1;
        [UIView animateWithDuration:.5f animations:^{
            
           
            
            
            TypeButton.frame = CGRectMake(0, 80, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, 800, 300, 40);
            AttachmentButton.frame = CGRectMake(0, 800, 300, 40);
            
        } completion:^(BOOL finished) {
            [self informationScrollAction];
        }];
    }
    else{
        informationStatus=0;
        [UIView animateWithDuration:.5f animations:^{
           
            
            
            TypeButton.frame = CGRectMake(0, 307, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            [informationScrollView removeFromSuperview];
        }];
    }
}
-(void)notesAction{
    [informationScrollView removeFromSuperview];
    if(notesStatus==0){
        notesStatus=1;
        [UIView animateWithDuration:.5f animations:^{
            
           
            
            
            TypeButton.frame = CGRectMake(0, 50, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            AttachmentButton.frame = CGRectMake(0, 800, 300, 40);
            
        } completion:^(BOOL finished) {
            [self NotesFunction];
        }];
    }
    else{
        notesStatus=0;
        [UIView animateWithDuration:.5f animations:^{
           
            
            
            TypeButton.frame = CGRectMake(0, 307, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
}
-(void)attachmentAction{
    [informationScrollView removeFromSuperview];
    if(attachmentsStatus==0){
        attachmentsStatus=1;
        [UIView animateWithDuration:.5f animations:^{
            
           
            
            
            TypeButton.frame = CGRectMake(0, 80, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            
        }];
    }
    else{
        attachmentsStatus=0;
        [UIView animateWithDuration:.5f animations:^{
           
            
            
            TypeButton.frame = CGRectMake(0, 307, 300, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 300, 40);
            InformationButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 300, 40);
            NotesButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 300, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 300, 40);
            
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(void)informationScrollAction{
    
    informationScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,InformationButton.frame.size.height+InformationButton.frame.origin.y+10, BackGroundImageView.frame.size.width, 290)];
    informationScrollView.backgroundColor=[UIColor clearColor];
    informationScrollView.contentSize=CGSizeMake(BackGroundImageView.frame.size.width, 290);
    informationScrollView.bounces=YES;
    informationScrollView.delegate=self;
    informationScrollView.exclusiveTouch=YES;
    informationScrollView.showsVerticalScrollIndicator=FALSE;
    
    appointmentTextField = [[UITextField alloc] initWithFrame:CGRectMake(5,20, 286, 20)];
    appointmentTextField.backgroundColor=[UIColor clearColor];
    appointmentTextField.delegate = self;
    appointmentTextField.placeholder = @"Appointment Name";
    [appointmentTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    appointmentTextField.textColor=[UIColor blackColor];
    appointmentTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    appointmentTextField.leftView = paddingView;
    appointmentTextField.leftViewMode = UITextFieldViewModeAlways;
    appointmentTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    appointmentTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [appointmentTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    appointmentTextField.autocapitalizationType = NO;
    appointmentTextField.returnKeyType=UIReturnKeyNext;
    [appointmentTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:appointmentTextField];
    
    
    consultantTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+15, 286, 20)];
    consultantTextField.delegate = self;
    consultantTextField.placeholder = @"Consultant Name";
    [consultantTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    consultantTextField.textColor=[UIColor blackColor];
    consultantTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    consultantTextField.leftView = paddingView;
    consultantTextField.leftViewMode = UITextFieldViewModeAlways;
    consultantTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    consultantTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [consultantTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    consultantTextField.autocapitalizationType = NO;
    consultantTextField.returnKeyType=UIReturnKeyNext;
    [consultantTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:consultantTextField];
    
    AppointmentDatePicker  = [[UIDatePicker alloc]init];
    [AppointmentDatePicker setFrame:CGRectMake(0, 518, 320, 100)];
    AppointmentDatePicker.datePickerMode = UIDatePickerModeDate;
    [AppointmentDatePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
    
    
    dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+15, 286, 20)];
    dateTextField.delegate = self;
    dateTextField.placeholder = @"Date";
    [dateTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    dateTextField.textColor=[UIColor blackColor];
    dateTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    dateTextField.leftView = paddingView;
    dateTextField.leftViewMode = UITextFieldViewModeAlways;
    dateTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    dateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [dateTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    dateTextField.autocapitalizationType = NO;
    dateTextField.returnKeyType=UIReturnKeyNext;
    [dateTextField setInputView:AppointmentDatePicker];
    [dateTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:dateTextField];
    
    AppointmentTimePicker  = [[UIDatePicker alloc]init];
    [AppointmentTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
    AppointmentTimePicker.datePickerMode = UIDatePickerModeTime;
    [AppointmentTimePicker addTarget:self action:@selector(updateTimePicker) forControlEvents:UIControlEventValueChanged];
    
    
    timeTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, dateTextField.frame.size.height+dateTextField.frame.origin.y+15, 286, 20)];
    timeTextField.delegate = self;
    timeTextField.placeholder = @"Time";
    [timeTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    timeTextField.textColor=[UIColor blackColor];
    timeTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    timeTextField.leftView = paddingView;
    timeTextField.leftViewMode = UITextFieldViewModeAlways;
    timeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    timeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [timeTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    timeTextField.autocapitalizationType = NO;
    timeTextField.returnKeyType=UIReturnKeyNext;
    [timeTextField setInputView:AppointmentTimePicker];
    [timeTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:timeTextField];
    
    hospitalTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, timeTextField.frame.size.height+timeTextField.frame.origin.y+15, 286, 20)];
    hospitalTextField.delegate = self;
    hospitalTextField.placeholder = @"Hospital Name";
    [hospitalTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    hospitalTextField.textColor=[UIColor blackColor];
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    hospitalTextField.leftView = paddingView;
    hospitalTextField.leftViewMode = UITextFieldViewModeAlways;
    hospitalTextField.textAlignment = NSTextAlignmentLeft;
    hospitalTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    hospitalTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [hospitalTextField setFont:[UIFont fontWithName:@"Comfortaa" size:15]];
    hospitalTextField.autocapitalizationType = NO;
    hospitalTextField.returnKeyType=UIReturnKeyNext;
    [hospitalTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:hospitalTextField];
    [BackGroundImageView addSubview:informationScrollView];
}

-(void)NotesFunction
{
    informationScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, BackGroundImageView.frame.size.width, 100)];
    informationScrollView.backgroundColor=[UIColor clearColor];
    informationScrollView.contentSize=CGSizeMake(BackGroundImageView.frame.size.width, 200);
    
    NotesTextView=[[MFUnderlinedTextView alloc]initWithFrame:CGRectMake(0, 0, BackGroundImageView.frame.size.width, 80)];
    NotesTextView.backgroundColor=[UIColor clearColor];
    NotesTextView.delegate=self;
    [NotesTextView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [NotesTextView setScrollEnabled:NO];
    [NotesTextView setScrollEnabled:YES];
    [informationScrollView addSubview:NotesTextView];
    [BackGroundImageView addSubview:informationScrollView];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [NotesTextView resignFirstResponder];
        return NO; // or true, whetever you's like
    }
    return YES;
}

//-(void)typeAction{
//    
//    StartDateTextField.hidden=YES;
//    EndDateTextField.hidden=YES;
//    StartDateTextLable.hidden=YES;
//    EndDateTextLable.hidden=YES;
//    if(typeButtonFlag==1){
//        typeButtonFlag=2;
//        [UIView animateWithDuration:0.8f animations:^{
//            
//            SortButtonView.frame=CGRectMake(0, 130, self.view.frame.size.width, 120);
//            HealthCareButton.frame=CGRectMake(0, 600,320, 40);
//            DateButton.frame=CGRectMake(0, 600, 320, 40);
//            
//        } completion:^(BOOL finished)
//         {
//             
//         }];
//        
//    }
//    else{
//        typeButtonFlag=1;
//        [UIView animateWithDuration:0.8f animations:^{
//            SortButtonView.frame=CGRectMake(0, 440, self.view.frame.size.width, 120);
//            TypeButton.frame=CGRectMake(0, 0,320, 40);
//            HealthCareButton.frame=CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y,320, 40);
//            DateButton.frame=CGRectMake(0, HealthCareButton.frame.size.height+HealthCareButton.frame.origin.y, 320, 40);
//            
//        } completion:^(BOOL finished)
//         {
//             
//         }];
//    }
//}
//-(void)HealthCareAction{
//    
//    StartDateTextField.hidden=YES;
//    EndDateTextField.hidden=YES;
//    StartDateTextLable.hidden=YES;
//    EndDateTextLable.hidden=YES;
//    if(healthCareFlag==1)
//    {
//        healthCareFlag=2;
//        [UIView animateWithDuration:0.8f animations:^{
//            
//            SortButtonView.frame=CGRectMake(0, 130, self.view.frame.size.width, 200);
//            TypeButton.frame=CGRectMake(0, 0,320, 40);
//            HealthCareButton.frame=CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y,320, 40);
//            DateButton.frame=CGRectMake(0, 600, 320, 40);
//            
//        } completion:^(BOOL finished)
//         {
//             
//         }];
//        
//    }
//    else
//    {
//        healthCareFlag=1;
//        [UIView animateWithDuration:0.8f animations:^{
//            SortButtonView.frame=CGRectMake(0, 440, self.view.frame.size.width, 120);
//            TypeButton.frame=CGRectMake(0, 0,320, 40);
//            HealthCareButton.frame=CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y,320, 40);
//            DateButton.frame=CGRectMake(0, HealthCareButton.frame.size.height+HealthCareButton.frame.origin.y, 320, 40);
//            
//        } completion:^(BOOL finished)
//         {
//             
//         }];
//    }
//    
//}
//-(void)DateButtonAction{
//    
//    if(dateButtonFlag==1)
//    {
//        StartDateTextField.hidden=NO;
//        EndDateTextField.hidden=NO;
//        StartDateTextLable.hidden=NO;
//        EndDateTextLable.hidden=NO;
//        dateButtonFlag=2;
//        [UIView animateWithDuration:0.5f animations:^{
//        
//            SortButtonView.frame=CGRectMake(0, 170, self.view.frame.size.width, 250);
//            TypeButton.frame=CGRectMake(0, 0,320, 40);
//            HealthCareButton.frame=CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y,320, 40);
//            DateButton.frame=CGRectMake(0, HealthCareButton.frame.size.height+HealthCareButton.frame.origin.y, 320, 40);
//            
//        } completion:^(BOOL finished)
//         {
//             //[self datePickerView];
//         }];
//        
//    }
//    else
//    {
//        dateButtonFlag=1;
//        [UIView animateWithDuration:0.5f animations:^{
//            SortButtonView.frame=CGRectMake(0, 440, self.view.frame.size.width, 120);
//            TypeButton.frame=CGRectMake(0, 0,320, 40);
//            HealthCareButton.frame=CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y,320, 40);
//            DateButton.frame=CGRectMake(0, HealthCareButton.frame.size.height+HealthCareButton.frame.origin.y, 320, 40);
//            
//        } completion:^(BOOL finished)
//         {
//             
//         }];
//    }
//    
//}
//-(void)StartDateField
//{
//    StartDateTextField.text = [self formatDate:dateTimePicker.date];
//}
//-(void)EndDateField
//{
//    EndDateTextField.text = [self formatDate:dateTimePicker.date];
//}
//- (NSString *)formatDate:(NSDate *)date
//{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
//    [dateFormatter setDateFormat:@"MM'/'dd'/'yyyy"];
//    NSString *formattedDate = [dateFormatter stringFromDate:date];
//    return formattedDate;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)nextviewController{
    
}
-(void)SortButtonAction{
   
    if(SortButtonFlag==1)
    {
        SortButtonFlag=2;
        SortButtonView.frame=CGRectMake(0, 130, self.view.frame.size.width, 120);
        pushBehavior.pushDirection = CGVectorMake(0.0f, 20.0f);
        pushBehavior.active = YES;
        
    }
    else
    {
        SortButtonFlag=1;
        [UIView animateWithDuration:0.8f animations:^{
            
            SortButtonView.frame=CGRectMake(0, -130, self.view.frame.size.width, 120);
            
        } completion:^(BOOL finished)
        {
            //SortButtonView.frame=CGRectMake(0, 445, self.view.frame.size.width, 120);
            // [self attachPopUpAnimationToView:SortButtonView];
        }];
    }
}
-(void)selbounse{
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:SortButtonView];
    UICollisionBehavior *collisionBehaviour = [[UICollisionBehavior alloc] initWithItems:@[SortButtonView]];
    // Need to create a boundary that lies to the left off of the right edge of the screen.
    [collisionBehaviour setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(0, 0, 0, -280)];
    [animator addBehavior:collisionBehaviour];
    
    gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[SortButtonView]];
    gravityBehaviour.gravityDirection = CGVectorMake(-1, 0);
    [animator addBehavior:gravityBehaviour];
    
    pushBehavior = [[UIPushBehavior alloc] initWithItems:@[SortButtonView] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.magnitude = 0.0f;
    pushBehavior.angle = 0.0f;
    [animator addBehavior:pushBehavior];
    
    UIDynamicItemBehavior *itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[SortButtonView]];
    itemBehaviour.elasticity = 0.20f;
    [animator addBehavior:itemBehaviour];
    
}
-(void)scrollViewDidTapped
{
    [StartDateTextField resignFirstResponder];
    [EndDateTextField resignFirstResponder];
    [appointmentTextField  resignFirstResponder];
    [dateTextField resignFirstResponder];
    [timeTextField resignFirstResponder];
    [hospitalTextField resignFirstResponder];
    [consultantTextField resignFirstResponder];
    [NotesTextView resignFirstResponder];
    
    if(dateButtonFlag==2){
        dateButtonFlag=1;
        [UIView animateWithDuration:0.5f animations:^{
            
            SortButtonView.frame=CGRectMake(0, 440, self.view.frame.size.width, 120);
            TypeButton.frame=CGRectMake(0, 0,320, 40);
            HealthCareButton.frame=CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y,320, 40);
            DateButton.frame=CGRectMake(0, HealthCareButton.frame.size.height+HealthCareButton.frame.origin.y, 320, 40);
            
        } completion:^(BOOL finished)
         {
             
         }];
    }
    
}
- (void)ShowActivityIndicatorWithTitle:(NSString *)Title
{
    
    [SVProgressHUD showWithStatus:Title maskType:SVProgressHUDMaskTypeGradient];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
    
}
- (void)HideActivityIndicator
{
    [SVProgressHUD dismiss];
}
-(void)BackButtonAction{
    
    [[soundManager shared] buttonSound];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)DoneButtonFuction{
    [[soundManager shared]buttonSound];
}
-(void)TypeFunctionCall
{
    
    TypeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y+10, BackGroundImageView.frame.size.width, 350)];
    TypeTableView.backgroundColor=[UIColor clearColor];
    TypeTableView.delegate=self;
    TypeTableView.dataSource = self;
    TypeTableView.separatorStyle=UITableViewCellAccessoryNone;
    [BackGroundImageView addSubview:TypeTableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //return [listOfTemArray count];
    return 10;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    //return backgroundImageSize.size.height/2+10;
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"cell";
    UITableViewCell *cell =nil;
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
        cell.backgroundColor=[UIColor clearColor];
        
        
        TypeValuesShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        TypeValuesShowButton.frame = CGRectMake(10,10, 280,40);
        TypeValuesShowButton.backgroundColor=[UIColor clearColor];
        TypeValuesShowButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
        TypeValuesShowButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [TypeValuesShowButton setTitle:[NSString stringWithFormat:@"%d",indexPath.row+1] forState:(UIControlState)UIControlStateNormal];
        [TypeValuesShowButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        TypeValuesShowButton.titleEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
        TypeValuesShowButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        TypeValuesShowButton.layer.borderWidth = 1.0f;
        TypeValuesShowButton.tag=1+indexPath.row;
        
        // [frameButton setBackgroundImage:backgroundImageSize forState:UIControlStateNormal];
        //        [frameButton setBackgroundImage:backgroundImageSize forState:UIControlStateSelected];
        //        [frameButton setBackgroundImage:backgroundImageSize forState:UIControlStateHighlighted];
        
        
        [TypeValuesShowButton addTarget:self action:@selector(selectTypeUser:) forControlEvents:UIControlEventTouchDown];
        
        [cell addSubview:TypeValuesShowButton];
    }
    
    return cell;
}
-(IBAction)selectTypeUser:(id)sender{
    
    [TypeButton setTitle:[NSString stringWithFormat:@"Type %d",[sender tag]] forState:(UIControlState)UIControlStateNormal];
    typeStatus=1;
    [self typeAction];
}
-(void)updateDateField
{
    dateTextField.text = [self formatDate:AppointmentDatePicker.date];
}
- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"MM'/'dd'/'yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}
- (NSString *)formatTime:(NSDate *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:time];
    return currentTime;
}
-(void)updateTimePicker
{
    timeTextField.text = [self formatTime:AppointmentTimePicker.date];
}
-(IBAction)textFieldDoneEditing:(id)sender{
    
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
-(void)keyboardWillShow
{
    // Animate the current view out of the way
    CGFloat heightofKeyboard = 250;
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
