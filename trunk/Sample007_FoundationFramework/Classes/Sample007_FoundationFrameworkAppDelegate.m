//
//  Sample007_FoundationFrameworkAppDelegate.m
//  Sample007_FoundationFramework
//
//  Created by Wilfred Mworia on 3/15/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample007_FoundationFrameworkAppDelegate.h"

@implementation Sample007_FoundationFrameworkAppDelegate

@synthesize window;

- (void)testNSString{
	NSLog(@"***Testing NSString***");
	
	NSString *aString = @"I am a ";
	
	NSString *sentence = [aString stringByAppendingString:@"String"];
	
	NSLog(@"%@",sentence);
	
	sentence = [aString stringByAppendingFormat:@"%i nd String", 2];
	
	NSLog(@"%@",sentence);	
}

- (void)testNSArray{
	NSLog(@"***Testing NSArray***");
	
	Person *p1 = [[Person alloc] initWithName:[NSString stringWithFormat:@"Person %i", 1] andAge:1];
	Person *p2 = [[Person alloc] initWithName:[NSString stringWithFormat:@"Person %i", 2] andAge:2];
	Person *p3 = [[Person alloc] initWithName:[NSString stringWithFormat:@"Person %i", 3] andAge:3];
	
	NSArray *array = [NSArray arrayWithObjects:p1, p2, p3, nil];
	
	for(Person *p in array)
	{
		NSLog(@"%@", [p description]);
	}
	
	NSLog(@"array count: %i", [array count]);
	
	NSLog(@"Object p2 is at index: %u", [array indexOfObject:p2]);
	
	Person *p4 = (Person *)[array objectAtIndex:2];
	
	NSLog(@"%@", [p4 description]);
	
	[p1 release];
	[p2 release];
	[p3 release];
	[p4 release];
}

- (void)testNSMutableArray{
	NSLog(@"***Testing NSMutableArray***");
	
	int a = 20;
	
	NSMutableArray *array = [NSMutableArray array];
	
	for (int i = 0; i < 5; i++) {
		a += i;
		
		Person *p = [[Person alloc] initWithName:[NSString stringWithFormat:@"Person %i", i] andAge:a];
		
		[array addObject:p];
		
		[p release];
		
	}
	
	for(Person *p in array)
	{
		NSLog(@"%@", [p description]);
	}
}

- (void)testEnumerator{
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"Peter", @"Name 1", 
						  @"Carol", @"Name 2", @"Angela", @"Name 3", nil];
	
	NSEnumerator *enumerator = [dict objectEnumerator];
	
	NSString *name;
	
	while (name = [enumerator nextObject]) {
		NSLog(@"%@",name);
	}

}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
	
	//[self testNSString];
	//[self testNSArray];
	//[self testNSMutableArray];
	[self testEnumerator];
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
