//
//  RootViewController.h
//  Sample024_TableView1
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddStringViewController.h"

@interface RootViewController : UITableViewController <AddStringDelegate>{
	
	NSMutableArray *strings;
	NSMutableArray *moreStrings;
	
	AddStringViewController *addVC;
}

@property (nonatomic,retain) NSMutableArray *moreStrings;
@property (nonatomic,retain) NSMutableArray *strings;
@property (nonatomic,retain) AddStringViewController *addVC;

- (void)add;

@end
