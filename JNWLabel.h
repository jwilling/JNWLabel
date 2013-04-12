//
//  JNWLabel.h
//  JNWLabel
//
//  Created by Jonathan Willing on 4/12/13.
//  Copyright (c) 2013 AppJon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNWLabel : NSView

// The string value of the label.
//
// Defaults to nil.
@property (nonatomic, copy) NSString *text;

// The font of the label.
//
// Defaults to the system default font and size.
@property (nonatomic, strong) NSFont *font;

// The text color of the label.
//
// Defaults to black.
@property (nonatomic, strong) NSColor *textColor;

// The shadow color of the label.
//
// Defaults to a clear color.
@property (nonatomic, strong) NSColor *shadowColor;

// The shadow offset of the label.
//
// Defaults to a zero size.
@property (nonatomic, assign) CGSize shadowOffset;

// The shadow radius of the label.
//
// Defaults to 0.
@property (nonatomic, assign) CGFloat shadowRadius;

// The text alignment of the label.
//
// Defaults to NSLeftTextAlignment.
@property (nonatomic, assign) NSTextAlignment textAlignment;


// Determines whether or not the bounds of the label is filled in with
// an opaque color. Turning this on will enable font smoothing and other
// text drawing enhancements. The text will appear to be slightly thicker.
//
// Defaults to NO.
@property (nonatomic, assign) BOOL drawsBackground;

// The background color used to fill in the bounds of the label when
// `drawsBackground` is enabled.
//
// Defaults to a white color.
@property (nonatomic, strong) NSColor *backgroundColor;


@end
