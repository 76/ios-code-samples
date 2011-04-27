//
//  MemberDetailViewController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Member.h"

@interface MemberDetailViewController : UIViewController <UITextFieldDelegate> {
	Member *member;
	NSFetchedResultsController *fetchedResultsController;
	
	IBOutlet UITextField *firstNameField;
	IBOutlet UITextField *lastNameField;
}
@property (nonatomic,retain) Member *member;
@property (nonatomic,retain) NSFetchedResultsController *fetchedResultsController;

-(void)saveMember;

@end
