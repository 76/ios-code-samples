//
//  Shape.h
//  Sample006_Shape
//
//  Created by Wilfred Mworia on 3/14/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Shape : NSObject {
	NSString *name;
	int numberOfSides;
}

- (Shape *)initWithName:(NSString *)aname andSides:(int)sides;

- (NSString *)getName;

- (void)setName:(NSString *)aname;

- (NSString *)description;



@end
