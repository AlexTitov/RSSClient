//
//  RSSClientAppDelegate.m
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSClientAppDelegate.h"

@implementation RSSClientAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    FeedsViewController *root = [[FeedsViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:root];
    
    [root release];
    
    self.window.rootViewController = navController;
    
    [navController release];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
