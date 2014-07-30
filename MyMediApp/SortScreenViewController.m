//
//  SortScreenViewController.m
//  MyMediApp
//
//  Created by anish on 29/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "SortScreenViewController.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.2;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.1;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 150;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

@interface SortScreenViewController (){
    UIView *TopBarView;
    UIButton *EdiButton;
    UIButton *Backbutton;
    UIButton *bylistButton;
    UIButton*byCalButton;
    CGSize   screenSize;
    CGRect screenBounds;
    NSDateFormatter *getdateFormatter;
     NSDateFormatter *datePopUpFormatter;
     NSDateFormatter *formatter;
     NSString *dateString;
    NSArray *dateArray;
    int currentDay;
    int currentmonth;
    int currentYear;
    int days;
    int month;
     CGFloat animatedDistance;
    int year;
    UIButton* SelectDateButton;
     UIImage*   selectimage;
    NSString *firstDayOfMonth;
    NSDate *dateFromString;
    UIImageView *calenderTopImageView;
     UILabel *dateMonthLbl;
    NSString *firstDayDate;
    NSDateFormatter *dayformatter;
    UIImageView *bgImgView;
    UIImageView *calenderBgImgView;
    NSDateFormatter *monthFormatter;
     NSString *formattedMonth;
    UIButton *monthRightBtn;
     UIImageView *currrentDayImgView;
    NSString *delivery_dateSave;
    UILabel * subheader1;
    UILabel * subheader2;
    UILabel * subheader3;
    UILabel * subheader4;
    UILabel * subheader5;
    UILabel * subheader6;
      UIButton *monthLeftBtn;
     UIButton *calenderBtn;
    
    UIButton *ViewByButton;
    UIButton *SortByButton;
    UIView *meraApnaView;
    UIView *  teraApnaView;
     UIDatePicker *DateDatePicker;
     UIDatePicker *EndDateDatePicker;
    UIToolbar *toolba;
    UIImageView *DropImageButtonImageView;
     UIImageView *CancelDropImageButtonImageView;
    UIView *BottomUpView;
    
    UITableView *TypeTableView;
    
    UITableView *ProviderTableView;
    
    int height;
    int heightProvider;
    
    UIButton*TypeValuesShowButton;
    
    UIButton*ProviderValuesShowButton;
    
    int TypeTagValue;
    
    int ProiverTagValue;
    
    UILabel *TypeTitleLable;
    
    UILabel *ProviderTitleLable;
    
    int typeStatus;
    
     int DateStatus;
    
    int purposeStatus;
    
    UIButton *TypeButton;
    UIButton   *ProviderButton;
    UIImageView *TypeImageView;
    UIImageView *ProviderImageView;
    UIImageView *StartDateImageView;
    
    UIButton *StartDateButton;
    UITextField *StartdateTextField;
    UITextField *EnddateTextField;
    
    UILabel *StartDateLable;
    UILabel *EndDateLable;
    
    NSString *SearhType;
    NSString  *SearhProvider;
    NSString   *searchDate;
    NSString *finalString;

}

@end

@implementation SortScreenViewController

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
    
    
    SearhType=@"0";
    SearhProvider=@"0";
    searchDate=@"0";
    finalString=@"0";
    
     finalString=@"000";
    self.view.backgroundColor=[UIColor whiteColor];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    TopBarView.userInteractionEnabled=TRUE;
    
    
    
//    EdiButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20, [UIImage imageNamed:@"editButton.png"].size.width ,[UIImage imageNamed:@"editButton.png"].size.height)];
//    
//    EdiButton.backgroundColor=[UIColor clearColor];
//    
//    [EdiButton setImage:[UIImage imageNamed:@"editButton.png"] forState:UIControlStateNormal];
//    
//    [EdiButton addTarget:self action:@selector(EditAppointments) forControlEvents:UIControlEventTouchUpInside];
//    
//    [TopBarView addSubview:EdiButton];
    
    
//    EditAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
//    
//    
//    
//    EditAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:15];
//    
//    EditAppointmentLable.textColor=[UIColor blackColor];
//    
//    EditAppointmentLable.textAlignment=NSTextAlignmentCenter;
//    
//    [TopBarView addSubview:EditAppointmentLable];
    
    
    Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Backbutton.frame = CGRectMake(5,20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height);
    
    Backbutton.backgroundColor=[UIColor clearColor];
    
    [Backbutton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    
    [Backbutton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:Backbutton];
    
    
    
  UIButton *DoneButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 35, 50, 25)];
    
    DoneButton.backgroundColor=[UIColor clearColor];
    
    [DoneButton setTitle:@"Done" forState:UIControlStateNormal];
    
    [DoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [DoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    DoneButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    
    [DoneButton addTarget:self action:@selector(DoneButtonFuction) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:DoneButton];
    
    DoneButton.exclusiveTouch=YES;
    
    
    
    [self.view addSubview:TopBarView];
    
    
    DropImageButtonImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"dropdown_btn.png"].size.width, [UIImage imageNamed:@"dropdown_btn.png"].size.height)];
    
    DropImageButtonImageView.image=[UIImage imageNamed:@"dropdown_btn.png"];
    
   ViewByButton=[[UIButton  alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+10, 320 , 45)];
    ViewByButton.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    ViewByButton.tag=100;
    [ViewByButton setTitle:@"View By" forState:UIControlStateNormal];
    [ViewByButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ViewByButton.layer.borderColor=[UIColor darkGrayColor].CGColor;
    ViewByButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    ViewByButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [ViewByButton addTarget:self action:@selector(listByListAction:) forControlEvents:UIControlEventTouchUpInside];
    ViewByButton.exclusiveTouch=YES;
    DropImageButtonImageView.hidden=YES;
    [ViewByButton addSubview:DropImageButtonImageView];
    [self.view addSubview:ViewByButton];
    
    
    CancelDropImageButtonImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"dropdown_btn.png"].size.width, [UIImage imageNamed:@"dropdown_btn.png"].size.height)];
    
    CancelDropImageButtonImageView.image=[UIImage imageNamed:@"dropdown_btn.png"];
    
    SortByButton=[[UIButton  alloc]initWithFrame:CGRectMake(0, ViewByButton.frame.size.height+ViewByButton.frame.origin.y+10, 320 , 45)];
    SortByButton.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    SortByButton.tag=100;
    [SortByButton setTitle:@"Sort By" forState:UIControlStateNormal];
    [SortByButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    SortByButton.layer.borderColor=[UIColor darkGrayColor].CGColor;
     SortByButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    SortByButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [SortByButton addTarget:self action:@selector(listBySortAction:) forControlEvents:UIControlEventTouchUpInside];
    SortByButton.exclusiveTouch=YES;
      CancelDropImageButtonImageView.hidden=YES;
     [SortByButton addSubview:CancelDropImageButtonImageView];
    
    
   
    
    
    [self.view addSubview:SortByButton];
    
    [self startDateEndDate];
    
    StartdateTextField.hidden=YES;
    EnddateTextField.hidden=YES;
    StartDateLable.hidden=YES;
    EndDateLable.hidden=YES;

    
}

