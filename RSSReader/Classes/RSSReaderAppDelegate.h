//
//  RSSReaderAppDelegate.h
//  RSSReader
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSReaderAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	UINavigationController *settingsNavController;
	UITabBarController *tabBarC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UINavigationController *settingsNavController;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarC;

@end

