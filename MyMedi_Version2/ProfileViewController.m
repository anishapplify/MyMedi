//
//  ProfileViewController.m
//  MyMedi_Version2
//
//  Created by Applify Tech on 19/09/14.
//  Copyright (c) 2014 ApplifyTech. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
{
    UIView *headerView;
    UILabel *profileLabel;
    UIView *horizontalLIneView;
    UIView *BottomView;
    UIButton *appointmentsButton;
    UIButton *profileButton;
    UIButton *shortCutsButton;
    UIButton *settingsButton;
    AsyncImageView *userImage;
    
    
    
    UIView *userImageView;
    UILabel *userNameLabel;
    UITableView *profileTableView;
    
    NSMutableArray *tableContentsArray;
    
    UIButton *HomeButton;
    UIButton *ShortCutButton;
    UIButton *ProfileButton;
    UIButton *AppointmentsBottomButton;
    UIButton *SettingButton;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [profileTableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    tableContentsArray = [[NSMutableArray alloc]initWithObjects:@"Personal Details", @"Address Details", @"Contact Details",@"GP Details",@"Emergency Contact", @"Employment Details", @"Medication",@"Aliergies", @"Medial Conditions",@"Immunisations", nil];
    
    [headerView removeFromSuperview];
    headerView = nil;
    headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor colorWithRed:11/255.0 green:161/255.0 blue:212/255.0 alpha:1.0];
    headerView.userInteractionEnabled = YES;
    [self.view addSubview:headerView];
    
    [profileLabel removeFromSuperview];
    profileLabel = nil;
    profileLabel = [[UILabel alloc] init];
    profileLabel.font = [UIFont fontWithName:@"Europa-Regular" size:17];
    profileLabel.backgroundColor = [UIColor clearColor];
    profileLabel.textColor=[UIColor whiteColor];
    profileLabel.textAlignment = NSTextAlignmentCenter;
    profileLabel.text= @"Profile";
    [self.view addSubview:profileLabel];
    
    [horizontalLIneView removeFromSuperview];
    horizontalLIneView = nil;
    horizontalLIneView = [[UIView alloc]init];
    horizontalLIneView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:horizontalLIneView];

   
    [userImageView removeFromSuperview];
    userImageView = nil;
    userImageView = [[UIView alloc] init];
    userImageView.backgroundColor=[UIColor colorWithRed:31/255.0 green:177/255.0 blue:228/255.0 alpha:1.0];
    userImageView.userInteractionEnabled = YES;
    [self.view addSubview:userImageView];

    [userImage removeFromSuperview];
    userImage=nil;
    userImage = [[AsyncImageView alloc] init];
    
    if ([[[[NSUserDefaults standardUserDefaults]valueForKey:kLoginData] valueForKey:@"image"]length]>0)
    {
        
        userImage.imageURL = [NSURL URLWithString:[[[NSUserDefaults standardUserDefaults]objectForKey:kLoginData] valueForKey:@"image"]];
        
    }
    else
    {
        userImage.image=[UIImage imageNamed:@"Headshot-Placeholder.png"];
    }
    userImage.backgroundColor=[UIColor colorWithRed:255.0/255 green:91.0/255 blue:115.0/255 alpha:1.0];
    userImage.userInteractionEnabled=YES;
    userImage.layer.masksToBounds = YES;
    userImage.contentMode = UIViewContentModeScaleAspectFill;
    userImage.userInteractionEnabled=YES;
    [[userImage layer]setCornerRadius:39];
    [userImageView addSubview:userImage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    [tap setNumberOfTouchesRequired:1];
    [userImage addGestureRecognizer:tap];
    
    
    [userNameLabel removeFromSuperview];
    userNameLabel = nil;
    userNameLabel = [[UILabel alloc] init];
    userNameLabel.font = [UIFont fontWithName:@"Europa-Regular" size:17];
    userNameLabel.backgroundColor = [UIColor clearColor];
    userNameLabel.textColor=[UIColor whiteColor];
    userNameLabel.textAlignment = NSTextAlignmentCenter;
    userNameLabel.text= @"Paul Walker";
    [userImageView addSubview:userNameLabel];

    
    [profileTableView removeFromSuperview];
    profileTableView = nil;
    profileTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    profileTableView.tag=1;
    profileTableView.dataSource=self;
    profileTableView.delegate = self;
    profileTableView.backgroundColor=[UIColor clearColor];
    profileTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    profileTableView.showsVerticalScrollIndicator = NO;
    profileTableView.alwaysBounceVertical = NO;
    [self.view addSubview:profileTableView];

    
    
    BottomView=[[UIView alloc]init];
    BottomView.backgroundColor=[UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    BottomView.userInteractionEnabled=TRUE;
    
    [HomeButton removeFromSuperview];
    HomeButton=nil;
    HomeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIImage imageNamed:@"bottommymedi.png"].size.width,[UIImage imageNamed:@"bottommymedi.png"].size.height)];//bottommymedi_sel.png
    HomeButton.backgroundColor=[UIColor clearColor];//bottommymedi.png
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi.png"] forState:UIControlStateNormal];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateHighlighted];
    [HomeButton setBackgroundImage:[UIImage imageNamed:@"bottommymedi_sel.png"] forState:UIControlStateSelected];
    [HomeButton addTarget:self action:@selector(HomeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:HomeButton];
    
    [AppointmentsBottomButton removeFromSuperview];
    AppointmentsBottomButton=nil;
    AppointmentsBottomButton=[[UIButton alloc]initWithFrame:CGRectMake(HomeButton.frame.size.width+HomeButton.frame.origin.x, 0, [UIImage imageNamed:@"appointments.png"].size.width,[UIImage imageNamed:@"appointments.png"].size.height)];//appointments_sel.png
    AppointmentsBottomButton.backgroundColor=[UIColor clearColor];//appointments.png
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments.png"] forState:UIControlStateNormal];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateSelected];
    [AppointmentsBottomButton setBackgroundImage:[UIImage imageNamed:@"appointments_sel.png"] forState:UIControlStateHighlighted];
    [AppointmentsBottomButton addTarget:self action:@selector(AppointmentButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:AppointmentsBottomButton];
    
    
    [ProfileButton removeFromSuperview];
    ProfileButton=nil;
    ProfileButton=[[UIButton alloc]initWithFrame:CGRectMake(AppointmentsBottomButton.frame.size.width+AppointmentsBottomButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomprofile.png"].size.width,[UIImage imageNamed:@"bottomprofile.png"].size.height)];
    ProfileButton.backgroundColor=[UIColor clearColor];//bottomprofile.png  //bottomprofile_sel.png
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile_sel.png"] forState:UIControlStateNormal];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile.png"] forState:UIControlStateSelected];
    [ProfileButton setBackgroundImage:[UIImage imageNamed:@"bottomprofile.png"] forState:UIControlStateHighlighted];
    ProfileButton.userInteractionEnabled=FALSE;
    [ProfileButton addTarget:self action:@selector(ProfileButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ProfileButton];
    
    
    [ShortCutButton removeFromSuperview];
    ShortCutButton=nil;
    ShortCutButton=[[UIButton alloc]initWithFrame:CGRectMake(ProfileButton.frame.origin.x+ProfileButton.frame.size.width, 0,[UIImage imageNamed:@"bottomshortcut.png"].size.width,[UIImage imageNamed:@"bottomshortcut.png"].size.height)];
    ShortCutButton.backgroundColor=[UIColor clearColor];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut.png"] forState:UIControlStateNormal];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateSelected];
    [ShortCutButton setBackgroundImage:[UIImage imageNamed:@"bottomshortcut_sel.png"] forState:UIControlStateHighlighted];
    [ShortCutButton addTarget:self action:@selector(ShortCutButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:ShortCutButton];
    
    [SettingButton removeFromSuperview];
    SettingButton=nil;
    SettingButton=[[UIButton alloc]initWithFrame:CGRectMake(ShortCutButton.frame.size.width+ShortCutButton.frame.origin.x, 0, [UIImage imageNamed:@"bottomsettings.png"].size.width,[UIImage imageNamed:@"bottomsettings.png"].size.height)];
    SettingButton.backgroundColor=[UIColor clearColor];//bottomsettings.png
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateNormal];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateSelected];
    [SettingButton setBackgroundImage:[UIImage imageNamed:@"bottomsettings.png"] forState:UIControlStateHighlighted];
    [SettingButton addTarget:self action:@selector(SettingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:SettingButton];
    [self.view addSubview:BottomView];
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] bounds].size.height==568)
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            profileLabel.frame = CGRectMake(0, 20, 320, 44);
            horizontalLIneView.frame = CGRectMake(0, 519, 320, 1);
            BottomView.frame=CGRectMake(0, 520, 320, 49);
            
            userImageView.frame = CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y, 320, 115);
           
            userImage.frame = CGRectMake(118, 8, 78, 78 );
            userNameLabel.frame = CGRectMake(0, userImage.frame.size.height+userImage.frame.origin.y, 320, 25);
            
            profileTableView.frame = CGRectMake(0, userImageView.frame.origin.y+userImageView.frame.size.height, 320, 344);
        }
        else
        {
            headerView.frame = CGRectMake(0, 0, 320, 64);
            profileLabel.frame = CGRectMake(0, 20, 320, 44);
            horizontalLIneView.frame = CGRectMake(0, 519, 320, 1);
             BottomView.frame=CGRectMake(0, 432, 320, 49);
    
            userImageView.frame = CGRectMake(0, headerView.frame.size.height+headerView.frame.origin.y, 320, 115);
        
            userImage.frame = CGRectMake(118, 8, 78, 78 );
            
            userNameLabel.frame = CGRectMake(0, userImage.frame.size.height+userImage.frame.origin.y, 320, 25);
            
            profileTableView.frame = CGRectMake(0, userImageView.frame.origin.y+userImageView.frame.size.height, 320, 300);
        }
    }

    
    
}
-(void)HomeButtonAction{
    HomeScreenViewController *homescreen=[[HomeScreenViewController alloc]init];
    [self.navigationController pushViewController:homescreen animated:NO];
}
-(void)AppointmentButtonAction{
    AppointmentCalenderViewController  *Appointmentslistview=[[AppointmentCalenderViewController alloc]init];
    [self.navigationController pushViewController:Appointmentslistview animated:NO];
}

