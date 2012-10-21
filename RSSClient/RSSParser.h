//
//  RSSParser.h
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSItem.h"

@class RSSParser;

@protocol RSSParserDelegate <NSObject>

- (void)RSSParser:(RSSParser *)parser didParseItems:(NSArray *)items;

@end

@interface RSSParser : NSObject <NSXMLParserDelegate>

@property (nonatomic, assign) id<RSSParserDelegate> delegate;

- (void)parseWithData:(NSData *)data;

@end