-(void) listByActionView
{
    meraApnaView = [[UIView alloc]init];
    meraApnaView.backgroundColor=[UIColor whiteColor];
    meraApnaView.frame = CGRectMake(0, ViewByButton.frame.size.height+ViewByButton.frame.origin.y+10, 320, 568);
    
    
    
    UIView *SubView = [[UIView alloc]init];
    SubView.backgroundColor=[UIColor whiteColor];
    SubView.frame = CGRectMake(0, 10, 320, 100);
    SubView.userInteractionEnabled=TRUE;
    
    UILabel *ListByLable=[[UILabel alloc] init];
    [ListByLable setFrame:CGRectMake(0, 5, 320, 45)];
    ListByLable.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    ListByLable.layer.borderWidth = 0.5f;
    ListByLable.text=@"      List";
    ListByLable.textColor=[UIColor blackColor];
    ListByLable.textAlignment=NSTextAlignmentLeft;
    ListByLable.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:13];
    [ListByLable setBackgroundColor:[UIColor whiteColor]];
    ListByLable.userInteractionEnabled=true;
    [SubView addSubview:ListByLable];
    
    bylistButton=[[UIButton  alloc]initWithFrame:CGRectMake(270, 10, [UIImage imageNamed:@"checked.png"].size.width, [UIImage imageNamed:@"checked.png"].size.height)];
    bylistButton.backgroundColor=[UIColor whiteColor];
    bylistButton.layer.masksToBounds = YES;
    bylistButton.layer.borderWidth = 0.5;
    bylistButton.tag=100;
    bylistButton.userInteractionEnabled=FALSE;
    [bylistButton setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    [bylistButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateSelected];
    bylistButton.layer.borderColor=[UIColor darkGrayColor].CGColor;
    [bylistButton addTarget:self action:@selector(listByListAction) forControlEvents:UIControlEventTouchUpInside];
    [[bylistButton layer]setCornerRadius:10];
    bylistButton.exclusiveTouch=YES;
    [SubView addSubview:bylistButton];
    
    
    UILabel *CalByLable=[[UILabel alloc] init];
    [CalByLable setFrame:CGRectMake(0, ListByLable.frame.size.height+ListByLable.frame.origin.y, 320, 45)];
    CalByLable.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    CalByLable.layer.borderWidth = 0.5f;
    CalByLable.text=@"      Calender";
    CalByLable.textColor=[UIColor blackColor];
    CalByLable.textAlignment=NSTextAlignmentLeft;
    CalByLable.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:13];
    [CalByLable setBackgroundColor:[UIColor whiteColor]];
    CalByLable.userInteractionEnabled=true;
    
    byCalButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 10, [UIImage imageNamed:@"unchecked.png"].size.width, [UIImage imageNamed:@"unchecked.png"].size.height)];
    byCalButton.backgroundColor=[UIColor whiteColor];
    byCalButton.layer.masksToBounds = YES;
    byCalButton.layer.borderWidth = 0.5;
    byCalButton.layer.borderColor=[UIColor darkGrayColor].CGColor;
    byCalButton.userInteractionEnabled=YES;
    [[byCalButton layer]setCornerRadius:10];
    byCalButton.tag=200;
    byCalButton.exclusiveTouch=YES;
    [byCalButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [byCalButton addTarget:self action:@selector(listByCalenderAction) forControlEvents:UIControlEventTouchUpInside];
    [CalByLable addSubview:byCalButton];
    
    [SubView addSubview:CalByLable];
    
    [meraApnaView addSubview:SubView];
    
    BottomUpView = [[UIView alloc]init];
    BottomUpView.backgroundColor=[UIColor greenColor];
    BottomUpView.frame = CGRectMake(0, SubView.frame.size.height+SubView.frame.origin.y+50, 320, 100);
    BottomUpView.userInteractionEnabled=TRUE;
    
   
    UILabel *ChronoLogicalByLable=[[UILabel alloc] init];
    [ChronoLogicalByLable setFrame:CGRectMake(0, 5, 320, 45)];
    ChronoLogicalByLable.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    ChronoLogicalByLable.layer.borderWidth = 0.5f;
    ChronoLogicalByLable.text=@"      Chronologically";
    ChronoLogicalByLable.textColor=[UIColor blackColor];
    ChronoLogicalByLable.textAlignment=NSTextAlignmentLeft;
    ChronoLogicalByLable.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:13];
    [ChronoLogicalByLable setBackgroundColor:[UIColor whiteColor]];
    ChronoLogicalByLable.userInteractionEnabled=true;
    [BottomUpView addSubview:ChronoLogicalByLable];
    
    
   
  
    
  UIButton *ChronolistButton=[[UIButton  alloc]initWithFrame:CGRectMake(270, 10, [UIImage imageNamed:@"checked.png"].size.width, [UIImage imageNamed:@"checked.png"].size.height)];
    ChronolistButton.backgroundColor=[UIColor whiteColor];
    ChronolistButton.layer.masksToBounds = YES;
    ChronolistButton.layer.borderWidth = 0.5;
    ChronolistButton.tag=100;
    ChronolistButton.userInteractionEnabled=FALSE;
    [ChronolistButton setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    [ChronolistButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateSelected];
    ChronolistButton.layer.borderColor=[UIColor darkGrayColor].CGColor;
    //[ChronolistButton addTarget:self action:@selector(listByListAction) forControlEvents:UIControlEventTouchUpInside];
    [[ChronolistButton layer]setCornerRadius:10];
    ChronolistButton.exclusiveTouch=YES;
    [ChronoLogicalByLable addSubview:ChronolistButton];
    
    
    [BottomUpView addSubview:ChronoLogicalByLable];
    
    UILabel *AlphbetButon=[[UILabel alloc] init];
    [AlphbetButon setFrame:CGRectMake(0, ChronoLogicalByLable.frame.size.height+ChronoLogicalByLable.frame.origin.y, 320, 45)];
    AlphbetButon.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    AlphbetButon.layer.borderWidth = 0.5f;
    AlphbetButon.text=@"      Alphabetically";
    AlphbetButon.textColor=[UIColor blackColor];
    AlphbetButon.textAlignment=NSTextAlignmentLeft;
    AlphbetButon.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:13];
    [AlphbetButon setBackgroundColor:[UIColor whiteColor]];
    AlphbetButon.userInteractionEnabled=true;
    
     [BottomUpView addSubview:AlphbetButon];
   
    
    
    UIButton *AphaBetlistButton=[[UIButton  alloc]initWithFrame:CGRectMake(270, 10, [UIImage imageNamed:@"checked.png"].size.width, [UIImage imageNamed:@"checked.png"].size.height)];
    AphaBetlistButton.backgroundColor=[UIColor whiteColor];
    AphaBetlistButton.layer.masksToBounds = YES;
    AphaBetlistButton.layer.borderWidth = 0.5;
    AphaBetlistButton.tag=100;
    AphaBetlistButton.userInteractionEnabled=FALSE;
    [AphaBetlistButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [AphaBetlistButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateSelected];
    AphaBetlistButton.layer.borderColor=[UIColor darkGrayColor].CGColor;
   // [AphaBetlistButton addTarget:self action:@selector(listByListAction) forControlEvents:UIControlEventTouchUpInside];
    [[AphaBetlistButton layer]setCornerRadius:10];
    AphaBetlistButton.exclusiveTouch=YES;
    [AlphbetButon addSubview:AphaBetlistButton];

    
    
    [BottomUpView addSubview:AlphbetButon];
    
    BottomUpView.backgroundColor=[UIColor whiteColor];
    [meraApnaView addSubview:BottomUpView];
    
[self.view addSubview:meraApnaView];
    
    
    

}
-(void)listBySortAction :(UIButton*) sender
{
    if(!(sender.selected))
    {
        sender.selected=YES;
        CancelDropImageButtonImageView.hidden=NO;
        [self listBySortActionView];
        [TypeTableView removeFromSuperview];
        [ProviderTableView removeFromSuperview];
        
    }
    else
    {
        CancelDropImageButtonImageView.hidden=YES;
        sender.selected=NO;
        
        [ProviderImageView removeFromSuperview];
        [TypeTableView removeFromSuperview];
        
        SortByButton.frame=CGRectMake(0,ViewByButton.frame.size.height+ViewByButton.frame.origin.y+10, 320 , 45);
        ViewByButton.hidden=NO;
        TypeButton.hidden=YES;
         ProviderButton.hidden=YES;
         StartDateButton.hidden=YES;
    }
}
-(void) listBySortActionView
{

    [TypeImageView removeFromSuperview];
  TypeImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    
    [TypeButton removeFromSuperview];
  TypeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 433, 320, 45)];
    
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
    
     [ProviderImageView removeFromSuperview];
    ProviderImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
 [ProviderButton removeFromSuperview];
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
    
     [StartDateImageView removeFromSuperview];
   StartDateImageView=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, [UIImage imageNamed:@"PlusImage.png"].size.width, [UIImage imageNamed:@"MinusImage.png"].size.height)];
    
    StartDateImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    
    StartDateButton=[[UIButton alloc]initWithFrame:CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45)];
    
     [StartDateButton addTarget:self action:@selector(DateActionButton)
    
    forControlEvents:UIControlEventTouchUpInside];
    
    [StartDateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    StartDateButton.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
    
    StartDateButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 18];
    
    StartDateButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [StartDateButton setTitle:@"Date" forState:(UIControlState)UIControlStateNormal];
    
    StartDateButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    StartDateButton.exclusiveTouch=YES;
    
     [StartDateButton addSubview:StartDateImageView];
    
    [self.view addSubview:StartDateButton];
    
    [TypeTitleLable removeFromSuperview];
    TypeTitleLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 30)];
    TypeTitleLable.backgroundColor=[UIColor clearColor];
    TypeTitleLable.textColor=[UIColor blackColor];
    TypeTitleLable.textAlignment=NSTextAlignmentLeft;
    TypeTitleLable.font=[UIFont fontWithName:helveticaRegular size:15];
    [TypeButton addSubview:TypeTitleLable];
    
    
    [ProviderTitleLable removeFromSuperview];
    ProviderTitleLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 30)];
    ProviderTitleLable.backgroundColor=[UIColor clearColor];
    ProviderTitleLable.textColor=[UIColor blackColor];
    ProviderTitleLable.textAlignment=NSTextAlignmentLeft;
    ProviderTitleLable.font=[UIFont fontWithName:helveticaRegular size:15];
    [ProviderButton addSubview:ProviderTitleLable];

    
    
    //[self.view addSubview:teraApnaView];
}

