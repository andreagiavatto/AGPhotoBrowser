//
//  AGPhotoBrowserOverlayView.h
//  AGPhotoBrowser
//
//  Created by Andrea Giavatto on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat AGPhotoBrowserAnimationDuration = 0.25;
static const NSInteger AGPhotoBrowserOverlayInitialHeight = 100;

@class AGPhotoBrowserOverlayView;

@protocol AGPhotoBrowserOverlayViewDelegate <NSObject>

- (void)sharingView:(AGPhotoBrowserOverlayView *)sharingView didTapOnActionButton:(UIButton *)actionButton;
@optional
- (void)sharingView:(AGPhotoBrowserOverlayView *)sharingView didTapOnSeeMoreButton:(UIButton *)actionButton;

@end

@interface AGPhotoBrowserOverlayView : UIView

@property (nonatomic, weak) id<AGPhotoBrowserOverlayViewDelegate> delegate;

@property (nonatomic, copy) NSString *photoTitle;
@property (nonatomic, copy) NSString *photoDescription;
@property (nonatomic, strong, readonly) UIButton *actionButton;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *descriptionLabel;

@property (nonatomic, assign, readonly, getter = isVisible) BOOL visible;
@property (nonatomic, assign, readonly) BOOL descriptionExpanded;

- (void)setOverlayVisible:(BOOL)visible animated:(BOOL)animated;
- (void)resetOverlayView;

@end
