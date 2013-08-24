/*
 Copyright (c) 2013, Jonathan Willing. All rights reserved.
 Licensed under the MIT license <http://opensource.org/licenses/MIT>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
 documentation files (the "Software"), to deal in the Software without restriction, including without limitation
 the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
 to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 IN THE SOFTWARE.
 */

typedef NS_ENUM(NSInteger, JNWLabelTruncationMode) {
	JNWLabelTruncationModeNone, // does not truncate
	JNWLabelTruncationModeStart, // truncates the beginning
	JNWLabelTruncationModeMiddle, // truncates the middle
	JNWLabelTruncationModeEnd // truncates the end
};

#import <Foundation/Foundation.h>

// A light-weight wrapper around CATextLayer.
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

// Determines whether or not the layer will attempt to wrap the text
// to fit text that would draw outside the current bounds.
//
// Defaults to NO.
@property (nonatomic, assign) BOOL wraps;

// Determines the behavior of the text wrapping, if enabled.
//
// Defaults to JNWLabelTruncationModeNone.
@property (nonatomic, assign) JNWLabelTruncationMode truncationMode;

@end
