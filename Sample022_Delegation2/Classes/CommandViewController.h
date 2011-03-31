//
//  CommandViewController.h
//  Sample022_Delegation2
//
//  Created by Wilfred Mworia on 3/31/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPersonViewController.h"


@interface CommandViewController : UIViewController <AddPersonViewDelegate> {
	IBOutlet UIButton *addButton;
	IBOutlet UIButton *viewButton;
	
	AddPersonViewController *addPersonViewController;
	
	NSMutableArray *arrayOfPersons;
}

@property (nonatomic,retain) AddPersonViewController *addPersonViewController;

@property (nonatomic, retain) NSMutableArray *arrayOfPersons;

- (IBAction)add:(id)sender;
- (IBAction)show:(id)sender;

@end
