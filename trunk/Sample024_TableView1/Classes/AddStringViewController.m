//
//  AddStringViewController.m
//  Sample024_TableView1
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "AddStringViewController.h"


@implementation AddStringViewController

@synthesize delegate,text,buttonText,editingIndex,editingSection;

-(void)addString{
	
	if([self.buttonText isEqual:@"Add"]){
		[[self delegate] didAddNewString:strField.text forSection:segmentControl.selectedSegmentIndex];
	}
	else {
		[[self delegate] didEditStringatIndex:self.editingIndex toString:strField.text forSection:segmentControl.selectedSegmentIndex];
	}

		
	
	[self.navigationController popViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Add String";
		self.text = @"";
		strField.text = self.text;
		
		self.buttonText = @"Add";
		addButton.titleLabel.text = self.buttonText;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	strField.text = self.text;
	addButton.titleLabel.text = self.buttonText;
	segmentControl.selectedSegmentIndex = self.editingSection;
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
	[text release];
	[buttonText release];
	[delegate release];
    [super dealloc];
}


@end
