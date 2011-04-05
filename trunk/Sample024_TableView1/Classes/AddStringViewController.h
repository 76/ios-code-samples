//
//  AddStringViewController.h
//  Sample024_TableView1
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AddStringDelegate;


@interface AddStringViewController : UIViewController {
	IBOutlet UITextField *strField;
	IBOutlet UIButton *addButton;
	IBOutlet UISegmentedControl *segmentControl;
	
	NSString *text;
	NSString *buttonText;
	
	int editingIndex;
	int editingSection;
	
	id <AddStringDelegate> delegate;
}

@property (nonatomic,assign) id <AddStringDelegate> delegate;
@property (copy) NSString *text;
@property (copy) NSString *buttonText;
@property int editingIndex;
@property int editingSection;

- (IBAction)addString;

@end


@protocol AddStringDelegate <NSObject>

-(void)didAddNewString:(NSString *)astring forSection:(int)section;
-(void)didEditStringatIndex:(int)index toString:(NSString *)anewstring forSection:(int)section;

@end