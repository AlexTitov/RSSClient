//
//  AddViewController.m
//  RSSClient
//
//  Created by Mac on 24.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"

@implementation AddViewController

@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *newFeed = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 280, 24)];
    newFeed.borderStyle = UITextBorderStyleRoundedRect;
    newFeed.font = [UIFont systemFontOfSize:15];
    newFeed.placeholder = @"Enter new feed";
    newFeed.delegate = self;
    
    [self.view addSubview:newFeed];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [_delegate addViewController:self didGetFeed:textField.text];
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

@end
