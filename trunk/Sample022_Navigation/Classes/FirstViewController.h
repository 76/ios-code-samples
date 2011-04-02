//
//  FirstViewController.h
//  Sample022_Navigation
//
//  Created by Wilfred Mworia on 4/1/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface FirstViewController : UIViewController {
	SecondViewController *svc;
}

@property (nonatomic,retain) SecondViewController *svc;

- (void)next;
- (void)bookmark;
- (void)compose;

@end
