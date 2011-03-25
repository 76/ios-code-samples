//
//  Sample021_UserDefaultsViewController.h
//  Sample021_UserDefaults
//
//  Created by Wilfred Mworia on 3/25/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sample021_UserDefaultsViewController : UIViewController {
	IBOutlet UISegmentedControl *color;
	IBOutlet UISwitch *onoff;
	IBOutlet UISlider *slider;
	IBOutlet UILabel *label;
}

- (IBAction)sliderSlid;

- (void)loadSettings;
- (void)saveSettings;

@end

