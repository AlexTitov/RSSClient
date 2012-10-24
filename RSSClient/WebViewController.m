//
//  WebViewController.m
//  RSSClient
//
//  Created by Mac on 23.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController()

@property (nonatomic, strong) NSString *urlString;

@end

@implementation WebViewController

@synthesize urlString = _urlString;

- (id)initWithURLString:(NSString *)urlString
{
    self = [super init];
    
    if (self) {
        _urlString = urlString;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = _urlString;
    
    UIWebView *webView = [[[UIWebView alloc] initWithFrame:self.view.bounds] autorelease];
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:_urlString];
    NSURLRequest *request = [[[NSURLRequest alloc] initWithURL:url] autorelease];
    [webView loadRequest:request];
    [webView setScalesPageToFit:YES];
    webView.delegate = self;
}

#pragma mark - 
#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [alert show];
}

@end
