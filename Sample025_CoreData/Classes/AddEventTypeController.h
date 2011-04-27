//
//  AddEventTypeController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface AddEventTypeController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource> {
	Event *event;
	NSFetchedResultsController *fetchedResultsController;
	
	IBOutlet UIPickerView *typePicker;
	IBOutlet UITextField *typeField;
	
	NSArray *eventTypes;
}
@property (nonatomic,retain) Event *event;
@property (nonatomic,retain) NSFetchedResultsController *fetchedResultsController;

-(void)saveType;

@end