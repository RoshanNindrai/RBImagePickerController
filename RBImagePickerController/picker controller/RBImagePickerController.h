//
//  RBImagePickerController.h
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/31/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RBImagePickerDelegate <NSObject>

@required
-(void)didFinishPickingImages:(NSArray *)selectedImages;
-(void)imagePickerDidCancel:(id)imagePicker;
@end


typedef enum {
    
    RBSingleImageSelectionType,
    RBMultipleImageSelectionType
    
} RBSelectionType;

@interface RBImagePickerController : UINavigationController

//title of the navigation bar
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) id<RBImagePickerDelegate> sourceDelegate;
@property(nonatomic) RBSelectionType selectionType;

-(void)finishPickingImages;
@end

