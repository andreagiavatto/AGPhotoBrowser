//
//  AGPhotoBrowserCellDelegate.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 1/5/14.
//  Copyright (c) 2014 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AGPhotoBrowserCellProtocol;


@protocol AGPhotoBrowserCellDelegate <NSObject>

- (void)didDoubleTapOnZoomableViewForCell:(id<AGPhotoBrowserCellProtocol>)cell;
- (void)didPanOnZoomableViewForCell:(id<AGPhotoBrowserCellProtocol>)cell withRecognizer:(UIPanGestureRecognizer *)recognizer;

@end


@protocol AGPhotoBrowserCellProtocol <NSObject>

@property (nonatomic, weak) id<AGPhotoBrowserCellDelegate> delegate;
- (void)setCellImage:(UIImage *)image;

@optional
- (void)resetZoomScale;
- (void)setCellImageWithURL:(NSURL *)url;

@end
