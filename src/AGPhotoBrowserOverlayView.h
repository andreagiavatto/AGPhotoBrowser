//
//  AGPhotoBrowserOverlayView.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import <UIKit/UIKit.h>

static const float AGPhotoBrowserAnimationDuration = 0.25;
static const int AGPhotoBrowserOverlayInitialHeight	= 120;

@class AGPhotoBrowserOverlayView;

@protocol AGPhotoBrowserOverlayViewDelegate <NSObject>

- (void)sharingView:(AGPhotoBrowserOverlayView *)sharingView didTapOnActionButton:(UIButton *)actionButton;
@optional
- (void)sharingView:(AGPhotoBrowserOverlayView *)sharingView didTapOnSeeMoreButton:(UIButton *)actionButton;

@end

@interface AGPhotoBrowserOverlayView : UIView

@property (nonatomic, weak) id<AGPhotoBrowserOverlayViewDelegate> delegate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, strong, readonly) UIButton *actionButton;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *descriptionLabel;

@property (nonatomic, assign, readonly, getter = isVisible) BOOL visible;

- (void)showOverlayAnimated:(BOOL)animated;
- (void)hideOverlayAnimated:(BOOL)animated;

- (void)resetOverlayView;

@end
