//
//  VenueLocationController.h
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Venue.h"

@class VenueMapAnnotation;

@interface VenueLocationController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate> {
	IBOutlet MKMapView *mapView;
	CLLocationManager *locationManager;
	
	NSFetchedResultsController *fetchedResultsController;	
	Venue *venue;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, retain) Venue *venue;
@property (nonatomic,retain) NSFetchedResultsController *fetchedResultsController;

@end
