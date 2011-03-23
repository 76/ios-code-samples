//
//  Sample014_EventManagerAppDelegate.h
//  Sample014_EventManager
//
//  Created by Wilfred Mworia on 3/18/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "Guest.h"

@interface Sample014_EventManagerAppDelegate : NSObject <UIApplicationDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate,UITextFieldDelegate> {
    UIWindow *window;
	
	IBOutlet UIPickerView *eventTypePicker;
	
	IBOutlet UIDatePicker *eventDatePicker;
	
	IBOutlet UIButton *createEventButton;
	IBOutlet UIButton *addGuestButton;
	IBOutlet UIButton *displayGuestsButton;
	IBOutlet UIButton *displayEventsButton;
	IBOutlet UIButton *showEventTypePicker;
	IBOutlet UIButton *showDatePicker;
	
	IBOutlet UITextField *eventNameField;
	IBOutlet UITextField *venueField;
	IBOutlet UITextField *eventNameForGuestField;
	IBOutlet UITextField *guestNameField;
	
	IBOutlet UITextView *display;

	IBOutlet UILabel *typeField;
	IBOutlet UILabel *dateField;
	
	NSString *eventType;
	NSDate *eventDate;
	NSMutableArray *eventTypes;
	
	NSMutableDictionary *events;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIPickerView *eventTypePicker;
@property (nonatomic, retain) IBOutlet UIDatePicker *eventDatePicker;
@property (nonatomic, retain) IBOutlet UITextView *display;

@property (retain) NSString *eventType;
@property (retain) NSMutableArray *eventTypes;
@property (retain) NSDate *eventDate;
@property (retain) NSMutableDictionary *events;

-(IBAction)createEvent;
-(IBAction)toggleEventTypePicker;
-(IBAction)toggleDatePicker;
-(void)toggleDisplay;
-(IBAction)hideKeyboard;
-(IBAction)addGuest;
-(IBAction)displayEventList;
-(IBAction)displayGuestList;

-(NSString *)formatDate:(NSDate *)date;

-(IBAction)datePickerValueChanged:(id)sender;

@end

