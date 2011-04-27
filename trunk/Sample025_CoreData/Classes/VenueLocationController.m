//
//  VenueLocationController.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "VenueLocationController.h"
#import "VenueMapAnnotation.h"

@implementation VenueLocationController

@synthesize mapView; 
@synthesize locationManager;
@synthesize venue;
@synthesize fetchedResultsController;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Location";
		
		self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        self.locationManager.delegate = self;
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];

}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
 
	if ([self.venue.latitude doubleValue] == 0.0 && [self.venue.longitude doubleValue] == 0.0) {
		//try and find current location
		[locationManager startUpdatingLocation];
	}else {
		MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
		
		region.center.latitude = [self.venue.latitude doubleValue];
		region.center.longitude = [self.venue.longitude doubleValue];
		
		region.span.longitudeDelta = 0.01f;
		region.span.latitudeDelta = 0.01f;
		[mapView setRegion:region animated:YES]; 
		
		[mapView setDelegate:self];
		
		VenueMapAnnotation *ann = [[VenueMapAnnotation alloc] init]; 
		ann.title = self.venue.venueName;
		ann.subtitle = @""; 
		ann.coordinate = region.center; 
		[mapView addAnnotation:ann];
	}
}


#pragma mark -
#pragma mark MKMapViewDelegate

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation {
	MKPinAnnotationView *pinView = nil; 
	if(annotation != mapView.userLocation) 
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil ) pinView = [[[MKPinAnnotationView alloc]
										  initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
		
		pinView.pinColor = MKPinAnnotationColorRed; 
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
	} 
	else {
		[mapView.userLocation setTitle:@"I am here"];
	}
	return pinView;
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //NSLog(@"Location: %@", [newLocation description]);
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
	
	region.center.latitude = newLocation.coordinate.latitude;
	region.center.longitude = newLocation.coordinate.longitude;
	
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;
	[mapView setRegion:region animated:YES]; 
	
	[mapView setDelegate:self];
	
	VenueMapAnnotation *ann = [[VenueMapAnnotation alloc] init]; 
	ann.title = self.venue.venueName;
	ann.subtitle = @""; 
	ann.coordinate = region.center; 
	[mapView addAnnotation:ann];
	
	[locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"Error: %@", [error description]);
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[fetchedResultsController release];
	[locationManager release];
	[venue release];
	[mapView release];
    [super dealloc];
}


@end
