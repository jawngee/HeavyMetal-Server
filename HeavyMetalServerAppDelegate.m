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
	
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  [@"~/DropBox/Projects/jssites/" stringByExpandingTildeInPath] ,@"applicationDir",
						  nil ]; // terminate the list
	
	[[NSUserDefaults standardUserDefaults] registerDefaults:dict];	
	
	app=[[HMServerApplication alloc] init];
}

@end
