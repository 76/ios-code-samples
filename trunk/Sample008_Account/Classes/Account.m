//
//  Account.m
//  Samole008_Account
//
//  Created by Wilfred Mworia on 3/15/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Account.h"


@implementation Account

- (Account *)initWithName:(NSString *)aname andBalance:(double)amount{
	if(self = [super init])
	{
		name = aname;
		
		balance = amount;
	}
	
	return self;
}

- (void)deposit:(double)amount{
	balance += amount;
	
	deposited += amount;
}

- (void)withdraw:(double)amount{
	balance -= amount;
	
	withdrawn += amount;
}

- (NSString *)getName{
	return name;
}

- (double)getBalance{
	return balance;
}

- (double)getWithdrawals{
	return withdrawn;
}

- (double)getDeposits{
	return deposited;
}

- (NSString *)statement{
	return [NSString stringWithFormat:@"Account Name: %@\nBalance: %d\nDeposits: %d\nWithdrawals: %d",
			name, balance, deposited, withdrawn];			
}

@end
