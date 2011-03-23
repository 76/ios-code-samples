//
//  Sample006_ShapeAppDelegate.h
//  Sample006_Shape
//
//  Created by Wilfred Mworia on 3/14/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shape.h"

@interface Sample006_ShapeAppDelegate : NSObject <UIApplicationDelegate,UIAlertViewDelegate> {
    UIWindow *window;
	
	IBOutlet UIButton *createButton;
	
	IBOutlet UITextField *nameField;
	
	IBOutlet UITextField *sidesField;
	
	IBOutlet UITextView *display;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)clickButtonEvent:(id)sender;

@end

