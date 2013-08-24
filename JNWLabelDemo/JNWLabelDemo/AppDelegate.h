//
//  AppDelegate.h
//  JNWLabelDemo
//
//  Created by Jonathan Willing on 4/12/13.
//  Copyright (c) 2013 AppJon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JNWLabel.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, assign) IBOutlet JNWLabel *label;
@property (nonatomic, assign) IBOutlet JNWLabel *label2;
@property (nonatomic, assign) IBOutlet NSWindow *window;

@end
