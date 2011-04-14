//
//  AddStudentViewController.m
//  PlistStudents
//
//  Created by ignitemobile on 14/04/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddStudentViewController.h"


@implementation AddStudentViewController

- (void)showNumberOfEntries:(int)number{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Number of Students" 
													message:[NSString stringWithFormat:@"There are %i entries in the plist",number] 
													delegate:self 
													cancelButtonTitle:@"OK" 
													otherButtonTitles:nil];
	[alert show];
	[alert release];
}

-(IBAction)addStudent{
	//get path to document directory
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsPath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
	/*
	if([paths count] > 0)
		documentsPath = [paths objectAtIndex:0];
	else {
		documentsPath = nil;
	}
	 */
	if (documentsPath != nil) {//documents path found
		
		//create path to students.plist
		NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"students.plist"];
		
		//create the dictionary or get it from the path
		NSMutableDictionary *studentsDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
		
		if (studentsDict == nil) {//we don't have a students.plist so create a new dictionary
			studentsDict = [NSMutableDictionary dictionary];
		}
		
		[studentsDict setValue:studentAge.text forKey:studentName.text];
		
		//write out the file
		[studentsDict writeToFile:plistPath atomically:YES];
		[self showNumberOfEntries:[studentsDict count]];
		
		
	}else{ //documents path not found
		
		NSLog(@"%@", @"Failed to find documents path");
	}

	
	
	
	
	//[self.navigationController popViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Add Student";
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
    [super dealloc];
}


@end
