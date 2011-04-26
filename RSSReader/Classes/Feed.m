//
//  Feed.m
//  RSSReader
//
//  Created by Wilfred Mworia on 4/11/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Feed.h"


@implementation Feed

@synthesize title,link;

+ (NSArray *)feedsArrayFromDictionary:(NSDictionary *)dict{

	NSMutableArray *array = [[NSMutableArray alloc] init];
	NSEnumerator *keys = [dict keyEnumerator];
	NSString *key;
	while (key = [keys nextObject]) {
		Feed *f = [[Feed alloc] init];
		f.title = key;
		f.link = (NSString *)[dict objectForKey:key];
		[array addObject:f];
		[f release];
	}
	[array autorelease];
	return array;
}

@end
