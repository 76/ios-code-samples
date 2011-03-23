//
//  Sample001AppDelegate.h
//  Sample001
//
//  Created by Wilfred Mworia on 3/8/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sample001AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UILabel *myLabel;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

