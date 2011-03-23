//
//  Sample010_StudentRegisterAppDelegate.h
//  Sample010_StudentRegister
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Subject.h"

@interface Sample010_StudentRegisterAppDelegate : NSObject <UIApplicationDelegate,UIAlertViewDelegate,UITextFieldDelegate> {
    UIWindow *window;
	
	IBOutlet UITextField *studentNameField;
	IBOutlet UITextField *cppMaksField;
	IBOutlet UITextField *csMarksField;
	IBOutlet UITextField *javaMarksField;
	IBOutlet UITextField *nameForReportCardField;
	
	IBOutlet UIButton *createStudentButton;
	IBOutlet UIButton *cppButton;
	IBOutlet UIButton *csButton;
	IBOutlet UIButton *javaButton;
	IBOutlet UIButton *reportCardButton;
	IBOutlet UIButton *registerButton;

	
	NSMutableDictionary *students;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)createStudent:(id)sender;
- (IBAction)addCpp:(id)sender;
- (IBAction)addCs:(id)sender;
- (IBAction)addJava:(id)sender;
- (IBAction)reportCard:(id)sender;
- (IBAction)classRegister:(id)sender;

- (void)removeKeyboard;

@end

