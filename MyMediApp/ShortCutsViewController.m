//
//  ShortCutsViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 18/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "ShortCutsViewController.h"

@interface ShortCutsViewController (){
    UITableView *ShortCutViewTableView;
    UIView *TopBarView;

    UIImageView *BackGroundImageView;
    UIGestureRecognizer *LeftGesture;
    UIGestureRecognizer *RightGesture;
    UIImageView *DemoImageViewRow;
    UIImage *sampleRowImage;
    UIImageView *HandArrowImageView;
    UIImageView *DemoImageView;
    UIImage *handImageArrow;
    int abc;
}

@end

@implementation ShortCutsViewController

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
    
    UIButton *Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    Backbutton.frame = CGRectMake(5,35,backImg.size.width, backImg.size.height);
    [Backbutton setImage:backImg forState:UIControlStateNormal];
    [Backbutton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [TopBarView addSubview:Backbutton];
    
    
    [self.view addSubview:TopBarView];

    
    UIImage *BackGroundImage=[UIImage imageNamed:@"Back_pattern.png"];
    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, BackGroundImage.size.width, BackGroundImage.size.height)];
    BackGroundImageView.backgroundColor=[UIColor clearColor];
    BackGroundImageView.image=BackGroundImage;
    BackGroundImageView.userInteractionEnabled=TRUE;
    
    [self setMaskTo:BackGroundImageView byRoundingCorners:UIRectCornerTopLeft];
    
    
    
    UILabel *EmergencyLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 130, 40)];
    EmergencyLable.text=@"Shortcuts";
    EmergencyLable.textColor=[UIColor grayColor];
    EmergencyLable.textAlignment=NSTextAlignmentCenter;
    EmergencyLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
    [BackGroundImageView addSubview:EmergencyLable];
    
    UIView*lineView=[[UIView alloc]initWithFrame:CGRectMake(3,EmergencyLable.frame.origin.y+45,300,1)];
    lineView.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [BackGroundImageView addSubview:lineView];

    UIImage *DemoImage=[UIImage imageNamed:@"text_arrow.png"];
    DemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 150, DemoImage.size.width, DemoImage.size.height)];
    DemoImageView.image=DemoImage;
    [BackGroundImageView addSubview:DemoImageView];
    
    sampleRowImage=[UIImage imageNamed:@"slidenNewdemo.png"];
    DemoImageViewRow=[[UIImageView alloc]initWithFrame:CGRectMake(-90, DemoImageView.frame.size.height+DemoImageView.frame.origin.y+20, sampleRowImage.size.width, sampleRowImage.size.height)];
    DemoImageViewRow.image=sampleRowImage;
    [BackGroundImageView addSubview:DemoImageViewRow];
    
  
    [self.view addSubview:BackGroundImageView];
    
    
    handImageArrow=[UIImage imageNamed:@"hand.png"];
    HandArrowImageView=[[UIImageView alloc]initWithFrame:CGRectMake(110, DemoImageViewRow.frame.size.height+DemoImageViewRow.frame.origin.y-10, handImageArrow.size.width, handImageArrow.size.height)];
    HandArrowImageView.image=handImageArrow;
    [BackGroundImageView addSubview:HandArrowImageView];

    [self.view addSubview:BackGroundImageView];
    [NSTimer scheduledTimerWithTimeInterval:0.8
                                     target:self
                                   selector:@selector(targetMethod)
                                   userInfo:nil
                                    repeats:NO];
    abc=1;
    // Do any additional setup after loading the view.
}
-(void)targetMethod
{
     [self AnimationArrow];
}

