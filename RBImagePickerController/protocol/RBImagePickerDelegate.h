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

@required
-(void)imagePickerController:(RBImagePickerController *)imagePicker didFinishPickingImages:(NSArray *)images;


@optional
-(void)imagePickerControllerDidCancel:(RBImagePickerController *)imagePicker;
-(NSInteger)imagePickerControllerMaxSelectionCount:(RBImagePickerController *)imagePicker;
-(NSInteger)imagePickerControllerMinSelectionCount:(RBImagePickerController *)imagePicker;

@end
