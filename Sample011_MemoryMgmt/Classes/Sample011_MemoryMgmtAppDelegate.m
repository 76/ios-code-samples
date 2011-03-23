//
//  Sample011_MemoryMgmtAppDelegate.m
//  Sample011_MemoryMgmt
//
//  Created by Wilfred Mworia on 3/17/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample011_MemoryMgmtAppDelegate.h"

@implementation Sample011_MemoryMgmtAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
	/*
	Person *s = [[Person alloc] init]; //retain count 1 //local scope
	
	NSLog(@"Retain Count is: %U", [s retainCount]); //print 1
	
	[s retain]; //retain count +1
	
	
	NSLog(@"Retain Count is: %U", [s retainCount]); //print 2
	
	[s release]; //retain count -1
	
	NSLog(@"Retain Count is: %U", [s retainCount]); //print 1
	
	[s release]; //-1
	 
	//[s release]; //cras
	//NSLog(@"Retain Count is: %U", [s retainCount]); //prints ?
	
	//[s x]; //cras
	
	
	//class scope
	p = [[Person alloc] init]; //retain count 1
	
	[p x];
	
	NSLog(@"test");
	
	[self test];
	
	[p release];
	*/
	
	Person *person = [[Person alloc] init];
	
	
	NSString *string = [[person getName] retain];
	
	NSLog(@"%@",[person getName]);
	
	[string release];
	
	
	[person release];
	
    
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


-(void)test{
	
	[p x];
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
	
	[p release];
	
    [super dealloc];
}


@end
