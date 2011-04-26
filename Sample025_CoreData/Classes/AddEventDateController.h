//
//  AddEventDateController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface AddEventDateController : UIViewController<UIPickerViewDelegate> {
	Event *event;
	NSFetchedResultsController *fetchedResultsController;
	
	IBOutlet UITextField *dateField;
	IBOutlet UIDatePicker *datePicker;
}

@property (nonatomic,retain) Event *event;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

- (void)saveDate;
- (IBAction)datePickerValueChanged:(id)sender;
- (NSString *)stringFromDate:(NSDate *)date;

@end
