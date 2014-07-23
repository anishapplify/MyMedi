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
    //UITapGestureRecognizer*tapRecognizer;
    UIImage *BackGroundImage;
    
    NSMutableArray *arrayofTypeFromServer;
    NSMutableArray *arrayofProviderFromServer;
    UILabel *NewAppointmentLable;
    UIButton *plusButton;
    UIButton *ProviderValuesShowButton;
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

    
    arrayofTypeFromServer = [[NSMutableArray alloc]init];
    arrayofProviderFromServer = [[NSMutableArray alloc]init];
    for (int i = 1; i <= 10; i++)
    {
        [arrayofTypeFromServer addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int j=11; j<=20; j++)
    {
        [arrayofProviderFromServer addObject:[NSString stringWithFormat:@"%d",j]];
    }
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    
    lineView=[[UIView alloc]initWithFrame:CGRectMake(265,35,1,30)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView];
    
    DoneButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 35, 50, 25)];
    DoneButton.backgroundColor=[UIColor clearColor];
    [DoneButton setTitle:@"Done" forState:UIControlStateNormal];
    [DoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [DoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    DoneButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [DoneButton addTarget:self action:@selector(DoneButtonFuction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:DoneButton];
    [self.view addSubview:TopBarView];
    
    NewAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 20, 130, 40)];
    NewAppointmentLable.text=@"New Appointment";
    NewAppointmentLable.textColor= [UIColor blackColor];
    NewAppointmentLable.textAlignment=NSTextAlignmentCenter;
    NewAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:15];
    [self.view addSubview:NewAppointmentLable];
    
    InformationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 367, 320, 40)];
    [InformationButton addTarget:self action:@selector(InformationAction)
                forControlEvents:UIControlEventTouchUpInside];
    [InformationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    InformationButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:174/255.0 blue:216/255.0 alpha:1.0];
    InformationButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    InformationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [InformationButton setTitle:@"Information" forState:(UIControlState)UIControlStateNormal];
    [InformationButton setTitleShadowColor:[UIColor clearColor] forState:UIControlStateNormal];
    InformationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:InformationButton];
    
    
    TypeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 40)];
    [TypeButton addTarget:self action:@selector(typeAction)
         forControlEvents:UIControlEventTouchUpInside];
    [TypeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    TypeButton.backgroundColor=[UIColor colorWithRed:161/255.0 green:207/255.0 blue:223/255.0 alpha:1.0];
    TypeButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    TypeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [TypeButton setTitle:@"Type" forState:(UIControlState)UIControlStateNormal];
    TypeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:TypeButton];
    
    
    ProviderButton=[[UIButton alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40)];
    [ProviderButton addTarget:self action:@selector(ProviderAction)
             forControlEvents:UIControlEventTouchUpInside];
    [ProviderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ProviderButton.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
    ProviderButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    ProviderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [ProviderButton setTitle:@"Provider" forState:(UIControlState)UIControlStateNormal];
    ProviderButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:ProviderButton];
    
    
    NotesButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40)];
    [NotesButton addTarget:self action:@selector(notesAction)
          forControlEvents:UIControlEventTouchUpInside];
    [NotesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NotesButton.backgroundColor=[UIColor colorWithRed:20/255.0 green:161/255.0 blue:211/255.0 alpha:1.0];
    NotesButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    NotesButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [NotesButton setTitle:@"Notes" forState:(UIControlState)UIControlStateNormal];
    NotesButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:NotesButton];
    
    AttachmentButton=[[UIButton alloc]initWithFrame:CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 40)];
    AttachmentButton.backgroundColor=[UIColor redColor];
    [AttachmentButton addTarget:self action:@selector(attachmentAction)
               forControlEvents:UIControlEventTouchUpInside];
    [AttachmentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    AttachmentButton.backgroundColor=[UIColor colorWithRed:2/255.0 green:145/255.0 blue:195/255.0 alpha:1.0];
    AttachmentButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    AttachmentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [AttachmentButton setTitle:@"Attachments" forState:(UIControlState)UIControlStateNormal];
    AttachmentButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:AttachmentButton];
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    typeStatus=0;
    informationStatus=0;
    purposeStatus=0;
    attachmentsStatus=0;
    notesStatus=0;
    
}
-(void)TypeFunctionCall
{
    TypeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y+10, 320, 350)];
    TypeTableView.backgroundColor=[UIColor clearColor];
    TypeTableView.delegate=self;
    TypeTableView.dataSource = self;
    TypeTableView.separatorStyle=UITableViewCellAccessoryNone;
    TypeTableView.tag=1;
    [self.view addSubview:TypeTableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag ==1)
    {
        return arrayofTypeFromServer.count;
    }
    else
    {
        return arrayofProviderFromServer.count;
    }
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
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
        cell.backgroundColor=[UIColor whiteColor];
        
        
        
        if (tableView.tag ==1)
        {
            TypeValuesShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
            TypeValuesShowButton.frame = CGRectMake(20,10, 280,40);
            TypeValuesShowButton.backgroundColor=[UIColor clearColor];
            TypeValuesShowButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
            TypeValuesShowButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [TypeValuesShowButton setTitle:[NSString stringWithFormat:@"%@",[arrayofTypeFromServer objectAtIndex:indexPath.row]] forState:(UIControlState)UIControlStateNormal];
            [TypeValuesShowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            TypeValuesShowButton.titleEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
            TypeValuesShowButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
            TypeValuesShowButton.layer.borderWidth = 1.0f;
            TypeValuesShowButton.tag=1+indexPath.row;
            [TypeValuesShowButton addTarget:self action:@selector(selectTypeUser:) forControlEvents:UIControlEventTouchDown];
            [cell addSubview:TypeValuesShowButton];
            
        }
        else
        {
            ProviderValuesShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
            ProviderValuesShowButton.frame = CGRectMake(20,10, 280,40);
            ProviderValuesShowButton.backgroundColor=[UIColor clearColor];
            ProviderValuesShowButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
            ProviderValuesShowButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [ProviderValuesShowButton setTitle:[NSString stringWithFormat:@"%@",[arrayofProviderFromServer objectAtIndex:indexPath.row]] forState:(UIControlState)UIControlStateNormal];
            [ProviderValuesShowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            ProviderValuesShowButton.titleEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
            ProviderValuesShowButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
            ProviderValuesShowButton.layer.borderWidth = 1.0f;
            ProviderValuesShowButton.tag= [[arrayofProviderFromServer objectAtIndex:indexPath.row] integerValue];
            [ProviderValuesShowButton addTarget:self action:@selector(selectProvideUser:) forControlEvents:UIControlEventTouchDown];
            [cell addSubview:ProviderValuesShowButton];
            
            
        }
        
        
        
        
        
        
        
        
    }
    
    return cell;
}
-(IBAction)selectTypeUser:(id)sender{
    
    [TypeButton setTitle:[NSString stringWithFormat:@"Type %d",[sender tag]] forState:(UIControlState)UIControlStateNormal];
    typeStatus=1;
    [self typeAction];
}

