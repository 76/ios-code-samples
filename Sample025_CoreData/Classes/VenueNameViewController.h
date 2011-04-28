//
//  VenueNameViewController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/26/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venue.h"

@interface VenueNameViewController : UIViewController <UITextFieldDelegate> {
	Venue *venue;
	
	IBOutlet UITextField *nameField;
}

@property (nonatomic,retain) Venue *venue;

@end
