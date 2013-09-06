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

![1](https://s3-us-west-2.amazonaws.com/andreagiavatto.github.io/AGPhotoBrowser/01.png)
![2](https://s3-us-west-2.amazonaws.com/andreagiavatto.github.io/AGPhotoBrowser/02.png)

## Install
- copy the content of the 'src' folder in your project
- import `AGPhotoBrowserView.h` in your class
- add a new instance of `AGPhotoBrowserView` to your view controller's view
- set up the delegate and the dataSource
- implement `- (NSInteger)numberOfPhotos` and `- (UIImage *)imageAtIndex:(NSInteger)index:` methods


## Resources

Info can be found on [my website](http://www.andreagiavatto.com), [and on Twitter](http://twitter.com/andreagiavatto).
