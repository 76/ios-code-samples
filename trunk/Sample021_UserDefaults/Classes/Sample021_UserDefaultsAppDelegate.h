//
//  Sample021_UserDefaultsAppDelegate.h
//  Sample021_UserDefaults
//
//  Created by Wilfred Mworia on 3/25/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Sample021_UserDefaultsViewController;

@interface Sample021_UserDefaultsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Sample021_UserDefaultsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Sample021_UserDefaultsViewController *viewController;

@end

