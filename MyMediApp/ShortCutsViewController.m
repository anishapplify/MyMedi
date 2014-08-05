//

//  ShortCutsViewController.m

//  MyMediApp

//

//  Created by Applify Tech on 18/06/14.

//  Copyright (c) 2014 Applify. All rights reserved.

//



#import "ShortCutsViewController.h"



@interface ShortCutsViewController ()

{
    
    UITableView *ShortCutViewTableView;
    
    UIView *TopBarView;
    
    UIButton *Backbutton;
    
    UIGestureRecognizer *LeftGesture;
    
    UIGestureRecognizer *RightGesture;
    
    UIImageView *DemoImageViewRow;
    
    UIImageView *HandArrowImageView;
    
    UIImageView *DemoImageView;
    
    int animationStatus;
    
    UILabel *ShortCutLable;
    
    
    
    UIButton *TypeValuesShowButton;
    
    UIBezierPath *rounded;
    
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
    
    self.view.backgroundColor=[UIColor whiteColor];

    
    
    TopBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,70)];
    
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    
    TopBarView.userInteractionEnabled=TRUE;
    
    
    
    Backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    Backbutton.frame = CGRectMake(5,20,[UIImage imageNamed:@"backButtonNew.png"].size.width, [UIImage imageNamed:@"backButtonNew.png"].size.height);
    
    [Backbutton setImage:[UIImage imageNamed:@"backButtonNew.png"] forState:UIControlStateNormal];
    
    [Backbutton addTarget:self action:@selector(BackButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [TopBarView addSubview:Backbutton];
    
    
    
    ShortCutLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 25, 130, 30)];
    
    ShortCutLable.text=@"Shortcuts";
    
    ShortCutLable.textColor=[UIColor blackColor];
    
    ShortCutLable.textAlignment=NSTextAlignmentCenter;
    
    ShortCutLable.font=[UIFont fontWithName:helveticaRegular size:18];
    
    [TopBarView addSubview:ShortCutLable];
    
    
    
    
    
    [self.view addSubview:TopBarView];
    
    
    
    UIImageView *backGround=[[UIImageView alloc]initWithFrame:CGRectMake(25, TopBarView.frame.size.height+TopBarView.frame.origin.y+80, [UIImage imageNamed:@"sortcut_text.png"].size.width, [UIImage imageNamed:@"sortcut_text.png"].size.height)];
    
    backGround.image=[UIImage imageNamed:@"sortcut_text.png"];
    
    [self.view addSubview:backGround];
    
    
   
    DemoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 350,[UIImage imageNamed:@"text_arrow.png"].size.width, [UIImage imageNamed:@"text_arrow.png"].size.height)];
    
    DemoImageView.image=[UIImage imageNamed:@"text_arrow.png"];
    
    [self.view addSubview:DemoImageView];
    
    DemoImageView.hidden=YES;
    
    
    
    DemoImageViewRow=[[UIImageView alloc]initWithFrame:CGRectMake(-90, DemoImageView.frame.size.height+DemoImageView.frame.origin.y+20, [UIImage imageNamed:@"slidenNewdemo.png"].size.width+20, [UIImage imageNamed:@"slidenNewdemo.png"].size.height)];
    
    DemoImageViewRow.image=[UIImage imageNamed:@"slidenNewdemo.png"];
    
    [self.view addSubview:DemoImageViewRow];
    
    
    
    DemoImageViewRow.hidden=YES;
    
    
    
    HandArrowImageView=[[UIImageView alloc]initWithFrame:CGRectMake(110, DemoImageViewRow.frame.size.height+DemoImageViewRow.frame.origin.y-10, [UIImage imageNamed:@"hand.png"].size.width, [UIImage imageNamed:@"hand.png"].size.height)];
    
    HandArrowImageView.image=[UIImage imageNamed:@"hand.png"];
    
    [self.view addSubview:HandArrowImageView];
    
    HandArrowImageView.hidden=YES;
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(targetMethod) userInfo:nil repeats:NO];
    
    animationStatus=1;
    
    
    
    //    ShortCutViewTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    
    //    ShortCutViewTableView.backgroundColor=[UIColor clearColor];
    
    //    ShortCutViewTableView.dataSource=self;
    
    //    ShortCutViewTableView.delegate=self;
    
    //    ShortCutViewTableView.separatorColor=[UIColor clearColor];
    
    //    [self.view addSubview:ShortCutViewTableView];
    
    //
    
    
    
}