-(IBAction)selectProvideUser:(id)sender{
    
    NSLog(@"provider tag is %d",[sender tag]);
    [ProviderButton setTitle:[NSString stringWithFormat:@"Provider %d",[sender tag]] forState:(UIControlState)UIControlStateNormal];
    purposeStatus=1;
    [self ProviderAction];
}


-(void)ProviderFunction{
    
    ProviderTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y+10, 320, 300)];
    ProviderTableView.backgroundColor=[UIColor clearColor];
    ProviderTableView.delegate=self;
    ProviderTableView.dataSource = self;
    ProviderTableView.separatorStyle=UITableViewCellAccessoryNone;
    [self.view addSubview:ProviderTableView];
}
-(void)InformationAction
{
    [informationScrollView removeFromSuperview];
    [TypeTableView removeFromSuperview];
    [ProviderTableView removeFromSuperview];
    [plusButton removeFromSuperview];
    if(informationStatus==0){
        informationStatus=1;
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0, 110, 320, 40);
            TypeButton.frame = CGRectMake(0, 400, 320, 40);
            ProviderButton.frame = CGRectMake(0,440, 320, 40);
            NotesButton.frame = CGRectMake(0, 480, 320, 40);
            AttachmentButton.frame = CGRectMake(0, 520, 320, 40);
        } completion:^(BOOL finished) {
            [self informationScrollAction];
        }];
    }
    else{
        informationStatus=0;
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0,367, 320, 40);
            
            TypeButton.frame = CGRectMake(0,  InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 40);
        } completion:^(BOOL finished) {
            [informationScrollView removeFromSuperview];
        }];
    }
}

