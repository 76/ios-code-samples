//
//  VenueLocationController.m
//  Sample025_CoreData
//
//  Created by Wilfred Mworia on 4/27/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "VenueLocationController.h"
#import "VenueMapAnnotation.h"
#import "Sample025_CoreDataAppDelegate.h"

@implementation VenueLocationController

@synthesize mapView; 
@synthesize searchBar;
@synthesize locationManager;
@synthesize foundLocations;
@synthesize placemarks;
@synthesize forwardGeocoder;
@synthesize venue;

- (void)saveLocation{
	self.venue.latitude = [NSNumber numberWithDouble:currentLocationCoordinate.latitude]; 
	self.venue.longitude = [NSNumber numberWithDouble:currentLocationCoordinate.longitude];
	
	Sample025_CoreDataAppDelegate *appdel = [[UIApplication sharedApplication] delegate];
	
	NSError *error = nil;
	if (![appdel.managedObjectContext save:&error]) {
		
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		//abort();
	}
	
	[self.navigationController popViewControllerAnimated:YES];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.title = @"Location";
		
		self.locationManager = [[[CLLocationManager alloc] init] autorelease];
        self.locationManager.delegate = self;
		
		self.foundLocations = [[NSMutableArray alloc] init];
		self.placemarks = [[NSMutableArray alloc] init];
		
		//self.searchDisplayController.searchResultsDataSource = self;
		//self.searchDisplayController.searchResultsDelegate = self;
		
		UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveLocation)];
		self.navigationItem.rightBarButtonItem = saveItem;
		[saveItem release];
									  
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
	
	[mapView setDelegate:self];
	
	searchBar.delegate = self;

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
		
		
		
		VenueMapAnnotation *placemark = [[VenueMapAnnotation alloc] init]; 
		placemark.title = self.venue.venueName;
		placemark.subtitle = @""; 
		placemark.coordinate = region.center;
		currentLocationCoordinate = placemark.coordinate;

		[mapView addAnnotation:placemark];
		[placemark release];
	}
}

#pragma mark - BSForwardGeocoderDelegate methods
- (void)forwardGeocoderError:(BSForwardGeocoder*)geocoder errorMessage:(NSString *)errorMessage
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
													message:errorMessage
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
	
}

- (void)forwardGeocoderFoundLocation:(BSForwardGeocoder*)geocoder
{
	if(forwardGeocoder.status == G_GEO_SUCCESS)
	{
		int searchResults = [forwardGeocoder.results count];
		
		// Add placemarks for each result
		//a result cell on results table
		for(int i = 0; i < searchResults; i++)
		{
			// Add to found locations array
			BSKmlResult *place = [forwardGeocoder.results objectAtIndex:i];
			[self.foundLocations addObject:place];			
			
			/*
			 [mapView addAnnotation:placemark];	
			
			NSArray *countryName = [place findAddressComponent:@"country"];
			if([countryName count] > 0)
			{
				NSLog(@"Country: %@", ((BSAddressComponent*)[countryName objectAtIndex:0]).longName );
			}
			
			*/
		}
		
		if([forwardGeocoder.results count] == 1)
		{
			BSKmlResult *place = [forwardGeocoder.results objectAtIndex:0];
			
			// Zoom into the location		
			[mapView setRegion:place.coordinateRegion animated:TRUE];
		}
		
		//reload results table
		[self.searchDisplayController.searchResultsTableView reloadData];
		
		// Dismiss the keyboard
		[searchBar resignFirstResponder];
	}
	else {
		NSString *message = @"";
		
		switch (forwardGeocoder.status) {
			case G_GEO_BAD_KEY:
				message = @"The API key is invalid.";
				break;
				
			case G_GEO_UNKNOWN_ADDRESS:
				message = [NSString stringWithFormat:@"Could not find %@", forwardGeocoder.searchQuery];
				break;
				
			case G_GEO_TOO_MANY_QUERIES:
				message = @"Too many queries has been made for this API key.";
				break;
				
			case G_GEO_SERVER_ERROR:
				message = @"Server error, please try again.";
				break;
				
				
			default:
				break;
		}
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" 
														message:message
													   delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil];
		[alert show];
		[alert release];
	}
}

#pragma mark - UI Events
- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
	
	[foundLocations removeAllObjects];
	//[placemarks removeAllObjects];
	
	NSLog(@"Searching for: %@", theSearchBar.text);
	
	if(forwardGeocoder == nil)
	{
		forwardGeocoder = [[BSForwardGeocoder alloc] initWithDelegate:self];
	}
	
	// Forward geocode!
	[forwardGeocoder findLocation:theSearchBar.text];
	
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView{
	/*
	[foundLocations removeAllObjects];
	//[placemarks removeAllObjects];
	
	[tableView reloadData];
	*/
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.foundLocations count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell.
    BSKmlResult *place = [self.foundLocations objectAtIndex:indexPath.row];
	currentLocationCoordinate = place.coordinate;
	cell.textLabel.text = place.address;
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//remove annotations
	[mapView removeAnnotations:placemarks];
	
	//place and zoom
	BSKmlResult *place = [forwardGeocoder.results objectAtIndex:indexPath.row];
	
	[mapView setRegion:place.coordinateRegion animated:TRUE];
	
	VenueMapAnnotation *placemark = [[VenueMapAnnotation alloc] init];
	placemark.title = place.address;
	placemark.subtitle = place.countryName;
	placemark.coordinate = place.coordinate;
	
	[mapView addAnnotation:placemark];
	[placemarks addObject:placemark];
	
	[placemark release];
	
	//dismiss results table
	[self.searchDisplayController setActive:NO];
	
	
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
	
	VenueMapAnnotation *placemark = [[VenueMapAnnotation alloc] init]; 
	placemark.title = self.venue.venueName;
	placemark.subtitle = @""; 
	placemark.coordinate = newLocation.coordinate;
	currentLocationCoordinate = placemark.coordinate;
	
	[placemarks addObject:placemark];
	[mapView addAnnotation:placemark];
	
	[placemark release];
	
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
	[locationManager release];
	[foundLocations release];
	[placemarks release];
	[venue release];
	[searchBar release];
	[mapView release];
	[forwardGeocoder release];
    [super dealloc];
}


@end
