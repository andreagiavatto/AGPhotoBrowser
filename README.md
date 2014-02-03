AGPhotoBrowser
==============

A photo browser for iOS6 and iOS7 inspired by Facebook iOS app.

Demo project included.

It currently supports:
- Any number of images through a data source
- Optional title and description (with support for long description through a 'See more' button)
- Full screen view
- Pinch to zoom in/out
- Double tap to zoom in/out
- Orientation changes
- "Swipe up/down" to hide the photo browser
- "Done/Action buttons" to dismiss the browser or perform a few operations on the selected image

![1](https://s3-us-west-2.amazonaws.com/andreagiavatto.github.io/AGPhotoBrowser/AGPhotoBrowser_demo.gif)

## Install
The suggested way to install the component is using [CocoaPods](http://cocoapods.org/), just include the following line in your Podfile to get the latest version:
`pod "AGPhotoBrowser"`


## Usage
There is a demo project included that shows how to use the photo browser.
- import `AGPhotoBrowserView.h` in your class
- create a new instance of `AGPhotoBrowserView` and set the delegate and the dataSource to your class
- implement `- (NSInteger)numberOfPhotosForPhotoBrowser:(AGPhotoBrowserView *)photoBrowser` and `- (UIImage *)photoBrowser:(AGPhotoBrowserView *)photoBrowser imageAtIndex:(NSInteger)index` methods from the datasource
- (optional) provide a title and a description for each image implementing `- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser titleForImageAtIndex:(NSInteger)index` and `- (NSString *)photoBrowser:(AGPhotoBrowserView *)photoBrowser descriptionForImageAtIndex:(NSInteger)index`
- show the browser calling the `- (void)show` or `- (void)showFromIndex:(NSInteger)initialIndex` methods
- dismiss the photo browser with a completion block calling `- (void)hideWithCompletion:( void (^) (BOOL finished) )completionBlock`

## TO-DO
- ~~add pinch to zoom gesture on images~~ (from 1.0.4, thanks @dtsolis)
- ~~support orientation changes~~ (from 1.0.6)

## Resources

Info can be found on [my website](http://www.andreagiavatto.com), [and on Twitter](http://twitter.com/andreagiavatto).


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/andreagiavatto/agphotobrowser/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