-(void)BackButtonAction{
    [[soundManager shared] buttonSound];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(9.0, 9.0)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
}
-(void)AnimationArrow{
    [UIView animateWithDuration:0.9f animations:^{
        
        HandArrowImageView.frame=CGRectMake(230, DemoImageViewRow.frame.size.height+DemoImageViewRow.frame.origin.y-10, handImageArrow.size.width, handImageArrow.size.height);

         DemoImageViewRow.frame=CGRectMake(0, DemoImageView.frame.size.height+DemoImageView.frame.origin.y+20, sampleRowImage.size.width, sampleRowImage.size.height);
        
    } completion:^(BOOL finished) {
        if(abc==1)
        {
             [self AnimationFinish];
        }
        if(abc==2)
        {
            [self AnimationFinish];
        }
      
            }];
}
-(void)AnimationFinish{
    [UIView animateWithDuration:0.9f animations:^{
        
        HandArrowImageView.frame=CGRectMake(110, DemoImageViewRow.frame.size.height+DemoImageViewRow.frame.origin.y-10, handImageArrow.size.width, handImageArrow.size.height);
        DemoImageViewRow.frame=CGRectMake(-93, DemoImageView.frame.size.height+DemoImageView.frame.origin.y+20, sampleRowImage.size.width, sampleRowImage.size.height);
        
    } completion:^(BOOL finished) {
        [self AnimationArrow];
        abc++;
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"cell";
    UITableViewCell *cell =nil;
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
        cell.backgroundColor=[UIColor clearColor];
        
        
        UIButton*TypeValuesShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        TypeValuesShowButton.frame = CGRectMake(10,10, 280,40);
        TypeValuesShowButton.backgroundColor=[UIColor clearColor];
        TypeValuesShowButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size: 15];
        TypeValuesShowButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [TypeValuesShowButton setTitle:[NSString stringWithFormat:@"%d",indexPath.row+1] forState:(UIControlState)UIControlStateNormal];
        [TypeValuesShowButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        TypeValuesShowButton.titleEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
        TypeValuesShowButton.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
        TypeValuesShowButton.layer.borderWidth = 1.0f;
        TypeValuesShowButton.tag=1000;
       
        [TypeValuesShowButton addTarget:self action:@selector(selectTypeUser:) forControlEvents:UIControlEventTouchDown];
        
      

        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
        swipeRight.delegate = self;
        [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
        [TypeValuesShowButton addGestureRecognizer:swipeRight];
        
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(deleteGame:)];
        swipeLeft.delegate = self;
        [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        [TypeValuesShowButton addGestureRecognizer:swipeLeft];
        
          [cell addSubview:TypeValuesShowButton];
        
          }
    
    return cell;
}
-(void)deleteGame:(UIGestureRecognizer*)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        //NSLog(@"view: %i", gestureRecognizer.view.tag);
        
        //gameIDDelete = [[game_id objectAtIndex:(gestureRecognizer.view.tag-1000)] integerValue];
        //int statusCheck = [[user_status objectAtIndex:(gestureRecognizer.view.tag-1000)] integerValue];
        //NSLog(@" game user statussssss is %i",gestureRecognizer.view.tag-999);
        
        //NSLog(@" game id is %i",gameIDDelete);
        
        NSLog(@"gestureRecognizer.view.tag-999=%d",gestureRecognizer.view.superview.tag-999);
        [(UIButton *)[gestureRecognizer.view viewWithTag:gestureRecognizer.view.tag-999] setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
    
        [(UIButton *)[gestureRecognizer.view viewWithTag:gestureRecognizer.view.tag-999] setImage:[UIImage imageNamed:@"deletepresspng.png"] forState:UIControlStateSelected];
        //[gestureRecognizer.view.superview viewWithTag:gestureRecognizer.view.tag-1000];
        //status_button.enabled=NO;
        //status_button.hidden=TRUE;
        // [(UIButton *)[gestureRecognizer.view viewWithTag:gestureRecognizer.view.tag-1000];
        [(UIButton *)[gestureRecognizer.view.superview viewWithTag:gestureRecognizer.view.tag-999] addTarget:self action:@selector(delete_from_server) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}
-(void)delete_from_server{
    
}
-(void)swipeRight{
    
    NSLog(@"Right Swipe");
    [UIView animateWithDuration:0.50f animations:^{
       // frontView.frame = CGRectMake(280, 0, self.view.frame.size.width, self.view.frame.size.height);
        //frontView.userInteractionEnabled = NO;
        //viewChange = TRUE;
    }completion:^ (BOOL finished){
        if (finished) {
        }
    }
     
     ];
    
}

-(void)swipeLeft{
    NSLog(@"Left Swipe");
    [UIView animateWithDuration:0.50f animations:^{
        //frontView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
       // frontView.userInteractionEnabled = YES;
       // viewChange = FALSE;
    }completion:^ (BOOL finished){
        if (finished) {
        }
    }
     ];
    
}

- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender
{
    if ( sender.direction == UISwipeGestureRecognizerDirectionLeft )
    {
        NSLog(@" *** SWIPE LEFT ***");
        
       // self.tableHeaderLabel.text = [self.categoriesLabelArray objectAtIndex:index1];
       // [self.feedsTableView reloadData];
        
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        NSLog(@" *** SWIPE RIGHT ***");
      //  index1--;
       // self.tableHeaderLabel.text = [self.categoriesLabelArray objectAtIndex:index1];
       // [self.feedsTableView reloadData];
        
        
    }
}
-(IBAction)selectTypeUser:(id)sender{
    
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
