//
//  AGPhotoBrowserControllerTransitioningDelegate.h
//
//  Created by Andrea Giavatto on 03/12/2014.
//  Copyright (c) 2014 Andrea Giavatto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGPhotoBrowserControllerTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

- (instancetype)initWithAnimator:(id<UIViewControllerAnimatedTransitioning>)animator;

@end
