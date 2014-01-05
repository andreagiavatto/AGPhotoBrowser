//
//  AGPhotoBrowserCellDelegate.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 1/5/14.
//  Copyright (c) 2014 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGPhotoBrowserCell;

@protocol AGPhotoBrowserCellDelegate <NSObject>

- (void)didDoubleTapOnZoomableViewForCell:(AGPhotoBrowserCell *)cell;
- (void)didPanOnZoomableViewForCell:(AGPhotoBrowserCell *)cell withRecognizer:(UIPanGestureRecognizer *)recognizer;

@end
