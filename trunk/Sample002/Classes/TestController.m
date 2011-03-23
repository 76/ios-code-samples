//
//  TestController.m
//  Sample002
//
//  Created by Wilfred Mworia on 3/8/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "TestController.h"


@implementation TestController

- (void)writeText:(UILabel *)label {
	label.text = @"controller text";
}


- (void)writeText:(UILabel *)label withText:(NSString *)text {
	label.text = text;
}

@end
