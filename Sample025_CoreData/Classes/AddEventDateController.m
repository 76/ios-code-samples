//
//  AddEventDateController.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "AddEventDateController.h"
#import "Sample025_CoreDataAppDelegate.h"

@implementation AddEventDateController

@synthesize event;

- (NSString *)stringFromDate:(NSDate *)date{
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
  [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  return [dateFormatter stringFromDate:date];
  [dateFormatter autorelease];
}

- (IBAction)datePickerValueChanged:(id)sender{

	dateField.text = [self stringFromDate:datePicker.date];
}

-(void)saveDate{
	self.event.eventDate = datePicker.date;
	
	Sample025_CoreDataAppDelegate *appdel = [[UIApplication sharedApplication] delegate];
	
	NSError *error = nil;
	if (![appdel.managedObjectContext save:&error]) {
		NSLog(@"Error: %@", [error description]);
	}
	
	[self.navigationController popViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Event Date";
	
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveDate)];
	self.navigationItem.rightBarButtonItem = item;
	[item release];
	
	dateField.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	self.navigationController.toolbarHidden = YES;
	
	dateField.text = [self stringFromDate:self.event.eventDate];
}


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
	[event release];
    [super dealloc];
}


@end
