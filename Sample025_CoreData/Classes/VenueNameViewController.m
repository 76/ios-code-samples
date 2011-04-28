//
//  VenueNameViewController.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "VenueNameViewController.h"
#import "Sample025_CoreDataAppDelegate.h"

@implementation VenueNameViewController

@synthesize venue;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Venue Name";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	nameField.text = self.venue.venueName;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[venue release];
    [super dealloc];
}

#pragma mark -
#pragma mark textField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)txtField{
	
	self.venue.venueName = nameField.text;
	
	Sample025_CoreDataAppDelegate *appdel = [[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *context = appdel.managedObjectContext;
	
	// Save the context.
	NSError *error = nil;
	if (![context save:&error]) {
		
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	
	[nameField resignFirstResponder];
	
	[self.navigationController popViewControllerAnimated:YES];
	
	return YES;
}

@end
