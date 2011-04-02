//
//  FirstViewController.m
//  Sample022_Navigation
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "FirstViewController.h"



@implementation FirstViewController

@synthesize svc;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"First";
		
		
		self.svc = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:[NSBundle mainBundle]];
    }
    return self;
}


- (void)next{
	
	
	[self.navigationController pushViewController:self.svc animated:YES];
}

- (void)bookmark{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bookmark" message:@"Pressed bookmark on toolbar" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)compose{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Compose" message:@"Pressed compose on toolbar" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(next)];
	
	self.navigationItem.rightBarButtonItem = item;
	
	[item release];
	
	//toolbar
	
	UIBarButtonItem *bookmarkItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(bookmark)];
	
	UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	
	UIBarButtonItem *composeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(compose)];
	
	[self setToolbarItems:[NSArray arrayWithObjects:bookmarkItem,spaceBarItem,composeItem,nil]];
	
	[bookmarkItem release];
	
	[spaceBarItem release];
	
	[composeItem release];		

	
    [super viewDidLoad];
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
	[svc release];
    [super dealloc];
}


@end
