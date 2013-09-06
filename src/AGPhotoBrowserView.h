//
//  AGPhotoBrowserView.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AGPhotoBrowserDelegate.h"
#import "AGPhotoBrowserDataSource.h"

@interface AGPhotoBrowserView : UIView

@property (nonatomic, weak) id<AGPhotoBrowserDelegate> delegate;
@property (nonatomic, weak) id<AGPhotoBrowserDataSource> dataSource;

@property (nonatomic, strong, readonly) UIButton *doneButton;

- (void)show;
- (void)showFromIndex:(NSInteger)initialIndex;
- (void)hideWithCompletion:( void (^) (BOOL finished) )completionBlock;

@end
