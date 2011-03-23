//
//  Person.m
//  Sample007_FoundationFramework
//
//  Created by Wilfred Mworia on 3/15/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Person.h"


@implementation Person

- initWithName:(NSString *)aname andAge:(int)anage{
	if(self = [super init])
	{
		name = aname;
		age = anage;
	}
	
	return self;
}

- (int)getAge{
	return age;
}

- (NSString *)getName{
	return name;
}

- (NSString *)description{
	return [NSString stringWithFormat:@"My name is: %@, and I am %i years old", name, age];
}
@end
