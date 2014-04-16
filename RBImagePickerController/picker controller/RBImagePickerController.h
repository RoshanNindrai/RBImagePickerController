//
//  RBImagePickerController.h
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/31/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBImagePickerDelegate.h"

typedef enum {
    
    RBSingleImageSelectionType,
    RBMultipleImageSelectionType
    
} RBSelectionType;

@interface RBImagePickerController : UINavigationController

//title of the navigation bar
@property(nonatomic, strong) NSString *title;
@property(nonatomic, weak) id<RBImagePickerDelegate, UINavigationControllerDelegate>delegate;
@property(nonatomic) RBSelectionType selectionType;

-(void)finishPickingImages;
@end

