//
//  AddPersonViewController.h
//  Sample022_Delegation2
//
//  Created by Wilfred Mworia on 3/31/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@protocol AddPersonViewDelegate; //declare protocol

@interface AddPersonViewController : UIViewController {
	IBOutlet UITextField *firstField;
	IBOutlet UITextField *lastField;
	
	IBOutlet UIButton *addButton;
	
	IBOutlet UILabel *display;
	
	Person *person;
	
	id <AddPersonViewDelegate> delegate; //AddPersonViewDelegate instance variable
}

@property (nonatomic,retain) Person *person;
@property (nonatomic,assign) id <AddPersonViewDelegate> delegate;

- (IBAction)add:(id)sender;

@end



//protocol implementation
@protocol AddPersonViewDelegate <NSObject>

- (int)didAddNewPerson:(Person *)aperson;

@end