-(void)typeAction
{
    [informationScrollView removeFromSuperview];
    [ProviderTableView removeFromSuperview];
    [plusButton removeFromSuperview];
    if(typeStatus==0)
    {
        typeStatus=1;
        [UIView animateWithDuration:.2f animations:^{
            InformationButton.frame = CGRectMake(0, 110, 320, 40);
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 40);
            ProviderButton.frame = CGRectMake(0, 800, 320, 40);
            NotesButton.frame = CGRectMake(0, 800, 320, 40);
            AttachmentButton.frame = CGRectMake(0, 800, 320, 40);
            
        } completion:^(BOOL finished) {
            [self TypeFunctionCall];
        }];
    }
    else{
        typeStatus=0;
        [UIView animateWithDuration:.2f animations:^{
            [TypeTableView removeFromSuperview];
            [ProviderTableView removeFromSuperview];
            
            InformationButton.frame = CGRectMake(0, 367, 320, 40);
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 40);
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
}
-(void)ProviderAction{
    
    [informationScrollView removeFromSuperview];
    [TypeTableView removeFromSuperview];
    [plusButton removeFromSuperview];
    if(purposeStatus==0){
        purposeStatus=1;
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0, 110, 320, 40);
            TypeButton.frame = CGRectMake(0, InformationButton.frame.origin.y+InformationButton.frame.size.height, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            NotesButton.frame = CGRectMake(0, 800, 320, 40);
            AttachmentButton.frame = CGRectMake(0, 800, 320, 40);
            
        } completion:^(BOOL finished) {
            [self ProviderFunction];
        }];
    }
    else{
        purposeStatus=0;
        [UIView animateWithDuration:.2f animations:^{
            [ProviderTableView removeFromSuperview];
            [TypeTableView removeFromSuperview];
            
            InformationButton.frame = CGRectMake(0, 367, 320, 40);
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 40);
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

-(void)notesAction{
    [informationScrollView removeFromSuperview];
    [plusButton removeFromSuperview];
    if(notesStatus==0){
        notesStatus=1;
        [UIView animateWithDuration:.2f animations:^{
            InformationButton.frame = CGRectMake(0, 110, 320, 40);
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40);
            AttachmentButton.frame = CGRectMake(0, 350, 320, 40);
        } completion:^(BOOL finished) {
            [self NotesFunction];
        }];
    }
    else{
        notesStatus=0;
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0, 367, 320, 40);
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 40);
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(void)attachmentAction{
    [informationScrollView removeFromSuperview];
    [plusButton removeFromSuperview];
    if(attachmentsStatus==0){
        attachmentsStatus=1;
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0, 110, 320, 40);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.origin.y+InformationButton.frame.size.height, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 40);
        } completion:^(BOOL finished) {
            [self AttachmentFunction];
            
        }];
    }
    else{
        attachmentsStatus=0;
        [UIView animateWithDuration:.2f animations:^{
            InformationButton.frame = CGRectMake(0, 367, 320, 40);
            TypeButton.frame = CGRectMake(0, InformationButton.frame.origin.y+InformationButton.frame.size.height, 320, 40);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 40);
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 40);
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 40);
        } completion:^(BOOL finished) {
            [plusButton removeFromSuperview];
        }];
    }
}

