//
//  AGPhotoBrowserDataSource.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AGPhotoBrowserCellProtocol.h"

@protocol AGPhotoBrowserDataSource <NSObject>

- (NSInteger)numberOfPhotosForPhotoBrowser:(AGPhotoBrowserView *)photoBrowser;

@optional
- (UIImage *)photoBrowser:(AGPhotoBrowserView *)photoBrowser imageAtIndex:(NSInteger)index;
- (UITableViewCell<AGPhotoBrowserCellProtocol> *)cellForBrowser:(AGPhotoBrowserView *)browser withReuseIdentifier:(NSString *)reuseIdentifier;
- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser URLStringForImageAtIndex:(NSInteger)index;
- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser titleForImageAtIndex:(NSInteger)index;
- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser descriptionForImageAtIndex:(NSInteger)index;
- (BOOL)photoBrowser:(AGPhotoBrowserView *)photoBrowser willDisplayActionButtonAtIndex:(NSInteger)index;

@end