-(void)listByListAction{
    BottomUpView.hidden=NO;
      [bylistButton setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
     [byCalButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
}
-(void)listByListAction :(UIButton*) sender
{
    
    if(!(sender.selected))
       {
    DropImageButtonImageView.hidden=NO;
    SortByButton.hidden=YES;
           sender.selected=YES;
           
           [self listByActionView];
    
    
           }

    else
    {SortByButton.hidden=NO;
        sender.selected=NO;
        meraApnaView.hidden = YES;
         DropImageButtonImageView.hidden=YES;
    }
    
    
 
}
-(void)listByCalenderAction{
    
    BottomUpView.hidden=YES;
    bylistButton.userInteractionEnabled=TRUE;
    //[self calender];
    // bylistButton.userInteractionEnabled=TRUE;
    [byCalButton setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateNormal];
    [bylistButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
}
-(void)calender

{
    screenSize = [[UIScreen mainScreen] bounds].size;
    
    getdateFormatter = [[NSDateFormatter alloc] init];
    
    [getdateFormatter setDateFormat:@"MMMM"];
    
    getdateFormatter.dateStyle = NSDateFormatterFullStyle;
    
    
    
    
    
    datePopUpFormatter = [[NSDateFormatter alloc] init];
    
    
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    
    
    //    if(subheader6.text.length >0){
    //
    //    }
    //    else{
    dateString = [formatter stringFromDate:[NSDate date]];
    // }
    dateArray = [dateString componentsSeparatedByString:@"-"];//current date in array
    
    
    
    currentDay = days = [[dateArray objectAtIndex:0] integerValue];
    
    // Current Day
    
    
    
    currentmonth = month =  [[dateArray objectAtIndex:1] integerValue];
    
    
    
    currentYear = year = [[dateArray objectAtIndex:2] integerValue];
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"SelectionType"];
    
    
    
    firstDayDate = [NSString stringWithFormat:@"01-%@-%@",[dateArray objectAtIndex:1],[dateArray objectAtIndex:2]];
    
    [[NSUserDefaults standardUserDefaults] setObject:firstDayDate forKey:@"firstDayDate"];
    
    
    NSLog(@"%@",firstDayDate);
    dateFromString = [[NSDate alloc] init];
    
    dateFromString = [formatter dateFromString:firstDayDate];
    
    
    
    dayformatter = [[NSDateFormatter alloc] init];
    
    [dayformatter setDateFormat:@"EEEE"];
    
    
    
    monthFormatter = [[NSDateFormatter alloc] init];
    
    [monthFormatter setDateFormat:@"MMMM yyyy"];
    
    
    
    firstDayOfMonth = [dayformatter stringFromDate:dateFromString];
    
    screenBounds = [[UIScreen mainScreen] bounds];
    
    UIImage * blueImg ;
    
    bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, 320, screenBounds.size.height)];
    if (screenSize.height == 480.0f){
        blueImg = [UIImage imageNamed:@"i4_calender_bg.jpg"];
    }
    if (screenSize.height == 568.0f){
        blueImg = [UIImage imageNamed:@"i5_calender_bg.jpg"];
    }
    
    
    [bgImgView setImage:blueImg];
    bgImgView.backgroundColor = [UIColor whiteColor];
    
    bgImgView.userInteractionEnabled = YES;
    
    
    
    //  UISwipeGestureRecognizer *LeftGesturesRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextDateSelected)];
    
    //    [LeftGesturesRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    //    [bgImgView addGestureRecognizer:LeftGesturesRecognizer];
    
    
    
    [self.view addSubview:bgImgView];
    
    
    
    NSArray *objArryDays = [NSArray arrayWithObjects:@"SUN",@"MON",@"TUE",@"WED",@"THU",@"FRI",@"SAT",nil];
    
    int daysLabel_x = 0;
    
    for(int arryCount = 0; arryCount < [objArryDays count]; arryCount ++)
        
    {
        
        UILabel *daysLabel = [[UILabel alloc] initWithFrame:CGRectMake(daysLabel_x, 53, 46, 34)];
        
        daysLabel.text = [objArryDays objectAtIndex:arryCount];
        
        daysLabel.textAlignment = NSTextAlignmentCenter;
        
        [daysLabel setFont:[UIFont fontWithName:@"Gotham-Bold" size:14]];
        
        daysLabel.backgroundColor = [UIColor colorWithRed:243.0/255 green:243.0/255 blue:243.0/255 alpha:1.0];
        
        daysLabel.textColor = [UIColor colorWithRed:25.0/255 green:64.0/255 blue:114.0/255 alpha:1.0];
        
        [bgImgView addSubview:daysLabel];
        
        
        
        daysLabel_x = daysLabel_x + 46;
        
    }
    
    
    
    // UIImageView *bottomImageView;
    
    if (screenSize.height == 480.0f)
        
    {
        
        
        
        UIImage *calbackground=[UIImage imageNamed:@"calender_bg_4.png"];
        
        calenderTopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
        
        calenderBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 85, calbackground.size.width/2,calbackground.size.height/2)];
        
        calenderBgImgView.image = calbackground;
        
        calenderBgImgView.userInteractionEnabled = YES;
        
        
        
    }
    
    if (screenSize.height == 568.0f)
        
    {
        
        calenderTopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 53.5)];
        
        UIImage *calbackground=[UIImage imageNamed:@"calender_bg_4.png"];
        
        calenderBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 85, calbackground.size.width/2,calbackground.size.height/2)];
        
        calenderBgImgView.image = calbackground;
        
    }
    
    
    
    calenderBgImgView.userInteractionEnabled = YES;
    
    calenderTopImageView.backgroundColor=[UIColor clearColor];
    
    [bgImgView addSubview:calenderBgImgView];
    
    [bgImgView addSubview:calenderTopImageView];
    
    
    
    
    
    calenderTopImageView.image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"calender_view_bar.png"]];
    
    calenderTopImageView.userInteractionEnabled = YES;
    
    [bgImgView addSubview:calenderTopImageView];
    
    
    
    
    
    
    
    dateMonthLbl = [[UILabel alloc] initWithFrame:CGRectMake(55,0, 210, 53)];
    
    [dateMonthLbl setFont:[UIFont fontWithName:@"Gotham-Book" size:15.f]];
    
    formattedMonth = [monthFormatter stringFromDate:dateFromString];
    
    dateMonthLbl.text = [[NSString stringWithFormat:@"%@",formattedMonth] uppercaseString];
    
    dateMonthLbl.textAlignment = NSTextAlignmentCenter;
    
    dateMonthLbl.backgroundColor = [UIColor clearColor];
    
    dateMonthLbl.textColor = [UIColor colorWithRed:243.0/255 green:243.0/255 blue:243.0/255 alpha:1.0];
    
    [calenderTopImageView addSubview:dateMonthLbl];
    
    
    
    monthRightBtn = [[UIButton alloc] initWithFrame:CGRectMake(286, 12, 20, 30)];
    
    [monthRightBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/rightarrow_off.png"]] forState:UIControlStateNormal];
    
    monthRightBtn.userInteractionEnabled = YES;
    
    monthRightBtn.exclusiveTouch = YES;
    
    [monthRightBtn addTarget:self action:@selector(nextDateSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [calenderTopImageView addSubview:monthRightBtn];
    
    
    
    [self makeCalender];
}
- (void)makeCalender

{
    
    
    [currrentDayImgView removeFromSuperview];
    
    currrentDayImgView = nil;
    
    
    
    for (int i = 0; i<[[[NSUserDefaults standardUserDefaults] objectForKey:@"days"] integerValue]; i++)
        
    {
        
        [[self.view viewWithTag:100+i] removeFromSuperview];
        
        [[self.view viewWithTag:2000+i] removeFromSuperview];
        
        [[self.view viewWithTag:i+1] removeFromSuperview];
        
    }
    
    NSDate *today;
    if(subheader6.text.length == 0)
        today =  dateFromString;
    
    else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMM dd, yyyy"]; // changed line in your code
        NSDate *date23 = [dateFormatter dateFromString:subheader6.text];
        NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
        [dateFormatter2 setDateFormat:@"dd-MM-yyyy"]; // changed line in your code
        NSString *dateText = [dateFormatter2 stringFromDate:date23];
        today = [dateFormatter2 dateFromString:dateText];
        
    }
    
    NSLog(@"%@",today);
    
    NSCalendar *c = [NSCalendar currentCalendar];
    
    NSRange dayss = [c rangeOfUnit:NSDayCalendarUnit
                     
                            inUnit:NSMonthCalendarUnit
                     
                           forDate:today];
    
    
    
    
    
    int floatY = 3.5;
    
    int floatX;
    
    int floatHeight;
    
    int floatwidth;
    
    
    
    
    
    if (screenSize.height == 480.0f)
        
    {
        
        floatHeight = 57;
        
        floatwidth = 46;
        
    }
    
    else
        
    {
        
        floatHeight = 57;
        
        floatwidth = 46;
        
    }
    
    
    
    
    
    if ([firstDayOfMonth isEqualToString:@"Monday"])
        
    {
        
        
        
        floatX = (floatwidth*1);
        
    }
    
    else if ([firstDayOfMonth isEqualToString:@"Tuesday"])
        
    {
        
        
        
        floatX =(floatwidth*2);
        
    }
    
    
    
    else if ([firstDayOfMonth isEqualToString:@"Wednesday"])
        
    {
        
        
        
        floatX = (floatwidth*3);
        
    }
    
    else if ([firstDayOfMonth isEqualToString:@"Thursday"])
        
    {
        
        
        
        floatX = (floatwidth*4);
        
    }
    
    else if ([firstDayOfMonth isEqualToString:@"Friday"])
        
    {
        
        
        
        floatX = (floatwidth*5);
        
    }
    
    else if ([firstDayOfMonth isEqualToString:@"Saturday"])
        
    {
        
        
        
        floatX = (floatwidth*6);
        
    }
    
    else
        
    {
        
        floatX = 0;
        
        NSLog(@"abc");
        
    }
    
    
    
    
    
    int count;
    
    [[NSUserDefaults standardUserDefaults] setInteger:dayss.length forKey:@"days"];
    
    for (count = 0; count<dayss.length; count++)
        
    {
        
        calenderBtn =[[UIButton alloc] initWithFrame:CGRectMake(floatX, floatY, floatwidth - 2, floatHeight-1.5)];
        
        calenderBtn.backgroundColor = [UIColor clearColor];
        
        calenderBtn.userInteractionEnabled = YES;
        
        calenderBtn.tag = count + 1;
        
        
        
        if(count + 1 == currentDay && month == currentmonth && year == currentYear)
            
        {
            
            //[calenderBtn setTitleColor:[UIColor colorWithRed:0.71484375 green:0.47703125 blue:0.94140625 alpha:1.0] forState:UIControlStateNormal];
            
            
            
            int k=calenderBtn.tag;
            
            
            
            for (int i=k; i>0; i--)
                
            {
                
                NSLog(@"k=%d",i);
                
                
                [(UIButton *)[self.view viewWithTag:i] setUserInteractionEnabled:NO];
                
                [(UIButton *)[self.view viewWithTag:i] setBackgroundColor:[UIColor colorWithRed:18.0/255 green:36.0/255 blue:56.0/255 alpha:1.0]];
                
            }
            
            [monthLeftBtn removeFromSuperview];
            
            NSLog(@"%d",currentmonth);
            if(subheader6.text.length == 0)
                calenderBtn.backgroundColor=[UIColor colorWithRed:53.0/255 green:100.0/255 blue:149.0/255 alpha:1.0];
        }
        
        
        NSString* monthtext = [[subheader6.text componentsSeparatedByString:@" "] objectAtIndex:0];
        int highlightedTag = [[[[[subheader6.text componentsSeparatedByString:@" "] objectAtIndex:1] componentsSeparatedByString:@","] objectAtIndex:0] integerValue];
        if([monthtext isEqualToString:@"JAN"]) monthtext = @"1";
        if([monthtext isEqualToString:@"FEB"]) monthtext = @"2";
        if([monthtext isEqualToString:@"MAR"]) monthtext = @"3";
        if([monthtext isEqualToString:@"APR"]) monthtext = @"4";
        if([monthtext isEqualToString:@"MAY"]) monthtext = @"5";
        if([monthtext isEqualToString:@"JUN"]) monthtext = @"6";
        if([monthtext isEqualToString:@"JUL"]) monthtext = @"7";
        if([monthtext isEqualToString:@"AUG"]) monthtext = @"8";
        if([monthtext isEqualToString:@"SEP"]) monthtext = @"9";
        if([monthtext isEqualToString:@"OCT"]) monthtext = @"10";
        if([monthtext isEqualToString:@"NOV"]) monthtext = @"11";
        if([monthtext isEqualToString:@"DEC"]) monthtext = @"12";
        
        
        if(subheader6.text.length>0){
            if(month == [monthtext integerValue]){
                [(UIButton *)[self.view viewWithTag:highlightedTag] setBackgroundColor:[UIColor colorWithRed:53.0/255 green:100.0/255 blue:149.0/255 alpha:1.0]];
            }
        }
        
        
        [calenderBtn setTitle:[NSString stringWithFormat:@"%d",count+1] forState:UIControlStateNormal];
        
        [calenderBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        
        [calenderBtn addTarget:self action:@selector(caaalenderSelected1:) forControlEvents:UIControlEventTouchDown];
        [calenderBtn addTarget:self action:@selector(caaalenderSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        [calenderBgImgView addSubview:calenderBtn];
        
        
        
        //        if(floatX==0)
        //
        //        {
        //
        //            UIImage *sundayBackGround=[UIImage imageNamed:@"calendar_cell_disabled.png"];
        //
        //            [calenderBtn setBackgroundImage:sundayBackGround forState:UIControlStateNormal];
        //
        //            [calenderBtn setBackgroundImage:sundayBackGround forState:UIControlStateSelected];
        //
        //            [calenderBtn setBackgroundImage:sundayBackGround forState:UIControlStateHighlighted];
        //
        //
        //
        //            NSLog(@"count=%d",count);
        //
        //            //[calenderBtn setTitleColor:[UIColor colorWithRed:0.13671875 green:0.13671875 blue:0.13671875 alpha:1.0] forState:UIControlStateNormal];
        //
        //            [(UIButton *)[self.view viewWithTag:count+1] setUserInteractionEnabled:NO];
        //
        //
        //
        //            //[(UIButton *)[self.view viewWithTag:count].userInteractionEnabled=FALSE];
        //
        //        }
        
        
        
        floatX = floatX + floatwidth;
        
        if (floatX > 320)
            
        {
            
            floatX = 0;
            
            
            
            floatY = floatY + floatHeight;
            
        }
        
    }
    
}
-(void)caaalenderSelected1 : (UIButton *)sender{
    [(UIButton *)[self.view viewWithTag:[sender tag]] setBackgroundColor:[UIColor colorWithRed:53.0/255 green:100.0/255 blue:149.0/255 alpha:1.0]];
}
-(void)caaalenderSelected : (UIButton *)sender

{
    
    NSLog(@"Selected date is=%d",sender.tag);
    
    selectimage=[UIImage imageNamed:@"calendar_cell_on_click.png"];
    
    
    
    [(UIButton *)[self.view viewWithTag:[sender tag]] setBackgroundImage:selectimage forState:UIControlStateSelected];
    
    [(UIButton *)[self.view viewWithTag:[sender tag]] setBackgroundImage:selectimage forState:UIControlStateHighlighted];
    
    NSString *selectDate=[NSString stringWithFormat:@"%d",sender.tag];
    if([selectDate isEqualToString:@"1"]) selectDate  = @"01";
    else if([selectDate isEqualToString:@"2"]) selectDate  = @"02";
    else if([selectDate isEqualToString:@"3"]) selectDate  = @"03";
    else if([selectDate isEqualToString:@"4"]) selectDate  = @"04";
    else if([selectDate isEqualToString:@"5"]) selectDate  = @"05";
    else if([selectDate isEqualToString:@"6"]) selectDate  = @"06";
    else if([selectDate isEqualToString:@"7"]) selectDate  = @"07";
    else if([selectDate isEqualToString:@"8"]) selectDate  = @"08";
    else if([selectDate isEqualToString:@"9"]) selectDate  = @"09";
    else selectDate = selectDate;
    
    // [[NSString stringWithFormat:@"%@",formattedMonth] uppercaseString];
    NSString*breaked = [[formattedMonth componentsSeparatedByString:@" "] objectAtIndex:0];
    breaked = [breaked substringWithRange:NSMakeRange(0,3)];
    breaked  =  [breaked uppercaseString];
    
    delivery_dateSave=[NSString stringWithFormat:@"%@ %@, %@",breaked,selectDate,[[formattedMonth componentsSeparatedByString:@" "] objectAtIndex:1]];
    
    [SelectDateButton setTitle:[[NSString stringWithFormat:@"%@",delivery_dateSave ]uppercaseString] forState:(UIControlState)UIControlStateNormal];
    
    [SelectDateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    //    NSDate *date = [dateFormat dateFromString:delivery_dateSave];
    //    // Convert date object to desired output format
    //    [dateFormat setDateFormat:@"yyyy"];
    //    NSLog(@"%@",date);
    //    name = [dateFormat stringFromDate:date];
    
    // selectCalendar=FALSE;
    
    // dateIsSelectOrNot=TRUE;
    subheader6.text = delivery_dateSave;
    NSLog(@"%@",delivery_dateSave);
    
    [bgImgView removeFromSuperview];
    
}
-(void)BackButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)previousDateSelected

{
    
    
    
    firstDayDate = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstDayDate"]];
    
    dateArray = [firstDayDate componentsSeparatedByString:@"-"];
    
    
    
    days = [[dateArray objectAtIndex:0] integerValue];
    
    month = [[dateArray objectAtIndex:1] integerValue];
    
    year = [[dateArray objectAtIndex:2] integerValue];
    
    
    
    if (month <=currentmonth && year == currentYear-1)
        
    {
        
        monthLeftBtn.enabled = NO;
        
    }
    
    else
        
    {
        
        monthLeftBtn.enabled = YES;
        
        monthRightBtn.enabled = YES;
        
        
        
        int preMonthDays = [[[NSUserDefaults standardUserDefaults] objectForKey:@"days"] integerValue];
        
        
        
        for (int x = 1; x<=preMonthDays; x++)
            
        {
            
            [[self.view  viewWithTag:x] removeFromSuperview];
            
        }
        
        
        
        if (month>1)
            
        {
            
            month = [[dateArray objectAtIndex:1] integerValue]-1;
            
            firstDayDate = [NSString stringWithFormat:@"%d-%d-%d",days, month, year];
            
        }
        
        else
            
        {
            
            year = [[dateArray objectAtIndex:2] integerValue]-1;
            
            firstDayDate = [NSString stringWithFormat:@"%d-%d-%d",days, 12, year];
            
        }
        
        
        
        [[NSUserDefaults standardUserDefaults] setObject:firstDayDate forKey:@"firstDayDate"];
        
        firstDayDate = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstDayDate"]];
        
        dateArray = [firstDayDate componentsSeparatedByString:@"-"];
        
        
        
        days = [[dateArray objectAtIndex:0] integerValue];
        
        month = [[dateArray objectAtIndex:1] integerValue];
        
        year = [[dateArray objectAtIndex:2] integerValue];
        
        dateFromString = [formatter dateFromString:firstDayDate];
        
        
        
        firstDayOfMonth = [dayformatter stringFromDate:dateFromString];
        
        formattedMonth = [monthFormatter stringFromDate:dateFromString];
        
        dateMonthLbl.text = [[NSString stringWithFormat:@"%@",formattedMonth] uppercaseString];
        
        
        
        [self makeCalender];
        
    }
    
    
    
}

- (void)nextDateSelected

{
    [monthLeftBtn removeFromSuperview];
    
    monthLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(15,12,20, 30)];  //(15,16,14.5, 23)
    
    [monthLeftBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/leftarrow_off.png"]] forState:UIControlStateNormal];
    
    monthLeftBtn.userInteractionEnabled = YES;
    
    monthLeftBtn.exclusiveTouch = YES;
    
    [monthLeftBtn addTarget:self action:@selector(previousDateSelected) forControlEvents:UIControlEventTouchUpInside];
    
    [calenderTopImageView addSubview:monthLeftBtn];
    
    
    
    firstDayDate = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstDayDate"]];
    NSLog(@"%@",firstDayDate);
    
    dateArray = [firstDayDate componentsSeparatedByString:@"-"];
    
    
    
    
    
    
    
    //    if ((currentmonth+3 <=month  && year == currentYear) || (year == currentYear+1 && currentmonth+3<=month+12))
    //
    //    {
    //
    //        monthRightBtn.enabled = NO;
    //
    //
    //
    //    }
    //
    //    else
    //
    //    {
    
    monthLeftBtn.enabled = YES;
    
    monthRightBtn.enabled = YES;
    
    
    
    int preMonDays = [[[NSUserDefaults standardUserDefaults] objectForKey:@"days"] integerValue];
    
    for (int x = 1; x<=preMonDays; x++)
        
    {
        
        [[self.view viewWithTag:x] removeFromSuperview];
        
    }
    
    
    
    if (month<12)
        
    {
        
        month = [[dateArray objectAtIndex:1] integerValue]+1;
        
        firstDayDate = [NSString stringWithFormat:@"%d-%d-%d",01, month, year];
        NSLog(@"%@",firstDayDate);
    }
    
    else
        
    {
        
        year = [[dateArray objectAtIndex:2] integerValue]+1;
        
        firstDayDate = [NSString stringWithFormat:@"%d-%d-%d",days, 01, year];
        NSLog(@"%@",firstDayDate);
    }
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:firstDayDate forKey:@"firstDayDate"];
    
    dateFromString = [formatter dateFromString:firstDayDate];
    NSLog(@"%@",dateFromString);
    firstDayOfMonth = [dayformatter stringFromDate:dateFromString];
    
    formattedMonth = [monthFormatter stringFromDate:dateFromString];
    NSLog(@"%@",formattedMonth);
    dateMonthLbl.text = [[NSString stringWithFormat:@"%@", formattedMonth] uppercaseString];
    NSLog(@"%@",dateMonthLbl.text);
    
    firstDayDate = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstDayDate"]];
    
    dateArray = [firstDayDate componentsSeparatedByString:@"-"];
    days = [[dateArray objectAtIndex:0] integerValue];
    
    month = [[dateArray objectAtIndex:1] integerValue];
    NSLog(@"%d",month);
    year = [[dateArray objectAtIndex:2] integerValue];
    
    [self makeCalender];

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
    
    NSString *string2 = [NSString stringWithFormat:@"%d", TypeTagValue];
    NSLog(@"TypeTagValue=%@",string2);
    int StatusChange;
    for(int j = 0 ; j < [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"] count] ; j ++)
    {
        NSLog(@"listOfTemArrayApplied=%@",[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"id"] objectAtIndex:j]);
        
        if(TypeTagValue==[[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"id"] objectAtIndex:j] integerValue])
        {
            StatusChange=[[NSString stringWithFormat:@"%d",j] integerValue];
            break;
        }
        
    }
    NSLog(@"StatusChange=%d",StatusChange);
    
    TypeTitleLable.text=[NSString stringWithFormat:@"(%@)",[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"appointmenttype"] objectAtIndex:StatusChange]];
    
    typeStatus=1;
    
    SearhType=@"1";
    SearhProvider=@"0";
    searchDate=@"0";
    
    finalString=[[SearhType stringByAppendingString:SearhProvider] stringByAppendingString:searchDate];
    NSLog(@"finalString=%@",finalString);
    [self typeAction];
    
}



-(IBAction)selectProvideUser:(id)sender{
    
    
    
    ProiverTagValue=[sender tag];
    
    NSString *string2 = [NSString stringWithFormat:@"%d", ProiverTagValue];
    NSLog(@"TypeTagValue=%@",string2);
    int StatusChange;
    for(int j = 0 ; j < [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"] count] ; j ++)
    {
        
        
        if(ProiverTagValue==[[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"]valueForKey:@"id"] objectAtIndex:j] integerValue])
        {
            StatusChange=[[NSString stringWithFormat:@"%d",j] integerValue];
            break;
        }
        
    }
    ProviderTitleLable.text=[NSString stringWithFormat:@"(%@)",[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"]valueForKey:@"provider"] objectAtIndex:StatusChange]];
    
    purposeStatus=1;
    SearhType=@"0";
    SearhProvider=@"1";
    searchDate=@"0";
    
    finalString=[[SearhType stringByAppendingString:SearhProvider] stringByAppendingString:searchDate];;
    
    [self ProviderAction];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)typeAction

{
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    StartDateImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    
    ViewByButton.hidden=YES;
    SortByButton.frame=CGRectMake(0,TopBarView.frame.size.height+TopBarView.frame.origin.y+10, 320 , 45);
    purposeStatus=0;
     [TypeTableView removeFromSuperview];
    [ProviderTableView removeFromSuperview];
    if(typeStatus==0)
    {
        
        typeStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
            
            height=[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"] count]*44;
            
            NSLog(@"height=%d",height);
            
            int heightY=0;
            if(400-height<90)
            {
                heightY=SortByButton.frame.origin.y+SortByButton.frame.size.height;
            }
            else{
                heightY=343-height;
                
            }
            TypeButton.frame = CGRectMake(0, heightY, 320, 45);
            
            
        } completion:^(BOOL finished) {
            
            [self TypeFunctionCall];
          //  ProviderButton.hidden=NO;
            
            ProviderButton.frame = CGRectMake(0, TypeTableView.frame.size.height+TypeTableView.frame.origin.y, 320, 45);
            StartDateButton.frame= CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            TypeImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
        }];
    }
    else
    {
        typeStatus=0;
        ProviderButton.hidden=NO;
        [UIView animateWithDuration:.2f animations:^{
            
            [TypeTableView removeFromSuperview];
            
            [ProviderTableView removeFromSuperview];
            
            TypeButton.frame = CGRectMake(0,433, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeTableView.frame.size.height+TypeTableView.frame.origin.y, 320, 45);
            StartDateButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
    
            
        } completion:^(BOOL finished) {
            
            TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
        }];
        
    }
    
}
-(void)TypeFunctionCall

{
    TypeTableView=[[UITableView alloc]init];
    
    int heightY=0;
    if(343-height<90)
    {
        heightY=308;
    }
    else
    {
        heightY=[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"] count]*44;
        
    }
    TypeTableView.frame=CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y,320 , heightY);
    TypeTableView.backgroundColor=[UIColor yellowColor];
    
    TypeTableView.delegate=self;
    
    TypeTableView.dataSource = self;
    
    TypeTableView.separatorStyle=UITableViewCellAccessoryNone;
    
    TypeTableView.tag=1;
    
    [self.view addSubview:TypeTableView];
    
}

-(void)ProviderAction{
    
    typeStatus=0;
    ViewByButton.hidden=YES;
    SortByButton.frame=CGRectMake(0,TopBarView.frame.size.height+TopBarView.frame.origin.y+10, 320 , 45);

    [TypeTableView removeFromSuperview];
    [ProviderTableView removeFromSuperview];
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    StartDateImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    StartDateButton.hidden=YES;

    if(purposeStatus==0){
        
        purposeStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
            
            heightProvider=[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"] count]*44;
            
            NSLog(@"height=%d",heightProvider);
            
            NSLog(@"height=%d",heightProvider);
            
            int heightY=0;
            if(343-heightProvider<90)
            {
                heightY=SortByButton.frame.origin.y+SortByButton.frame.size.height;
            }
            else
            {
                heightY=343-heightProvider;
                
            }
            
            TypeButton.frame = CGRectMake(0, heightY, 320, 45);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            [self ProviderFunction];
            StartDateButton.hidden=NO;
             StartDateButton.frame = CGRectMake(0, ProviderTableView.frame.size.height+ProviderTableView.frame.origin.y, 320, 45);
            ProviderImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
        }];
        
    }
    
    else{
        
        purposeStatus=0;
           StartDateButton.hidden=NO;
        [UIView animateWithDuration:.2f animations:^{
            
            [ProviderTableView removeFromSuperview];
            
            [TypeTableView removeFromSuperview];
            
            TypeButton.frame = CGRectMake(0, 433, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            StartDateButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
        }];
        
    }
    
}
-(void)ProviderFunction{
    

    int heightY=0;
    if(373-heightProvider<90)
    {
        heightY=250;
    }
    else{
        heightY=[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_provider"] count]*44;
        
    }
    
    ProviderTableView=[[UITableView alloc]init];
    ProviderTableView.frame=CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y,320 , heightY);
    ProviderTableView.backgroundColor=[UIColor clearColor];
    
    ProviderTableView.delegate=self;
    
    ProviderTableView.dataSource = self;
    
    ProviderTableView.separatorStyle=UITableViewCellAccessoryNone;
    
    [self.view addSubview:ProviderTableView];
    
}
-(void)DateActionButton{
    
    typeStatus=0;
    purposeStatus=0;
    
    
    [TypeTableView removeFromSuperview];
    [ProviderTableView removeFromSuperview];
    
    ProviderImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    TypeImageView.image=[UIImage imageNamed:@"PlusImage.png"];
    if(DateStatus==0){
        
        DateStatus=1;
        
        [UIView animateWithDuration:.2f animations:^{
            
        
            TypeButton.frame = CGRectMake(0, SortByButton.frame.size.height+SortByButton.frame.origin.y , 320, 45);
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
             StartDateButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            [self startDateEndDateHiddenNo];
            
            StartDateImageView.image=[UIImage imageNamed:@"MinusImage.png"];
            
        }];
        
    }
    
    else{
        
        DateStatus=0;
        StartDateButton.hidden=NO;
        [UIView animateWithDuration:.2f animations:^{
            
            TypeButton.frame = CGRectMake(0, 433, 320, 45);
            
            ProviderButton.frame = CGRectMake(0, TypeButton.frame.size.height+TypeButton.frame.origin.y, 320, 45);
            StartDateButton.frame = CGRectMake(0, ProviderButton.frame.size.height+ProviderButton.frame.origin.y, 320, 45);
            
        } completion:^(BOOL finished) {
            
            StartDateImageView.image=[UIImage imageNamed:@"PlusImage.png"];
            
        }];
        
    }
    
}
-(void)startDateEndDateHiddenNo{
    
    StartdateTextField.hidden=NO;
    EnddateTextField.hidden=NO;
    StartDateLable.hidden=NO;
    EndDateLable.hidden=NO;
}
-(void)startDateEndDate{
    
    [StartdateTextField removeFromSuperview];
    [EnddateTextField removeFromSuperview];
    [StartDateLable removeFromSuperview];
    [EndDateLable removeFromSuperview];
    
    [DateDatePicker removeFromSuperview];
    DateDatePicker  = [[UIDatePicker alloc]init];
    [DateDatePicker setFrame:CGRectMake(100, 518, 320, 100)];
    
    DateDatePicker.datePickerMode = UIDatePickerModeDate;
    [DateDatePicker addTarget:self action:@selector(updateDateField) forControlEvents:UIControlEventValueChanged];
    
    
    [EndDateDatePicker removeFromSuperview];
    EndDateDatePicker = [[UIDatePicker alloc]init];
    [EndDateDatePicker setFrame:CGRectMake(100, 518, 320, 100)];
    EndDateDatePicker.datePickerMode = UIDatePickerModeDate;
    [EndDateDatePicker addTarget:self action:@selector(EndupdateDateField) forControlEvents:UIControlEventValueChanged];
    
    [toolba removeFromSuperview];
    toolba = [[UIToolbar alloc] initWithFrame: CGRectMake(0,477 ,320,45)];
    
    toolba.barStyle = UIBarStyleBlackOpaque;
    
    
    
    UIBarButtonItem *flexibleSpaceBarButton = [[UIBarButtonItem alloc]
                                               
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                               
                                               target:nil
                                               
                                               action:nil];
    
    
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target: self action: @selector(dismissKeyboard)];
    
    doneButton.width = 50;
    
    
    
    toolba.items = [NSArray arrayWithObjects:flexibleSpaceBarButton, doneButton,nil];
    

   StartdateTextField = [[UITextField alloc] initWithFrame:CGRectMake(135, 350, 150, 40)];
    
    StartdateTextField.delegate = self;
    
    StartdateTextField.textColor=[UIColor blackColor];
    
    StartdateTextField.backgroundColor = [UIColor grayColor];
    
    StartdateTextField.tag=108;
    
    StartdateTextField.textAlignment = NSTextAlignmentLeft;
    
    [StartdateTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    StartdateTextField.leftView = paddingView;
    
    StartdateTextField.leftViewMode = UITextFieldViewModeAlways;
    
    StartdateTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    StartdateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [StartdateTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
    StartdateTextField.autocapitalizationType = NO;
    
    StartdateTextField.returnKeyType=UIReturnKeyNext;
    
    [StartdateTextField setInputView:DateDatePicker];
    
    [StartdateTextField setInputAccessoryView:toolba];
    
    //[dateTextField addTarget:self action:@selector(textFieldDoneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.view addSubview:StartdateTextField];
    

    StartDateLable=[[UILabel alloc]initWithFrame:CGRectMake(20, 350, 100, 40) ];
    
    StartDateLable.text= [NSString stringWithFormat:@"   %@",@"Start Date"];
    
    StartDateLable.textAlignment=NSTextAlignmentLeft;
    
    StartDateLable.font = [UIFont fontWithName:helveticaRegular size:15];
    
    StartDateLable.textColor=[UIColor blackColor];
    
    StartDateLable.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:StartDateLable];
    
    
    EnddateTextField = [[UITextField alloc] initWithFrame:CGRectMake(135, StartdateTextField.frame.size.height+StartdateTextField.frame.origin.y+10, 150, 40)];
    
    EnddateTextField.delegate = self;
    
    EnddateTextField.textColor=[UIColor blackColor];
    
    EnddateTextField.backgroundColor = [UIColor grayColor];
    
    EnddateTextField.tag=109;
    
    EnddateTextField.textAlignment = NSTextAlignmentLeft;
    
    [EnddateTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    
    EnddateTextField.leftView = paddingView3;
    
    EnddateTextField.leftViewMode = UITextFieldViewModeAlways;
    
    EnddateTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    EnddateTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [EnddateTextField setFont:[UIFont fontWithName:helveticaRegular size:13]];
    
    EnddateTextField.autocapitalizationType = NO;
    
    EnddateTextField.returnKeyType=UIReturnKeyNext;
    
    [EnddateTextField setInputView:EndDateDatePicker];
    
    [EnddateTextField setInputAccessoryView:toolba];
    
    [self.view addSubview:EnddateTextField];
    

    EndDateLable=[[UILabel alloc]initWithFrame:CGRectMake(20, StartdateTextField.frame.size.height+StartdateTextField.frame.origin.y+10, 100, 40) ];
    
    EndDateLable.text= [NSString stringWithFormat:@"   %@",@"End Date"];
    
    EndDateLable.textAlignment=NSTextAlignmentLeft;
    
    EndDateLable.font = [UIFont fontWithName:helveticaRegular size:15];
    
    EndDateLable.textColor=[UIColor blackColor];
    
    EndDateLable.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:EndDateLable];
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    
    if(textField.tag==108 || textField.tag==109 )
        
    {
        
        return NO;
        
    }
    
    return YES;
    
}

-(void)EndupdateDateField{
    EnddateTextField.text = [self formatDate:EndDateDatePicker.date];
    NSLog(@"dateTextField=%@",EnddateTextField.text);
    
    SearhType=@"0";
    SearhProvider=@"0";
    searchDate=@"1";
    
    finalString=[[SearhType stringByAppendingString:SearhProvider] stringByAppendingString:searchDate];
    NSLog(@"finalString=%@",finalString);
}
-(void)updateDateField
{
    SearhType=@"0";
    SearhProvider=@"0";
    searchDate=@"1";
    
     finalString=[[SearhType stringByAppendingString:SearhProvider] stringByAppendingString:searchDate];
    NSLog(@"finalString=%@",finalString);
    StartdateTextField.text = [self formatDate:DateDatePicker.date];
    NSLog(@"dateTextField=%@",StartdateTextField.text);
}
- (NSString *)formatDate:(NSDate *)date
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd"];
    
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    return formattedDate;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [StartdateTextField resignFirstResponder];
    [EnddateTextField     resignFirstResponder];
}
-(void)dismissKeyboard
{
    
    [self.view endEditing:YES];
    
    
}

#pragma mark- slide Keyboard up

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
    
    
}
-(void)DoneButtonFuction{
    
    
   if(TypeTitleLable.text.length<1 && ProviderTitleLable.text.length<1 && StartdateTextField.text.length<1 && EnddateTextField.text.length<1)
   {
       [StartdateTextField resignFirstResponder];
       [EnddateTextField resignFirstResponder  ];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Enter atleast one type" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
    }
    else
      {
            [self ShowActivityIndicatorWithTitle:@"Loading..."];
            [self performSelector:@selector(serverCallFoSortAction) withObject:nil afterDelay:0.1];
    }
}
#pragma mark server CallFor AddApointment
-(void)serverCallFoSortAction
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
    
        NSLog(@"TypeTagValue=%d",TypeTagValue);
         NSLog(@"ProiverTagValue=%d",ProiverTagValue);
        NSLog(@"StartdateTextField=%@",StartdateTextField.text);
        NSLog(@"EnddateTextField=%@",EnddateTextField.text);
        
         NSLog(@"FinalString=%@",finalString);
        
        
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *params = @{
                                 
                                 @"accesstoken":[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData]valueForKey:@"accesstoken"],
                                 @"type":[NSString stringWithFormat:@"%d",TypeTagValue],
                                 @"provider":[NSString stringWithFormat:@"%d",ProiverTagValue],
                                 @"startdate":StartdateTextField.text,
                                 @"enddate":EnddateTextField.text,
                                 @"searchtype":finalString
                                 
                                 };
        
        NSLog(@"Parameter=>%@",params);
        
        [manager POST:[NSString stringWithFormat:@"%@/get_sorted_data_based_on_type",kBaseUrl] parameters:params success:^(AFHTTPRequestOperation *operation, id json) {
            
            NSLog(@"Sort Wala data Json--->%@",json);
            
            if([[json objectForKey:@"log"] isEqualToString:@"No apointment yet!"])
                
            {
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",[json objectForKey:@"log"]] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [myAlertView show];
                
            }
            
            else
                
            {
                
                
              
                
               // [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isNewAppointmentCreatedByUser"];
                
                UIAlertView *complete=[[UIAlertView alloc]initWithTitle:nil  message:@"Done" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                
        
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
