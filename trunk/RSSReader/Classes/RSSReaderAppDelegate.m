//
//  RSSReaderAppDelegate.m
//  RSSReader
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "RSSReaderAppDelegate.h"
#import "RootViewController.h"
#import "SettingsViewController.h"

@implementation RSSReaderAppDelegate

@synthesize window;
@synthesize navigationController,settingsNavController;
@synthesize tabBarC;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    // Add the navigation controller's view to the window and display.
	self.tabBarC = [[UITabBarController alloc] init];
	
	self.settingsNavController = [[UINavigationController alloc] init];
	
	SettingsViewController *s = [[SettingsViewController alloc] init];
	s.title = @"Settings";
	UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"Settings" image:nil tag:0];
	s.tabBarItem = tab;
	[tab release];
	
	[self.settingsNavController pushViewController:s animated:NO];
	
	NSArray *viewControllers = [NSArray arrayWithObjects:navigationController,self.settingsNavController,nil];
	
	self.tabBarC.viewControllers = viewControllers;
	
	[s release];
	
	
    [self.window addSubview:tabBarC.view];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[settingsNavController release];
	[tabBarC release];
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

