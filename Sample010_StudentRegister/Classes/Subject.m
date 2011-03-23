//
//  Subject.m
//  Sample010_StudentRegister
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Subject.h"


@implementation Subject

- (Subject *)initWithName:(NSString *)aname andMarks:(double)mark{
	if (self = [super init]) {
		name = aname;
		marks = mark;
	}
	
	return self;
}


- (NSString *)getName{
	return name;
}


- (double)getMarks{
	return marks;
}

@end
