//
//  HeavyMetalServerAppDelegate.m
//  HeavyMetalServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HeavyMetalServerAppDelegate.h"

@implementation HeavyMetalServerAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	app=[[HMServerApplication alloc] init];
}

@end
