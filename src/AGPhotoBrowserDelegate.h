//
//  AGPhotoBrowserDelegate.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGPhotoBrowserView;

@protocol AGPhotoBrowserDelegate <NSObject>

@optional

- (void)photoBrowser:(AGPhotoBrowserView *)photoBrowser didTapOnDoneButton:(UIButton *)doneButton;
- (void)photoBrowser:(AGPhotoBrowserView *)photoBrowser didTapOnActionButton:(UIButton *)actionButton atIndex:(NSInteger)index;

@end
