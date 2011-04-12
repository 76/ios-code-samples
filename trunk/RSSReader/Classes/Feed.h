//
//  Feed.h
//  RSSReader
//
//  Created by Wilfred Mworia on 4/11/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Feed : NSObject {
	NSString *title;
	NSString *link;
}

@property (copy) NSString *title;
@property (copy) NSString *link;

@end
