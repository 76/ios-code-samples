//
//  SettingsViewController.h
//  RSSReader
//
//  Created by Wilfred Mworia on 4/11/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"
#import "NewFeedViewController.h"

@interface SettingsViewController : UITableViewController<NewFeedDelegate> {
	NSMutableArray *feeds;
}

- (void)newFeed;

@end
