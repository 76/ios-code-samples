//
//  Person.m
//  Sample003
//
//  Created by Wilfred Mworia on 3/9/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Person.h"


@implementation Person

+ (int)getNumberOfPeople {
	return numberOfPeople;
}

- (void)create {
	age = 0;
	name = @"no name";
}

- (void) initWithName : (NSString *)aname {
	name = aname;
	age = 0;
}

- (void)initWithName:(NSString *)aname andAge:(int)anage {
	name = aname;
	age = anage;
}

- (void)setAge:(int)anage {
	age = anage;
}

- (void)setName:(NSString *)aname {
	name = aname;
}

- (int)getAge {
	return age;
}

- (NSString *)getName {
	return name;
}

1

@end
