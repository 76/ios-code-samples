//
//  Sample011_MemoryMgmtAppDelegate.h
//  Sample011_MemoryMgmt
//
//  Created by Wilfred Mworia on 3/17/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface Sample011_MemoryMgmtAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	Person *p;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(void)test;

@end

