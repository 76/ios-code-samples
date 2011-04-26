//
//  RootViewController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/21/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class EventDetailViewController;

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {

@private
    NSFetchedResultsController *fetchedResultsController_;
    NSManagedObjectContext *managedObjectContext_;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
