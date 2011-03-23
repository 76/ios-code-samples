//
//  Sample007_FoundationFrameworkAppDelegate.h
//  Sample007_FoundationFramework
//
//  Created by Wilfred Mworia on 3/15/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface Sample007_FoundationFrameworkAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)testNSString;

- (void)testNSArray;

- (void)testNSMutableArray;

- (void)testEnumerator;

@end

