//
//  UPComingAppointmentViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 21/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "UPComingAppointmentViewController.h"

@interface UPComingAppointmentViewController (){
    
    UITableView *UpcomingTableView;
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton *RefreashButton;
}

@end

@implementation UPComingAppointmentViewController

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
    // Do any additional setup after loading the view.
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(5,20,[UIImage imageNamed:@"backButtonNew.png"].size.width, [UIImage imageNamed:@"backButtonNew.png"].size.height);
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    
    UILabel   *UpcommingLable=[[UILabel alloc]initWithFrame:CGRectMake(55, 30, 210, 20)];
    UpcommingLable.text=@"UPCOMING APPOINTMENTS";
    UpcommingLable.font=[UIFont fontWithName:helveticaRegular size:15];
    UpcommingLable.textColor=[UIColor blackColor];
    UpcommingLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:UpcommingLable];
    
    RefreashButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20,[UIImage imageNamed:@"refresh_icon.png"].size.width ,[UIImage imageNamed:@"refresh_icon.png"].size.height)];
    RefreashButton.backgroundColor=[UIColor clearColor];
    [RefreashButton setImage:[UIImage imageNamed:@"refresh_icon.png"] forState:UIControlStateNormal];
    [RefreashButton addTarget:self action:@selector(RefreashButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:RefreashButton];
    [self.view addSubview:TopBarView];
    
    UpcomingTableView=[[UITableView alloc]init];
    UpcomingTableView.frame=CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+50, self.view.frame.size.width, 447);
    
    [UpcomingTableView setDelegate:self];
    UpcomingTableView.dataSource=self;
    [UpcomingTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [UpcomingTableView setSeparatorColor:[UIColor grayColor]];
    [UpcomingTableView setSeparatorInset:UIEdgeInsetsZero];
    UpcomingTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //CastingJobTableView.backgroundColor=[UIColor colorWithRed:0.8515625 green:0.85546875 blue:0.8671875 alpha:1.0];
    UpcomingTableView.backgroundColor=[UIColor clearColor];
    UpcomingTableView.showsVerticalScrollIndicator = NO;
    UpcomingTableView.alwaysBounceVertical = NO;
    // [searchTableView setBackgroundColor:[UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0]];
    [self.view addSubview:UpcomingTableView];
    
    
}
-(void)RefreashButtonAction{
    
}
-(void)BackButtonAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableView Datasource and Delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"Value=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] count]);
    return [[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"]count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIImage *cellBackGrounImageView=[UIImage imageNamed:@"cart_product_info.png"];
    
    static NSString *CellIdentifier =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.backgroundView=[[UIView alloc] initWithFrame:cell.bounds];
        cell.backgroundColor=[UIColor clearColor];
        
    } else
    {
        UIButton *CellButtonClick=(UIButton *)[cell.contentView viewWithTag:1506];
        [CellButtonClick removeFromSuperview];
        CellButtonClick=nil;
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIButton *CellButtonClick;
    CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    //[CellButtonClick setTag:1506];
    CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
    CellButtonClick.backgroundColor=[UIColor clearColor];
    [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    CellButtonClick.layer.masksToBounds = NO;
    CellButtonClick.exclusiveTouch=YES;
    CellButtonClick.tag=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentid"] objectAtIndex:indexPath.row] integerValue];
    [CellButtonClick setBackgroundImage:cellBackGrounImageView forState:UIControlStateNormal];
    [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
    [CellButtonClick addTarget:self action:@selector(cellButtonClickUpcomingInfromation:) forControlEvents:UIControlEventTouchUpInside];
    CellButtonClick.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;;
    CellButtonClick.layer.borderWidth = 0.5f;

    
    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,10,220,10)];
    AppointmentNameTitleShow.textColor = [UIColor blackColor];
    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:indexPath.row];
    AppointmentNameTitleShow.numberOfLines=0;
    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [AppointmentNameTitleShow sizeToFit];
    [CellButtonClick addSubview:AppointmentNameTitleShow];
    
    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,30,14)];
    TypeNameTitleShow.textColor = [UIColor grayColor];
    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
    //TypeNameTitleShow.textAlignment = NSTextAlignmentLeft;
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:indexPath.row];
   // TypeNameTitleShow.numberOfLines=0;
   // TypeNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [TypeNameTitleShow sizeToFit];
    TypeNameTitleShow.textAlignment = NSTextAlignmentRight;
    
    //TypeNameTitleShow.lineBreakMode = NSLineBreakByCharWrapping;
    //[TypeNameTitleShow setAdjustsFontSizeToFitWidth:YES];
    TypeNameTitleShow.minimumScaleFactor=0.3;
    
    [CellButtonClick addSubview:TypeNameTitleShow];
    
    CGRect size_label = [TypeNameTitleShow.text boundingRectWithSize:CGSizeMake(320, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{ NSFontAttributeName : [UIFont fontWithName:helveticaRegular size:12]}
                                             context:nil];
    
    UIView* line=[[UIView alloc]initWithFrame:CGRectMake(size_label.size.width+TypeNameTitleShow.frame.origin.x-7,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5, 1,12)];
    line.layer.borderColor = [UIColor grayColor].CGColor;
    line.layer.borderWidth = 1.0f;
    [CellButtonClick addSubview:line];

    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(line.frame.size.width+line.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,50,14)];
    ProviderNameTitleShow.textColor = [UIColor grayColor];
    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:10];
    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:indexPath.row];
    
    [ProviderNameTitleShow sizeToFit];
    ProviderNameTitleShow.textAlignment = NSTextAlignmentRight;
    
    //TypeNameTitleShow.lineBreakMode = NSLineBreakByCharWrapping;
    //[TypeNameTitleShow setAdjustsFontSizeToFitWidth:YES];
    ProviderNameTitleShow.minimumScaleFactor=0.3;
    [CellButtonClick addSubview:ProviderNameTitleShow];

    
    
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:indexPath.row] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    
    NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
    NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
    NSString *date2=[dateSplitArray2 objectAtIndex:1];
    NSString *date3=[dateSplitArray2 objectAtIndex:2];
    
     NSString *date4=[dateSplitArray2 objectAtIndex:0];
    
    NSLog(@"date2=%@",date2);
    
     NSLog(@"date3=%@",date3);
    
    if([date2 isEqualToString:@"01"]) date2=@"Jan";
    if([date2 isEqualToString:@"02"]) date2=@"Feb";
    if([date2 isEqualToString:@"03"]) date2=@"Mar";
    if([date2 isEqualToString:@"04"]) date2=@"Apr";
    if([date2 isEqualToString:@"05"]) date2=@"May";
    if([date2 isEqualToString:@"06"]) date2=@"Jun";
    if([date2 isEqualToString:@"07"]) date2=@"Jul";
    if([date2 isEqualToString:@"08"]) date2=@"Aug";
    if([date2 isEqualToString:@"09"]) date2=@"Sep";
    if([date2 isEqualToString:@"10"]) date2=@"Oct";
    if([date2 isEqualToString:@"11"]) date2=@"Nov";
    if([date2 isEqualToString:@"12"]) date2=@"Dec";
    
    UILabel *DateLable = [[UILabel alloc] init];
    DateLable.textColor = [UIColor grayColor];
    DateLable.backgroundColor = [UIColor clearColor];
    DateLable.textAlignment = NSTextAlignmentLeft;
    DateLable.font = [UIFont fontWithName:helveticaRegular size:10];
    DateLable.text =[NSString stringWithFormat:@"%@ %@ %@",date3,date2,date4];
    DateLable.numberOfLines=0;
    DateLable.lineBreakMode =NSLineBreakByCharWrapping;
    [DateLable sizeToFit];
    DateLable.frame=CGRectMake(300-DateLable.frame.size.width,10,DateLable.frame.size.width,15);
    [CellButtonClick addSubview:DateLable];
    
    
     NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
    NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
  //  NSString *TimeString2=[TimeSplitArray2 objectAtIndex:2];
    
    NSLog(@"TimeString1=%@",TimeString1);
    
    UILabel *TimeLable = [[UILabel alloc] init];
    TimeLable.textColor = [UIColor grayColor];
    TimeLable.backgroundColor = [UIColor clearColor];
    TimeLable.textAlignment = NSTextAlignmentLeft;
    TimeLable.font = [UIFont fontWithName:helveticaRegular size:10];
    TimeLable.text =[NSString stringWithFormat:@"%@",TimeString1];
    TimeLable.numberOfLines=0;
    TimeLable.lineBreakMode =NSLineBreakByCharWrapping;
    [TimeLable sizeToFit];
    TimeLable.frame=CGRectMake(300-TimeLable.frame.size.width,DateLable.frame.size.height+DateLable.frame.origin.y+3,TimeLable.frame.size.width,13);
    [CellButtonClick addSubview:TimeLable];
    
    
    [cell.contentView addSubview:CellButtonClick];
    
    return cell;
}
-(IBAction)cellButtonClickUpcomingInfromation:(id)sender{
    NSLog(@"tag=%d",[sender tag]);
    
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isEditAppointmentPressed"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"TapFlagVriable"];
    
    if([[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] count]<1){
        
    }
    else
    {
        for (int k=0; k<[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] count]; k++) {
            
            if([[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentid"] objectAtIndex:k] stringValue] isEqualToString:[NSString stringWithFormat:@"%d",[sender tag]]])
            {
                NSLog(@"tag=%d",[sender tag]);
                
                [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmentname"] objectAtIndex:k] forKeyPath:kAppointmentmentNameString];
                
                NSLog(@"appointments name=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameString]);
                
                [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"consultantname"] objectAtIndex:k] forKeyPath:kAppointmentmentNameConsultantString];
                
                
                NSLog(@"consultantname=%@",[[NSUserDefaults standardUserDefaults] valueForKey:kAppointmentmentNameConsultantString]);
                
                NSArray *dateSplitArray = [[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttime"] objectAtIndex:k] componentsSeparatedByString:@"T"];
                NSString *date=[dateSplitArray objectAtIndex:0];
                NSString *dateTime=[dateSplitArray objectAtIndex:1];
                
                
                NSArray *dateSplitArray2=[date componentsSeparatedByString:@"-"];
                NSString *date2=[dateSplitArray2 objectAtIndex:1];
                NSString *date3=[dateSplitArray2 objectAtIndex:2];
                NSString *date4=[dateSplitArray2 objectAtIndex:0];
                
                NSLog(@"date2=%@",date2);
                NSLog(@"date3=%@",date3);
                NSLog(@"date4=%@",date4);
                
                if([date2 isEqualToString:@"01"]) date2=@"Jan";
                if([date2 isEqualToString:@"02"]) date2=@"Feb";
                if([date2 isEqualToString:@"03"]) date2=@"Mar";
                if([date2 isEqualToString:@"04"]) date2=@"Apr";
                if([date2 isEqualToString:@"05"]) date2=@"May";
                if([date2 isEqualToString:@"06"]) date2=@"Jun";
                if([date2 isEqualToString:@"07"]) date2=@"Jul";
                if([date2 isEqualToString:@"08"]) date2=@"Aug";
                if([date2 isEqualToString:@"09"]) date2=@"Sep";
                if([date2 isEqualToString:@"10"]) date2=@"Oct";
                if([date2 isEqualToString:@"11"]) date2=@"Nov";
                if([date2 isEqualToString:@"12"]) date2=@"Dec";
                
                NSArray *TimeSplitArray2=[dateTime componentsSeparatedByString:@"."];
                NSString *TimeString1=[TimeSplitArray2 objectAtIndex:0];
                
                
                [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%@ %@",date,TimeString1] forKeyPath:kAppointmentmentNameDate];
                
                
                
                [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"hospital"] objectAtIndex:k] forKeyPath:kAppointmentmentNameHospital];
                
                
                 [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"appointmenttype"] objectAtIndex:k] forKeyPath:kAppointmentmentNameTypeName];
                
                 [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"provider"] objectAtIndex:k] forKeyPath:kAppointmentmentNameProviderName];
                
                
                [[NSUserDefaults standardUserDefaults]setValue:[[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"] valueForKey:@"notes"] objectAtIndex:k] forKeyPath:kAppointmentmentNotes];
                
                                
                EditAppointmentViewController *createnewAppointment=[[EditAppointmentViewController alloc]init];
                [self.navigationController pushViewController:createnewAppointment animated:YES];
                
                
                
            }
            
        }
        
        
    }
    
    
    //[[[[NSUserDefaults standardUserDefaults] objectForKey:kUpcomingAppointmentData] objectForKey:@"upcomingappointments"]
    
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
