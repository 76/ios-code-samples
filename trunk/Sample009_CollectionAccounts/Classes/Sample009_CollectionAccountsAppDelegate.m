//
//  Sample009_CollectionAccountsAppDelegate.m
//  Sample009_CollectionAccounts
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample009_CollectionAccountsAppDelegate.h"

@implementation Sample009_CollectionAccountsAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
	
	nameField.delegate = self;
	openBalanceField.delegate = self;
	depositField.delegate = self;
	withdrawField.delegate = self;	
	
	accounts = [[NSMutableDictionary alloc] init]; //initialize
    
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

- (IBAction)openAccount:(id)sender{
	NSString *acname = nameField.text;
	
	double openbal = [openBalanceField.text doubleValue];
	
	Account *account = [[Account alloc] initWithName:acname andBalance:openbal];
	
	[accounts setObject:account forKey:acname];
	
	[account release];
	
	[self printBalance];
}

- (IBAction)depositAmount:(id)sender{
	
	Account *account = [accounts objectForKey:transactionNameField.text];
	
	double amount = [depositField.text doubleValue];
	
	[account deposit:amount];
	
	[self printBalance];
}

- (IBAction)withdrawAmount:(id)sender{
	Account *account = [accounts objectForKey:transactionNameField.text];
	
	double amount = [withdrawField.text doubleValue];
	
	[account withdraw:amount];
	
	[self printBalance];
}

- (IBAction)showStatement:(id)sender{
	
	Account *account = [accounts objectForKey:transactionNameField.text];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Statement" message:[account statement] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	
	[alert show];
	 
	[alert release];
}

- (IBAction)showAccountsRegister:(id)sender{
	NSEnumerator *enumerator = [accounts objectEnumerator];
	
	Account *account;
	
	NSString *accountsRegister = @"NAME\tBALANCE\n";
	
	while (account = [enumerator nextObject]) {
		accountsRegister = [accountsRegister stringByAppendingFormat:@"%@\t%f\n", [account getName], [account getBalance]];
	}
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Register" message:accountsRegister delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];	
}


- (void)printBalance{
	Account *account = [accounts objectForKey:transactionNameField.text];
	
	balanceLabel.text = [NSString stringWithFormat:@"%f", [account getBalance]];
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
	[accounts release];
    [super dealloc];
}


@end
