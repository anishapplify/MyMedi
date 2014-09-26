//
//  MedicalNotesViewController.m
//  MyMedi_Version2
//
//  Created by anish on 24/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "MedicalNotesViewController.h"

@interface MedicalNotesViewController (){
    UIView *TopBarView;
    UILabel *NewAppointmentLable;
    UITextView *NotesTextView;
    UIButton *DoneButton;
}
@end

@implementation MedicalNotesViewController

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
    
    self.view.backgroundColor=[UIColor colorWithRed:241/255.0 green:245/255.0 blue:246/255.0 alpha:1.0];
    
    [TopBarView removeFromSuperview];
    TopBarView=nil;
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    TopBarView.backgroundColor=[UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    [NewAppointmentLable removeFromSuperview];
    NewAppointmentLable=nil;
    [NewAppointmentLable removeFromSuperview];
    NewAppointmentLable=nil;
    NewAppointmentLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 25, 130, 30)];
    NewAppointmentLable.textColor= [UIColor whiteColor];
    NewAppointmentLable.textAlignment=NSTextAlignmentCenter;
    NewAppointmentLable.text=@"Notes";
    NewAppointmentLable.font=[UIFont fontWithName:helveticaRegular size:15];
    [TopBarView addSubview:NewAppointmentLable];
    
    [DoneButton removeFromSuperview];
    DoneButton=nil;
    DoneButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 20, [UIImage imageNamed:@"doneCheck.png"].size.width, [UIImage imageNamed:@"doneCheck.png"].size.height)];
    DoneButton.backgroundColor=[UIColor clearColor];
    [DoneButton setBackgroundImage:[UIImage imageNamed:@"doneCheck.png"] forState:UIControlStateNormal];
    [DoneButton addTarget:self action:@selector(DoneButtonFuction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:DoneButton];
    DoneButton.exclusiveTouch=YES;
    
    [self.view addSubview:TopBarView];
    
    [NotesTextView removeFromSuperview];
    NotesTextView=nil;
    NotesTextView=[[UITextView alloc]init];
    NotesTextView.frame=CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, 320, 130);
    NotesTextView.backgroundColor=[UIColor whiteColor];
    NotesTextView.delegate=self;
    NotesTextView.textColor = [UIColor blackColor];
    [NotesTextView setFont:[UIFont fontWithName:@"MuseoSans-300" size:14]];
    [NotesTextView setScrollEnabled:YES];
    [self.view addSubview:NotesTextView];
}
-(void)DoneButtonFuction
{
    [NotesTextView resignFirstResponder];
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
