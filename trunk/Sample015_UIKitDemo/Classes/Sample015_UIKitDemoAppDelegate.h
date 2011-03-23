//
//  Sample015_UIKitDemoAppDelegate.h
//  Sample015_UIKitDemo
//
//  Created by Wilfred Mworia on 3/22/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sample015_UIKitDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UIButton *toggleStatusBarStyle;
	IBOutlet UIButton *eventTestButton;
	IBOutlet UIButton *superViewTestButton;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


-(IBAction)toggleStatusBarStyle;
-(IBAction)eventTest:(id)sender withEvent:(UIEvent *)event;
-(IBAction)superViewTest;

@end

