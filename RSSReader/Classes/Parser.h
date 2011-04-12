//
//  RssParser.h
//  RSSReader
//
//  Created by Wilfred Mworia on 4/11/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ParserDelegate;



@interface Parser : NSObject<NSXMLParserDelegate> {
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
	
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
	
	
	id <ParserDelegate> delegate;
}

@property (nonatomic,assign) id <ParserDelegate> delegate;

- (void)parseXMLFileAtURL:(NSString *)URL;

@end





@protocol ParserDelegate <NSObject>

-(void)doneParsing:(NSMutableArray *)documentStories;

@end
