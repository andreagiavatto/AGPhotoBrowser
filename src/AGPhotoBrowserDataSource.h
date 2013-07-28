//
//  AGPhotoBrowserDataSource.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AGPhotoBrowserDataSource <NSObject>

- (NSInteger)numberOfPhotos;
- (UIImage *)imageAtIndex:(NSInteger)index;

@optional
- (NSString *)titleForImageAtIndex:(NSInteger)index;
- (NSString *)descriptionForImageAtIndex:(NSInteger)index;

@end
