//
//  Sample021_UserDefaultsViewController.m
//  Sample021_UserDefaults
//
//  Created by Wilfred Mworia on 3/25/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Sample021_UserDefaultsViewController.h"

@implementation Sample021_UserDefaultsViewController




// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = @"User Prefs";
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"viewDidLoad" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
	
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"viewWillAppear" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
	
	[self loadSettings]; //load state
	
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"viewDidAppear" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[alert show];
	
	[alert release];
	
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[self saveSettings]; //save state
	
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	

	[super viewDidDisappear:animated];
}

- (IBAction)sliderSlid
{
	float val = slider.value;
	
	label.text = [NSString stringWithFormat:@"%f", val];
}

- (void)loadSettings
{

	float val = [[NSUserDefaults standardUserDefaults] floatForKey:@"brightness"]; //slider value
	
	int selectedSegment = [[NSUserDefaults standardUserDefaults] integerForKey:@"color"]; //segment index
	
	BOOL isOn = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch"];
	
	//set
	
	slider.value = val;
	
	color.selectedSegmentIndex = selectedSegment;
	
	onoff.on = isOn;
	
}

- (void)saveSettings
{
	float val = slider.value; //slider value
	
	int selectedSegment = color.selectedSegmentIndex; //segment index
	
	BOOL isOn = onoff.on;
	
	//save to default user prefences
	
	[[NSUserDefaults standardUserDefaults] setFloat:val forKey:@"brightness"];
	
	[[NSUserDefaults standardUserDefaults] setInteger:selectedSegment forKey:@"color"];
	
	[[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"switch"];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return YES;
    //return (interfaceOrientation == UIInterfaceOrientationPortrait );
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
