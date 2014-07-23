//
//  MedicalRecordsHomeViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 19/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "MedicalRecordsHomeViewController.h"


static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.2;

static const CGFloat MINIMUM_SCROLL_FRACTION = 0.1;

static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;

static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 80;

static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


@interface MedicalRecordsHomeViewController ()<UIGestureRecognizerDelegate,UIDynamicAnimatorDelegate>{
    
    UIButton *BackButton;
    UIButton *DoneButton;
    
    
    
    UIView *TopBarView;
    
    
    
    UIButton *TypeButton;
    
    UIButton *ProviderButton;
    
    UIButton *InformationButton;
    
    UIButton *NotesButton;
    
    UIButton *AttachmentButton;
    
    
    
    UILabel*MedicalRecordAppointmentLable;
    
    UIView *lineView;
    
    
    
    UITableView *TypeTableView;
    
    UITableView *ProviderTableView;
    
    
    
    int typeStatus;
    
    int purposeStatus;
    
    int informationStatus;
    
    int notesStatus;
    
    int attachmentsStatus;
    
    
    
    
    
    UIDatePicker *AppointmentDatePicker;
    
    UIScrollView *informationScrollView;
    
    
    
    UITextField *appointmentTextField;
    
    UITextField *consultantTextField;
    
    UITextField *dateTextField;
    
    UITextField *hospitalTextField;
    
    
    
    AYTextViewWithUnderline *NotesTextView;
    
    UIButton*TypeValuesShowButton;
    
    UIButton*ProviderValuesShowButton;
    
    UIView *paddingView;
    
    UIButton *plusButton;
    
    
    
    
    
    UIImageView *InformationImageView;
    
    UIImageView *TypeImageView;
    
    UIImageView *ProviderImageView;
    
    UIImageView *NotesImageView;
    
    UIImageView *AttachmentsImageView;
    
    
    
    UILabel *TypeTitleLable;
    
    UILabel *ProviderTitleLable;
    
    
    
    int TypeTagValue;
    
    int ProiverTagValue;
    
    CGFloat animatedDistance;
    
    

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

    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor colorWithRed:224/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
    
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isNewAppointmentCreatedByUser"];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    TopBarView.userInteractionEnabled=TRUE;
    
    
    
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height)];
    
    BackButton.backgroundColor=[UIColor clearColor];
    
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:BackButton];
    
    
    
    BackButton.exclusiveTouch=YES;
    
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
    
    DoneButton.exclusiveTouch=YES;
    
    [self.view addSubview:TopBarView];
    
    
    
    MedicalRecordAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(60, 25, 190, 30)];
    
    MedicalRecordAppointmentLable.text=@"NEW MEDICAL RECORDS";
    
    MedicalRecordAppointmentLable.textColor= [UIColor blackColor];
    
    MedicalRecordAppointmentLable.textAlignment=NSTextAlignmentCenter;
    
    MedicalRecordAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:15];
    
    [self.view addSubview:MedicalRecordAppointmentLable];
    
    
    
    
    
    InformationImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    InformationImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    //InformationImageView.backgroundColor=[UIColor yellowColor];
    
    InformationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 343, 320, 45)];
    
    [InformationButton addTarget:self action:@selector(InformationAction)
     
                forControlEvents:UIControlEventTouchUpInside];
    
    [InformationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    InformationButton.backgroundColor=[UIColor colorWithRed:161/255.0 green:207/255.0 blue:223/255.0 alpha:1.0];
    
    InformationButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    
    InformationButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [InformationButton setTitle:@"Information" forState:(UIControlState)UIControlStateNormal];
    
    [InformationButton setTitleShadowColor:[UIColor clearColor] forState:UIControlStateNormal];
    
    InformationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    
    
    InformationButton.exclusiveTouch=YES;
    
    
    
    [InformationButton addSubview:InformationImageView];
    
    
    
    [self.view addSubview:InformationButton];
    
    
    
    TypeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    
    
    TypeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 45)];
    
    [TypeButton addTarget:self action:@selector(typeAction)
     
         forControlEvents:UIControlEventTouchUpInside];
    
    [TypeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    TypeButton.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
    
    TypeButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    
    TypeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [TypeButton setTitle:@"Type" forState:(UIControlState)UIControlStateNormal];
    
    TypeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    TypeButton.exclusiveTouch=YES;
    
    
    
    [TypeButton addSubview:TypeImageView];
    
    
    
    [self.view addSubview:TypeButton];
    
    
    
    ProviderImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    
    
    ProviderButton=[[UIButton alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45)];
    
    [ProviderButton addTarget:self action:@selector(ProviderAction)
     
             forControlEvents:UIControlEventTouchUpInside];
    
    [ProviderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    ProviderButton.backgroundColor=[UIColor colorWithRed:52/255.0 green:174/255.0 blue:216/255.0 alpha:1.0];
    
    ProviderButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    
    ProviderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [ProviderButton setTitle:@"Provider" forState:(UIControlState)UIControlStateNormal];
    
    ProviderButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    
    
    ProviderButton.exclusiveTouch=YES;
    
    [ProviderButton addSubview:ProviderImageView];
    
    [self.view addSubview:ProviderButton];
    
    
    
    
    
    NotesImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    NotesImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    
    
    NotesButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45)];
    
    [NotesButton addTarget:self action:@selector(notesAction)
     
          forControlEvents:UIControlEventTouchUpInside];
    
    [NotesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    NotesButton.backgroundColor=[UIColor colorWithRed:20/255.0 green:161/255.0 blue:211/255.0 alpha:1.0];
    
    NotesButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    
    NotesButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [NotesButton setTitle:@"Notes" forState:(UIControlState)UIControlStateNormal];
    
    NotesButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    NotesButton.exclusiveTouch=YES;
    
    [NotesButton addSubview:NotesImageView];
    
    [self.view addSubview:NotesButton];
    
    
    
    
    
    AttachmentsImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    AttachmentsImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    
    
    AttachmentButton=[[UIButton alloc]initWithFrame:CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45)];
    
    AttachmentButton.backgroundColor=[UIColor redColor];
    
    [AttachmentButton addTarget:self action:@selector(attachmentAction)
     
               forControlEvents:UIControlEventTouchUpInside];
    
    [AttachmentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    AttachmentButton.backgroundColor=[UIColor colorWithRed:2/255.0 green:145/255.0 blue:195/255.0 alpha:1.0];
    
    AttachmentButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    
    AttachmentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [AttachmentButton setTitle:@"Attachments" forState:(UIControlState)UIControlStateNormal];
    
    AttachmentButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    [AttachmentButton   addSubview:AttachmentsImageView];
    
    AttachmentButton.exclusiveTouch=YES;
    
    [self.view addSubview:AttachmentButton];
    
    
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    
    
    
    typeStatus=0;
    
    informationStatus=0;
    
    purposeStatus=0;
    
    attachmentsStatus=0;
    
    notesStatus=0;
    
    
    
    NotesTextView=[[AYTextViewWithUnderline alloc]init];
    
    
    
    [self informationScrollAction];
    
    informationScrollView.hidden=true;
    
}
-(void)TypeFunctionCall