-(void)targetMethod

{
    
    [self AnimationArrow];
    
    DemoImageViewRow.hidden=NO;
    
    DemoImageView.hidden=NO;
    
    HandArrowImageView.hidden=NO;
    
}

-(void)BackButtonAction{
    

    [self.navigationController popViewControllerAnimated:YES];
    
}



- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners

{
    
    rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
               
                                    byRoundingCorners:corners
               
                                          cornerRadii:CGSizeMake(9.0, 9.0)];
    
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    
    [shape setPath:rounded.CGPath];
    
    view.layer.mask = shape;
    
}

-(void)AnimationArrow{
    
    
    
    [UIView animateWithDuration:0.9f animations:^{
        
        HandArrowImageView.frame=CGRectMake(230, DemoImageViewRow.frame.size.height+DemoImageViewRow.frame.origin.y-10,[UIImage imageNamed:@"hand.png"].size.width, [UIImage imageNamed:@"hand.png"].size.height);
        
        DemoImageViewRow.frame=CGRectMake(0, DemoImageView.frame.size.height+DemoImageView.frame.origin.y+20,[UIImage imageNamed:@"slidenNewdemo.png"].size.width+20, [UIImage imageNamed:@"slidenNewdemo.png"].size.height);
        
        
        
    } completion:^(BOOL finished) {
        
        if(animationStatus==1)
            
        {
            
            [self AnimationFinish];
            
        }
        
        if(animationStatus==2)
            
        {
            
            [self AnimationFinish];
            
        }
        
    }];
    
}

-(void)AnimationFinish{
    
    
    
    [UIView animateWithDuration:0.9f animations:^{
        
        HandArrowImageView.frame=CGRectMake(110, DemoImageViewRow.frame.size.height+DemoImageViewRow.frame.origin.y-10, [UIImage imageNamed:@"hand.png"].size.width, [UIImage imageNamed:@"hand.png"].size.height);
        
        DemoImageViewRow.frame=CGRectMake(-93, DemoImageView.frame.size.height+DemoImageView.frame.origin.y+20, [UIImage imageNamed:@"slidenNewdemo.png"].size.width+20, [UIImage imageNamed:@"slidenNewdemo.png"].size.height);
        
        
        
    } completion:^(BOOL finished) {
        
        [self AnimationArrow];
        
        animationStatus++;
        
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
        
        cell.backgroundColor=[UIColor clearColor];
        
        
        
        
        
        TypeValuesShowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
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

-(void)dealloc{
    
    [ShortCutViewTableView removeFromSuperview];
    
    ShortCutViewTableView=nil;
    
    [TopBarView removeFromSuperview];
    
    TopBarView=nil;
    
    [Backbutton removeFromSuperview];
    
    Backbutton=nil;
    
    LeftGesture=nil;
    
    RightGesture=nil;
    
    [DemoImageViewRow removeFromSuperview];
    
    DemoImageViewRow=nil;
    
    [HandArrowImageView removeFromSuperview];
    
    HandArrowImageView=nil;
    
    [DemoImageView removeFromSuperview];
    
    DemoImageView=nil;
    
    
    
    [TypeValuesShowButton removeFromSuperview];
    
    TypeValuesShowButton=nil;
    
    
    
}
-(void) viewWillDisappear:(BOOL)animated
{
    [DemoImageView removeFromSuperview];
    [DemoImageViewRow removeFromSuperview];
    [HandArrowImageView removeFromSuperview];
    [self.view.layer removeAllAnimations];
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

