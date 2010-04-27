//
//  HMHTTPResponse.h
//  HeavyMetalServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HTTPResponse.h"

@interface HMHTTPResponse : HTTPDataResponse 
{
	NSMutableDictionary *headers;
}

@property (readonly) NSMutableDictionary *headers;

- (NSDictionary *)httpHeaders;

@end
