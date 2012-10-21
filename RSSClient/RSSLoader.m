//
//  RSSLoader.m
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSLoader.h"

@interface RSSLoader()

@property (nonatomic, strong) NSMutableData *rssData;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) RSSParser *rssparser;

@end

@implementation RSSLoader

@synthesize delegate = _delegate;
@synthesize rssData = _rssData;
@synthesize connection = _connection;
@synthesize rssparser = _rssparser;

- (id)initWithURLString:(NSString *)urlString
{
    self = [super init];
    
    if (self) {
        _rssData = [NSMutableData new];
//        _rssparser = [RSSParser new];
//        _rssparser.delegate = self;
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [[[NSURLRequest alloc] initWithURL:url] autorelease];
        _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    }
    
    return self;
}

#pragma mark - 
#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_rssData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _rssparser = [RSSParser new];
    _rssparser.delegate = self;
    [_rssparser parseWithData:_rssData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSString *errorString = [NSString stringWithFormat:@"Connection failed: %@", [error localizedDescription]];
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [alert show];
}

#pragma mark - 
#pragma mark - RSSParserDelegate

- (void)RSSParser:(RSSParser *)parser didParseItems:(NSArray *)items
{
    [_delegate RSSLoader:self didLoadItems:items];
}

@end
