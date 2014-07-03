//
//  ApplifyAppDelegate.m
//  MyMediApp
//
//  Created by Guest User on 09/06/14.
//  Copyright (c) 2014 Applify. All rights reserved.
//

#import "ApplifyAppDelegate.h"

@implementation ApplifyAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
        
    {
        [application setStatusBarStyle:UIStatusBarStyleLightContent];
        
       [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        
        
       // [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"FirstTimeUser"];
        //[[NSUserDefaults standardUserDefaults]synchronize];
        
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
        view.backgroundColor=[UIColor colorWithRed:18/256.0 green:124/256.0 blue:196/256.0 alpha:1.0];
        [self.window.rootViewController.view addSubview:view];

        
       
        self.window.clipsToBounds =YES;
//        
//       // [[UINavigationBar appearance]setBackgroundColor:[UIColor redColor]];
//        [[UINavigationBar appearance] setBarTintColor:[UIColor   redColor]];
//        // [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x067AB5)];
//        // [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
//        
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//        
//        //[[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
//        
//        self.window.frame =  CGRectMake(0,20,self.window.frame.size.width,self.window.frame.size.height-20);
//        
//        
//        
//        //Added on 19th Sep 2013
//        
//        self.window.bounds = CGRectMake(0, 20, self.window.frame.size.width,   self.window.frame.size.height);
        
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    
    NSString* newToken = [deviceToken description];
    
    newToken = [newToken stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    
    newToken = [newToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if(![[NSUserDefaults standardUserDefaults] objectForKey:@"device_token"])
        
    {
        
        [[NSUserDefaults standardUserDefaults] setValue:newToken forKey:@"device_token"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
    
    //  UIAlertView *token=[[UIAlertView alloc]initWithTitle:@"token" message:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"device_token"]]  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    
    
    // [token show];
    
}

@end
