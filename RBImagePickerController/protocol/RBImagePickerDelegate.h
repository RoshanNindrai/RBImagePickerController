//
//  RBImagePickerDelegate.h
//  RBImagePickerDemo
//
//  Created by Roshan Balaji on 4/16/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RBImagePickerController;

@protocol RBImagePickerDelegate <NSObject>


@optional
-(void)imagePickerController:(RBImagePickerController *)imagePicker didFinishPickingImages:(NSArray *)images __deprecated_msg("This method is replaced with new delegate method returning image assset urls");

@required
-(void)imagePickerController:(RBImagePickerController *)imagePicker didFinishPickingImagesWithURL:(NSArray *)imageURLS;

@optional
-(void)imagePickerControllerDidCancel:(RBImagePickerController *)imagePicker;

@end
