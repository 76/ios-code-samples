//
//  RootViewController.m
//  RSSReader
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "RootViewController.h"
#import "Feed.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle


-(void)doneParsing:(NSMutableArray *)documentStories{
	
	[storiesContainer addObject:documentStories];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *filepath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"feeds.plist"];
	
	feeds = [NSMutableDictionary dictionaryWithContentsOfFile:filepath];
	
	if (feeds == nil) {
		feeds = [NSMutableDictionary dictionary];		
	}else {
		
		
		//[feeds setValue:@"http://feeds.feedburner.com/Afrinnovatorcom" forKey:@"Afrinnovator"];
		//[feeds setValue:@"http://newsrss.bbc.co.uk/rss/sportonline_world_edition/front_page/rss.xml" forKey:@"NYGiants"];
	}
	
	
	storiesContainer = [[NSMutableArray alloc] init];
	
	
	parser = [[Parser alloc] init];
	parser.delegate = self;
	
	NSEnumerator *e = [feeds objectEnumerator];
	NSString *link;
	while (link = [e nextObject]) {
		[parser parseXMLFileAtURL:link];
	}
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	UITabBarItem *tab = [[UITabBarItem alloc] initWithTitle:@"Rss" image:nil tag:0];
	self.tabBarItem = tab;
	[tab release];
	
	self.title = @"RSS Reader";
	
	feeds = [[NSMutableDictionary alloc] init];
	
	cellSize = CGSizeMake([self.tableView bounds].size.width, 60);
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [storiesContainer count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[storiesContainer objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	//return [[feeds allKeysForObject:[feeds objectAtIndex:section]] objectAtIndex:0];
	return [NSString stringWithFormat:@"Feed #%i", section];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	NSMutableArray *story = [storiesContainer objectAtIndex:indexPath.section];
	NSMutableDictionary *anitem = [story objectAtIndex:indexPath.row];
	
	//int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];

	cell.textLabel.text = [anitem objectForKey: @"title"];
	cell.detailTextLabel.text = [anitem objectForKey: @"summary"];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSMutableArray *story = [storiesContainer objectAtIndex:indexPath.section];
	NSMutableDictionary *anitem = [story objectAtIndex:indexPath.row];
	
	NSString * storyLink = [anitem objectForKey: @"link"];
	
	// clean up the link - get rid of spaces, returns, and tabs...
	storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
	storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
	storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
	
	NSLog(@"link: %@", storyLink);
	// open in Safari
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:storyLink]];
	
	WebViewController *webVC = [[WebViewController alloc] initWithNibName:@"WebView" bundle:[NSBundle mainBundle]];
	
	webVC.url = [NSURL URLWithString:storyLink];
	
	[self.navigationController pushViewController:webVC animated:YES];
	
	[webVC release];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	NSLog(@"found file and started parsing");
	
}




- (void)dealloc {
	[feeds release];
	[storiesContainer release];

	
    [super dealloc];
}


@end

