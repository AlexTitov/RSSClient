//
//  RSSLoader.h
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSParser.h"

@class RSSLoader;

@protocol RSSLoaderDelegate <NSObject>

- (void)RSSLoader:(RSSLoader *)loader didLoadItems:(NSArray *)items;

@end

@interface RSSLoader : NSObject <NSURLConnectionDataDelegate, RSSParserDelegate>

@property (nonatomic, assign) id<RSSLoaderDelegate> delegate;
@property (nonatomic, strong) NSURLConnection *connection;

- (id)initWithURLString:(NSString *)urlString;

@end
