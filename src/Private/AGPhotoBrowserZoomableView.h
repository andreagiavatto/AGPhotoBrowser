//
//  AGPhotoBrowserZoomableView.h
//  AGPhotoBrowser
//
//  Created by Dimitris-Sotiris Tsolis on 24/11/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGPhotoBrowserZoomableView;

@protocol AGPhotoBrowserZoomableViewDelegate <NSObject>

- (void)didDoubleTapZoomableView:(AGPhotoBrowserZoomableView *)zoomableView;

@end


@interface AGPhotoBrowserZoomableView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, weak) id<AGPhotoBrowserZoomableViewDelegate> zoomableDelegate;
@property (nonatomic, strong, readonly) UIImageView *imageView;

- (void)setImage:(UIImage *)image;

@end
