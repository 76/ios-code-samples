//
//  AddEventNameController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface AddEventNameController : UIViewController <UITextFieldDelegate> {
	Event *event;
	NSFetchedResultsController *fetchedResultsController;
	
	IBOutlet UITextField *textField;
}

@property (nonatomic,retain) Event *event;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;



@end
