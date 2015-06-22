//
//  AGPhotoBrowserViewController.m
//  AGPhotoBrowser
//
//  Created by Hellrider on 6/22/15.
//  Copyright (c) 2015 Andrea Giavatto. All rights reserved.
//

#import "AGPhotoBrowserViewController.h"
#import "AGPhotoBrowserCell.h"

@interface AGPhotoBrowserViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate, AGPhotoBrowserCellDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak, readwrite) IBOutlet UIButton *doneButton;

@end

@implementation AGPhotoBrowserViewController

static NSString *kAGPhotoBrowserCellReuseIdentifier = @"kAGPhotoBrowserCellReuseIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	layout.minimumInteritemSpacing = 0.0;
	layout.minimumLineSpacing = 0.0;
	
	self.collectionView.collectionViewLayout = layout;
	[self.collectionView registerClass:[AGPhotoBrowserCell class] forCellWithReuseIdentifier:kAGPhotoBrowserCellReuseIdentifier];
}

#pragma mark - Public methods

- (IBAction)doneButtonTapped:(UIButton *)sender
{
	if ([self.delegate respondsToSelector:@selector(photoBrowser:didTapOnDoneButton:)]) {
		[self.delegate photoBrowser:self didTapOnDoneButton:sender];
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [self.dataSource numberOfPhotosForPhotoBrowser:self];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell<AGPhotoBrowserCellProtocol> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAGPhotoBrowserCellReuseIdentifier forIndexPath:indexPath];
	
	cell.delegate = self;
	
	[self configureCell:cell forRowAtIndexPath:indexPath];
//	[self.overlayView resetOverlayView];
	
	return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//	self.displayingDetailedView = !self.isDisplayingDetailedView;
}

#pragma mark - UICollectionViewFlowLayoutDelegate 

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return self.view.bounds.size;
}

#pragma mark - AGPhotoBrowserCellDelegate

- (void)didDoubleTapOnZoomableViewForCell:(id<AGPhotoBrowserCellProtocol>)cell
{
	
}

- (void)didPanOnZoomableViewForCell:(id<AGPhotoBrowserCellProtocol>)cell withRecognizer:(UIPanGestureRecognizer *)recognizer
{
	
}

#pragma mark - Private methods

- (void)configureCell:(UICollectionViewCell<AGPhotoBrowserCellProtocol> *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([cell respondsToSelector:@selector(resetZoomScale)]) {
		[cell resetZoomScale];
	}
	
	[cell setCellImage:[self.dataSource photoBrowser:self imageAtIndex:indexPath.row]];
}

@end
