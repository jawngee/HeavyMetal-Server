//
//  JSServerApplication.m
//  JSServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HMServerApplication.h"
#import "HMHTTPConnection.h"

@implementation HMServerApplication

static JSCocoa *jsEngine=nil;

-(id)init
{
	if ((self=[super init]))
	{
		httpServer = [[ThreadPoolServer alloc] init];
		
		[httpServer setType:@"_jsserver._tcp."];
		[httpServer setPort:8181];
		[httpServer setConnectionClass:[HMHTTPConnection class]];
		
		NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
		[httpServer setDocumentRoot:[NSURL fileURLWithPath:[preferences objectForKey:@"applicationDir"]]];
		
		NSError *error;
		BOOL success = [httpServer start:&error];
		
		if(!success)
		{
			NSLog(@"Error starting HTTP Server: %@", error);
		}
		
		[JSCocoa allocAutoreleasePool];
		
		
	}
	
	return self;
}


- (void)dealloc {
	[httpServer release];
	[jsEngine release];
	
   [super dealloc];
}

+(JSCocoa *)jsEngine
{
	return [JSCocoa sharedController];
}

@end
