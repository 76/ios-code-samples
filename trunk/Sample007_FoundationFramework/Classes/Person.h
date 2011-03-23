//
//  Person.h
//  Sample007_FoundationFramework
//
//  Created by Wilfred Mworia on 3/15/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString *name;
	int age;
}

- initWithName:(NSString *)aname andAge:(int)anage;

- (int)getAge;

- (NSString *)getName;

- (NSString *)description;

@end
