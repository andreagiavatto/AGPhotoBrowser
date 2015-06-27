//
//  AGPhotoBrowserControllerTransitioningDelegate.h
//
//  Created by Andrea Giavatto on 03/12/2014.
//  Copyright (c) 2014 Andrea Giavatto. All rights reserved.
//

#import "AGPhotoBrowserControllerTransitioningDelegate.h"
#import "AGCustomAnimation.h"

@interface AGPhotoBrowserControllerTransitioningDelegate ()

@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> animator;

@end

@implementation AGPhotoBrowserControllerTransitioningDelegate

- (instancetype)initWithAnimator:(id<UIViewControllerAnimatedTransitioning>)animator {
	
	NSParameterAssert(animator);
	
	self = [super init];
    if (self) {
        
        _animator = animator;
    }
    
    return self;
}

- (instancetype)init {
    
    return [self initWithAnimator:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
	
    return self.animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    id<UIViewControllerAnimatedTransitioning> dismissingAnimation = self.animator;
	if ([dismissingAnimation conformsToProtocol:@protocol(AGCustomAnimation)]) {
		((id<AGCustomAnimation>)dismissingAnimation).reverse = YES;
	}
	return dismissingAnimation;
}

@end
