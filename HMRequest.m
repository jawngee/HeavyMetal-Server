//
//  HMRequest.m
//  JSServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HMRequest.h"


@implementation HMRequest


-(id)initWithQuery:(NSDictionary *)data
{
	if ((self=[super init]))
	{
		query=[data retain];
	}
	
	return self;
}

-(NSString *)value:(NSString *)key
{
	return [query objectForKey:key];
}

-(void)dealloc
{
	[query release];
	[super dealloc];
}

@end
