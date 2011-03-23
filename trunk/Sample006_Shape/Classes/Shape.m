//
//  Shape.m
//  Sample006_Shape
//
//  Created by Wilfred Mworia on 3/14/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Shape.h"


@implementation Shape

- (Shape *)initWithName:(NSString *)aname andSides:(int)sides{
	
	if(self = [super init])
	{
		name = aname;
		numberOfSides = sides;
	}
	
	return self;
}

- (NSString *)getName{
	return name;
}

- (void)setName:(NSString *)aname{
	name = aname;
}

- (NSString *)description{
	return [NSString stringWithFormat:@"I am a %@ and I have %i sides",name,numberOfSides];
}


@end
