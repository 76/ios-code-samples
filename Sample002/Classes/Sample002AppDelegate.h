//
//  Sample002AppDelegate.h
//  Sample002
//
//  Created by Wilfred Mworia on 3/8/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestController.h"

@interface Sample002AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UILabel *myLabel;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

