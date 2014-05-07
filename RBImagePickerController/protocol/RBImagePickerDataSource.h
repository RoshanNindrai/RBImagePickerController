//
//  RBImagePickerDataSource.h
//  RBImagePickerDemo
//
//  Created by Roshan Balaji on 5/7/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RBImagePickerController;

@protocol RBImagePickerDataSource <NSObject>

@optional
-(NSInteger)imagePickerControllerMaxSelectionCount:(RBImagePickerController *)imagePicker;
-(NSInteger)imagePickerControllerMinSelectionCount:(RBImagePickerController *)imagePicker;

@end
