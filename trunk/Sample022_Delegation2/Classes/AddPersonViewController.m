//
//  AddPersonViewController.m
//  Sample022_Delegation2
//
//  Created by Wilfred Mworia on 3/31/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "AddPersonViewController.h"


@implementation AddPersonViewController

@synthesize person;
@synthesize delegate;

- (IBAction)add:(id)sender{
	self.person = [[Person alloc] init];
	
	self.person.first = firstField.text;
	self.person.last = lastField.text;
	
	int n = [[self delegate] didAddNewPerson:self.person]; //call delegate metod
	
	display.text = [NSString stringWithFormat:@"Number of persons so far: %i", n];
	
	[self.navigationController popViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Add Person";
		
		//self.person = [[Person alloc] init];
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[super viewDidLoad];
}
*/

-(void)viewWillAppear:(BOOL)animated{
	firstField.text = @"";
	lastField.text = @"";
	
	[super viewWillAppear:animated];
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
	[person release];
    [super dealloc];
}


@end
