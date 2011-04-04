//
//  Sample023_TabBarControllerAppDelegate.h
//  Sample023_TabBarController
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentViewController.h"
#import "LecturerViewController.h"

@interface Sample023_TabBarControllerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	UINavigationController *studentNav;
	
	UITabBarController *tabBarController;
	
	
	StudentViewController *sVC;
	LecturerViewController *lVC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *studentNav;
@property (nonatomic, retain) UITabBarController *tabBarController;

@property (nonatomic, retain) StudentViewController *sVC;
@property (nonatomic, retain) LecturerViewController *lVC;

@end

