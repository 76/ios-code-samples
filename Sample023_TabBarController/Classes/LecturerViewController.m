//
//  LecturerViewController.m
//  Sample023_TabBarController
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "LecturerViewController.h"


@implementation LecturerViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Lecturers";
		
		UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"Lecturers" image:[UIImage imageNamed:@"gear2.png"] tag:1];
		
		self.tabBarItem = item;
		
		[item release];
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	

	
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
    [super dealloc];
}


@end
