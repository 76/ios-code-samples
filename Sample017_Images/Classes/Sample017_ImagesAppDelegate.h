//
//  Sample017_ImagesAppDelegate.h
//  Sample017_Images
//
//  Created by Wilfred Mworia on 3/23/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sample017_ImagesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UIImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;


@end

