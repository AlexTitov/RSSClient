//
//  ItemsViewController.m
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController()

@property (nonatomic, strong) RSSLoader *loader;
@property (nonatomic, strong) NSArray *items;

@end

@implementation ItemsViewController

@synthesize loader = _loader;
@synthesize items = _items;

- (void)dealloc
{
    [_items release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style andURLString:(NSString *)urlString
{
    self = [super initWithStyle:style];
    
    if (self) {
        _items = [NSArray new];
        _loader = [[RSSLoader alloc] initWithURLString:urlString];
        _loader.delegate = self;
        [_loader.connection start];
    }
    
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"RSS items";
}

#pragma mark - 
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    cell.textLabel.text = [[_items objectAtIndex:indexPath.row] title];
    cell.detailTextLabel.text = [[_items objectAtIndex:indexPath.row] pubDate];
    
    return cell;
}

#pragma mark - 
#pragma mark - RSSLoaderDelegate

- (void)RSSLoader:(RSSLoader *)loader didLoadItems:(NSArray *)items
{
    _items = [items retain];
    [self.tableView reloadData];
}

@end
