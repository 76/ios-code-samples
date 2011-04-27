//
//  SelectEventAttendeesController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@class Member;

@interface SelectEventAttendeesController : UITableViewController <NSFetchedResultsControllerDelegate> {
	Event *event;

	
@private
    NSFetchedResultsController *fetchedResultsController_;
    NSManagedObjectContext *managedObjectContext_;
}
@property (nonatomic, retain) Event *event;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)saveMembers;
@end
