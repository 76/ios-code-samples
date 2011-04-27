//
//  AddEventTypeController.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "AddEventTypeController.h"


@implementation AddEventTypeController

@synthesize event;
@synthesize fetchedResultsController;


-(void)saveType{
	self.event.eventType = [eventTypes objectAtIndex:[typePicker selectedRowInComponent:0]];;
	
	NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
	
	NSError *error = nil;
	if (![context save:&error]) {
		NSLog(@"Error: %@", [error description]);
	}
	
	[self.navigationController popViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Event Type";
		eventTypes = [[NSArray alloc] initWithObjects:@"Party",@"Launch",@"Other",nil];
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveType)];
	self.navigationItem.rightBarButtonItem = item;
	[item release];
	
	typeField.enabled = NO;
	typeField.text = self.event.eventType;
	
	self.navigationController.toolbarHidden = YES;
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

#pragma mark -
#pragma mark UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	return [eventTypes objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	typeField.text = [eventTypes objectAtIndex:row];
}

#pragma mark -
#pragma mark UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	return 3;
}

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
	[fetchedResultsController release];
	[eventTypes release];
    [super dealloc];
}


@end
