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

#import "JNWLabel.h"
#import "JNWLabel+Accessibility.h"
#import <QuartzCore/QuartzCore.h>

@interface JNWTextLayer : CATextLayer
@property (nonatomic, strong) NSColor *shadowColor;
@property (nonatomic, strong) NSColor *backgroundFillColor;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, assign) CGFloat shadowRadius;
@property (nonatomic, assign) BOOL drawsBackground;
@end

@implementation JNWTextLayer

- (void)drawInContext:(CGContextRef)ctx {
	CGContextSaveGState(ctx);
	
	if (self.drawsBackground && self.backgroundFillColor != nil) {
		CGContextSetFillColorWithColor(ctx, self.backgroundFillColor.CGColor);
		CGContextFillRect(ctx, self.bounds);
		
		CGContextSetShouldSmoothFonts(ctx, YES);
		CGContextSetAllowsAntialiasing(ctx, YES);
		CGContextSetAllowsFontSubpixelPositioning(ctx, YES);
		CGContextSetAllowsFontSubpixelQuantization(ctx, YES);
	}
	
	CGContextSetShadowWithColor(ctx, self.shadowOffset, self.shadowRadius, self.shadowColor.CGColor);
	[super drawInContext:ctx];
	
	CGContextRestoreGState(ctx);
}

@end

@interface JNWLabel()
@property (nonatomic, strong) JNWTextLayer *layer;
@end

@implementation JNWLabel
@dynamic layer;

- (void)setup {
	self.layer = [JNWTextLayer layer];
	self.layer.delegate = self;
	self.wantsLayer = YES;
	
	self.textColor = [NSColor blackColor];
	self.font = [NSFont systemFontOfSize:[NSFont systemFontSize]];
	self.textAlignment = NSLeftTextAlignment;
	
	self.shadowColor = [NSColor clearColor];
	self.shadowOffset = CGSizeZero;
	self.shadowRadius = 0.f;
	
	self.drawsBackground = NO;
	self.backgroundColor = [NSColor whiteColor];
	
	self.wraps = NO;
	self.truncationMode = JNWLabelTruncationModeNone;
}

- (id)initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];
	[self setup];
	return self;
}

- (void)viewDidChangeBackingProperties {
	self.layer.contentsScale = self.window.backingScaleFactor;
}

- (void)setFont:(NSFont *)font {
	if (font != nil && _font != font) {
		_font = font;
		self.layer.font = (__bridge CFTypeRef)(font);
		self.layer.fontSize = font.pointSize;
	}
}

- (void)setText:(NSString *)text {
	if (_text != text) {
		_text = text;
		self.layer.string = text;
	}
}

- (void)setTextColor:(NSColor *)textColor {
	if (_textColor != textColor) {
		_textColor = textColor;
		self.layer.foregroundColor = textColor.CGColor;
	}
}

- (void)setShadowColor:(NSColor *)shadowColor {
	self.layer.shadowColor = shadowColor;
}

- (NSColor *)shadowColor {
	return self.layer.shadowColor;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
	self.layer.shadowOffset = shadowOffset;
}

- (CGSize)shadowOffset {
	return self.layer.shadowOffset;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
	self.layer.shadowRadius = shadowRadius;
}

- (CGFloat)shadowRadius {
	return self.layer.shadowRadius;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
	NSString *alignment = nil;
	
	switch (textAlignment) {
		case NSLeftTextAlignment:
			alignment = kCAAlignmentLeft;
			break;
		case NSCenterTextAlignment:
			alignment = kCAAlignmentCenter;
			break;
		case NSRightTextAlignment:
			alignment = kCAAlignmentRight;
			break;
		case NSJustifiedTextAlignment:
			alignment = kCAAlignmentJustified;
			break;
		case NSNaturalTextAlignment:
			alignment = kCAAlignmentNatural;
			break;
		default:
			break;
	}
	
	self.layer.alignmentMode = alignment;
}

- (void)setDrawsBackground:(BOOL)drawsBackground {
	self.layer.drawsBackground = drawsBackground;
}

- (BOOL)drawsBackground {
	return self.layer.drawsBackground;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor {
	self.layer.backgroundFillColor = backgroundColor;
}

- (NSColor *)backgroundColor {
	return self.layer.backgroundFillColor;
}

- (void)setWraps:(BOOL)wraps {
	_wraps = wraps;
	self.layer.wrapped = wraps;
}

- (void)setTruncationMode:(JNWLabelTruncationMode)truncationMode {
	_truncationMode = truncationMode;
	
	switch (truncationMode) {
		case JNWLabelTruncationModeNone:
			self.layer.truncationMode = kCATruncationNone;
			break;
		case JNWLabelTruncationModeStart:
			self.layer.truncationMode = kCATruncationStart;
			break;
		case JNWLabelTruncationModeMiddle:
			self.layer.truncationMode = kCATruncationMiddle;
			break;
		case JNWLabelTruncationModeEnd:
			self.layer.truncationMode = kCATruncationEnd;
			break;
		default:
			break;
	}
}

// We do not want any animations by default.
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
	return (id<CAAction>)[NSNull null];
}

@end
