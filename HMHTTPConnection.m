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

#import "HMRequest.h"
#import "HMResponse.h"

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
	
	HMRequest *req=[[HMRequest alloc] initWithQuery:query];
	HMResponse *res=[[HMResponse alloc] initWithResponse:nil];
	
	[[HMServerApplication jsEngine] setObject:req withName:@"request"];
	[[HMServerApplication jsEngine] setObject:res withName:@"response"];
	[[HMServerApplication jsEngine] evalJSFile:[@"~/DropBox/Projects/jssites/hello.js" stringByExpandingTildeInPath]];
	
	return [[[HTTPDataResponse alloc] initWithData:res.responseBody] autorelease];
}


@end
