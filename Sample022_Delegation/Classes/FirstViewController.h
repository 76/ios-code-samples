//
//  FirstViewController.h
//  Sample022_Delegation
//
//  Created by Wilfred Mworia on 3/30/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface FirstViewController : UIViewController <SecondViewDelegate> {
	IBOutlet UILabel *display;
	IBOutlet UITextField *message;
	IBOutlet UIButton *send;
	
	SecondViewController *sv;
}

@property (nonatomic,retain) SecondViewController *sv;

- (IBAction)sendMessage:(id)sender;

@end
