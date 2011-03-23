//
//  Subject.h
//  Sample010_StudentRegister
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Subject : NSObject {
	NSString *name;
	double marks;
}

- (Subject *)initWithName:(NSString *)aname andMarks:(double)mark;

- (NSString *)getName;

- (double)getMarks;

@end
