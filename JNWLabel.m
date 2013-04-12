//
//  JNWLabel.m
//  JNWLabel
//
//  Created by Jonathan Willing on 4/12/13.
//  Copyright (c) 2013 AppJon. All rights reserved.
//

#import "JNWLabel.h"
#import <QuartzCore/QuartzCore.h>

@interface JNWTextLayer : CATextLayer
@property (nonatomic, strong) NSColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, assign) CGFloat shadowRadius;
@end

@implementation JNWTextLayer

- (void)drawInContext:(CGContextRef)ctx {
	CGContextSaveGState(ctx);
	
	// TODO: Add -drawsBackground property which will let us
	// flip on font smoothing.
	
//	CGContextSetRGBFillColor(ctx, 1, 1, 1, 1.f);
//	CGContextFillRect(ctx, self.bounds);
//	CGContextSetShouldSmoothFonts(ctx, YES);
	
//	CGContextSetAllowsAntialiasing(ctx, YES);
//	CGContextSetAllowsFontSmoothing(ctx, YES);
//	CGContextSetAllowsFontSubpixelPositioning(ctx, YES);
//	CGContextSetAllowsFontSubpixelQuantization(ctx, YES);

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

// We do not want any animations by default.
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
	return (id<CAAction>)[NSNull null];
}

@end
