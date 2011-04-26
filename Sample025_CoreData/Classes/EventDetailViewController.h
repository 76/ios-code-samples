//
//  EventDetailViewController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"


@class AddEventNameController;
@class AddEventDateController;
@class AddEventTypeController;
@class Venue;
@class AddEventVenueController;

@interface EventDetailViewController : UITableViewController {
	Event *event;
	NSFetchedResultsController *fetchedResultsController;
}

@property (nonatomic,retain) Event *event;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

-(void)saveEvent;

@end
