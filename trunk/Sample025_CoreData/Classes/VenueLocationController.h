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
#import "BSForwardGeocoder.h"
#import "BSKmlResult.h"

@class VenueMapAnnotation;

@interface VenueLocationController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,
UISearchBarDelegate,UISearchDisplayDelegate,
//UITableViewDelegate,UITableViewDataSource,
BSForwardGeocoderDelegate> {
	
	IBOutlet MKMapView *mapView;
	IBOutlet UISearchBar *searchBar;
	
	CLLocationManager *locationManager;
	NSMutableArray *foundLocations;
	NSMutableArray *placemarks;
	CLLocationCoordinate2D currentLocationCoordinate;
	
	BSForwardGeocoder *forwardGeocoder;
		
	Venue *venue;
}

@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) NSMutableArray *foundLocations;
@property (nonatomic, retain) NSMutableArray *placemarks;
@property (nonatomic, retain) BSForwardGeocoder *forwardGeocoder;

@property (nonatomic, retain) Venue *venue;

- (void)saveLocation;

@end
