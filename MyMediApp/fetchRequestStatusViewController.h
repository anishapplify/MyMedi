//
//  fetchRequestStatusViewController.h
//  MiniLuxe_ Customer
//
//  Created by Click Labs on 4/7/14.
//  Copyright (c) 2014 Click Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fetchRequestStatusViewController : UIViewController
{
    UILabel *requestingLabel;
    UIProgressView *progressView;
    
    UIButton *cancelRequestButton;
    UILabel *cancelRequestLabel;
    UILabel *cancelingRequest;
    UIImageView *crossImage;
    int count;
     UIImageView *backMapImage;
    NSString *etaTime;
    NSTimer *requestTimerForAPI;
    NSTimer *requestTimerForAPI1;
    NSTimer *requestTimerProgress;
    NSTimer *RepeatRequestTimer;
}
@property(nonatomic,readwrite)int engageId;

@end
