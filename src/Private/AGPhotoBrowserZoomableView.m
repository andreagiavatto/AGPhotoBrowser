//
//  AGPhotoBrowserZoomableView.m
//  AGPhotoBrowser
//
//  Created by Dimitris-Sotiris Tsolis on 24/11/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import "AGPhotoBrowserZoomableView.h"


@interface AGPhotoBrowserZoomableView ()

@property (nonatomic, strong, readwrite) UIImageView *imageView;

@end

@implementation AGPhotoBrowserZoomableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.translatesAutoresizingMaskIntoConstraints = NO;
        self.delegate = self;
        self.imageView = [[UIImageView alloc] initWithFrame:frame];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        self.minimumZoomScale = 1.0f;
        self.maximumZoomScale = 5.0f;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(doubleTapped:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        
        [self addSubview:self.imageView];
    }
    return self;
}


#pragma mark - Public methods

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}


#pragma mark - Touch handling

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.zoomableDelegate respondsToSelector:@selector(didDoubleTapZoomableView:)]) {
        [self.zoomableDelegate didDoubleTapZoomableView:self];
    }
}


#pragma mark - Recognizer

- (void)doubleTapped:(UITapGestureRecognizer *)recognizer
{
    if (self.zoomScale > 1.0f) {
        [UIView animateWithDuration:0.35 animations:^{
            self.zoomScale = 1.0f;
        }];
    } else {
        [UIView animateWithDuration:0.35 animations:^{
            CGPoint point = [recognizer locationInView:self];
            [self zoomToRect:CGRectMake(point.x, point.y, 0, 0) animated:YES];
        }];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
