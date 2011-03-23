//
//  Sample005_SelectorsAppDelegate.h
//  Sample005_Selectors
//
//  Created by Wilfred Mworia on 3/14/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Test.h"

@interface Sample005_SelectorsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

