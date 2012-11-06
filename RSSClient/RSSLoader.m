//
//  RSSLoader.m
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSLoader.h"

@interface RSSLoader()

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *rssData;
@property (nonatomic, strong) RSSParser *rssparser;

@end

@implementation RSSLoader

@synthesize delegate = _delegate;
@synthesize urlString = _urlString;
@synthesize connection = _connection;
@synthesize rssData = _rssData;
@synthesize rssparser = _rssparser;

- (id)initWithURLString:(NSString *)urlString
{
    self = [super init];
    
    if (self) {
        _rssData = [NSMutableData new];
        _rssparser = [RSSParser new];
        _rssparser.delegate = self;
        _urlString = urlString;
    }
    
    return self;
}

- (void)startLoading
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURL *url = [NSURL URLWithString:_urlString];
    NSURLRequest *request = [[[NSURLRequest alloc] initWithURL:url] autorelease];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (void)cancelLoading
{
    [_connection cancel];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
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
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSString *errorString = [NSString stringWithFormat:@"Connection failed: %@", [error localizedDescription]];
    [_delegate RSSLoader:self connectionDidFailWithErrorString:errorString];
}

#pragma mark - 
#pragma mark - RSSParserDelegate

- (void)RSSParser:(RSSParser *)parser didParseItems:(NSArray *)items
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [_delegate RSSLoader:self didLoadItems:items];
}

@end
