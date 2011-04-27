//
//  MemberDetailViewController.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "MemberDetailViewController.h"


@implementation MemberDetailViewController

@synthesize member;
@synthesize fetchedResultsController;

-(void)saveMember{
	self.member.firstName = firstNameField.text;
	self.member.lastName = lastNameField.text;
	
	NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
	
	// Save the context.
	NSError *error = nil;
	if (![context save:&error]) {
		
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	
	[firstNameField resignFirstResponder];
	[lastNameField resignFirstResponder];
	
	[self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark textField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)txtField{
	
	[txtField resignFirstResponder];
	
	return YES;
}

#pragma mark -
#pragma mark view stuff

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

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	firstNameField.text = self.member.firstName;
	lastNameField.text = self.member.lastName;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveMember)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
	
	self.title = @"Member";
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
    [member release];
	[fetchedResultsController release];
	[super dealloc];
}


@end
