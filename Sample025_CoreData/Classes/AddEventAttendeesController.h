//
//  AddEventAttendeesController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@class Member;
@class SelectEventAttendeesController;

@interface AddEventAttendeesController : UITableViewController <NSFetchedResultsControllerDelegate> {
	Event *event;
	
	NSArray *members;
	
@private
    NSManagedObjectContext *managedObjectContext_;
}
@property (nonatomic, retain) Event *event;

@property (nonatomic, retain) NSArray *members;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (void)editMembers;

@end