//
//  HeavyMetalServerAppDelegate.h
//  HeavyMetalServer
//
//  Created by Jon Gilkison on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HMServerApplication.h"

@interface HeavyMetalServerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	HMServerApplication *app;
}

@property (assign) IBOutlet NSWindow *window;

@end
