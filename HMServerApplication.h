//
//  JSServerApplication.h
//  JSServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSCocoa.h"
#import "HTTPServer.h"
#import "ThreadPoolServer.h"
#import "ThreadPerConnectionServer.h"

@interface HMServerApplication : NSObject 
{
	HTTPServer *httpServer;
}

-(id)init;

@end
