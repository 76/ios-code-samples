//
//  Person.h
//  Sample013_Properties
//
//  Created by Wilfred Mworia on 3/18/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	int numberOfYearsOld;
	NSString *name;
	
}


@property int age;
@property (retain) NSString *name;



@end
