//
//  ReportViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 02/07/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController (){
    UIView *TopBarView;
    UIButton *BackButton;
    UIButton  *LogOutButton;
    UILabel *ReportLable;
    UIView *TearmBackGroundView;
    UIScrollView *TearmScrollVeiw;
}

@end

@implementation ReportViewController

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
    
    ReportLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 150, 30)];
    ReportLable.text=@"Legal & Privacy";
    ReportLable.font=[UIFont fontWithName:helveticaRegular size:18];
    ReportLable.textColor=[UIColor blackColor];
    ReportLable.textAlignment=NSTextAlignmentCenter;
    [TopBarView addSubview:ReportLable];
    
    
    [self.view addSubview:TopBarView];

  UIButton *TeamsAndConditions=[[UIButton alloc]initWithFrame:CGRectMake(0, 100,320 ,45)];
    [TeamsAndConditions setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [TeamsAndConditions setTitle:@"Terms & Conditions" forState:(UIControlState)UIControlStateNormal];
    TeamsAndConditions.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    TeamsAndConditions.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    TeamsAndConditions.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    TeamsAndConditions.backgroundColor=[UIColor whiteColor];
    [TeamsAndConditions addTarget:self action:@selector(TeamsAndConditionAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:TeamsAndConditions];
    
  UIButton *PrivacyAndPolicy=[[UIButton alloc]initWithFrame:CGRectMake(0, TeamsAndConditions.frame.size.height+TeamsAndConditions.frame.origin.y+1,320 ,45)];
    [PrivacyAndPolicy setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [PrivacyAndPolicy setTitle:@"Privacy Policy" forState:(UIControlState)UIControlStateNormal];
    PrivacyAndPolicy.titleLabel.font = [UIFont fontWithName:helveticaRegular size: 15];
    PrivacyAndPolicy.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    PrivacyAndPolicy.titleEdgeInsets = UIEdgeInsetsMake(5, 25, 0, 0);
    [PrivacyAndPolicy addTarget:self action:@selector(TeamsAndConditionAction) forControlEvents:UIControlEventTouchUpInside];
    PrivacyAndPolicy.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:PrivacyAndPolicy];
}
-(void)TeamsAndConditionAction{
    
    [TearmBackGroundView removeFromSuperview];
   TearmBackGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    TearmBackGroundView.backgroundColor=[UIColor blackColor];
    TearmBackGroundView.alpha=0.8;
    [self.view addSubview:TearmBackGroundView];
    
    [TearmScrollVeiw removeFromSuperview];
  TearmScrollVeiw=[[UIScrollView alloc]initWithFrame:CGRectMake(20, 70, 280, 480)];
    TearmScrollVeiw.backgroundColor=[UIColor whiteColor];
    
    
 UIButton *CrossButton=[[UIButton  alloc]initWithFrame:CGRectMake(260, 0, 20, 20)];
    [CrossButton addTarget:self action:@selector(removeTearmScrollView) forControlEvents:UIControlEventTouchUpInside];
    CrossButton.backgroundColor=[UIColor blackColor];
    [CrossButton setImage:[UIImage imageNamed:@"CrossImage.png"] forState:UIControlStateNormal];
    [TearmScrollVeiw addSubview:CrossButton];
    
   UITextView *TearmTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 50, 300, 490)];
    TearmTextView.backgroundColor=[UIColor clearColor];
    TearmTextView.text=@"asdflk haklsdfh klasdfsl kjasdflk jaslk;djf lkasdflkjasdlkf jlaskdjf lkasjdflk jasdlkfj lkasdjfl kasjdlfkj aslk asdfjl kasjdf salkdjf lksajdfl kjsadlkfj lkasjdflk jsadlkfj lksajdfk jsadlkfj lkdsajf lkjdsaflk jsdaklfj lkadsjf lkjsdalfkj lsakdjflkasdjflkjdslkfjdsalkfjlksadjflkj sadfj lsadjf jasdlfj lsadjfl";
    
    [TearmTextView setFont:[UIFont boldSystemFontOfSize:10]];
    [TearmScrollVeiw addSubview:TearmTextView];
    [self.view addSubview:TearmScrollVeiw];
    [self attachPopUpAnimationToView:TearmScrollVeiw];
}
-(void)removeTearmScrollView{
    [TearmBackGroundView removeFromSuperview];
    [TearmScrollVeiw removeFromSuperview];
}
- (void) attachPopUpAnimationToView:(UIView *)myView
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .2;
    
    [myView.layer addAnimation:animation forKey:@"popup"];
}
-(void)PrivacyAndPolicyAction{
    
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
