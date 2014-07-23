//
//  RecentAppointmentViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 21/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "RecentAppointmentViewController.h"

@interface RecentAppointmentViewController (){
    
    UITableView *RecentTableView;
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton *RefreashButton;
    
}

@end

@implementation RecentAppointmentViewController

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
    
    
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(5,20,[UIImage imageNamed:@"backButtonNew.png"].size.width, [UIImage imageNamed:@"backButtonNew.png"].size.height);
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    UILabel   *UpcommingLable=[[UILabel alloc]initWithFrame:CGRectMake(55, 30, 210, 20)];
    UpcommingLable.text=@"RECENT UPDATES";
    UpcommingLable.font=[UIFont fontWithName:helveticaRegular size:15];
    UpcommingLable.textColor=[UIColor blackColor];
    UpcommingLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:UpcommingLable];

    

    RefreashButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20, [UIImage imageNamed:@"refresh_icon.png"].size.width, [UIImage imageNamed:@"refresh_icon.png"].size.height)];
    RefreashButton.backgroundColor=[UIColor clearColor];
    [RefreashButton setImage:[UIImage imageNamed:@"refresh_icon.png"] forState:UIControlStateNormal];
    [RefreashButton addTarget:self action:@selector(RefreashButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:RefreashButton];
    [self.view addSubview:TopBarView];
    
    RecentTableView=[[UITableView alloc]init];
    RecentTableView.frame=CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y+50, self.view.frame.size.width, 447);
    
    [RecentTableView setDelegate:self];
    RecentTableView.dataSource=self;
    [RecentTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [RecentTableView setSeparatorColor:[UIColor grayColor]];
    [RecentTableView setSeparatorInset:UIEdgeInsetsZero];
    RecentTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    RecentTableView.backgroundColor=[UIColor clearColor];
    RecentTableView.showsVerticalScrollIndicator = NO;
    RecentTableView.alwaysBounceVertical = NO;
    [self.view addSubview:RecentTableView];


    
    // Do any additional setup after loading the view.
}
-(void)RefreashButtonAction{
    
}
-(void)BackButtonAction
{
    [[soundManager shared] buttonSound];
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
    
    NSLog(@"Value=%d",[[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"] count]);
    return [[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"]count];
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
    [CellButtonClick setTag:1506];
    CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width+1,50);
    CellButtonClick.backgroundColor=[UIColor clearColor];
    [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    CellButtonClick.layer.masksToBounds = NO;
    CellButtonClick.exclusiveTouch=YES;
    [CellButtonClick setBackgroundImage:cellBackGrounImageView forState:UIControlStateNormal];
    [CellButtonClick setBackgroundImage:[UIImage imageNamed:@"afterClickCell.jpg"] forState:UIControlStateSelected];
    
    
    UILabel *AppointmentNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,5,220,10)];
    AppointmentNameTitleShow.textColor = [UIColor blackColor];
    AppointmentNameTitleShow.backgroundColor = [UIColor clearColor];
    AppointmentNameTitleShow.textAlignment = NSTextAlignmentLeft;
    AppointmentNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:14];
    AppointmentNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"] valueForKey:@"appointmentname"] objectAtIndex:indexPath.row];
    AppointmentNameTitleShow.numberOfLines=0;
    AppointmentNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [AppointmentNameTitleShow sizeToFit];
    [CellButtonClick addSubview:AppointmentNameTitleShow];
    
    UILabel *TypeNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(20,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,220,10)];
    TypeNameTitleShow.textColor = [UIColor grayColor];
    TypeNameTitleShow.backgroundColor = [UIColor clearColor];
    TypeNameTitleShow.textAlignment = NSTextAlignmentLeft;
    TypeNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:12];
    TypeNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"] valueForKey:@"consultantname"] objectAtIndex:indexPath.row];
    TypeNameTitleShow.numberOfLines=0;
    TypeNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [TypeNameTitleShow sizeToFit];
    [CellButtonClick addSubview:TypeNameTitleShow];
    
    UILabel *ProviderNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(TypeNameTitleShow.frame.size.width+TypeNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,220,10)];
    ProviderNameTitleShow.textColor = [UIColor grayColor];
    ProviderNameTitleShow.backgroundColor = [UIColor clearColor];
    ProviderNameTitleShow.textAlignment = NSTextAlignmentLeft;
    ProviderNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:12];
    ProviderNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"] valueForKey:@"consultantname"] objectAtIndex:indexPath.row];
    ProviderNameTitleShow.numberOfLines=0;
    ProviderNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [ProviderNameTitleShow sizeToFit];
    [CellButtonClick addSubview:ProviderNameTitleShow];
    
    
    UILabel *ConsultantNameTitleShow = [[UILabel alloc] initWithFrame:CGRectMake(ProviderNameTitleShow.frame.size.width+ProviderNameTitleShow.frame.origin.x+5,AppointmentNameTitleShow.frame.size.height+AppointmentNameTitleShow.frame.origin.y+5,220,10)];
    ConsultantNameTitleShow.textColor = [UIColor grayColor];
    ConsultantNameTitleShow.backgroundColor = [UIColor clearColor];
    ConsultantNameTitleShow.textAlignment = NSTextAlignmentLeft;
    ConsultantNameTitleShow.font = [UIFont fontWithName:helveticaRegular size:12];
    ConsultantNameTitleShow.text = [[[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"] valueForKey:@"consultantname"] objectAtIndex:indexPath.row];
    ConsultantNameTitleShow.numberOfLines=0;
    ConsultantNameTitleShow.lineBreakMode =NSLineBreakByCharWrapping;
    [ConsultantNameTitleShow sizeToFit];
    [CellButtonClick addSubview:ConsultantNameTitleShow];
    
    
    
    NSArray *dateSplitArray=[[[[[[NSUserDefaults standardUserDefaults] objectForKey:kRecentAppointmentData] objectForKey:@"recentupdates"] valueForKey:@"appointmenttime"] objectAtIndex:indexPath.row] componentsSeparatedByString:@"T"];
    NSString *date=[dateSplitArray objectAtIndex:0];
    
   // NSString *dateTime=[dateSplitArray objectAtIndex:1];
    
    
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
    DateLable.frame=CGRectMake(300-DateLable.frame.size.width,15,DateLable.frame.size.width,15);
    [CellButtonClick addSubview:DateLable];
    
    UILabel *TimeLable = [[UILabel alloc] init];
    TimeLable.textColor = [UIColor grayColor];
    TimeLable.backgroundColor = [UIColor clearColor];
    TimeLable.textAlignment = NSTextAlignmentLeft;
    TimeLable.font = [UIFont fontWithName:helveticaRegular size:10];
   // TimeLable.text =[NSString stringWithFormat:@"%@",dateTime];
    TimeLable.numberOfLines=0;
    TimeLable.lineBreakMode =NSLineBreakByCharWrapping;
    [TimeLable sizeToFit];
    TimeLable.frame=CGRectMake(300-TimeLable.frame.size.width,DateLable.frame.size.height+DateLable.frame.origin.y,TimeLable.frame.size.width,13);
    [CellButtonClick addSubview:TimeLable];
    
    
    [cell.contentView addSubview:CellButtonClick];
    
    return cell;
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
