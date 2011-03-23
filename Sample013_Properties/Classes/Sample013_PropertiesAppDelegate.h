//
//  Sample013_PropertiesAppDelegate.h
//  Sample013_Properties
//
//  Created by Wilfred Mworia on 3/18/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface Sample013_PropertiesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;

	Person *person;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

