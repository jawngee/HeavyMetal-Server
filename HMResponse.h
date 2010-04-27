//
//  HMResponse.h
//  JSServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HTTPResponse.h"

@interface HMResponse : NSObject 
{
	NSObject<HTTPResponse> *response;
	NSMutableData *responseBody;
	NSMutableDictionary *headers;
}

@property (readonly) NSMutableData *responseBody;
@property (readonly) NSMutableDictionary *headers;

-(id)initWithResponse:(NSObject<HTTPResponse> *)theResponse;
-(void)write:(NSString *)theString;
-(void)addHeader:(NSString*)headerName withValue:(NSString *)value;

@end
