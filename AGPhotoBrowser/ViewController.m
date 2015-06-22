//
//  ViewController.m
//  AGPhotoBrowser
//
//  Created by Andrea Giavatto on 7/28/13.
//  Copyright (c) 2013 Andrea Giavatto. All rights reserved.
//

#import "ViewController.h"
#import "AGPhotoBrowserViewController.h"

#define SAMPLE_IMAGE_1			[UIImage imageNamed:@"sample1.jpg"]
#define SAMPLE_IMAGE_2			[UIImage imageNamed:@"sample2.jpg"]
#define SAMPLE_IMAGE_3			[UIImage imageNamed:@"sample3.jpg"]
#define SAMPLE_IMAGE_4			[UIImage imageNamed:@"sample4.jpg"]


@interface ViewController () <UITableViewDataSource, UITableViewDelegate, AGPhotoBrowserDelegate, AGPhotoBrowserDataSource> {
	NSArray *_samplePictures;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) AGPhotoBrowserViewController *browserViewController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
		
	_samplePictures = @[
	@{
		  @"Image": SAMPLE_IMAGE_1,
		  @"Title" : @"Hot air balloons",
		  @"Description" : @"Really cool!"
	},
	  @{
		  @"Image": SAMPLE_IMAGE_2,
		  @"Title" : @"Drop on a leaf",
		  @"Description" : @"A very long and meaningful description about a drop on a leaf that spans on multiple lines.\n\nThis description is so interesting that i am never bored reading it!\n\nI could go on and on and on and on and on and on..."
	},
	  @{
		  @"Image": SAMPLE_IMAGE_3,
		  @"Title" : @"Rainbow flower",
		  @"Description" : @"A colorful image with a meaningless long description for testing purposes that also spans on multiple lines."
	},
      @{
          @"Image": SAMPLE_IMAGE_4,
          @"Title" : @"",
          @"Description" : @""
    }
	];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _samplePictures.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 140;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"SampleControllerCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
	
	[self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}


#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	self.browserViewController.initialIndex = indexPath.row;
	[self presentViewController:self.browserViewController animated:YES completion:nil];
}


#pragma mark - Private methods

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:1];
	if (!imageView) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake(115, 35, 90, 90)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
		imageView.tag = 1;
		
		[cell.contentView addSubview:imageView];
	}
	
	UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:2];
	if (!titleLabel) {
		titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 280, 15)];
		titleLabel.font = [UIFont boldSystemFontOfSize:17];
		titleLabel.textAlignment = NSTextAlignmentCenter;
		
		[cell.contentView addSubview:titleLabel];
	}
	
	titleLabel.text = [self photoBrowser:self.browserViewController titleForImageAtIndex:indexPath.row];
	imageView.image = [self photoBrowser:self.browserViewController imageAtIndex:indexPath.row];
}


#pragma mark - AGPhotoBrowser datasource

- (NSInteger)numberOfPhotosForPhotoBrowser:(AGPhotoBrowserViewController *)photoBrowser
{
	return _samplePictures.count;
}

- (UIImage *)photoBrowser:(AGPhotoBrowserViewController *)photoBrowser imageAtIndex:(NSInteger)index
{
	return [[_samplePictures objectAtIndex:index] objectForKey:@"Image"];
}

- (NSString *)photoBrowser:(AGPhotoBrowserViewController *)photoBrowser titleForImageAtIndex:(NSInteger)index
{
	return [[_samplePictures objectAtIndex:index] objectForKey:@"Title"];
}

- (NSString *)photoBrowser:(AGPhotoBrowserViewController *)photoBrowser descriptionForImageAtIndex:(NSInteger)index
{
	return [[_samplePictures objectAtIndex:index] objectForKey:@"Description"];
}

- (BOOL)photoBrowser:(AGPhotoBrowserViewController *)photoBrowser willDisplayActionButtonAtIndex:(NSInteger)index
{
    // -- For testing purposes only
    if (index % 2) {
        return YES;
    }
    
    return NO;
}


#pragma mark - AGPhotoBrowser delegate

- (void)photoBrowser:(AGPhotoBrowserViewController *)viewController didTapOnDoneButton:(UIButton *)doneButton
{
	// -- Dismiss
	NSLog(@"Optional: get notified that the view controller is about to be dismissed");
}

- (void)photoBrowser:(AGPhotoBrowserViewController *)viewController didTapOnActionButton:(UIButton *)actionButton atIndex:(NSInteger)index
{
	NSLog(@"Action button tapped at index %ld!", (long)index);
	UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@""
														delegate:nil
											   cancelButtonTitle:NSLocalizedString(@"Cancel", @"Cancel button")
										  destructiveButtonTitle:NSLocalizedString(@"Delete", @"Delete button")
											   otherButtonTitles:NSLocalizedString(@"Share", @"Share button"), nil];
	[action showInView:self.view];
}


#pragma mark - Getters

- (AGPhotoBrowserViewController *)browserViewController
{
	if (!_browserViewController) {
		_browserViewController = [[AGPhotoBrowserViewController alloc] initWithNibName:nil bundle:nil];
		_browserViewController.delegate = self;
		_browserViewController.dataSource = self;
	}
	
	return _browserViewController;
}


@end
