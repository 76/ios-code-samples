//
//  Student.h
//  Sample010_StudentRegister
//
//  Created by Wilfred Mworia on 3/16/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"

@interface Student : NSObject {
	NSString *name;
	NSMutableArray *subjects;
}

- (id)initWithName:(NSString *)aname;

- (void)addSubject:(Subject *)subject;

- (NSMutableArray *)getSubjects;

- (NSString *)getName;

					

@end
