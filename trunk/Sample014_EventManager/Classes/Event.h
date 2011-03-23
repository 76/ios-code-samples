//
//  Event.h
//  Sample014_EventManager
//
//  Created by Wilfred Mworia on 3/18/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guest.h"

@interface Event : NSObject {
	NSString *name;
	NSString *venue;
	NSDate *date;
	NSString *type;
	NSMutableArray *guests;
}

@property (retain) NSString *name;
@property (retain) NSString *venue;
@property (retain) NSDate *date;
@property (retain) NSString *type;
@property (retain) NSMutableArray *guests;

-(id)init;
-(void)addGuest:(Guest *)guest;

@end
