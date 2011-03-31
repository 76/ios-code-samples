//
//  CommandViewController.m
//  Sample022_Delegation2
//
//  Created by Wilfred Mworia on 3/31/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "CommandViewController.h"


@implementation CommandViewController

@synthesize addPersonViewController, arrayOfPersons;

- (int)didAddNewPerson:(Person *)aperson{ //implementation of AddPersonViewDelegate metod
	
	[aperson retain];
	
	[self.arrayOfPersons addObject:aperson];
	
	[aperson release];
	
	return [self.arrayOfPersons count];
}

- (IBAction)add:(id)sender{
	[self.navigationController pushViewController:self.addPersonViewController animated:YES];
}

- (IBAction)show:(id)sender{
	
	NSEnumerator *e = [self.arrayOfPersons objectEnumerator];
	
	Person *p = nil;
	
	NSString *msg = @"FIRST\tLAST\n";
	
	while (p = [e nextObject]) {
		msg = [msg stringByAppendingFormat:@"%@\t%@\n", p.first, p.last];
	}
	
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Noisemakers" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];

}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Command Screen";
		
		self.addPersonViewController = [[AddPersonViewController alloc] initWithNibName:@"AddPersonView" bundle:[NSBundle mainBundle]];
		self.addPersonViewController.delegate = self; //set myself as delegate of AddPersonViewController object
		
		self.arrayOfPersons = [[NSMutableArray alloc] init];
		
    }
    return self;
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
	[addPersonViewController release];
	[arrayOfPersons release];
    [super dealloc];
}


@end
