//
//  ListOfAppoinmentViewController.h
//  MyMediApp
//
//  Created by Applify Tech on 11/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottomNavigationUIView.h"

@end
@interface UserHomeScreenViewController : UIViewController<BottomNavigationView,UIImagePickerControllerDelegate,UIPickerViewDelegate,UINavigationControllerDelegate,UIScrollViewDelegate,UIActionSheetDelegate,UIScrollViewDelegate>
{
    BottomNavigationUIView *nav;
}
@end
