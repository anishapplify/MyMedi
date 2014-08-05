//
//  HelpScreenViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 02/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "HelpScreenViewController.h"

@interface HelpScreenViewController (){
    
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton  *LogOutButton;
    UILabel *HelpLable;
}

@end

@implementation HelpScreenViewController

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
    
    self.view.backgroundColor=[UIColor colorWithRed:23/255.0 green:115/255.0 blue:178/255.0 alpha:1.0];
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    BackButton=[[UIButton alloc]initWithFrame:CGRectMake(5, 20,[UIImage imageNamed:@"backButtonNew.png"].size.width ,[UIImage imageNamed:@"backButtonNew.png"].size.height)];
    BackButton.backgroundColor=[UIColor clearColor];
    [BackButton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:BackButton];
    
    HelpLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    HelpLable.text=@"Help";
    HelpLable.font=[UIFont fontWithName:helveticaRegular size:18];
    HelpLable.textColor=[UIColor blackColor];
    HelpLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:HelpLable];
    
    [self.view addSubview:TopBarView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)BackButtonAction
{
[self.navigationController popViewControllerAnimated:YES];
}
-(void)dealloc{
    
    TopBarView=nil;
    [TopBarView removeFromSuperview];
    BackButton=nil;
    [BackButton removeFromSuperview];
    LogOutButton=nil;
    [LogOutButton removeFromSuperview];
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
