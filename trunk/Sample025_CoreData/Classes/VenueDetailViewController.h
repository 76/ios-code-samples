//
//  VenueDetailViewController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venue.h"

@class VenueNameViewController;
@class VenueLocationController;

@interface VenueDetailViewController : UITableViewController {
	Venue *venue;
}
@property (nonatomic,retain) Venue *venue;

@end
