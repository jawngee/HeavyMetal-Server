//
//  HMResponse.m
//  JSServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HMResponse.h"


@implementation HMResponse

@synthesize responseBody;

-(id)initWithResponse:(NSObject<HTTPResponse> *)theResponse
{
	if ((self=[super init]))
	{
		responseBody=[[[NSMutableData alloc] init] retain];
		response=[theResponse retain];
	}
	
	return self;
}

-(void)write:(NSString *)theString
{
	[responseBody appendData:[theString dataUsingEncoding:NSUTF8StringEncoding]];
}

-(void)dealloc
{
	[responseBody release];
	[response release];
	
	[super dealloc];
}

@end
