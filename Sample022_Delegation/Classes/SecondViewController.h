//
//  SecondViewController.h
//  Sample022_Delegation
//
//  Created by Wilfred Mworia on 3/30/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewDelegate; //declare protocol

@interface SecondViewController : UIViewController {
	IBOutlet UILabel *display;
	IBOutlet UITextField *message;
	IBOutlet UIButton *send;
	
	NSString *msg;
	
	id <SecondViewDelegate> delegate; //delegate
}

@property (copy) NSString *msg;
@property (nonatomic,assign) id <SecondViewDelegate> delegate;

- (IBAction)sendMessage:(id)sender;

@end



//protocol definition
@protocol SecondViewDelegate <NSObject>

@required

- (void)didSendMessage:(NSString *)amessage;

@end

