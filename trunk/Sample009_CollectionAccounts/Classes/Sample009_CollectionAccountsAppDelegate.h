//
//  Sample009_CollectionAccountsAppDelegate.h
//  Sample009_CollectionAccounts
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface Sample009_CollectionAccountsAppDelegate : NSObject <UIApplicationDelegate,UIAlertViewDelegate,UITextFieldDelegate> {
    UIWindow *window;
	
	IBOutlet UITextField *nameField;
	IBOutlet UITextField *openBalanceField;
	IBOutlet UITextField *depositField;
	IBOutlet UITextField *withdrawField;
	IBOutlet UITextField *transactionNameField;
	
	IBOutlet UIButton *openButton;
	IBOutlet UIButton *depositButton;
	IBOutlet UIButton *withdrawButton;
	IBOutlet UIButton *statementButton;
	IBOutlet UIButton *registerButton;
	
	IBOutlet UILabel *balanceLabel;	
	
	NSMutableDictionary *accounts;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)openAccount:(id)sender;
- (IBAction)depositAmount:(id)sender;
- (IBAction)withdrawAmount:(id)sender;
- (IBAction)showStatement:(id)sender;
- (IBAction)showAccountsRegister:(id)sender;

- (void)printBalance;

@end

