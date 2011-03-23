//
//  Person.m
//  Sample011_MemoryMgmt
//
//  Created by Wilfred Mworia on 3/17/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Person.h"


@implementation Person


-(void)x{
	NSLog(@"It ran");
}

-(NSString *)getName{
	NSString *name = [[NSString alloc] initWithString:@"WILL"]; //retain count of 1
	
	NSLog(@"releasing");
	
	[name autorelease];
	
	return name;
	
	//
	
}

@end
