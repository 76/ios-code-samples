//
//  Person.h
//  Sample022_Delegation2
//
//  Created by Wilfred Mworia on 3/31/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString *first;
	NSString *last;
}

@property (copy) NSString *first;
@property (copy) NSString *last;

@end
