//
//  Sample004AppDelegate.h
//  Sample004
//
//  Created by Wilfred Mworia on 3/10/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Sample004ViewController;

@interface Sample004AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Sample004ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Sample004ViewController *viewController;

@end

