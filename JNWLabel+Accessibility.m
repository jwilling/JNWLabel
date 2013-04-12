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
