//
//  Sample003AppDelegate.h
//  Sample003
//
//  Created by Wilfred Mworia on 3/9/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Person.h"

@interface Sample003AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	IBOutlet UIButton *makeBlankPerson;
	
	IBOutlet UIButton *makeNamedPerson;
	
	IBOutlet UITextField *nameField;
	
	IBOutlet UITextField *ageField;
	
	IBOutlet UILabel *nameLabel;
	
	IBOutlet UILabel *ageLabel;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)createBlankPerson:(id)sender;

- (IBAction)createNamedPerson:(id)sender;

@end

