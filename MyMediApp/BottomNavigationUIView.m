//
//  BottomNavigationUIView.m
//  MyMediApp
//
//  Created by Applify Tech on 21/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "BottomNavigationUIView.h"

@implementation BottomNavigationUIView
{
    UIView *BottomView;
    UIButton *HomeButton;
    UIButton *AppointmentButton;
    UIButton *CalenderButton;
    UIButton *MapButton;
    UIButton *SlidMenuButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    BottomView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    BottomView.backgroundColor=[UIColor clearColor];
    BottomView.userInteractionEnabled=TRUE;
    
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(15, 5, 50, 30)];
    HomeButton.backgroundColor=[UIColor clearColor];
    [HomeButton setTitle:@"Home" forState:UIControlStateNormal];
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    
    AppointmentButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.origin.x+HomeButton.frame.size.width+10, 5, 50, 30)];
    AppointmentButton.backgroundColor=[UIColor clearColor];
    [AppointmentButton setTitle:@"Medi" forState:UIControlStateNormal];
    [AppointmentButton addTarget:self action:@selector(AppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:AppointmentButton];
    
    CalenderButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentButton.frame.size.width+AppointmentButton.frame.origin.x+10, 5, 50, 30)];
    CalenderButton.backgroundColor=[UIColor clearColor];
    [CalenderButton setTitle:@"New" forState:UIControlStateNormal];
    [CalenderButton addTarget:self action:@selector(CalenderButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:CalenderButton];
    
    
    MapButton=[[UIButton alloc]initWithFrame:CGRectMake(CalenderButton.frame.size.width+CalenderButton.frame.origin.x+10, 5, 50, 30)];
    MapButton.backgroundColor=[UIColor clearColor];
    [MapButton setTitle:@"Map" forState:UIControlStateNormal];
    [MapButton addTarget:self action:@selector(MapButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:MapButton];
    
    SlidMenuButton=[[UIButton alloc]initWithFrame:CGRectMake(MapButton.frame.size.width+MapButton.frame.origin.x+10, 5, 50, 30)];
    SlidMenuButton.backgroundColor=[UIColor brownColor];
    [SlidMenuButton addTarget:self action:@selector(SlidMenuButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SlidMenuButton];
    
    [self addSubview:BottomView];
    
    return self;
}
-(void)HomeButtonAction{
    
}
-(void)AppointmentButtonAction{
    
}
-(void)CalenderButtonAction{
    
}
-(void)MapButtonAction{
    
}
-(void)SlidMenuButtonAction{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end
