//
//  RSSParser.m
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSParser.h"

@interface RSSParser()

@property (nonatomic, strong) NSXMLParser *parser;
@property (nonatomic, strong) NSString *currentElement;
@property (nonatomic, strong) NSMutableString *currentTitle;
@property (nonatomic, strong) NSMutableString *currentLink;
@property (nonatomic, strong) NSMutableString *currentPubDate;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation RSSParser

@synthesize delegate = _delegate;
@synthesize parser = _parser;
@synthesize currentElement = _currentElement;
@synthesize currentTitle = _currentTitle;
@synthesize currentLink = _currentLink;
@synthesize currentPubDate = _currentPubDate;
@synthesize items = _items;

- (id)init
{
    self = [super init];
    
    if (self) {
        _items = [NSMutableArray new];
    }
    
    return self;
}

- (void)parseWithData:(NSData *)data
{
    _parser = [[NSXMLParser alloc] initWithData:data];
    _parser.delegate = self;
    [_parser parse];
    [_delegate RSSParser:self didParseItems:_items];
}

#pragma mark - 
#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    _currentElement = elementName;
    
    if ([elementName isEqualToString:@"item"]) {
        _currentTitle = [NSMutableString string];
        _currentLink = [NSMutableString string];
        _currentPubDate = [NSMutableString string];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([_currentElement isEqualToString:@"title"]) {
        [_currentTitle appendString:string];
    }
    if ([_currentElement isEqualToString:@"link"]) {
        [_currentLink appendString:string];
    }
    if ([_currentElement isEqualToString:@"pubDate"]) {
        [_currentPubDate appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        RSSItem *item = [RSSItem new];
        item.title = _currentTitle;
        item.link = _currentLink;
        item.pubDate = _currentPubDate;
        [_items addObject:item];
        [item release];
    }
}

@end
