//
//  AGPhotoBrowserDataSource.h
//  AGPhotoBrowser
//
//  Created by Andrea Giavatto on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AGPhotoBrowserCellProtocol.h"

@protocol AGPhotoBrowserDataSource <NSObject>

- (NSInteger)numberOfPhotosForPhotoBrowser:(AGPhotoBrowserViewController *)viewController;

@optional
- (UIImage *)photoBrowser:(AGPhotoBrowserViewController *)viewController imageAtIndex:(NSInteger)index;
- (NSString *)photoBrowser:(AGPhotoBrowserViewController *)viewController URLStringForImageAtIndex:(NSInteger)index;
- (NSString *)photoBrowser:(AGPhotoBrowserViewController *)viewController titleForImageAtIndex:(NSInteger)index;
- (NSString *)photoBrowser:(AGPhotoBrowserViewController *)viewController descriptionForImageAtIndex:(NSInteger)index;
- (BOOL)photoBrowser:(AGPhotoBrowserViewController *)viewController willDisplayActionButtonAtIndex:(NSInteger)index;

@end
