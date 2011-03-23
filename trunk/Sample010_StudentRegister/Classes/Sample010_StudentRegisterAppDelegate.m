//
//  Sample010_StudentRegisterAppDelegate.m
//  Sample010_StudentRegister
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample010_StudentRegisterAppDelegate.h"

@implementation Sample010_StudentRegisterAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
	
	students = [[NSMutableDictionary alloc] init];
    
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

- (IBAction)createStudent:(id)sender{
	Student *student = [[Student alloc] initWithName:studentNameField.text];
	
	[students setObject:student forKey:studentNameField.text];
	
	[student release];
	
	[self removeKeyboard];
}

- (IBAction)addCpp:(id)sender{
	Student *student = [students objectForKey:nameForReportCardField.text];
	
	Subject *subject = [[Subject alloc] initWithName:@"C++" andMarks:[cppMaksField.text doubleValue]];
	
	[student addSubject:subject];
	
	[subject release];
	
	[self removeKeyboard];
}

- (IBAction)addCs:(id)sender{
	Student *student = [students objectForKey:nameForReportCardField.text];
	
	Subject *subject = [[Subject alloc] initWithName:@"C#" andMarks:[csMarksField.text doubleValue]];
	
	[student addSubject:subject];
	
	[subject release];
	
	[self removeKeyboard];
}

- (IBAction)addJava:(id)sender{
	Student *student = [students objectForKey:nameForReportCardField.text];
	
	Subject *subject = [[Subject alloc] initWithName:@"Java" andMarks:[javaMarksField.text doubleValue]];
	
	[student addSubject:subject];
	
	[subject release];	
	
	[self removeKeyboard];
}

- (IBAction)reportCard:(id)sender{
	Student *student = [students objectForKey:nameForReportCardField.text];
	
	NSEnumerator *subjectsenum = [[student getSubjects] objectEnumerator];
	
	Subject *subject;
	
	NSString *report = [NSString stringWithFormat:@"NAME: %@ \n", [student getName]];
	
	while (subject = [subjectsenum nextObject]) {
		report = [report stringByAppendingFormat:@"%@\t%f\n", [subject getName], [subject getMarks]];
	}
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"REPORT CARD" message:report delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
	
	[subject release];
}

- (IBAction)classRegister:(id)sender{
	/*
	NSEnumerator *stdenum = [accounts objectEnumerator];
	
	Student *student;
	
	NSString *stds = @"NAME";
	
	while (student = [stdenum nextObject]) {
		stds = [accountsRegister stringByAppendingFormat:@"%@\t%f\n", [account getName], [account getBalance]];
	}
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Students" message:accountsRegister delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
	*/
}

- (void)removeKeyboard{
	[studentNameField resignFirstResponder];
	[cppMaksField resignFirstResponder];
	[csMarksField resignFirstResponder];
	[javaMarksField resignFirstResponder];
	[nameForReportCardField resignFirstResponder];
	
}

//text field delegate metods

- (void)textFieldDidEndEditing:(UITextField *)textField{
	[textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return TRUE;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
