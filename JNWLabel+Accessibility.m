//
//  JNWLabel+Accessibility.m
//  JNWLabelDemo
//
//  Created by Jonathan Willing on 4/12/13.
//  Copyright (c) 2013 AppJon. All rights reserved.
//

#import "JNWLabel+Accessibility.h"

@implementation JNWLabel (Accessibility)

- (BOOL)accessibilityIsIgnored {
	return NO;
}

- (NSArray *)accessibilityAttributeNames {
	static NSMutableArray *attributes = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		attributes = [[super accessibilityAttributeNames] mutableCopy];
		NSArray *additionalAttributes = @[NSAccessibilityRoleAttribute,
									NSAccessibilityValueAttribute,
									NSAccessibilityNumberOfCharactersAttribute,
									NSAccessibilityVisibleCharacterRangeAttribute];
		for (NSString *attribute in additionalAttributes) {
			if (![attributes containsObject:attributes]) {
				[attributes addObject:attribute];
			}
		}
	});
	
	return attributes;
}

- (id)accessibilityAttributeValue:(NSString *)attribute {
	if ([attribute isEqualToString:NSAccessibilityRoleAttribute]) {
		return NSAccessibilityStaticTextRole;
	} else if ([attribute isEqualToString:NSAccessibilityValueAttribute]) {
		return self.text;
	} else if ([attribute isEqualToString:NSAccessibilityNumberOfCharactersAttribute]) {
		return @(self.text.length);
	} else if ([attribute isEqualToString:NSAccessibilityVisibleCharacterRangeAttribute]) {
		return [NSValue valueWithRange:NSMakeRange(0, self.text.length)];
	} else {
		return [super accessibilityAttributeValue:attribute];
	}
}

@end