-(void)ProfileButtonAction{
    //HomeScreenViewController *appointmentList=[[HomeScreenViewController alloc]init];
    //[self.navigationController pushViewController:appointmentList animated:NO];
}

-(void)ShortCutButtonAction{
   // HomeScreenViewController *appointmentList=[[HomeScreenViewController alloc]init];
    //[self.navigationController pushViewController:appointmentList animated:NO];
}

-(void)SettingButtonAction{
    SettingScreenViewController *settingview=[[SettingScreenViewController alloc]init];
    [self.navigationController pushViewController:settingview animated:NO];
}



#pragma marK TABLE VIEW DELEGATES
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [tableContentsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    else
    {
        UILabel *textLabel_remove = (UILabel*)[cell.contentView viewWithTag:1];
        [textLabel_remove removeFromSuperview];
        textLabel_remove = nil;
        
        UIButton *arrowButton_remove = (UIButton*)[cell.contentView viewWithTag:2];
        [arrowButton_remove removeFromSuperview];
        arrowButton_remove = nil;


    }
    
    UILabel *details = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 250, 45)];
    details.font = [UIFont fontWithName:@"Europa-Regular" size:14];
    details.backgroundColor = [UIColor clearColor];
    details.textColor=[UIColor blackColor];
    details.tag = 1;
    details.userInteractionEnabled = false;
    details.text = [tableContentsArray objectAtIndex:indexPath.row];
    details.textAlignment = NSTextAlignmentLeft;
    [cell addSubview:details];
    
    
    UIButton *arrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    arrowButton.frame = CGRectMake(270, 0, 45, 45);
    arrowButton.backgroundColor=[UIColor clearColor];
    [arrowButton setBackgroundImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    arrowButton.exclusiveTouch = YES;
    arrowButton.tag = 2;
    arrowButton.userInteractionEnabled = false;
   [cell addSubview:arrowButton];


    
    cell.tag = indexPath.row;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row selected is %d",indexPath.row);
    
    if (indexPath.row ==0)
    {
        PersonalDetailsViewController *person = [[PersonalDetailsViewController alloc]init];
        [self.navigationController pushViewController:person animated:NO];
    }
    else if (indexPath.row ==1)
    {
        AddressDetailViewController *address = [[AddressDetailViewController alloc]init];
        [self.navigationController pushViewController:address animated:NO];
    }
    else if (indexPath.row ==2)
    {
        ContactDetailsViewController *contacts = [[ContactDetailsViewController alloc]init];
        [self.navigationController pushViewController:contacts animated:NO];
    }
    else if (indexPath.row ==3)
    {
        GPDetailsViewController *gp = [[GPDetailsViewController alloc]init];
        [self.navigationController pushViewController:gp animated:NO];
    }
    else if (indexPath.row ==4)
    {
        EmergencyContactViewController *eg = [[EmergencyContactViewController alloc]init];
        [self.navigationController pushViewController:eg animated:NO];
    }
    else if (indexPath.row ==5)
    {
        EmergencyDetailsViewController *eg = [[EmergencyDetailsViewController alloc]init];
        [self.navigationController pushViewController:eg animated:NO];
        
    }
    else if (indexPath.row ==6)
    {
       
    }
    else if (indexPath.row ==7)
    {
        //AllergiesDetailsViewController *eg = [[AllergiesDetailsViewController alloc]init];
        //[self.navigationController pushViewController:eg animated:NO];
    }
    else if (indexPath.row ==8)
    {
        
    }
    else if (indexPath.row ==9)
    {
        
    }
}

