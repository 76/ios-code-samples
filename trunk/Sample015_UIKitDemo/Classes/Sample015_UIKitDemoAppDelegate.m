//
//  Sample015_UIKitDemoAppDelegate.m
//  Sample015_UIKitDemo
//
//  Created by Wilfred Mworia on 3/22/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample015_UIKitDemoAppDelegate.h"

@implementation Sample015_UIKitDemoAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
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
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Memory Warning" message:@"Bye! Bye!" delegate:self cancelButtonTitle:@"It's Ok, Sniff :'-(" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
}

-(IBAction)toggleStatusBarStyle{
	UIApplication *app = [UIApplication sharedApplication];
	
	if (app.statusBarStyle == UIStatusBarStyleDefault) {
		
		
		app.statusBarStyle = UIStatusBarStyleBlackOpaque;
	}
	else {
		app.statusBarStyle = UIStatusBarStyleDefault;
	}

}


-(IBAction)eventTest:(id)sender withEvent:(UIEvent *)event{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Event" message:@"Sasa" delegate:self cancelButtonTitle:@"Bye!" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
}


-(IBAction)superViewTest{
	superViewTestButton.backgroundColor = [UIColor greenColor];
	
	superViewTestButton.superview.backgroundColor = [UIColor blueColor];
	
	NSLog(@"Number of Window subviews: %i", [self.window.subviews count]);
	
	
	[superViewTestButton removeFromSuperview];
	
	CGRect rect = CGRectMake(30.0, 140.0, 200.0, 30.0);
	
	UILabel *label = [[UILabel alloc] initWithFrame:rect];
	
	label.text = @"Subview Added";
	
	NSLog(@"Frame: x:%f, y:%f, w:%f, h:%f", label.frame.origin.x, label.frame.origin.y, label.frame.size.width, label.frame.size.height);
	
	[self.window addSubview:label];
	
	[label release];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
