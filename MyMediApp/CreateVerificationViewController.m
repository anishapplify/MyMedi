//
//  CreateVerificationViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 07/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "CreateVerificationViewController.h"

@interface CreateVerificationViewController (){
    
    UIImageView *StaticImageView;
}

@end

@implementation CreateVerificationViewController

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
    self.view.backgroundColor=[UIColor whiteColor];
    
   
    
    
    
    StaticImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 100, [UIImage imageNamed:@"log_inVerification.jpg"].size.width, [UIImage imageNamed:@"log_inVerification.jpg"].size.height)];
    StaticImageView.image=[UIImage   imageNamed:@"log_inVerification.jpg"];
    [self.view addSubview:StaticImageView];
    
    
    UIButton *LogInButton=[[UIButton alloc]initWithFrame:CGRectMake(35, StaticImageView.frame.size.height+StaticImageView.frame.origin.y+50, 250, 40)];
    LogInButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:185/255.0 blue:242/255.0 alpha:1.0];
    [LogInButton addTarget:self action:@selector(LogInButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [LogInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [LogInButton setTitle:@"Log In" forState:UIControlStateNormal];
    LogInButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
    [LogInButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [LogInButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    LogInButton.clipsToBounds = YES;
    LogInButton.layer.cornerRadius = 5;
    [self.view addSubview:LogInButton];
    
    
    UIButton *ResendInButton=[[UIButton alloc]initWithFrame:CGRectMake(70, LogInButton.frame.size.height+LogInButton.frame.origin.y+50, [UIImage imageNamed:@"resend_button.png"].size.width, [UIImage imageNamed:@"resend_button.png"].size.height)];
    ResendInButton.backgroundColor=[UIColor clearColor];
    [ResendInButton setBackgroundImage:[UIImage imageNamed:@"resend_button.png"] forState:UIControlStateNormal];
    [ResendInButton addTarget:self action:@selector(ResendButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ResendInButton];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)LogInButtonAction{
    UserHomeScreenViewController *listAppointment=[[UserHomeScreenViewController alloc]init];
    [self.navigationController pushViewController:listAppointment animated:YES];
}
-(void)ResendButtonAction{
    
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