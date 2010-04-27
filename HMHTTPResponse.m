//
//  HMHTTPResponse.m
//  HeavyMetalServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HMHTTPResponse.h"


@implementation HMHTTPResponse

@synthesize headers;

- (id)initWithData:(NSData *)dataParam
{
	if((self = [super initWithData:dataParam]))
	{
		headers=[[[NSMutableDictionary alloc] init] retain];
	}
	return self;
}

- (NSDictionary *)httpHeaders
{
	return headers;
}

-(void)dealloc
{
	[headers release];
	[super dealloc];
}

@end
