//
//  HMRequest.h
//  JSServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface HMRequest : NSObject 
{
	NSDictionary *query;
}

-(id)initWithQuery:(NSDictionary *)data;
-(NSString *)value:(NSString *)key;

@end