#pragma mark myMediButtonFunction
-(void)myMediButtonFunction
{
    NSLog(@"myMediButtonFunction called");
    HomeScreenViewController *home = [[HomeScreenViewController alloc]init];
    [self.navigationController pushViewController:home animated:NO];
}

#pragma mark userImgaeFunction
-(void)changeImage:(UITapGestureRecognizer*)recognizer
{
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle: nil delegate: self cancelButtonTitle: @"Cancel" destructiveButtonTitle: nil otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    [actionSheet1 showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate  = self;
    picker.allowsEditing = YES;
    switch (buttonIndex) {
        case 0:
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                UIAlertView*  myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                            message:@"Device has no camera" delegate:nil
                                            cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [myAlertView show];
            }
            else
            {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:picker animated:YES completion:Nil];
            }
            
            break;
        case 1:
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:NULL];
        default:
            break;
    }
}

#pragma mark IMAGE PICKER DELEGATES

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path= [documentsDirectory stringByAppendingPathComponent:@"userprofile.png" ];  // IT IS THE PATH OF CHOOSEN IMAGE
    
    NSData *imageData= UIImagePNGRepresentation([info objectForKey:@"UIImagePickerControllerEditedImage"]);
    [imageData writeToFile:path atomically:YES];
    
    // STORING THE PATH OF IMAGE IN NSUserDefault
    
    [[NSUserDefaults standardUserDefaults]setObject:path forKey:@"userProfileImage"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    userImage.image  = [UIImage imageWithContentsOfFile:path];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





















