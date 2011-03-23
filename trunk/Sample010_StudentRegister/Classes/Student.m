//
//  Student.m
//  Sample010_StudentRegister
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Student.h"


@implementation Student
- (id)initWithName:(NSString *)aname{
	if (self = [super init]) {
		name = aname;
		subjects = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)addSubject:(Subject *)subject{
	[subjects addObject:subject];
}

- (NSMutableArray *)getSubjects{
	return subjects;
}

- (NSString *)getName{
	return name;
}

@end
