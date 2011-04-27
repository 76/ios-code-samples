//
//  VenueMapAnnotation.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "VenueMapAnnotation.h"


@implementation VenueMapAnnotation

@synthesize coordinate,title,subtitle;


-(void)dealloc{
	[title release];
	[super dealloc];
}

@end
