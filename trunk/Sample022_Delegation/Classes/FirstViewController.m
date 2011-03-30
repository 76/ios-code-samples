//
//  FirstViewController.m
//  Sample022_Delegation
//
//  Created by Wilfred Mworia on 3/30/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController

@synthesize sv;


- (IBAction)sendMessage:(id)sender{
	sv.msg = message.text;
	
	[self.navigationController pushViewController:sv animated:YES];
}

- (void)didSendMessage:(NSString *)amessage{
	display.text = amessage;
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Jimmy";
		
		self.sv = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:[NSBundle mainBundle]];
		
		self.sv.delegate = self;
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
	[sv release];
    [super dealloc];
}


@end
