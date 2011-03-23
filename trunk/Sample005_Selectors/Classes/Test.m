//
//  Test.m
//  Sample005_Selectors
//
//  Created by Wilfred Mworia on 3/14/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "Test.h"


@implementation Test


- (void)testSelector:(int)arg{
	NSLog(@"test 1 ran");
}


- (void)testSelector2{
	NSLog(@"test 2 ran");
}

- (void)testSelector3:(int)arg arg2:(int)arg2{
	NSLog(@"test 3 ran");
}

@end
