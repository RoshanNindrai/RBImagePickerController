RBImagePickerController
=======================

This cantroller can be used to pick one or more images from the photo library. This project consicts of a demo application to unsderstand the use of this controller.

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
      



 
