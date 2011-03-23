//
//  Event.m
//  Sample014_EventManager
//
//  Created by Wilfred Mworia on 3/18/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Event.h"


@implementation Event

@synthesize name,venue,type,date,guests;


-(id)init{
	if (self = [super init]) {
		guests = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void)addGuest:(Guest *)guest{
	[guests addObject:guest];
}

@end
