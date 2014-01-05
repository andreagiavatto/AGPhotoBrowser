//
//  AGPhotoBrowserCell.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 1/5/14.
//  Copyright (c) 2014 Andrea Giavatto. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AGPhotoBrowserCellDelegate.h"

@interface AGPhotoBrowserCell : UITableViewCell

@property (nonatomic, weak) id<AGPhotoBrowserCellDelegate> delegate;
@property (nonatomic, strong) UIImage *zoomableImage;

- (void)resetZoomScale;

@end
