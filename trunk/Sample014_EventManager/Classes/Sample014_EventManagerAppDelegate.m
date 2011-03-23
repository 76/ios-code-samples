//
//  Sample014_EventManagerAppDelegate.m
//  Sample014_EventManager
//
//  Created by Wilfred Mworia on 3/18/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample014_EventManagerAppDelegate.h"

@implementation Sample014_EventManagerAppDelegate

@synthesize window,eventTypePicker,eventDatePicker,display;
@synthesize eventType,eventTypes,eventDate,events;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
	
	eventTypes = [[NSMutableArray alloc] initWithObjects:@"Party", @"Seminar", @"Launch", nil];
	events = [[NSMutableDictionary alloc] init];
	
	self.eventTypePicker.hidden = YES;
	self.eventDatePicker.hidden = YES;
	self.display.hidden = YES;
	self.display.editable = NO;
	
	eventType = @"Party";
	typeField.text = eventType;
	
	
	eventDate = eventDatePicker.date;
	
	dateField.text = [self formatDate:eventDate];	
	
	display.backgroundColor = window.backgroundColor;
    
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


//picker

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	
	return [eventTypes count];
}


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [eventTypes objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	
	//NSLog(@"Selected Event Type: %@. Index of selected color: %i", [eventTypes objectAtIndex:row], row);
	
	eventType = [eventTypes objectAtIndex:row];
	typeField.text = eventType;
	
	//NSLog(@"'eventType': %@.", [eventTypes objectAtIndex:row]);
}


//

-(IBAction)addGuest{
	Event *event = [events objectForKey:eventNameForGuestField.text];
	
	if(event)
	{
		Guest *guest = [[Guest alloc] init];
		guest.name = guestNameField.text;
		
		[event addGuest:guest];
		
		//[event.guests addObject:guest];
		
		[guest release];
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Guest was added successfully" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		
		[alert show];
		
		[alert release];
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Event does not exist" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		
		[alert show];
		
		[alert release];
	}
	

}

-(IBAction)createEvent{
	Event *event = [[Event alloc] init];
	
	[event setType:eventType];
	[event setDate:eventDate];
	[event setName:eventNameField.text];
	[event setVenue:venueField.text];
	
	[events setObject:event forKey:eventNameField.text];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Event was created successfully" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
	
	[event release];
}

-(IBAction)toggleEventTypePicker{
	[self hideKeyboard];
	self.eventTypePicker.hidden = NO;
	self.eventDatePicker.hidden = YES;
	self.display.hidden = YES;
}

-(IBAction)toggleDatePicker{
	[self hideKeyboard];
	self.eventTypePicker.hidden = YES;
	self.eventDatePicker.hidden = NO;
	self.display.hidden = YES;
}

-(void)toggleDisplay{
	[self hideKeyboard];
	self.eventTypePicker.hidden = YES;
	self.eventDatePicker.hidden = YES;
	self.display.hidden = NO;
}

-(IBAction)hideKeyboard{
	[eventNameField resignFirstResponder];
	[venueField resignFirstResponder];
	[typeField resignFirstResponder];
	[dateField resignFirstResponder];
	[eventNameForGuestField resignFirstResponder];
	[guestNameField resignFirstResponder];
}

-(IBAction)displayEventList{
	//name,venue,type,time
	
	NSEnumerator *enumerator = [events objectEnumerator];
	
	Event *event;
	
	NSString *eventRegister = @"NAME\tTYPE\tVENUE\tTIME\n";
	
	while (event = [enumerator nextObject]) {
		eventRegister = [eventRegister stringByAppendingFormat:@"%@\t%@\t%@\t%@\n", 
						 event.name, event.type, event.venue, [self formatDate:event.date]];
	}
	
	display.text = eventRegister;
	
	[self toggleDisplay];
}

-(IBAction)displayGuestList{


	Event *event = [events objectForKey:eventNameForGuestField.text];
	
	if(event)
	{
		Guest *guest;
		
		NSString *guestRegister = [NSString stringWithFormat:@"Guests for event:\n", eventNameForGuestField.text];
		
		NSEnumerator *enumerator = [event.guests objectEnumerator];
		
		while (guest = [enumerator nextObject]) {
			guestRegister = [guestRegister stringByAppendingFormat:@"\t%@\n", guest.name];
		}
		
		display.text = guestRegister;
		
		[self toggleDisplay];
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Event does not exist" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		
		[alert show];
		
		[alert release];
	}
	
	
	
}

-(IBAction)datePickerValueChanged:(id)sender{
	
	eventDate = eventDatePicker.date;
	
	dateField.text = [self formatDate:eventDate];
	
}


-(NSString *)formatDate:(NSDate *)date{
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	
	dateFormatter.dateStyle = NSDateFormatterLongStyle;
	
	return [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:eventDatePicker.date]];
}

//textfielddelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	
	[eventType release];
	[eventTypes release];
	[eventDate release];
	[events release];
	
	[eventTypePicker release];
	[eventDatePicker release];
	[createEventButton release];
	[addGuestButton release];
	[displayGuestsButton release];
	[displayEventsButton release];
	[showEventTypePicker release];
	[showDatePicker release];
	[eventNameField release];
	[venueField release];
	[typeField release];
	[dateField release];
	[eventNameForGuestField release];
	[guestNameField release];
	[display release];
    [window release];
	
	
    [super dealloc];
}


@end
