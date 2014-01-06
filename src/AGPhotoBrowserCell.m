//
//  AGPhotoBrowserCell.m
//  AGPhotoBrowser
//
//  Created by Hellrider on 1/5/14.
//  Copyright (c) 2014 Andrea Giavatto. All rights reserved.
//

#import "AGPhotoBrowserCell.h"
#import "AGPhotoBrowserZoomableView.h"

@interface AGPhotoBrowserCell () <AGPhotoBrowserZoomableViewDelegate>

@property (nonatomic, strong) AGPhotoBrowserZoomableView *zoomableView;

@end

@implementation AGPhotoBrowserCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setupCell];
	}
	
	return self;
}

- (void)updateConstraints
{
	[self.contentView removeConstraints:self.contentView.constraints];
	
	NSDictionary *constrainedViews = NSDictionaryOfVariableBindings(_zoomableView);
	
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_zoomableView]|"
																			 options:0
																			 metrics:@{}
																			   views:constrainedViews]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_zoomableView]|"
																			 options:0
																			 metrics:@{}
																			   views:constrainedViews]];
	
	[super updateConstraints];
}


#pragma mark - Getters

- (AGPhotoBrowserZoomableView *)zoomableView
{
	if (!_zoomableView) {
		_zoomableView = [[AGPhotoBrowserZoomableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
		_zoomableView.userInteractionEnabled = YES;
        _zoomableView.zoomableDelegate = self;
		
		UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_imageViewPanned:)];
		panGesture.delegate = self;
		panGesture.maximumNumberOfTouches = 1;
		panGesture.minimumNumberOfTouches = 1;
		[_zoomableView addGestureRecognizer:panGesture];
		_zoomableView.tag = 1;
        
		CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
		CGPoint origin = _zoomableView.frame.origin;
		_zoomableView.transform = transform;
        CGRect frame = _zoomableView.frame;
        frame.origin = origin;
        _zoomableView.frame = frame;
	}
	
	return _zoomableView;
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    UIView *imageView = [gestureRecognizer view];
    CGPoint translation = [gestureRecognizer translationInView:[imageView superview]];
	
    // -- Check for horizontal gesture
    if (fabsf(translation.x) > fabsf(translation.y)) {
        return YES;
	}
	
    return NO;
}


#pragma mark - Setters

- (void)setCellImage:(UIImage *)cellImage
{
	[self.zoomableView setImage:cellImage];
	
	[self updateConstraints];
}


#pragma mark - Public methods

- (void)resetZoomScale
{
	[self.zoomableView setZoomScale:1.];
}


#pragma mark - Private methods

- (void)setupCell
{
	[self.contentView addSubview:self.zoomableView];
}

- (void)p_imageViewPanned:(UIPanGestureRecognizer *)recognizer
{
	[self.delegate didPanOnZoomableViewForCell:self withRecognizer:recognizer];
}


#pragma mark - AGPhotoBrowserZoomableViewDelegate

- (void)didDoubleTapZoomableView:(AGPhotoBrowserZoomableView *)zoomableView
{
	[self.delegate didDoubleTapOnZoomableViewForCell:self];
}

@end
