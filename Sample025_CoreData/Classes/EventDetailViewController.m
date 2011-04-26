//
//  EventDetailViewController.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "EventDetailViewController.h"
#import "AddEventNameController.h"
#import "AddEventDateController.h"
#import "AddEventTypeController.h"
#import "Venue.h"
#import "AddEventVenueController.h"

@implementation EventDetailViewController

@synthesize event;
@synthesize fetchedResultsController;

#pragma mark -
#pragma mark Persistence stuff

-(void)saveEvent{
    
	 // Create a new instance of the entity managed by the fetched results controller.
	 NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
	/* 
	NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
	 Event *newEvent = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
	 
	 // If appropriate, configure the new managed object.
	 [self.eventName setValue:[NSDate date] forKey:@"timeStamp"];
	 */
	 // Save the context.
	 NSError *error = nil;
	 if (![context save:&error]) {
	 NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	 //abort();
	 }
	 
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveEvent)];
	self.navigationItem.rightBarButtonItem = saveItem;
	[saveItem release];
	
	self.title = @"Event";
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	[self.tableView reloadData];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	NSString *text = @"";
	NSString *detailText = @"";
	
	if(indexPath.row == 0){
		text = @"Name";
		if (self.event != nil) {
			detailText = self.event.eventName;
		}
	}
	
	if(indexPath.row == 1){
		text = @"Date";
		if (self.event != nil) {
			NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
			[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
			[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
			detailText = [dateFormatter stringFromDate:self.event.eventDate];
			[dateFormatter release];
		}
	}
	
	if(indexPath.row == 2){
		text = @"Type";
		if (self.event != nil) {
			detailText = self.event.eventType;
		}
	}
	
	if(indexPath.row == 3) {
		text = @"Venue";
		if (self.event != nil) {
			Venue *venue = self.event.venue;
			detailText = venue.venueName;
		}
	}
	
	cell.textLabel.text = text;
	cell.detailTextLabel.text = detailText;
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	if(indexPath.row == 0)
	{
		AddEventNameController *vc = [[AddEventNameController alloc] initWithNibName:@"AddEventNameController" bundle:[NSBundle mainBundle]];
		vc.fetchedResultsController = self.fetchedResultsController;
		vc.event = self.event;
		
		[self.navigationController pushViewController:vc animated:YES];
		
		[vc release];
	}
	if(indexPath.row == 1)
	{
		AddEventDateController *vc = [[AddEventDateController alloc] initWithNibName:@"AddEventDateController" bundle:[NSBundle mainBundle]];
		vc.fetchedResultsController = self.fetchedResultsController;
		vc.event = self.event;
		
		[self.navigationController pushViewController:vc animated:YES];
		
		[vc release];
	}
	if(indexPath.row == 2)
	{
		AddEventTypeController *vc = [[AddEventTypeController alloc] initWithNibName:@"AddEventTypeController" bundle:[NSBundle mainBundle]];
		vc.fetchedResultsController = self.fetchedResultsController;
		vc.event = self.event;
		
		[self.navigationController pushViewController:vc animated:YES];
		
		[vc release];
	}
	if(indexPath.row == 3)
	{
		AddEventVenueController *vc = [[AddEventVenueController alloc] initWithNibName:@"AddEventVenueController" bundle:[NSBundle mainBundle]];
		vc.eventFetchedResultsController = self.fetchedResultsController;
		vc.event = self.event;
		
		[self.navigationController pushViewController:vc animated:YES];
		
		[vc release];
	}
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[fetchedResultsController release];
	[event release];
    [super dealloc];
}


@end

