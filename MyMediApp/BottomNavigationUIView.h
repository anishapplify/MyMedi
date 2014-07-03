//
//  BottomNavigationUIView.h
//  MyMediApp
//
//  Created by Applify Tech on 21/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomNavigationView;

@interface BottomNavigationUIView : UIView
{
    
    id<BottomNavigationView>calldelegate;
}
@property (retain) id<BottomNavigationView> calldelegate;
@end
@protocol BottomNavigationView <NSObject>