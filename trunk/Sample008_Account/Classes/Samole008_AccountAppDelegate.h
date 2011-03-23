//
//  Samole008_AccountAppDelegate.h
//  Samole008_Account
//
//  Created by Wilfred Mworia on 3/15/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Account.h"

@interface Samole008_AccountAppDelegate : NSObject <UIApplicationDelegate,UIAlertViewDelegate,UITextFieldDelegate> {
    UIWindow *window;
	
	IBOutlet UITextField *nameField;
	IBOutlet UITextField *openBalanceField;
	IBOutlet UITextField *depositField;
	IBOutlet UITextField *withdrawField;
	
	IBOutlet UIButton *openButton;
	IBOutlet UIButton *depositButton;
	IBOutlet UIButton *withdrawButton;
	IBOutlet UIButton *statementButton;
	
	IBOutlet UILabel *balanceLabel;
	
	Account *account;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)openAccount:(id)sender;
- (IBAction)depositAmount:(id)sender;
- (IBAction)withdrawAmount:(id)sender;
- (IBAction)showStatement:(id)sender;

- (void)printBalance;

@end

