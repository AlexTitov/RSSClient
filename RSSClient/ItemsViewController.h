//
//  ItemsViewController.h
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSLoader.h"

@interface ItemsViewController : UITableViewController <RSSLoaderDelegate>

- (id)initWithStyle:(UITableViewStyle)style andURLString:(NSString *)urlString;

@end
