//
//  Account.h
//  Sample009_CollectionAccounts
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Account : NSObject {
	NSString *name;
	double balance;
	double withdrawn;
	double deposited;
}

- (Account *)initWithName:(NSString *)aname andBalance:(double)amount;

- (void)deposit:(double)amount;

- (void)withdraw:(double)amount;

- (NSString *)getName;

- (double)getBalance;

- (double)getWithdrawals;

- (double)getDeposits;

- (NSString *)statement;

@end
