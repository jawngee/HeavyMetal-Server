//
//  JSHTTPConnection.m
//  JSServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HMHTTPConnection.h"
#import "HTTPResponse.h"
#import "HTTPAsyncFileResponse.h"

#import "HMServerApplication.h"
#import "HMHTTPResponse.h"

#import "HMRequest.h"
#import "HMResponse.h"

#import "JSCocoa.h"

@implementation HMHTTPConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
	NSArray *parsedMethod=[path componentsSeparatedByString:@"?"];
	NSMutableDictionary *query=[[NSMutableDictionary alloc] init];
	if ([parsedMethod count]==2)
	{
		NSArray *queryElements=[[parsedMethod objectAtIndex:1] componentsSeparatedByString:@"&"];
		for(NSString *queryElement in queryElements)
		{
			NSArray *keyvalue=[queryElement componentsSeparatedByString:@"="];
			if ([keyvalue count]==1)
				[query setObject:@"YES" forKey:[keyvalue objectAtIndex:0]];
			else	
				[query setObject:[keyvalue objectAtIndex:1] forKey:[keyvalue objectAtIndex:0]];
		}
	}
	
	NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
	
	HMRequest *req=[[HMRequest alloc] initWithQuery:query];
	HMResponse *res=[[HMResponse alloc] initWithResponse:nil];
	
	[[JSCocoa sharedController] setObject:req withName:@"request"];
	[[JSCocoa sharedController] setObject:res withName:@"response"];
	[[JSCocoa sharedController] evalJSFile:[[preferences objectForKey:@"applicationDir"] stringByAppendingString:@"/controllers/hello.js"]];
	
	HMHTTPResponse *resp=[[[HMHTTPResponse alloc] initWithData:res.responseBody] autorelease];
	
	[resp.headers addEntriesFromDictionary:res.headers];
	
	return resp;
}


@end
