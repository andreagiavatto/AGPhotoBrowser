//
//  AGFadeInOutAnimator.h
//
//  Created by Andrea Giavatto on 5/4/15.
//  Copyright (c) 2015 Andrea Giavatto. All rights reserved.
//

#import "AGPhotoBrowserFadeInOutAnimator.h"

@implementation AGPhotoBrowserFadeInOutAnimator

@synthesize reverse;

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
	return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)context
{
	UIViewController *fromViewController = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
	UIViewController *toViewController = [context viewControllerForKey:UITransitionContextToViewControllerKey];
	UIView *inView = [context containerView];
	UIView *toView = [toViewController view];

	if (!reverse) {
		
		toView.alpha = 0.0;
		[inView addSubview:toView];
		
		NSTimeInterval duration = [self transitionDuration:context];
		
		[UIView animateWithDuration:duration
						 animations:^{
							 
							 toView.alpha = 1.0;
							 
						 } completion:^(BOOL finished) {
							 
							 [context completeTransition:finished];
						 }];
	} else {
		
		[inView insertSubview:toView belowSubview:fromViewController.view];
		
		NSTimeInterval duration = [self transitionDuration:context];
		
		[UIView animateWithDuration:duration
						 animations:^{
							 
							 fromViewController.view.alpha = 0.0;
							 
						 } completion:^(BOOL finished) {
							 
							 [context completeTransition:finished];
						 }];
	}
}

@end
