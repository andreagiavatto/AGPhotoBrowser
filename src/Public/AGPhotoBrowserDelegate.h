//
//  AGPhotoBrowserDelegate.h
//  AGPhotoBrowser
//
//  Created by Andrea Giavatto on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGPhotoBrowserViewController;

@protocol AGPhotoBrowserDelegate <NSObject>

@optional

- (void)photoBrowser:(AGPhotoBrowserViewController *)viewController didTapOnDoneButton:(UIButton *)doneButton;
- (void)photoBrowser:(AGPhotoBrowserViewController *)viewController didTapOnActionButton:(UIButton *)actionButton atIndex:(NSInteger)index;

@end
