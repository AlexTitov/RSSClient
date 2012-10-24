//
//  FeedsViewController.m
//  RSSClient
//
//  Created by Mac on 20.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedsViewController.h"

@interface FeedsViewController()

@property (nonatomic, strong) NSMutableArray *feeds;

@end

@implementation FeedsViewController

@synthesize feeds = _feeds;

- (void)dealloc
{
    [_feeds release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        _feeds = [[NSMutableArray alloc] initWithObjects:
                  @"http://www.apple.com/pr/feeds/pr.rss", 
                  @"http://www.3dnews.ru/news/rss",
                  @"http://www.overclockers.ru/rss/all.rss",
                  nil];
    }
    
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"RSS feeds";
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)] autorelease];
}

- (void)add
{
    AddViewController *add = [[[AddViewController alloc] init] autorelease];
    add.delegate = self;
    [self.navigationController pushViewController:add animated:YES];
}

#pragma mark - 
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_feeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"] autorelease];
    }
    
    cell.textLabel.text = [_feeds objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - 
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemsViewController *items = [[[ItemsViewController alloc] initWithStyle:UITableViewStylePlain andURLString:[_feeds objectAtIndex:indexPath.row]] autorelease];
    
    [self.navigationController pushViewController:items animated:YES];
}

#pragma mark - 
#pragma mark - AddViewControllerDelegate

- (void)addViewController:(AddViewController *)controller didGetFeed:(NSString *)newFeed
{
    [_feeds addObject:newFeed];
    [self.tableView reloadData];
}

@end
