//
//  JNWLabel.h
//  JNWLabel
//
//  Created by Jonathan Willing on 4/12/13.
//  Copyright (c) 2013 AppJon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNWLabel : NSView

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSFont *font;
@property (nonatomic, strong) NSColor *textColor;

@property (nonatomic, strong) NSColor *shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, assign) CGFloat shadowRadius;

@property (nonatomic, assign) BOOL drawsBackground;
@property (nonatomic, strong) NSColor *backgroundColor;

@property (nonatomic, assign) NSTextAlignment textAlignment;

@end
