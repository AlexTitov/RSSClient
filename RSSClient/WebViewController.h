//
//  WebViewController.h
//  RSSClient
//
//  Created by Mac on 23.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

- (id)initWithURLString:(NSString *)urlString;

@end
