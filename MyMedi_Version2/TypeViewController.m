//
//  TypeViewController.m
//  MyMedi_Version2
//
//  Created by anish on 23/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "TypeViewController.h"

@interface TypeViewController ()
{
    UIButton*TypeValuesShowButton;
    UITableView *TypeTableView;
    UIView *TopBarView;
    UILabel *NewAppointmentLable;
}

@end

@implementation TypeViewController

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
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    
    [NewAppointmentLable removeFromSuperview];
    NewAppointmentLable=nil;
    NewAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 25, 130, 30)];
    NewAppointmentLable.textColor= [UIColor whiteColor];
    NewAppointmentLable.textAlignment=NSTextAlignmentCenter;
    NewAppointmentLable.text=@"Types";
    NewAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:15];
    [TopBarView addSubview:NewAppointmentLable];
    [self.view addSubview:TopBarView];
    
    TypeTableView=[[UITableView alloc]init];
    TypeTableView.frame=CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y,320 ,500);
    TypeTableView.backgroundColor=[UIColor clearColor];
    TypeTableView.delegate=self;
    TypeTableView.dataSource = self;
    TypeTableView.showsVerticalScrollIndicator=NO;
    TypeTableView.separatorStyle=UITableViewCellAccessoryNone;
    [self.view addSubview:TypeTableView];
}
#pragma mark Table View Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
  NSLog(@"appointment-type=%d",[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"] count]);
  return [[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"] count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    
    return 50+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.backgroundView=[[UIView alloc] initWithFrame:cell.bounds];
        cell.backgroundColor=[UIColor clearColor];
    }
    else
    {
        UIButton *CellButtonClick=(UIButton *)[cell.contentView viewWithTag:1506];
        [CellButtonClick removeFromSuperview];
        CellButtonClick=nil;

    }

    UIButton *CellButtonClick;
    CellButtonClick = [UIButton buttonWithType:UIButtonTypeCustom];
    [CellButtonClick setTag:1506];
    CellButtonClick.frame = CGRectMake(0,0, self.view.frame.size.width,50);
    CellButtonClick.backgroundColor=[UIColor whiteColor];
    CellButtonClick.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
    CellButtonClick.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    CellButtonClick.exclusiveTouch=YES;

    [CellButtonClick setTitle:[NSString stringWithFormat:@"%d",[[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"id"] objectAtIndex:indexPath.row] integerValue]] forState:UIControlStateNormal];
    [CellButtonClick setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [CellButtonClick addTarget:self action:@selector(selectTypeUser:) forControlEvents:UIControlEventTouchDown];
     [cell.contentView addSubview:CellButtonClick];

    UILabel *JobTitleNameShow = [[UILabel alloc] initWithFrame:CGRectMake(20,15,220,20)];
    JobTitleNameShow.textColor = [UIColor colorWithRed:123/255.0 green:137/255.0 blue:142/255.0 alpha:1.0];
    JobTitleNameShow.backgroundColor = [UIColor clearColor];
    JobTitleNameShow.textAlignment = NSTextAlignmentLeft;
    JobTitleNameShow.font = [UIFont fontWithName:@"MuseoSans-300" size:15];
    JobTitleNameShow.text = [[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"appointmenttype"] objectAtIndex:indexPath.row];
     [CellButtonClick addSubview:JobTitleNameShow];
    
    
    UIImageView *selectimage=[[UIImageView alloc]init];
    selectimage.frame=CGRectMake(285, 10, [UIImage imageNamed:@"rowselect.png"].size.width, [UIImage imageNamed:@"rowselect.png"].size.height);
    selectimage.image=[UIImage imageNamed:@"rowselect.png"];
    selectimage.tag=[[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"id"] objectAtIndex:indexPath.row] integerValue]+100;
    selectimage.hidden=YES;
    [CellButtonClick addSubview:selectimage];
    [cell.contentView addSubview:CellButtonClick];
    
    
    
    return cell;
}
-(IBAction)selectTypeUser:(UIButton*)sender
{
    [(UIImageView*)[self.view viewWithTag:[sender.titleLabel.text integerValue]+100]setHidden:NO];
  
    int StatusChange;
    for(int j = 0 ; j < [[[[[NSUserDefaults standardUserDefaults] objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"] count] ; j ++)
    {
        if([sender.titleLabel.text integerValue]==[[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"id"] objectAtIndex:j] integerValue])
        {
            StatusChange=[[NSString stringWithFormat:@"%d",j] integerValue];
            break;
        }
    }
    NSString *MessageString=[[[[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] objectForKey:@"appointment"] objectForKey:@"appointment_type"]valueForKey:@"appointmenttype"] objectAtIndex:StatusChange];
    
    NSLog(@"MessageString=%@",MessageString);
    
    [[NSUserDefaults standardUserDefaults]setObject:MessageString forKey:@"setTypeValueSelect"];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.2]];
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
