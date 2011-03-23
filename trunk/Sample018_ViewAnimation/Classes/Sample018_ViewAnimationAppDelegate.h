//
//  Sample018_ViewAnimationAppDelegate.h
//  Sample018_ViewAnimation
//
//  Created by Wilfred Mworia on 3/23/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sample018_ViewAnimationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UIButton *animateButton;
	IBOutlet UIView *slidingView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(IBAction)animateView;
- (void)animationWillStart;
- (void)animationDidStop;
@end

