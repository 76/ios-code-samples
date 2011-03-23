//
//  Sample005_SelectorsAppDelegate.m
//  Sample005_Selectors
//
//  Created by Wilfred Mworia on 3/14/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample005_SelectorsAppDelegate.h"

@implementation Sample005_SelectorsAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
	
	
	Test *test = [[Test alloc] init]; //allocate and initialize a 'Test' object
	
	//declare a selector
	SEL sel = @selector(testSelector2);//sel is like a function pointer to - (void)testSelector2;
	
	SEL sel2 = @selector(testSelector:);//sel is like a function pointer to - (void)testSelector:(int)arg;
	
	SEL sel3 = @selector(testSelector3:arg2:);//sel is like a function pointer to - (void)testSelector3:(int)arg arg2:(int)arg2;
	
	SEL sel4 = @selector(testSelector4);//sel is like a function pointer to - (void)testSelector3:(int)arg arg2:(int)arg2;
	
	
	
	if ([test respondsToSelector:sel]) {
		NSLog(@"it responds to - (void)testSelector2;");
		
		[test performSelector:sel];
	}
	else {
		NSLog(@"it does not respond - (void)testSelector2;");
	}
	
	//
	
	if ([test respondsToSelector:sel2]) {
		NSLog(@"it responds - (void)testSelector:(int)arg;");
		
		[test performSelector:sel2 withObject:1];
	}
	else {
		NSLog(@"it does not respond - (void)testSelector:(int)arg;");
	}
	
	//
	
	if ([test respondsToSelector:sel3]) {
		NSLog(@"it responds - (void)testSelector3:(int)arg arg2:(int)arg2;");
	}
	else {
		NSLog(@"it does not respond - (void)testSelector3:(int)arg arg2:(int)arg2;");
	}
	
	//
	
	if ([test respondsToSelector:sel4]) {
		NSLog(@"it responds - (void)testSelector4;");
	}
	else {
		NSLog(@"it does not respond - (void)testSelector4; does not exist");
	}		
	


	[test release]; //get rid of memory
    
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
    [window release];
    [super dealloc];
}


@end
