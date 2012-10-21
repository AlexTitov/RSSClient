//
//  RSSItem.h
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *pubDate;

@end
