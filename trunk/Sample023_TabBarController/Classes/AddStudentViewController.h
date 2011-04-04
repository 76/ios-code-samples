//
//  AddStudentViewController.h
//  Sample023_TabBarController
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@protocol AddStudentViewDelegate;

@interface AddStudentViewController : UIViewController {
	IBOutlet UIButton *addButton;
	IBOutlet UITextField *nameField;
	
	id <AddStudentViewDelegate> delegate;
}

@property (nonatomic,assign) id <AddStudentViewDelegate> delegate;

- (IBAction)addStudent;

@end


@protocol AddStudentViewDelegate <NSObject>

- (void) didAddStudent:(Student *)astudent;

@end

