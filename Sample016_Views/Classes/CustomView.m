//
//  CustomView.m
//  Sample016_Views
//
//  Created by Wilfred Mworia on 3/22/11.
//  Copyright 2011 African Pixel, Afrinnovator. All rights reserved.
//

#import "CustomView.h"


@implementation CustomView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	[[UIColor blueColor] set];
	UIRectFill(self.bounds);
	
	//ellipse
	[[UIColor redColor] set];
	
	CGRect ellipserect = CGRectMake(self.bounds.size.width/3, self.bounds.size.height/2, 200, 100);
	
	NSLog(@"%f,%f,%f,%f",ellipserect.origin.x,ellipserect.origin.y,ellipserect.size.width,ellipserect.size.height);
	//106.666664,185.000000,200.000000,100.000000
	
	CGContextFillEllipseInRect(context, ellipserect);
	
	
	
	
	//triangle
	CGContextBeginPath (context); 
	
	CGContextMoveToPoint (context, 120.0, 250.0);//top
	
	CGContextAddLineToPoint (context, 90.0, 280.0); //left
	
	CGContextAddLineToPoint (context, 156.0, 270.0); //rite
	
	 
	
	CGContextClosePath (context);
	
	[[UIColor redColor] setFill]; 
	//[[UIColor blackColor] setStroke]; 
	
	CGContextDrawPath (context, kCGPathFillStroke);
	

	
	
	
}


- (void)dealloc {
    [super dealloc];
}


@end