-(void)AttachmentFunction
{
    plusButton=[[UIButton alloc]initWithFrame:CGRectMake(30, NotesButton.frame.size.height+NotesButton.frame.origin.y+50, 50, 40)];
    [plusButton addTarget:self action:@selector(AttachmentActionForPicker)
         forControlEvents:UIControlEventTouchUpInside];
    [plusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    plusButton.backgroundColor=[UIColor blackColor];
    plusButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    plusButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [plusButton setTitle:@"+" forState:(UIControlState)UIControlStateNormal];
    plusButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    plusButton.layer.cornerRadius = 5;
    [self.view addSubview:plusButton];
    
}
-(void)AttachmentActionForPicker
{
    NSLog(@"UIIMAge Picker");
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
    
    NSString *path= [documentsDirectory stringByAppendingPathComponent:@"userprofile.png" ];  // IT IS THE PATH OF CHOOSEN IMAGE
    
    NSData* imageData= UIImagePNGRepresentation([info objectForKey:@"UIImagePickerControllerEditedImage"]);
    
    [imageData writeToFile:path atomically:YES];
    
    // STORING THE PATH OF IMAGE IN NSUserDefault
    [[NSUserDefaults standardUserDefaults]setObject:path forKey:@"pathOfAttachmentinCreateAppointmentPage"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


-(void)informationScrollAction{
    
    informationScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,InformationButton.frame.size.height+InformationButton.frame.origin.y+5, 320, 240)];
    informationScrollView.backgroundColor=[UIColor clearColor];
    informationScrollView.contentSize=CGSizeMake(320, 290);
    informationScrollView.bounces=YES;
    informationScrollView.delegate=self;
    informationScrollView.exclusiveTouch=YES;
    informationScrollView.showsVerticalScrollIndicator=FALSE;
    informationScrollView.scrollEnabled=FALSE;
    
    appointmentTextField = [[UITextField alloc] initWithFrame:CGRectMake(125,5, 200, 40)];
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
    
    
    UILabel *AppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 125, 40) ];
    AppointmentLable.text= [NSString stringWithFormat:@"   %@",@"Appointment Name"];
    AppointmentLable.textAlignment=NSTextAlignmentLeft;
    AppointmentLable.font = [UIFont fontWithName:helveticaRegular size:13];
    AppointmentLable.textColor=[UIColor blackColor];
    AppointmentLable.backgroundColor = [UIColor whiteColor];
    [informationScrollView addSubview:AppointmentLable];
    
    consultantTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+3, 200, 40)];
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
    
    UILabel *ConsultantLable=[[UILabel alloc]initWithFrame:CGRectMake(0, appointmentTextField.frame.size.height+appointmentTextField.frame.origin.y+3, 125, 40) ];
    ConsultantLable.text= [NSString stringWithFormat:@"   %@",@"Consultant Name"];
    ConsultantLable.textAlignment=NSTextAlignmentLeft;
    ConsultantLable.font = [UIFont fontWithName:helveticaRegular size:13];
    ConsultantLable.textColor=[UIColor blackColor];
    ConsultantLable.backgroundColor = [UIColor whiteColor];
    [informationScrollView addSubview:ConsultantLable];
    
    
    AppointmentDatePicker  = [[UIDatePicker alloc]init];
    [AppointmentDatePicker setFrame:CGRectMake(100, 518, 320, 100)];
    AppointmentDatePicker.datePickerMode = UIDatePickerModeDate;
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
    
    
    
    dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+3, 200, 40)];
    dateTextField.delegate = self;
    dateTextField.placeholder = @"Date";
    // [dateTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    dateTextField.textColor=[UIColor blackColor];
    dateTextField.backgroundColor = [UIColor whiteColor];
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
    
    UILabel *DateLable=[[UILabel alloc]initWithFrame:CGRectMake(0, consultantTextField.frame.size.height+consultantTextField.frame.origin.y+3, 125, 40) ];
    DateLable.text= [NSString stringWithFormat:@"   %@",@"Date"];
    DateLable.textAlignment=NSTextAlignmentLeft;
    DateLable.font = [UIFont fontWithName:helveticaRegular size:13];
    DateLable.textColor=[UIColor blackColor];
    DateLable.backgroundColor = [UIColor whiteColor];
    [informationScrollView addSubview:DateLable];
    
    
    
    AppointmentTimePicker  = [[UIDatePicker alloc]init];
    [AppointmentTimePicker setFrame:CGRectMake(0, 518, 320, 100)];
    AppointmentTimePicker.datePickerMode = UIDatePickerModeTime;
    [AppointmentTimePicker addTarget:self action:@selector(updateTimePicker) forControlEvents:UIControlEventValueChanged];
    
    
    timeTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, dateTextField.frame.size.height+dateTextField.frame.origin.y+3, 200, 40)];
    timeTextField.delegate = self;
    timeTextField.placeholder = @"Time";
    //  [timeTextField setBackground:[UIImage imageNamed:@"inputBoxfor-shiping.png"]];
    timeTextField.textColor=[UIColor blackColor];
    timeTextField.backgroundColor = [UIColor whiteColor];
    timeTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    timeTextField.leftView = paddingView;
    timeTextField.leftViewMode = UITextFieldViewModeAlways;
    [timeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    timeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    timeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [timeTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    timeTextField.autocapitalizationType = NO;
    timeTextField.returnKeyType=UIReturnKeyNext;
    [timeTextField setInputView:AppointmentTimePicker];
    [timeTextField setInputAccessoryView:toolbar];
    [timeTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [informationScrollView addSubview:timeTextField];
    
    
    UILabel *TimeLable=[[UILabel alloc]initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+3, 125, 40) ];
    TimeLable.text= [NSString stringWithFormat:@"   %@",@"Time"];
    TimeLable.textAlignment=NSTextAlignmentLeft;
    TimeLable.font = [UIFont fontWithName:helveticaRegular size:13];
    TimeLable.textColor=[UIColor blackColor];
    TimeLable.backgroundColor = [UIColor whiteColor];
    [informationScrollView addSubview:TimeLable];
    
    hospitalTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, timeTextField.frame.size.height+timeTextField.frame.origin.y+3, 200, 40)];
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
    [self.view addSubview:informationScrollView];
    
    
    UILabel *HospitalLable=[[UILabel alloc]initWithFrame:CGRectMake(0, timeTextField.frame.size.height+timeTextField.frame.origin.y+3, 125, 40) ];
    HospitalLable.text= [NSString stringWithFormat:@"   %@",@"Hospital Name"];
    HospitalLable.textAlignment=NSTextAlignmentLeft;
    HospitalLable.font = [UIFont fontWithName:helveticaRegular size:13];
    HospitalLable.textColor=[UIColor blackColor];
    HospitalLable.backgroundColor = [UIColor whiteColor];
    [informationScrollView addSubview:HospitalLable];
    
    
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
-(void)NotesFunction
{
    //    informationScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 80)];
    //    informationScrollView.backgroundColor=[UIColor clearColor];
    //    informationScrollView.contentSize=CGSizeMake(320, 80);
    
    NotesTextView=[[MFUnderlinedTextView alloc]initWithFrame:CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 80)];
    NotesTextView.backgroundColor=[UIColor yellowColor];
    NotesTextView.delegate=self;
    NotesTextView.textColor = [UIColor blackColor];
    [NotesTextView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [NotesTextView setScrollEnabled:NO];
    [NotesTextView setScrollEnabled:YES];
    [self.view addSubview:NotesTextView];
    //[self.view addSubview:informationScrollView];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{
    if ([text isEqualToString:@"\n"]) {
        [NotesTextView resignFirstResponder];
        return NO; // or true, whetever you's like
    }
    return YES;
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
}
-(IBAction)textFieldDoneEditing:(id)sender{
    
}
-(void)BackButtonAction{
    
    [[soundManager shared] buttonSound];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)DoneButtonFuction{
    
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
    CGFloat heightofKeyboard = 100;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    [informationScrollView  setContentInset:insets];
    [informationScrollView setScrollIndicatorInsets:insets];
    
}
-(void)scrollViewDidTapped
{
    [appointmentTextField  resignFirstResponder];
    [dateTextField resignFirstResponder];
    [timeTextField resignFirstResponder];
    [hospitalTextField resignFirstResponder];
    [consultantTextField resignFirstResponder];
    [NotesTextView resignFirstResponder];
    
}
-(void)keyboardWillHide
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    [informationScrollView setContentInset:insets];
    [informationScrollView setScrollIndicatorInsets:insets];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == appointmentTextField)
    {
        [consultantTextField becomeFirstResponder];
        return NO;
    }
    else
        if (textField == consultantTextField)
        {
            [dateTextField becomeFirstResponder];
            return NO;
        }
        else
            if (textField == dateTextField)
            {
                [timeTextField becomeFirstResponder];
                return NO;
            }
            else
                if (textField == timeTextField)
                {
                    [hospitalTextField becomeFirstResponder];
                    return NO;
                }
                else
                {
                    [textField resignFirstResponder];
                }
    return YES;
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
