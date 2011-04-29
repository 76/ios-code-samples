//
//  RootViewController.h
//  PlistStudents
//
//  Created by ignitemobile on 14/04/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddStudentViewController.h"

@interface RootViewController : UITableViewController {
	NSMutableDictionary *students;
}

- (void)showAddStudentView;

@end
