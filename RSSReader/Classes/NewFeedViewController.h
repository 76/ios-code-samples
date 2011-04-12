//
//  NewFeedViewController.h
//  RSSReader
//
//  Created by Wilfred Mworia on 4/11/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

@protocol NewFeedDelegate;


@interface NewFeedViewController : UIViewController {
	IBOutlet UITextField *nameField;
	IBOutlet UITextField *linkLabel;
	IBOutlet UIButton *saveButton;
	
	id <NewFeedDelegate> delegate;
}

@property (nonatomic,assign) id <NewFeedDelegate> delegate;

-(IBAction)saveFeed;

@end


@protocol NewFeedDelegate<NSObject>

-(void)addedNewFeed:(Feed *)feed;

@end