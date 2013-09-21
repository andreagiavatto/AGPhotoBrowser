AGPhotoBrowser
==============

A photo browser for iOS6 and iOS7 inspired by Facebook iOS app.

Demo project included.

It currently supports:
- Any number of images through a data source
- Optional title and description (with support for long description through a 'See more' button)
- Full screen view
- "Swipe up/down" to hide the photo browser
- "Done/Action buttons" to dismiss the browser or perform a few operations on the selected image

![1](https://s3-us-west-2.amazonaws.com/andreagiavatto.github.io/AGPhotoBrowser/AGPhotoBrowser.gif)

## Install
- copy the content of the 'src' folder in your project
- import `AGPhotoBrowserView.h` in your class
- set up the delegate and the dataSource
- implement `- (NSInteger)numberOfPhotosForPhotoBrowser:(AGPhotoBrowserView *)photoBrowser` and `- (UIImage *)photoBrowser:(AGPhotoBrowserView *)photoBrowser imageAtIndex:(NSInteger)index` methods from the datasource
- (optional) provide a title and a description for each image implementing `- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser titleForImageAtIndex:(NSInteger)index` and `- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser descriptionForImageAtIndex:(NSInteger)index`
- show the browser calling the `- (void)show` or `- (void)showFromIndex:(NSInteger)initialIndex` methods
- dismiss the photo browser with a completion block calling `- (void)hideWithCompletion:( void (^) (BOOL finished) )completionBlock`

## TO-DO
- add pinch to zoom gesture on images
- support orientation changes

## Resources

Info can be found on [my website](http://www.andreagiavatto.com), [and on Twitter](http://twitter.com/andreagiavatto).
