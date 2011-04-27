//
//  Sample025_CoreDataAppDelegate.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/21/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "RootViewController.h"
#import "VenuesViewController.h"
#import "MembersViewController.h"

@interface Sample025_CoreDataAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	UITabBarController *tabBarController;
	
	UINavigationController *venueNavController;
	VenuesViewController *venuesViewController;
	
	UINavigationController *membersNavController;
	MembersViewController *membersViewController;

@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) UITabBarController *tabBarController;

@property (nonatomic, retain) UINavigationController *venueNavController;
@property (nonatomic, retain) VenuesViewController *venuesViewController;

@property (nonatomic, retain) UINavigationController *membersNavController;
@property (nonatomic, retain) MembersViewController *membersViewController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

@end

