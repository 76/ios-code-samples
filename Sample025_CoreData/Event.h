//
//  Event.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Venue;

@interface Event :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * eventDate;
@property (nonatomic, retain) NSString * eventType;
@property (nonatomic, retain) NSString * eventName;
@property (nonatomic, retain) Venue * venue;
@property (nonatomic, retain) NSSet* members;

@end


@interface Event (CoreDataGeneratedAccessors)
- (void)addMembersObject:(NSManagedObject *)value;
- (void)removeMembersObject:(NSManagedObject *)value;
- (void)addMembers:(NSSet *)value;
- (void)removeMembers:(NSSet *)value;

@end

