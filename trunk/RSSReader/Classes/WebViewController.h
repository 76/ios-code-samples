//
//  WebViewController.h
//  RSSReader
//
//  Created by Wilfred Mworia on 4/5/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {
	
	IBOutlet UIWebView *webView;
	
	NSURL *url;
}

@property (nonatomic,retain) NSURL *url;

@end
