//
//  StudentViewController.h
//  Sample023_TabBarController
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddStudentViewController.h"
#import "Student.h"


@interface StudentViewController : UIViewController <AddStudentViewDelegate> {
	IBOutlet UIButton *viewButton;
	
	IBOutlet UILabel *displayLabel;
	
	IBOutlet UITextView *displayView;
	
	NSMutableArray *students;
	
	AddStudentViewController *addStudentViewController;
}

@property (nonatomic,retain) NSMutableArray *students;
@property (nonatomic,retain) AddStudentViewController *addStudentViewController;

- (void)addStudents;
- (IBAction)viewStudents;

@end
