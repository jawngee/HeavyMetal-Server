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

-(IBAction)setApplicationPath:(id)sender
{
	NSOpenPanel *save = [NSOpenPanel openPanel];
	
	[save setAllowsMultipleSelection:NO];
	[save setCanChooseFiles:NO];
	[save setCanChooseDirectories:YES];
	[save setCanCreateDirectories:YES];
	
	NSInteger result=[save runModal];
	
	if (result==NSOKButton)
	{
		//		[pathField setStringValue:[save filename]];
		NSUserDefaults *preferences = [[NSUserDefaults standardUserDefaults] retain];
		[preferences setObject:[save filename] forKey:@"applicationDir"];
		[preferences synchronize];
	}
}

@end
