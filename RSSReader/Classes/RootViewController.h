//
//  RootViewController.h
//  RSSReader
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

#import "Parser.h"

@interface RootViewController : UITableViewController <ParserDelegate>{
	IBOutlet UITableView * newsTable;
	
	UIActivityIndicatorView * activityIndicator;
	
	CGSize cellSize;
	
	
	Parser *parser;
	
	NSMutableDictionary *feeds;
	NSMutableArray * storiesContainer;

	
}

@end
