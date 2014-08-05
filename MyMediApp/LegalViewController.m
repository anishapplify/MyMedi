//
//  LegalViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 02/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "LegalViewController.h"

@interface LegalViewController ()

{
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton  *LogOutButton;
    UILabel *LegalLable;
}

@end

@implementation LegalViewController

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
    
    LegalLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    LegalLable.text=@"Send Feedback";
    LegalLable.font=[UIFont fontWithName:helveticaRegular size:18];
    LegalLable.textColor=[UIColor blackColor];
    LegalLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:LegalLable];
    
    [self.view addSubview:TopBarView];
    
    UIButton *ReportProblem=[[UIButton alloc]initWithFrame:CGRectMake(0, 100,320 ,45)];
    [ReportProblem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ReportProblem setTitle:@"Report a Problem" forState:(UIControlState)UIControlStateNormal];
    ReportProblem.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    ReportProblem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    ReportProblem.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    ReportProblem.backgroundColor=[UIColor whiteColor];
    [ReportProblem addTarget:self action:@selector(ReportProblemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ReportProblem];
    
    UIButton *Messages=[[UIButton alloc]initWithFrame:CGRectMake(0, ReportProblem.frame.size.height+ReportProblem.frame.origin.y+1,320 ,45)];
    [Messages setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Messages setTitle:@"Message" forState:(UIControlState)UIControlStateNormal];
    Messages.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    Messages.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    Messages.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [Messages addTarget:self action:@selector(MessagesAction) forControlEvents:UIControlEventTouchUpInside];
    Messages.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:Messages];
    
}
//-(void)ReportProblemAction{
//    
//}
-(void)MessagesAction{
    
}
- (void)ReportProblemAction:(id)sender
{
    
    if ([MFMailComposeViewController canSendMail])
        
    {
        
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"Feedback on MyMedi!"];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"care@mymedi.com",nil];
        
        [mailer setToRecipients:toRecipients];
        
        NSString *emailBody = @"";
        
        [mailer setMessageBody:emailBody isHTML:NO];
        [self presentViewController:mailer animated:YES completion:nil];
        
    }
    
    
    
    else
        
        
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"message:@"Your device doesn't support the composer sheet" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        
        
        [alert show];
        
        
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    
    switch (result)
    {
            
        case MFMailComposeResultCancelled:
            
            NSLog(@"mail cancelled");
            
            break;
            
        case MFMailComposeResultSent:
            
            NSLog(@"mail sent");
            
            break;
            
        case MFMailComposeResultSaved:
            
            NSLog(@"mail saved");
            
            break;
            
        case MFMailComposeResultFailed:
            
            NSLog(@"error,mail not sent");
            
            break;
            
            
            
        default:NSLog(@"mail not sent");
            
            break;
            
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    // [self dismissModalViewControllerAnimated:YES];
    
}
-(void)BackButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    
    TopBarView=nil;
    [TopBarView removeFromSuperview];
    BackButton=nil;
    [BackButton removeFromSuperview];
    LogOutButton=nil;
    [LogOutButton removeFromSuperview];
    LegalLable=nil;
    [LegalLable removeFromSuperview];
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
