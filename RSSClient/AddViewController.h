//
//  AddViewController.h
//  RSSClient
//
//  Created by Mac on 24.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AddViewController;

@protocol AddViewControllerDelegate <NSObject>

- (void)addViewController:(AddViewController *)controller didGetFeed:(NSString *)newFeed;

@end

@interface AddViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, assign) id<AddViewControllerDelegate> delegate;

@end
