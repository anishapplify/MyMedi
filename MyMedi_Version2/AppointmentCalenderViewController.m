//
//  AppointmentCalenderViewController.m
//  MyMedi_Version2
//
//  Created by Deepak Bhagat on 9/11/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "AppointmentCalenderViewController.h"

@interface AppointmentCalenderViewController (){
    UIView *TopBarView;
    UIButton *EdiButton;
    UIButton *Backbutton;
    UIButton *bylistButton;
    UIButton*byCalButton;
    UIButton *ChronolistButton;
    UIButton *AphaBetlistButto;
    
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
    
    UIImageView *DropImageButtonArrow;
    UIImageView *DropImageButtonArrow2;
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
    UIButton *DoneButton;
    
    int FlagVriableViewType;
    int SubVariableViewType;
    
    
    UILabel *TopBarLable;
    UIButton *AddAppointmentButton;
    UIButton *ListButton;
    UIButton *BackButton;
    
    UIView *BottomView;
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
    UIView *horizontalLIneView;


}

@end

@implementation AppointmentCalenderViewController

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
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,64)];
    TopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    [BackButton removeFromSuperview];
    BackButton=nil;
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"back_Button_image.png"].size.width ,[UIImage imageNamed:@"back_Button_image.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setBackgroundImage:[UIImage imageNamed:@"back_Button_image.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    
    
    [TopBarLable removeFromSuperview];
    TopBarLable=nil;
    TopBarLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 30, 130, 25)];
    TopBarLable.text=@"Mymedi Calendar";
    TopBarLable.backgroundColor=[UIColor clearColor];
    TopBarLable.font=[UIFont fontWithName:@"Europa-Regular" size:17];
    TopBarLable.textAlignment=NSTextAlignmentCenter;
    TopBarLable.textColor=[UIColor whiteColor];
    [TopBarView addSubview:TopBarLable];
    
    
    
    
    [ListButton removeFromSuperview];
    ListButton=nil;
    ListButton=[[UIButton alloc]initWithFrame:CGRectMake(TopBarLable.frame.size.width+TopBarLable.frame.origin.x, 20,[UIImage imageNamed:@"grid.png"].size.width ,[UIImage imageNamed:@"grid.png"].size.height)];
    ListButton.backgroundColor=[UIColor clearColor];
    [ListButton setBackgroundImage:[UIImage imageNamed:@"grid.png"] forState:UIControlStateNormal];
    [ListButton addTarget:self action:@selector(ListButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:ListButton];
    
    
    [AddAppointmentButton removeFromSuperview];
    AddAppointmentButton=nil;
    AddAppointmentButton=[[UIButton alloc]initWithFrame:CGRectMake(ListButton.frame.size.width+ListButton.frame.origin.x, 20,[UIImage imageNamed:@"plusButton.png"].size.width ,[UIImage imageNamed:@"plusButton.png"].size.height)];
    AddAppointmentButton.backgroundColor=[UIColor clearColor];
    [AddAppointmentButton setBackgroundImage:[UIImage imageNamed:@"plusButton.png"] forState:UIControlStateNormal];
    [AddAppointmentButton addTarget:self action:@selector(AddAppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:AddAppointmentButton];
    
    [self.view addSubview:TopBarView];
    
    
     [self calender];
    
    
    BottomView=[[UIView alloc]init];
    
    [horizontalLIneView removeFromSuperview];
    horizontalLIneView = nil;
    horizontalLIneView = [[UIView alloc]init];
    horizontalLIneView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:horizontalLIneView];
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            BottomView.frame=CGRectMake(0, 520, 320, 49);
            horizontalLIneView.frame = CGRectMake(0, 519, 320, 1);
        }
        else
        {
            BottomView.frame=CGRectMake(0, 432, 320, 49);
            horizontalLIneView.frame = CGRectMake(0, 432, 320, 1);
            
        }
    }
    BottomView.backgroundColor=[UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width,[UIImage imageNamed:@"bottommymedi.png"].size.height)];//bottommymedi_sel.png
    HomeButton.backgroundColor=[UIColor clearColor];//bottommymedi.png
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi.png"] forState:UIControlStateNormal];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateHighlighted];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateSelected];
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    [AppointmentsBottomButton removeFromSuperview];
    AppointmentsBottomButton=nil;
    AppointmentsBottomButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.size.width+HomeButton.frame.origin.x, 0, [UIImage imageNamed:@"appointments.png"].size.width,[UIImage imageNamed:@"appointments.png"].size.height)];
    AppointmentsBottomButton.backgroundColor=[UIColor clearColor];//appointments.png
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateNormal];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateSelected];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateHighlighted];
    [AppointmentsBottomButton addTarget:self action:@selector(AppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    AppointmentsBottomButton.userInteractionEnabled=FALSE;
    [BottomView addSubview:AppointmentsBottomButton];
    
    
    [ProfileButton removeFromSuperview];
    ProfileButton=nil;
    ProfileButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentsBottomButton.frame.size.width+AppointmentsBottomButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomprofile.png"].size.width,[UIImage imageNamed:@"bottomprofile.png"].size.height)];
    ProfileButton.backgroundColor=[UIColor clearColor];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile.png"] forState:UIControlStateNormal];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateSelected];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateHighlighted];
    [ProfileButton addTarget:self action:@selector(ProfileButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ProfileButton];
    
    
    [ShortCutButton removeFromSuperview];
    ShortCutButton=nil;
    ShortCutButton=[[UIButton alloc]initWithFrame:CGRectMake(ProfileButton.frame.origin.x+ProfileButton.frame.size.width, 0,[UIImage imageNamed:@"bottomshortcut.png"].size.width,[UIImage imageNamed:@"bottomshortcut.png"].size.height)];
    ShortCutButton.backgroundColor=[UIColor clearColor];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut.png"] forState:UIControlStateNormal];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateSelected];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateHighlighted];
    [ShortCutButton addTarget:self action:@selector(ShortCutButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ShortCutButton];
    
    [SettingButton removeFromSuperview];
    SettingButton=nil;
    SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(ShortCutButton.frame.size.width+ShortCutButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomsettings.png"].size.width,[UIImage imageNamed:@"bottomsettings.png"].size.height)];
    SettingButton.backgroundColor=[UIColor clearColor];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateNormal];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings_sel.png"] forState:UIControlStateSelected];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings_sel.png"] forState:UIControlStateHighlighted];
    [SettingButton addTarget:self action:@selector(SettingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SettingButton];
    [self.view addSubview:BottomView];
}
-(void)HomeButtonAction{
    HomeScreenViewController *homescreen=[[HomeScreenViewController alloc]init];
    [self.navigationController pushViewController:homescreen animated:NO];
}
-(void)AppointmentButtonAction{
    
}
-(void)ProfileButtonAction{
    ProfileViewController *profileview=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:profileview animated:NO];
}
-(void)ShortCutButtonAction{
    //ProfileViewController *profileview=[[ProfileViewController alloc]init];
   // [self.navigationController pushViewController:profileview animated:NO];

}
-(void)SettingButtonAction{
    SettingScreenViewController *settingview=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:settingview animated:NO];

}
-(void)ListButtonAction{
    AppointmentListViewController *AppointmentList=[[AppointmentListViewController alloc]init];
    [self.navigationController pushViewController:AppointmentList animated:NO];
}
-(void)AddAppointmentButtonAction{
    AddAppointmentViewController *AddAppointment=[[AddAppointmentViewController alloc]init];
    [self.navigationController pushViewController:AddAppointment animated:NO];
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
    dateString = [formatter stringFromDate:[NSDate date]];
    dateArray = [dateString componentsSeparatedByString:@"-"];//current date in array
    
    currentDay = days = [[dateArray objectAtIndex:0] integerValue];
    
    
    currentmonth = month =  [[dateArray objectAtIndex:1] integerValue];
    currentYear = year = [[dateArray objectAtIndex:2] integerValue];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"SelectionType"];
    
    firstDayDate = [NSString stringWithFormat:@"01-%@-%@",[dateArray objectAtIndex:1],[dateArray objectAtIndex:2]];
    [[NSUserDefaults standardUserDefaults] setObject:firstDayDate forKey:@"firstDayDate"];
    
    dateFromString = [[NSDate alloc] init];
    dateFromString = [formatter dateFromString:firstDayDate];
    
    dayformatter = [[NSDateFormatter alloc] init];
    [dayformatter setDateFormat:@"EEEE"];
    
    monthFormatter = [[NSDateFormatter alloc] init];
    [monthFormatter setDateFormat:@"MMMM yyyy"];
    
    firstDayOfMonth = [dayformatter stringFromDate:dateFromString];
    screenBounds = [[UIScreen mainScreen] bounds];
    
    calenderTopImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 53)];
    
  
    bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, [UIImage imageNamed:@"calendar_bg.png"].size.width, [UIImage imageNamed:@"calendar_bg.png"].size.height+50)];
    if (screenSize.height == 480.0f)
    {
        bgImgView.image = [UIImage imageNamed:@"calendar_bg.png"];
    }
    if (screenSize.height == 568.0f)
    {
        bgImgView.image = [UIImage imageNamed:@"calendar_bg.png"];
    }
    bgImgView.backgroundColor = [UIColor clearColor];
    bgImgView.userInteractionEnabled = YES;
    [self.view addSubview:bgImgView];

    NSArray *objArryDays = [NSArray arrayWithObjects:@"MON",@"TUE",@"WED",@"THU",@"FRI",@"SAT",@"SUN",nil];
    int daysLabel_x = 0;
    for(int arryCount = 0; arryCount < [objArryDays count]; arryCount ++)
    {
        UILabel *daysLabel = [[UILabel alloc] initWithFrame:CGRectMake(daysLabel_x, 53, 46, 34)];
        daysLabel.text = [objArryDays objectAtIndex:arryCount];
        daysLabel.textAlignment = NSTextAlignmentCenter;
        [daysLabel setFont:[UIFont fontWithName:@"MuseoSans-300" size:12]];
        daysLabel.backgroundColor = [UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
        daysLabel.textColor = [UIColor whiteColor];
        [bgImgView addSubview:daysLabel];
        daysLabel_x = daysLabel_x + 46;
    }
    
    if (screenSize.height == 480.0f)
    {
        calenderBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 85, [UIImage imageNamed:@"calendar_bg.png"].size.width,[UIImage imageNamed:@"calendar_bg.png"].size.height)];
        // calenderBgImgView.image = calbackground;
        calenderBgImgView.userInteractionEnabled = YES;
    }
    
    if (screenSize.height == 568.0f)
    {
        calenderBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 85,  [UIImage imageNamed:@"calendar_bg.png"].size.width,[UIImage imageNamed:@"calendar_bg.png"].size.height)];
        //calenderBgImgView.image = calbackground;
    }
    calenderBgImgView.backgroundColor=[UIColor clearColor];
    calenderBgImgView.userInteractionEnabled = YES;
    calenderTopImageView.backgroundColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    [bgImgView addSubview:calenderBgImgView];
    [bgImgView addSubview:calenderTopImageView];
    
    //calenderTopImageView.image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"calender_view_bar.png"]];
    calenderTopImageView.userInteractionEnabled = YES;
    [bgImgView addSubview:calenderTopImageView];
    
    dateMonthLbl = [[UILabel alloc] initWithFrame:CGRectMake(55,0, 210, 53)];
    [dateMonthLbl setFont:[UIFont fontWithName:@"Europa-Regular" size:17]];
    formattedMonth = [monthFormatter stringFromDate:dateFromString];
    NSLog(@"formattedMonth=%@",formattedMonth);
    dateMonthLbl.text = [[NSString stringWithFormat:@"%@",formattedMonth] uppercaseString];
    dateMonthLbl.textAlignment = NSTextAlignmentCenter;
    dateMonthLbl.backgroundColor = [UIColor clearColor];
    dateMonthLbl.textColor = [UIColor colorWithRed:243.0/255 green:243.0/255 blue:243.0/255 alpha:1.0];
    
    [calenderTopImageView addSubview:dateMonthLbl];
    
    [monthRightBtn removeFromSuperview];
    monthRightBtn=nil;
    monthRightBtn = [[UIButton alloc] initWithFrame:CGRectMake(273, 5, [UIImage imageNamed:@"rightsidearrow_off.png"].size.width, [UIImage imageNamed:@"rightsidearrow_off.png"].size.height)];
    [monthRightBtn setBackgroundImage:[UIImage imageNamed:@"rightsidearrow_off.png"] forState:UIControlStateNormal];
    monthRightBtn.userInteractionEnabled = YES;
    monthRightBtn.exclusiveTouch = YES;
    monthRightBtn.backgroundColor=[UIColor clearColor];
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
    
    else
    {
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
        floatHeight = 40;
        floatwidth = 46;
    }
    else
    {
        floatHeight = 40;
        floatwidth = 46;
    }
    
    if ([firstDayOfMonth isEqualToString:@"Tuesday"])
    {
        floatX = (floatwidth*1);
    }
    else if ([firstDayOfMonth isEqualToString:@"Wednesday"])
    {
        floatX =(floatwidth*2);
    }
    else if ([firstDayOfMonth isEqualToString:@"Thursday"])
    {
        floatX = (floatwidth*3);
    }
    else if ([firstDayOfMonth isEqualToString:@"Friday"])
    {
        floatX = (floatwidth*4);
    }
    else if ([firstDayOfMonth isEqualToString:@"Saturday"])
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
        calenderBtn =[[UIButton alloc] initWithFrame:CGRectMake(floatX, floatY, 35, 35)];
        
        calenderBtn.backgroundColor = [UIColor clearColor];
        calenderBtn.userInteractionEnabled = YES;
        calenderBtn.layer.cornerRadius=35/2;
        calenderBtn.tag = count + 1;
        
        if(count + 1 == currentDay && month == currentmonth && year == currentYear)
        {
            int k=calenderBtn.tag;
            
            for (int i=k; i>0; i--)
            {
                [(UIButton *)[self.view viewWithTag:i] setUserInteractionEnabled:NO];
                //GreenColor
                [(UIButton *)[self.view viewWithTag:i] setBackgroundColor:[UIColor clearColor]];
                [(UIButton *)[self.view viewWithTag:i] setTitleColor:[UIColor colorWithRed:207/255.0 green:208/255.0 blue:207/255.0 alpha:1.0] forState:UIControlStateNormal];
                [(UIButton *)[self.view viewWithTag:i] setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            }
            
            [monthLeftBtn removeFromSuperview];
            if(subheader6.text.length == 0)
            calenderBtn.backgroundColor=[UIColor colorWithRed:32/255.0 green:202/255.0 blue:168/255.0 alpha:1.0];
            
            //[calenderBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            //[calenderBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
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
        
        if(subheader6.text.length>0)
        {
            if(month == [monthtext integerValue])
            {
                [(UIButton *)[self.view viewWithTag:highlightedTag] setBackgroundColor:[UIColor whiteColor]];
                
            }
        }
        
        [calenderBtn setTitle:[NSString stringWithFormat:@"%d",count+1] forState:UIControlStateNormal];
        [calenderBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [calenderBtn addTarget:self action:@selector(caaalenderSelected1:) forControlEvents:UIControlEventTouchDown];
        [calenderBtn addTarget:self action:@selector(caaalenderSelected:) forControlEvents:UIControlEventTouchUpInside];
        [calenderBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [calenderBgImgView addSubview:calenderBtn];
        
        floatX = floatX + floatwidth;
        
        if (floatX > 320)
        {
            floatX = 0;
            floatY = floatY + floatHeight;
        }
    }
}

-(void)caaalenderSelected1 : (UIButton *)sender
{
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
    
    NSString*breaked = [[formattedMonth componentsSeparatedByString:@" "] objectAtIndex:0];
    breaked = [breaked substringWithRange:NSMakeRange(0,3)];
    breaked  =  [breaked uppercaseString];
    
    delivery_dateSave=[NSString stringWithFormat:@"%@ %@, %@",breaked,selectDate,[[formattedMonth componentsSeparatedByString:@" "] objectAtIndex:1]];
    [SelectDateButton setTitle:[[NSString stringWithFormat:@"%@",delivery_dateSave ]uppercaseString] forState:(UIControlState)UIControlStateNormal];
    [SelectDateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    subheader6.text = delivery_dateSave;
    NSLog(@"%@",delivery_dateSave);
    [bgImgView removeFromSuperview];
}
-(void)BackButtonAction
{
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
    monthLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,5,[UIImage imageNamed:@"leftsidearrow_off.png"].size.width, [UIImage imageNamed:@"leftsidearrow_off.png"].size.height)];
    [monthLeftBtn setBackgroundImage:[UIImage imageNamed:@"leftsidearrow_off.png"] forState:UIControlStateNormal];
    monthLeftBtn.userInteractionEnabled = YES;
    monthLeftBtn.exclusiveTouch = YES;
    monthLeftBtn.backgroundColor=[UIColor clearColor];
    [monthLeftBtn addTarget:self action:@selector(previousDateSelected) forControlEvents:UIControlEventTouchUpInside];
    [calenderTopImageView addSubview:monthLeftBtn];
    
    firstDayDate = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstDayDate"]];
    
    dateArray = [firstDayDate componentsSeparatedByString:@"-"];
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
    }
    else
    {
        year = [[dateArray objectAtIndex:2] integerValue]+1;
        firstDayDate = [NSString stringWithFormat:@"%d-%d-%d",days, 01, year];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:firstDayDate forKey:@"firstDayDate"];
    
    dateFromString = [formatter dateFromString:firstDayDate];
    firstDayOfMonth = [dayformatter stringFromDate:dateFromString];
    
    formattedMonth = [monthFormatter stringFromDate:dateFromString];
    dateMonthLbl.text = [[NSString stringWithFormat:@"%@", formattedMonth] uppercaseString];
    firstDayDate = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstDayDate"]];
    
    dateArray = [firstDayDate componentsSeparatedByString:@"-"];
    days = [[dateArray objectAtIndex:0] integerValue];
    month = [[dateArray objectAtIndex:1] integerValue];
    NSLog(@"%d",month);
    year = [[dateArray objectAtIndex:2] integerValue];
    
    [self makeCalender];
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
