//
//  AGPhotoBrowserViewController.h
//  AGPhotoBrowser
//
//  Created by Hellrider on 6/22/15.
//  Copyright (c) 2015 Andrea Giavatto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGPhotoBrowserDelegate.h"
#import "AGPhotoBrowserDataSource.h"

@interface AGPhotoBrowserViewController : UIViewController

@property (nonatomic, weak) id<AGPhotoBrowserDelegate> delegate;
@property (nonatomic, weak) id<AGPhotoBrowserDataSource> dataSource;

@property (nonatomic, assign) NSUInteger initialIndex;
@property (nonatomic, weak, readonly) IBOutlet UIButton *doneButton;

@end