{
    
    TypeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 350)];
    
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
    NSLog(@"appointment-type=%@",[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"]);
    
    if (tableView.tag ==1)
        
    {
        
        NSLog(@"appointment-type=%@",[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]);
        
        return [[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"] count];
        
    }
    
    else
        
    {
        
        NSLog(@"appointment_provider=%@",[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"]);
        
        return [[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"] count];
        
    }
    
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath

{
    
    return 44;
    
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
        
        
        if (tableView.tag ==1)
            
        {
            
            TypeValuesShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            TypeValuesShowButton.frame = CGRectMake(0,0, 320,45);
            
            TypeValuesShowButton.backgroundColor=[UIColor whiteColor];
            
            TypeValuesShowButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
            
            TypeValuesShowButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            
            TypeValuesShowButton.exclusiveTouch=YES;
            
            
            
            [TypeValuesShowButton setTitle:[NSString stringWithFormat:@"%@",[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"appointmenttype"] objectAtIndex:indexPath.row]] forState:(UIControlState)UIControlStateNormal];
            
            [TypeValuesShowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
            
            TypeValuesShowButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
            
            
            
            TypeValuesShowButton.layer.borderWidth = 1.0f;
            
            TypeValuesShowButton.tag=[[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"id"] objectAtIndex:indexPath.row] integerValue];
            
            [TypeValuesShowButton addTarget:self action:@selector(selectTypeUser:) forControlEvents:UIControlEventTouchDown];
            
            [cell addSubview:TypeValuesShowButton];
            
            
            
        }
        
        else
            
        {
            
            ProviderValuesShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            ProviderValuesShowButton.frame = CGRectMake(0,0, 320,45);
            
            ProviderValuesShowButton.backgroundColor=[UIColor whiteColor];
            
            ProviderValuesShowButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
            
            ProviderValuesShowButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            
            [ProviderValuesShowButton setTitle:[NSString stringWithFormat:@"%@",[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"]valueForKey:@"provider"] objectAtIndex:indexPath.row]] forState:(UIControlState)UIControlStateNormal];
            
            [ProviderValuesShowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            ProviderValuesShowButton.exclusiveTouch=YES;
            
            ProviderValuesShowButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
            
            ProviderValuesShowButton.layer.borderWidth = 1.0f;
            
            ProviderValuesShowButton.tag= [[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"]valueForKey:@"id"] objectAtIndex:indexPath.row] integerValue];
            
            [ProviderValuesShowButton addTarget:self action:@selector(selectProvideUser:) forControlEvents:UIControlEventTouchDown];
            
            [cell addSubview:ProviderValuesShowButton];
            
        }
    }
    
    return cell;
    
}

-(IBAction)selectTypeUser:(id)sender{
    
    
    
    TypeTagValue=[sender tag];
    NSLog(@"TypeTagValue=%d",TypeTagValue);
    
    [TypeTitleLable removeFromSuperview];
    
    TypeTitleLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 30)];
    
    TypeTitleLable.backgroundColor=[UIColor clearColor];
    
    TypeTitleLable.textColor=[UIColor blackColor];
    
    TypeTitleLable.textAlignment=NSTextAlignmentLeft;
    
    TypeTitleLable.font=[UIFont fontWithName:helveticaRegular size:15];
    
    TypeTitleLable.text=[NSString stringWithFormat:@"(%@)",[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"appointmenttype"] objectAtIndex:[sender tag]-1]];
    
    [TypeButton addSubview:TypeTitleLable];
    
    
    
    typeStatus=1;
    
    [self typeAction];
    
}



-(IBAction)selectProvideUser:(id)sender{
    
    
    
    ProiverTagValue=[sender tag];
    
    [ProviderTitleLable removeFromSuperview];
    
    ProviderTitleLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 30)];
    
    ProviderTitleLable.backgroundColor=[UIColor clearColor];
    
    ProviderTitleLable.textColor=[UIColor blackColor];
    
    ProviderTitleLable.textAlignment=NSTextAlignmentLeft;
    
    ProviderTitleLable.font=[UIFont fontWithName:helveticaRegular size:15];
    
    ProviderTitleLable.text=[NSString stringWithFormat:@"(%@)",[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"]valueForKey:@"provider"] objectAtIndex:[sender tag]-1]];
    
    [ProviderButton addSubview:ProviderTitleLable];
    
    
    
    purposeStatus=1;
    
    [self ProviderAction];
    
}





-(void)ProviderFunction{
    
    
    
    ProviderTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 300)];
    
    ProviderTableView.backgroundColor=[UIColor clearColor];
    
    ProviderTableView.delegate=self;
    
    ProviderTableView.dataSource = self;
    
    ProviderTableView.separatorStyle=UITableViewCellAccessoryNone;
    
    [self.view addSubview:ProviderTableView];
    
}

-(void)InformationAction

{
    
    [self scrollViewDidTapped];
    
    
    
    typeStatus=0;
    
    purposeStatus=0;
    
    notesStatus=0;
    
    attachmentsStatus=0;
    
    
    
    informationScrollView.hidden=YES;
    
    [TypeTableView removeFromSuperview];
    
    [ProviderTableView removeFromSuperview];
    
    [plusButton removeFromSuperview];
    
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    AttachmentsImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesTextView.hidden=YES;
    
    if(informationStatus==0){
        
        informationStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
            
            
            InformationButton.frame = CGRectMake(0, 178, 320, 45);
            
            TypeButton.frame = CGRectMake(0, 388, 320, 45);
            
            ProviderButton.frame = CGRectMake(0,TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            informationScrollView.hidden=NO;
            
            InformationImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
        }];
        
    }
    
    else{
        
        informationStatus=0;
        
        [UIView animateWithDuration:.2f animations:^{
            
            
            
            InformationButton.frame = CGRectMake(0,343, 320, 45);
            
            
            
            TypeButton.frame = CGRectMake(0,  InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            InformationImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
            
            
        }];
        
    }
    
}



-(void)typeAction

{
    
    [self scrollViewDidTapped];
    
    
    
    informationStatus=0;
    
    purposeStatus=0;
    
    notesStatus=0;
    
    attachmentsStatus=0;
    
    
    
    informationScrollView.hidden=YES;
    
    [ProviderTableView removeFromSuperview];
    
    [plusButton removeFromSuperview];
    
    
    
    InformationImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    AttachmentsImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesTextView.hidden=YES;
    
    
    
    if(typeStatus==0)
        
    {
        
        typeStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0, 155, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, 800, 320, 45);
            
            NotesButton.frame = CGRectMake(0, 800, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, 800, 320, 45);
            
            
            
        } completion:^(BOOL finished) {
            
            [self TypeFunctionCall];
            
            TypeImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
            
            
        }];
        
    }
    
    else
        
    {
        
        typeStatus=0;
        
        [UIView animateWithDuration:.2f animations:^{
            
            [TypeTableView removeFromSuperview];
            
            [ProviderTableView removeFromSuperview];
            
            
            
            InformationButton.frame = CGRectMake(0, 343, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45);
            
            
            
        } completion:^(BOOL finished) {
            
            TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
        }];
        
    }
    
    
    
}

-(void)ProviderAction{
    
    
    
    [self scrollViewDidTapped];
    
    
    
    informationStatus=0;
    
    typeStatus=0;
    
    notesStatus=0;
    
    attachmentsStatus=0;
    
    
    
    informationScrollView.hidden=YES;
    
    [TypeTableView removeFromSuperview];
    
    [plusButton removeFromSuperview];
    
    
    
    InformationImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    AttachmentsImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesTextView.hidden=YES;
    
    if(purposeStatus==0){
        
        purposeStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
            
            
            InformationButton.frame = CGRectMake(0, 155, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.origin.y+InformationButton.frame.size.height, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, 800, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, 800, 320, 45);
            
            
            
        } completion:^(BOOL finished) {
            
            [self ProviderFunction];
            
            ProviderImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
        }];
        
    }
    
    else{
        
        purposeStatus=0;
        
        [UIView animateWithDuration:.2f animations:^{
            
            [ProviderTableView removeFromSuperview];
            
            [TypeTableView removeFromSuperview];
            
            
            
            InformationButton.frame = CGRectMake(0, 343, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45);
            
            
            
        } completion:^(BOOL finished) {
            
            ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
        }];
        
    }
    
}



-(void)notesAction{
    
    
    
    [self scrollViewDidTapped];
    
    informationScrollView.hidden=YES;
    
    [plusButton removeFromSuperview];
    
    
    
    informationStatus=0;
    
    purposeStatus=0;
    
    typeStatus=0;
    
    attachmentsStatus=0;
    
    
    
    InformationImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    AttachmentsImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    
    
    if(notesStatus==0){
        
        notesStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0, 155, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            
            
        } completion:^(BOOL finished) {
            
            [self NotesFunction];
            
            AttachmentButton.frame = CGRectMake(0, NotesTextView.frame.size.height+NotesTextView.frame.origin.y, 320, 45);
            
            NotesImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
        }];
        
    }
    
    else{
        
        notesStatus=0;
        
        [UIView animateWithDuration:.2f animations:^{
            
            NotesTextView.hidden=YES;
            
            InformationButton.frame = CGRectMake(0, 343, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.size.height+InformationButton.frame.origin.y, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            
            
            NotesImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
        }];
        
    }
    
}

-(void)attachmentAction{
    
    [self scrollViewDidTapped];
    
    informationScrollView.hidden=YES;
    
    [plusButton removeFromSuperview];
    
    
    
    
    
    informationStatus=0;
    
    purposeStatus=0;
    
    typeStatus=0;
    
    notesStatus=0;
    
    
    
    InformationImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    NotesTextView.hidden=YES;
    
    if(attachmentsStatus==0)
        
    {
        
        attachmentsStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
            
            
            InformationButton.frame = CGRectMake(0, 155, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.origin.y+InformationButton.frame.size.height, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            [self AttachmentFunction];
            
            AttachmentsImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
        }];
        
    }
    
    else{
        
        attachmentsStatus=0;
        
        [UIView animateWithDuration:.2f animations:^{
            
            InformationButton.frame = CGRectMake(0, 343, 320, 45);
            
            TypeButton.frame = CGRectMake(0, InformationButton.frame.origin.y+InformationButton.frame.size.height, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
            NotesButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
            AttachmentButton.frame = CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            [plusButton removeFromSuperview];
            
            
            
            AttachmentsImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
        }];
        
    }
    
}



-(void)AttachmentFunction

{
    
    plusButton=[[UIButton alloc]initWithFrame:CGRectMake(30, NotesButton.frame.size.height+NotesButton.frame.origin.y+80, 50, 40)];
    
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
    
    
    
    //NSLog(@"InformationButton=%f",InformationButton.frame.size.height+InformationButton.frame.origin.y);
    
    
    
    informationScrollView=[[UIScrollView alloc]init];
    
    informationScrollView.hidden=NO;
    
    informationScrollView.frame=CGRectMake(0, 224, 320, 163);
    
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
    
    AppointmentLable.backgroundColor = [UIColor whiteColor];
    
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
    
    ConsultantLable.backgroundColor = [UIColor whiteColor];
    
    [informationScrollView addSubview:ConsultantLable];
    
    
    
    
    
    AppointmentDatePicker  = [[UIDatePicker alloc]init];
    
   // [AppointmentDatePicker setMinimumDate:[NSDate date]];
    
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
    
    DateLable.backgroundColor = [UIColor whiteColor];
    
    [informationScrollView addSubview:DateLable];
    
    
    
    
    
    
    
    UILabel *TimeLable=[[UILabel alloc]initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 125, 40) ];
    
    TimeLable.text= [NSString stringWithFormat:@"   %@",@"Time"];
    
    TimeLable.textAlignment=NSTextAlignmentLeft;
    
    TimeLable.font = [UIFont fontWithName:helveticaRegular size:13];
    
    TimeLable.textColor=[UIColor blackColor];
    
    TimeLable.backgroundColor = [UIColor whiteColor];
    
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
    
    [self.view addSubview:informationScrollView];
    
    
    
    
    
    UILabel *HospitalLable=[[UILabel alloc]initWithFrame:CGRectMake(0, dateTextField.frame.size.height+dateTextField.frame.origin.y+1, 125, 40) ];
    
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



-(void)NotesFunction

{
    
    NotesTextView.hidden=NO;
    
    NotesTextView.frame=CGRectMake(0, NotesButton.frame.size.height+NotesButton.frame.origin.y, 320, 80);
    
    NotesTextView.backgroundColor=[UIColor whiteColor];
    
    NotesTextView.delegate=self;
    
    NotesTextView.textColor = [UIColor blackColor];
    
    [NotesTextView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    
    [NotesTextView setScrollEnabled:YES];
    
    [self.view addSubview:NotesTextView];
    
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
    
    
    
    if ([textView.text isEqualToString:@"Bio"]) {
        
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

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    
    
    if ([textView.text isEqualToString:@""]) {
        
        // textView.text = @"Bio";
        
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

-(IBAction)textFieldDoneEditing:(id)sender{
    
}

-(void)BackButtonAction{
    
    [self scrollViewDidTapped];
    
    informationStatus=1;
    [self InformationAction];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    
}

-(void)DoneButtonFuction{
    
    
    if(appointmentTextField.text.length<1){
        
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
            [self ShowActivityIndicatorWithTitle:@"Loading..."];
            
            [self performSelector:@selector(serverCallForAddApointment) withObject:nil afterDelay:0.1];
        }
    
    
    
    
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
    
    CGFloat heightofKeyboard = 60;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, heightofKeyboard, 0);
    
    
    
    [informationScrollView  setContentInset:insets];
    
    [informationScrollView setScrollIndicatorInsets:insets];
    
    
    
}

-(void)scrollViewDidTapped

{
    
    [appointmentTextField  resignFirstResponder];
    
    [dateTextField resignFirstResponder];
    
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

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    
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
#pragma mark server CallFor AddApointment

-(void)serverCallForAddApointment

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
                                 
                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"],
                                 
                                 @"appointmentname":appointmentTextField.text,
                                 
                                 @"consultantname":consultantTextField.text,
                                 
                                 @"datetime":dateTextField.text,
                                 
                                 @"hospital":hospitalTextField.text,
                                 
                                 @"appointmenttype":[NSString stringWithFormat:@"%d",TypeTagValue],
                                 
                                 @"provider":[NSString stringWithFormat:@"%d",ProiverTagValue],
                                 
                                 @"notes":appointmentTextField.text,
                                 
                                 @"type":@"0",
                                 
                                 
                                 };
        
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/create_or_edit_user_appointment",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            
            NSLog(@"Add Apointments Json--->%@",json);
            
            if([json objectForKey:@"error"])
                
            {
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"error"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [myAlertView show];
                
            }
            
            else
                
            {
                //[NSString stringWithFormat:@"like to play game with %@ continue?",fbusername]
                
                [[NSUserDefaults standardUserDefaults] setObject:json forKey:kAppointmentData];
                NSLog(@"kAppointmentData=%@",[[NSUserDefaults standardUserDefaults]objectForKey:kAppointmentData]);
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isNewAppointmentCreatedByUser"];
                
                UIAlertView *complete=[[UIAlertView alloc]initWithTitle:nil  message:[NSString stringWithFormat:@"Your appointment '%@' has been confirmed",appointmentTextField.text]delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                
                complete.tag = 111;
                
                [complete show];
            }
            
            
            
            [self HideActivityIndicator];
            
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch");
    
    informationStatus=1;
    [self InformationAction];
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
