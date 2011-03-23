//
//  Person.h
//  Sample003
//
//  Created by Wilfred Mworia on 3/9/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	//ivars
	int age;
	
	NSString *name;
}

//class var
int numberOfPeople;


//class met
+ (int)getNumberOfPeople;


//instance met
- (void)create;

- (void)initWithName:(NSString *)aname;

- (void)initWithName:(NSString *)aname andAge:(int)anage;

- (void)setAge:(int)anage;

- (void)setName:(NSString *)aname;

- (int)getAge;

- (NSString *)getName;

@end
