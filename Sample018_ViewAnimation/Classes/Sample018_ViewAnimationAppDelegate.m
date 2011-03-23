//
//  Sample018_ViewAnimationAppDelegate.m
//  Sample018_ViewAnimation
//
//  Created by Wilfred Mworia on 3/23/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample018_ViewAnimationAppDelegate.h"

@implementation Sample018_ViewAnimationAppDelegate

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



-(IBAction)animateView{
	//animation
	[UIView beginAnimations:@"slideViewAnimation" context:nil];
	[UIView setAnimationDuration:0.3];
	
	[UIView setAnimationDelegate:self];
	
	SEL animestart = @selector(animationWillStart:);
	
	[UIView setAnimationWillStartSelector:animestart];
	
	SEL animestop = @selector(animationDidStop:);
	
	[UIView setAnimationWillStartSelector:animestop];	
	
	CGRect slidingViewFrame = slidingView.frame;
	
	if (slidingViewFrame.origin.y == 215) {
		slidingViewFrame.origin.y = 65;
	}
	else {
		slidingViewFrame.origin.y = 215;
	}

	
	slidingView.frame = slidingViewFrame;
	
	[UIView commitAnimations];
}

- (void)animationWillStart{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Animation" message:@"Animation Will Start" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
}

- (void)animationDidStop{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Animation" message:@"Animation Stopped" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
