//
//  AppDelegate.m
//  JNWLabelDemo
//
//  Created by Jonathan Willing on 4/12/13.
//  Copyright (c) 2013 AppJon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)awakeFromNib {
	NSColor *backgroundColor = [NSColor colorWithCalibratedWhite:0.635 alpha:1.000];
	self.window.backgroundColor = backgroundColor;
	
	[self setupSingleLineLabel];
	[self setupMultiLineLabel];
}

- (void)setupSingleLineLabel {
	self.label.text = @"Ooh! It's shiny.";
	self.label.textAlignment = NSCenterTextAlignment;
	self.label.font = [NSFont boldSystemFontOfSize:17];
	self.label.textColor = [NSColor colorWithCalibratedWhite:0.2f alpha:1.f];
	
	// This turns on font smoothing.
	self.label.backgroundColor = [NSColor colorWithCalibratedWhite:0.635 alpha:1.000];
	self.label.drawsBackground = YES;
	
	self.label.shadowColor = [NSColor colorWithCalibratedWhite:0.8f alpha:1.f];
	self.label.shadowRadius = 1.f;
	self.label.shadowOffset = CGSizeMake(0.f, 1.f);
}

- (void)setupMultiLineLabel {
	self.label2.text = @"This is a fairly long string of text. It should wrap, really. Oh, it does!";
	self.label2.font = [NSFont fontWithName:@"Helvetica" size:15.f];
	self.label2.textAlignment = NSCenterTextAlignment;
	self.label2.wraps = YES;
}

@end
