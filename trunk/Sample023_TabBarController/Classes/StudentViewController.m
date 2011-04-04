//
//  StudentViewController.m
//  Sample023_TabBarController
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "StudentViewController.h"


@implementation StudentViewController

@synthesize students,addStudentViewController;

- (IBAction)viewStudents{
	NSEnumerator *e = [self.students objectEnumerator];
	
	Student *s = nil;
	
	NSString *msg = @"NAME\n";
	
	while (s = [e nextObject]) {
		msg = [msg stringByAppendingFormat:@"%@\n", s.name];
	}
	
	displayView.text = msg;	
}


- (void)addStudents{
	[self.navigationController pushViewController:self.addStudentViewController animated:YES];
}

- (void) didAddStudent:(Student *)astudent{
	[astudent retain];
	
	[students addObject:astudent];
	
	[astudent release];

}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Students";
		
		self.addStudentViewController = [[AddStudentViewController alloc] initWithNibName:@"AddStudentView" bundle:[NSBundle mainBundle]];
		
		self.addStudentViewController.delegate = self;
		
		self.students = [[NSMutableArray alloc] init];
		
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"Students" image:[UIImage imageNamed:@"gear.png"] tag:0];
						  
	self.tabBarItem = item;
	
	[item release];
	
	//
	UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addStudents)];
	self.navigationItem.rightBarButtonItem = barItem;
	[barItem release];
						  
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
	displayLabel.text = [NSString stringWithFormat:@"%i", [students count]];
	
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
	[addStudentViewController release];
	[students release];
    [super dealloc];
}


@end
