//
//  VerifyAccountDetailViewController.m
//  MyMediApp
//
//  Created by Applify Tech on 10/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "VerifyAccountDetailViewController.h"

@interface VerifyAccountDetailViewController ()
{
    UIButton *NextViewControllerButton;
    UILabel *VerifyAccountLable;
    UIView *lineView;
    UIView *TopBarView;
    UIView *CenterView;
    
    UITextField *PinTextField;
     UIView *paddingView;
    
}

@end

@implementation VerifyAccountDetailViewController

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
    TopBarView.backgroundColor=[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    TopBarView.userInteractionEnabled=TRUE;
    
    lineView=[[UIView alloc]initWithFrame:CGRectMake(270,35,1,25)];
    lineView.layer.borderColor = [UIColor colorWithRed:0.89453125 green:0.89453125 blue:0.89453125 alpha:1.0].CGColor;
    lineView.backgroundColor=[UIColor darkGrayColor];
    lineView.layer.borderWidth = 1.0f;
    [TopBarView addSubview:lineView];

    
    UIButton *LoginButton=[[UIButton alloc]initWithFrame:CGRectMake(270, 25, [UIImage imageNamed:@"tick.png"].size.width, [UIImage imageNamed:@"tick.png"].size.height)];
    LoginButton.backgroundColor=[UIColor clearColor];
    [LoginButton setImage:[UIImage imageNamed:@"tick.png"] forState:UIControlStateNormal];
    [LoginButton addTarget:self action:@selector(nextviewController)
          forControlEvents:UIControlEventTouchUpInside];
    //    LoginButton.titleEdgeInsets = UIEdgeInsetsMake(5, 100, 0, 0);
    //    LoginButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1.0].CGColor;
    //    LoginButton.layer.borderWidth = 1.0f;
    //    LoginButton.layer.cornerRadius = 3;
    [TopBarView addSubview:LoginButton];
    
//    NextViewControllerButton=[[UIButton alloc]initWithFrame:CGRectMake(260, 18,60 ,50)];
//    NextViewControllerButton.backgroundColor=[UIColor clearColor];
//    [NextViewControllerButton setTitle:@"Next" forState:UIControlStateNormal];
//    [NextViewControllerButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
//    [NextViewControllerButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//    NextViewControllerButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTCom-Lt" size: 15];
//    [NextViewControllerButton addTarget:self action:@selector(nextviewController) forControlEvents:UIControlEventTouchUpInside];
//    [TopBarView addSubview:NextViewControllerButton];
    
    
    
    VerifyAccountLable=[[UILabel alloc]initWithFrame:CGRectMake(90, 30, 130, 30)];
    VerifyAccountLable.text=@"Verify Account";
    VerifyAccountLable.font=[UIFont fontWithName:helveticaRegular size:15];
    VerifyAccountLable.textColor=[UIColor blackColor];
    VerifyAccountLable.textAlignment=NSTextAlignmentCenter;
    VerifyAccountLable.backgroundColor=[UIColor clearColor];
    [TopBarView addSubview:VerifyAccountLable];
    [self.view addSubview:TopBarView];
    
    CenterView=[[UIView alloc]initWithFrame:CGRectMake(0, TopBarView.frame.size.height+TopBarView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    CenterView.backgroundColor=[UIColor whiteColor];
    

    
//    lineView=[[UIView alloc]initWithFrame:CGRectMake(111,VerifyAccountLable.frame.origin.y+30,90,1)];
//    lineView.layer.borderColor = [UIColor blackColor].CGColor;
//    lineView.backgroundColor=[UIColor blackColor];
//    lineView.layer.borderWidth = 1.0f;
//    [CenterView addSubview:lineView];
   
    
    
    UIImageView *PhoneImageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, VerifyAccountLable.frame.size.height+VerifyAccountLable.frame.origin.y,[UIImage imageNamed:@"verify_account_ok_screen.png"].size.width, [UIImage imageNamed:@"verify_account_ok_screen.png"].size.height)];
    PhoneImageView.image=[UIImage imageNamed:@"verify_account_ok_screen.png"];
    [CenterView addSubview:PhoneImageView];
    
   
    
    PinTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 370, 100, 40)];
    PinTextField.delegate = self;
    PinTextField.placeholder = @"Sms Code*";
    PinTextField.textAlignment = NSTextAlignmentLeft;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    PinTextField.leftView = paddingView;
    PinTextField.leftViewMode = UITextFieldViewModeAlways;
    PinTextField.textColor=[UIColor blackColor];
    PinTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    PinTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [PinTextField setFont:[UIFont fontWithName:helveticaRegular size:15]];
    PinTextField.keyboardType=UIKeyboardTypeNumberPad;
    PinTextField.autocapitalizationType = NO;
    PinTextField.backgroundColor=[UIColor grayColor];
    PinTextField.returnKeyType=UIReturnKeyNext;
    [CenterView addSubview:PinTextField];
    
    
    
    UILabel *PinSmsLable=[[UILabel alloc]initWithFrame:CGRectMake(70, PinTextField.frame.size.height+PinTextField.frame.origin.y+20, 220, 20)];
    PinSmsLable.text=@"Generate OTP(one time password)";
    PinSmsLable.textColor=[UIColor whiteColor];
    [PinSmsLable setFont:[UIFont fontWithName:helveticaRegular size:12]];
    PinSmsLable.backgroundColor=[UIColor clearColor];
    [CenterView addSubview:PinSmsLable];
    [self.view addSubview:CenterView];

    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTapped)] ;
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
//    UIImage *BackGroundImage=[UIImage imageNamed:@"Back_pattern.png"];
//    BackGroundImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, TopBarView.frame.size.height+TopBarView.frame.origin.y+20, BackGroundImage.size.width, BackGroundImage.size.height)];
//    BackGroundImageView.backgroundColor=[UIColor clearColor];
//    BackGroundImageView.image=BackGroundImage;
//    BackGroundImageView.userInteractionEnabled=TRUE;
    
    //[self setMaskTo:BackGroundImageView byRoundingCorners:UIRectCornerTopLeft];
    
    
    //[self.view addSubview:BackGroundImageView];
    

}
- (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(25, 25)];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
}
-(void)nextviewController{
    
    [[soundManager shared]buttonSound];
   UserHomeScreenViewController *UserHome=[[UserHomeScreenViewController alloc]init];
    [self.navigationController pushViewController:UserHome animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    // register for keyboard notifications
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow)
     
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
}
- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}
-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
         [self setViewMovedUp:YES];
        
    }
    else if (self.view.frame.origin.y < 0)
    {
       
       [self setViewMovedUp:NO]; 
       
    }
}

-(void)keyboardWillHide
{
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}
-(void)scrollViewDidTapped
{
    [PinTextField resignFirstResponder];
   
}
//-(void)textFieldDidBeginEditing:(UITextField *)sender
//{
//    if ([sender isEqual:PinTextField])
//    {
//        //move the main view, so that the keyboard does not hide it.
//        if  (self.view.frame.origin.y >= 0)
//        {
//            [self setViewMovedUp:YES];
//        }
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//}



@end
