//
//  SecondViewController.m
//  Sample022_Navigation
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

-(void)rewind{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Rewind" message:@"Pressed rewind on toolbar" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

-(void)play{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Play" message:@"Pressed play on toolbar" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

-(void)forward{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Forward" message:@"Pressed forward on toolbar" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Second";
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//toolbar
	
	UIBarButtonItem *forwardItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(forward)];
	
	UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	
	UIBarButtonItem *playItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(play)];
	
	//UIBarButtonItem *spaceBarItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	
	UIBarButtonItem *rewindItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(rewind)];
	
	
	[self setToolbarItems:[NSArray arrayWithObjects:rewindItem,spaceBarItem,playItem,spaceBarItem,forwardItem,nil]];
	
	[rewindItem release];
	
	[spaceBarItem release];
	
	[playItem release];
	
	//[spaceBarItem2 release];
	
	[forwardItem release];
    
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
