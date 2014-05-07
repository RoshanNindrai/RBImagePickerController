RBImagePickerController
=======================

This controller can be used to pick one or more images from the photo library. This project consicts of a demo application for the sake of understanding.

Installation
=======================
 
 This controller can be added to your project by copying the RBImagePickerController folder from the project to yours. Cocopod support will be added soon.
 
Usage
=======================

 1. To use this contoller first is to import RBImagePickerController 
 
        #import "RBImagePickerController.h"
 
 2. The Controller must conform to RBImagePickerDelegate, UINavigationControllerDelegate.
 
 3. The RBImagePickerController has to be initialized followed by assigning its delegate and selection type
 
        self.imagePicker = [[RBImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.selectionType = RBMultipleImageSelectionType;
      
 There are two selectiontypes provided with the controller.
 
      RBSingleImageSelectionType //for selecting single image from the photo library 
      RBMultipleImageSelectionType // for selecting multiple images from photo library

 4. The number of images that are selected by the user can also be throttled. 
   
    (I) to set the minimum number of image to be selected by the user the following datasource method is used
  
        -(NSInteger)imagePickerControllerMinSelectionCount:(RBImagePickerController *)imagePicker
  
    (II) to set the maximum number of image to be selected by the user the following datasource method is used
  
        -(NSInteger)imagePickerControllerMaxSelectionCount:(RBImagePickerController *)imagePicker

Once the images are selected from the photo library by the user, the selected images are obtained from the delegate method
 
      -(void)imagePickerController:(RBImagePickerController *)imagePicker didFinishPickingImages:(NSArray *)images
      
  The image picker is automatically dismissed once the user is done with selection. If the user wants to cancel without selecting any images The action can be recognized by the following delegate method.
  
      -(void)imagePickerControllerDidCancel:(RBImagePickerController *)imagePicker
      

Screenshots
=======================

![ScreenShot](https://raw.githubusercontent.com/RoshanNindrai/RBImagePickerController/master/Screenshots/Image%20picker.png)

Multiple selection type

![ScreenShot](https://raw.githubusercontent.com/RoshanNindrai/RBImagePickerController/master/Screenshots/image%20picker%20with%20selections.png)

TO DO:
============

1. To display the # of pictures that are currently selected.

LICENSE:
============
  RBImagePickerController is available under The MIT License (MIT)

Copyright (c) 2014 Roshan Balaji

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

