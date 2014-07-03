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
     self.view.backgroundColor=[UIColor colorWithRed:224/255.0 green:222/255.0 blue:222/255.0 alpha:1.0];
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    UIImage * backImg = [UIImage imageNamed:@"back_mymediNew.png"];
    
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    BackButton.frame = CGRectMake(5,35,backImg.size.width, backImg.size.height);
    [BackButton setImage:backImg forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
  UIView * lineView=[[UIView alloc]initWithFrame:CGRectMake(270,35,1,25)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView];
    
    
    
    UIImage *RefreashImage=[UIImage imageNamed:@"refresh_icon.png"];
    RefreashButton=[[UIButton alloc]initWithFrame:CGRectMake(285, 35, RefreashImage.size.width, RefreashImage.size.height)];
    RefreashButton.backgroundColor=[UIColor clearColor];
    [RefreashButton setImage:RefreashImage forState:UIControlStateNormal];
    [RefreashButton addTarget:self action:@selector(RefreashButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:RefreashButton];
    [self.view addSubview:TopBarView];
    
    UIButton*RecentButtonActionArrow=[[UIButton alloc]initWithFrame:CGRectMake(15, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, 300, 40)];
    RecentButtonActionArrow.backgroundColor=[UIColor blackColor];
    RecentButtonActionArrow.backgroundColor=[UIColor blackColor];
    [RecentButtonActionArrow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    RecentButtonActionArrow.backgroundColor=[UIColor colorWithRed:97/255.0 green:186/255.0 blue:217/255.0 alpha:1.0];
    RecentButtonActionArrow.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    RecentButtonActionArrow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [RecentButtonActionArrow setTitle:@"RECENT UPDATES" forState:(UIControlState)UIControlStateNormal];
    [RecentButtonActionArrow setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    RecentButtonActionArrow.userInteractionEnabled=FALSE;
    [RecentButtonActionArrow setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    RecentButtonActionArrow.titleEdgeInsets = UIEdgeInsetsMake(5, 80, 0, 0);
    [self.view addSubview:RecentButtonActionArrow];
    
    
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
