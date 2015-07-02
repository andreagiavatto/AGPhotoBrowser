//
//  AGPhotoBrowserCell.m
//  AGPhotoBrowser
//
//  Created by Andrea Giavatto on 1/5/14.
//  Copyright (c) 2014 Andrea Giavatto. All rights reserved.
//

#import "AGPhotoBrowserCell.h"
#import "AGPhotoBrowserZoomableView.h"

@interface AGPhotoBrowserCell () <AGPhotoBrowserZoomableViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) AGPhotoBrowserZoomableView *zoomableView;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation AGPhotoBrowserCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupCell];
	}
	
	return self;
}

#pragma mark - Getters

- (AGPhotoBrowserZoomableView *)zoomableView
{
	if (!_zoomableView) {
		_zoomableView = [[AGPhotoBrowserZoomableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
		_zoomableView.userInteractionEnabled = YES;
        _zoomableView.zoomableDelegate = self;
		
		[_zoomableView addGestureRecognizer:self.panGestureRecognizer];
        
		CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2);
		CGPoint origin = _zoomableView.frame.origin;
		_zoomableView.transform = transform;
        CGRect frame = _zoomableView.frame;
        frame.origin = origin;
        _zoomableView.frame = frame;
	}
	
	return _zoomableView;
}

- (UIPanGestureRecognizer *)panGestureRecognizer
{
    if (!_panGestureRecognizer) {
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_imageViewPanned:)];
		_panGestureRecognizer.delegate = self;
		_panGestureRecognizer.maximumNumberOfTouches = 1;
		_panGestureRecognizer.minimumNumberOfTouches = 1;
    }
    
    return _panGestureRecognizer;
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.panGestureRecognizer) {
        UIView *imageView = [gestureRecognizer view];
        CGPoint translation = [gestureRecognizer translationInView:[imageView superview]];
        
        // -- Check for horizontal gesture
        if (fabs(translation.x) > fabs(translation.y)) {
            return YES;
        }
    }
	
    return NO;
}


#pragma mark - Setters

- (void)setCellImage:(UIImage *)cellImage
{
	[self.zoomableView setImage:cellImage];
	
	[self setNeedsUpdateConstraints];
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
	
	NSDictionary *constrainedViews = NSDictionaryOfVariableBindings(_zoomableView);
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_zoomableView]|" options:0 metrics:@{} views:constrainedViews]];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_zoomableView]|" options:0 metrics:@{} views:constrainedViews]];
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
