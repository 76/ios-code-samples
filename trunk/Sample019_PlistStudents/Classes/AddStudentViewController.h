//
//  AddStudentViewController.h
//  PlistStudents
//
//  Created by ignitemobile on 14/04/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddStudentViewController : UIViewController {
	IBOutlet UITextField *studentName;
	IBOutlet UITextField *studentAge;
	IBOutlet UIButton *addButton;
}

-(IBAction)addStudent;
- (void)showNumberOfEntries:(int)number;

@end
